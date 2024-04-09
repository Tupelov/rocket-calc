clear
clc

rocket = yaml.loadFile("calc.yaml");


s = yaml.dump(rocket)

rocket.delatap = 240 * 6894.75729
rocket.coef.p_lox = 1.141

rocket.coef.p_ipa = 0.786



while true

x = input("Hello! Welcome to the rocket calc, please select an option below:" +newline + ...
    "1) Load"+newline+ ...
    "2) Save" + newline+ ...
    "3) Mass Flow"+newline + ...
    "4) Display yaml"+newline+...
    "5) Exit"+newline...
    );
    
if x==1
 rocket   = yaml.loadFile("calc.yaml")
end
if x==2
    yaml.dumpFile("calc.yaml",rocket)
end
if x==3
    
 
rocket.mass_flow_ipa = rocket.mass_flow/(rocket.coef.of_ratio+1);
rocket.mass_flow_lox = rocket.mass_flow - rocket.mass_flow_ipa;

end
if x==4
    disp(yaml.dump(rocket))
end

if x==5
break
end
end

%{

fig = uifigure;







save_button = uibutton(fig);
quick_save = uibutton(fig);
quick_load = uibutton(fig);

save_button.Text = 'Save';
quick_save.Text = 'Quick Save';
quick_load.Text = 'Quick Load';


save_button.ButtonPushedFcn = @test_press;
quick_save.ButtonPushedFcn = @test_press;
quick_load.ButtonPushedFcn = @test_press;


btnX = 50;
btnY = 50;
btnWidth = 100;
btnHeight = 22;
save_button.Position = [btnX btnY btnWidth btnHeight];
quick_save.Position = [btnX btnY+50 btnWidth btnHeight];
quick_load.Position = [btnX btnY+100 btnWidth btnHeight];




function test_press(app,src,event)
    disp('This is a test!');
end
%}

        

