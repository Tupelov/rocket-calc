clear
clc

rocket = yaml.loadFile("calc.yaml");


while true

x = input("Hello! Welcome to the rocket calc, please select an option below:" +newline + ...
    "1) Load"+newline+ ...
    "2) Save" + newline+ ...
    "3) Mass Flow"+newline + ...
    "4) Display yaml"+newline+...
    "5) Exit"+newline+...
    "6) Calculate injector orifice area"+newline...
    );
    
if x==1
 rocket   = yaml.loadFile("calc.yaml");
end

if x==2
    yaml.dumpFile("calc.yaml",rocket);
end

if x==3
    rocket.mass_flow_ipa = rocket.mass_flow/(rocket.coef.of_ratio+1);
    rocket.mass_flow_lox = rocket.mass_flow - rocket.mass_flow_ipa;
end
if x==4
    disp(yaml.dump(rocket));
end

if x==5
    break
end
if x==6

    rocket.a_lox = rocket.mass_flow_lox / (rocket.coef.cd * sqrt(2*rocket.coef.p_lox*rocket.delatap));
    rocket.a_ipa = rocket.mass_flow_ipa / (rocket.coef.cd * sqrt(2*rocket.coef.p_ipa*rocket.delatap));

    disp("LOx Orifice Area: "+rocket.a_lox*1000^2 + " mm^2")
    disp("IPA Orifice Area: "+rocket.a_ipa*1000^2 + " mm^2")


end

end
