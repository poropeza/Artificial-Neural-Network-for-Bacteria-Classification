function [ x ] = LeerPruebas( archivo_ , x )


archivo = fopen(archivo_,'r');
cont_bact=0;

data = fgetl(archivo);%me posiciono en la primer linea del archivo
while ischar(data)
           
     
        
      if data(1,1)~='>'%la linea es del índice
          
          [~,c_b]=size(data);
        
        cont_bact=cont_bact+1;
        
        qq=0;
        sumi=0;
        conti_b=1;
        
        for q=1:c_b-1
            if qq<=800 %agrupo
                %realizo sumatoria
                
                %A=65  C=67   G=71  T=84    codigo ASCII de los alelos
                if data(1,q)==65
                    if data(1,q+1)==65
                        sumi=sumi+0.0625;
                    elseif data(1,q+1)==67
                        sumi=sumi+0.125;
                    elseif data(1,q+1)==71
                        sumi=sumi+0.1875;
                    elseif data(1,q+1)==84
                        sumi=sumi+0.25;
                    else
                        sumi=sumi+0.35;
                    end
                
                elseif data(1,q)==67

                    if data(1,q+1)==65
                        sumi=sumi+0.3125;
                    elseif data(1,q+1)==67
                        sumi=sumi+0.375;
                    elseif data(1,q+1)==71
                        sumi=sumi+0.4375;
                    elseif data(1,q+1)==84
                        sumi=sumi+0.5;
                    else
                        sumi=sumi+0.35;
                    end

                elseif data(1,q)==71
                    if data(1,q+1)==65
                        sumi=sumi+0.5625;
                    elseif data(1,q+1)==67
                        sumi=sumi+0.625;
                    elseif data(1,q+1)==71
                        sumi=sumi+0.6875;
                    elseif data(1,q+1)==84
                        sumi=sumi+0.75;
                    else
                        sumi=sumi+0.35;
                    end
                elseif data(1,q)==84
                    if data(1,q+1)==65
                        sumi=sumi+0.8125;
                    elseif data(1,q+1)==67
                        sumi=sumi+0.875;
                    elseif data(1,q+1)==71
                        sumi=sumi+0.9375;
                    elseif data(1,q+1)==84
                        sumi=sumi+0.99;
                    else
                        sumi=sumi+0.35;
                    end
                end
                
                sumi=sumi+((q+1)/100);

            else  

                x(cont_bact,conti_b)=sumi;     %asigno el valor numérico de agrupación
                qq=1;%reinicio contador
                sumi=0;%reinicio la sumatoria
                conti_b=conti_b+1;%aumentando en uno la columna

                %hago el primer movimiento de agrupamiento
                if data(1,q)==65
                    if data(1,q+1)==65
                        sumi=sumi+0.0625;
                    elseif data(1,q+1)==67
                        sumi=sumi+0.125;
                    elseif data(1,q+1)==71
                        sumi=sumi+0.1875;
                    elseif data(1,q+1)==84
                        sumi=sumi+0.25;
                    else
                        sumi=sumi+0.35;
                    end
                
                elseif data(1,q)==67

                    if data(1,q+1)==65
                        sumi=sumi+0.3125;
                    elseif data(1,q+1)==67
                        sumi=sumi+0.375;
                    elseif data(1,q+1)==71
                        sumi=sumi+0.4375;
                    elseif data(1,q+1)==84
                        sumi=sumi+0.5;
                    else
                        sumi=sumi+0.35;
                    end

                elseif data(1,q)==71
                    if data(1,q+1)==65
                        sumi=sumi+0.5625;
                    elseif data(1,q+1)==67
                        sumi=sumi+0.625;
                    elseif data(1,q+1)==71
                        sumi=sumi+0.6875;
                    elseif data(1,q+1)==84
                        sumi=sumi+0.75;
                    else
                        sumi=sumi+0.35;
                    end
                elseif data(1,q)==84
                    if data(1,q+1)==65
                        sumi=sumi+0.8125;
                    elseif data(1,q+1)==67
                        sumi=sumi+0.875;
                    elseif data(1,q+1)==71
                        sumi=sumi+0.9375;
                    elseif data(1,q+1)==84
                        sumi=sumi+0.99;
                    else
                        sumi=sumi+0.35;
                    end
                end 
                
                sumi=sumi+((q+1)/100);
            end
            qq=qq+1;
        end
        
        x(cont_bact,conti_b:4)=100;  
     
      end
           
    data = fgetl(archivo);  %me muevo a la siguiente linea  

end

fclose(archivo);


x(:,1:4)=x(:,1:4)/10000;



end

