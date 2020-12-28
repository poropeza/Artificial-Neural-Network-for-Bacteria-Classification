function PerceptronMulticapa()

%limpiar memoria y consola
clear
clc

%format long;

%% Entrada

x=[];%arreglo de entrada

load('entrenado.mat');

%% entrada con pesos entrenamiento calculado

%entrada de archivo-----
% 
% filename = 'bacterias.txt';
% delimiterIn = '\t';
% headerlinesIn = 1;
% bacterias = importdata(filename,delimiterIn,headerlinesIn);
% %disp(bacterias.data(65722,:));
% 
% 
% %% leer x desde archivo
% 
% filename = 'x.txt';
% delimiterIn = '\t';
% headerlinesIn = 1;
% x = importdata(filename,delimiterIn,headerlinesIn);
% 
% %bacterias.data(:,2)=x.data(:,5);


%% entrada con archivo madre
% 
% archivo = fopen('Ca1234NR_madre.txt','r');
% 
% 
% indice_real=0.1;
% bacterias=[];
% cont_bact=0;
% 
% cont_arch=0;
% 
% data = fgetl(archivo);%me posiciono en la primer linea del archivo
% while ischar(data)
%     
%     cont_arch=cont_arch+1;
%     
%     if data(1,1)=='>'%la linea es del índice
%         [~,c_b]=size(data);
%         cont_bact=cont_bact+1;
%         bacterias(cont_bact,1)=cont_bact;
%         bacterias(cont_bact,2)=indice_real;
%        %bacterias(cont_bact,3:c_b+1)=data(1,2:c_b);
%         
%     
%     else %es la secuenciación
%         
%         [~,c_b]=size(data);
%         
%         qq=0;
%         sumi=0;
%         conti_b=1;
%         
%         for q=1:c_b-1
%             if qq<=800 %agrupo
%                 %realizo sumatoria
%                 
%                 %A=65  C=67   G=71  T=84    codigo ASCII de los alelos
%                 if data(1,q)==65
%                     if data(1,q+1)==65
%                         sumi=sumi+0.0625;
%                     elseif data(1,q+1)==67
%                         sumi=sumi+0.125;
%                     elseif data(1,q+1)==71
%                         sumi=sumi+0.1875;
%                     elseif data(1,q+1)==84
%                         sumi=sumi+0.25;
%                     else
%                         sumi=sumi+0.35;
%                     end
%                 
%                 elseif data(1,q)==67
% 
%                     if data(1,q+1)==65
%                         sumi=sumi+0.3125;
%                     elseif data(1,q+1)==67
%                         sumi=sumi+0.375;
%                     elseif data(1,q+1)==71
%                         sumi=sumi+0.4375;
%                     elseif data(1,q+1)==84
%                         sumi=sumi+0.5;
%                     else
%                         sumi=sumi+0.35;
%                     end
% 
%                 elseif data(1,q)==71
%                     if data(1,q+1)==65
%                         sumi=sumi+0.5625;
%                     elseif data(1,q+1)==67
%                         sumi=sumi+0.625;
%                     elseif data(1,q+1)==71
%                         sumi=sumi+0.6875;
%                     elseif data(1,q+1)==84
%                         sumi=sumi+0.75;
%                     else
%                         sumi=sumi+0.35;
%                     end
%                 elseif data(1,q)==84
%                     if data(1,q+1)==65
%                         sumi=sumi+0.8125;
%                     elseif data(1,q+1)==67
%                         sumi=sumi+0.875;
%                     elseif data(1,q+1)==71
%                         sumi=sumi+0.9375;
%                     elseif data(1,q+1)==84
%                         sumi=sumi+0.99;
%                     else
%                         sumi=sumi+0.35;
%                     end
%                 end
%                 
%                 sumi=sumi+((q+1)/100);
% 
%             else  
% 
%                 x(cont_bact,conti_b)=sumi;     %asigno el valor numérico de agrupación
%                 qq=1;%reinicio contador
%                 sumi=0;%reinicio la sumatoria
%                 conti_b=conti_b+1;%aumentando en uno la columna
% 
%                 %hago el primer movimiento de agrupamiento
%                 if data(1,q)==65
%                     if data(1,q+1)==65
%                         sumi=sumi+0.0625;
%                     elseif data(1,q+1)==67
%                         sumi=sumi+0.125;
%                     elseif data(1,q+1)==71
%                         sumi=sumi+0.1875;
%                     elseif data(1,q+1)==84
%                         sumi=sumi+0.25;
%                     else
%                         sumi=sumi+0.35;
%                     end
%                 
%                 elseif data(1,q)==67
% 
%                     if data(1,q+1)==65
%                         sumi=sumi+0.3125;
%                     elseif data(1,q+1)==67
%                         sumi=sumi+0.375;
%                     elseif data(1,q+1)==71
%                         sumi=sumi+0.4375;
%                     elseif data(1,q+1)==84
%                         sumi=sumi+0.5;
%                     else
%                         sumi=sumi+0.35;
%                     end
% 
%                 elseif data(1,q)==71
%                     if data(1,q+1)==65
%                         sumi=sumi+0.5625;
%                     elseif data(1,q+1)==67
%                         sumi=sumi+0.625;
%                     elseif data(1,q+1)==71
%                         sumi=sumi+0.6875;
%                     elseif data(1,q+1)==84
%                         sumi=sumi+0.75;
%                     else
%                         sumi=sumi+0.35;
%                     end
%                 elseif data(1,q)==84
%                     if data(1,q+1)==65
%                         sumi=sumi+0.8125;
%                     elseif data(1,q+1)==67
%                         sumi=sumi+0.875;
%                     elseif data(1,q+1)==71
%                         sumi=sumi+0.9375;
%                     elseif data(1,q+1)==84
%                         sumi=sumi+0.99;
%                     else
%                         sumi=sumi+0.35;
%                     end
%                 end 
%                 
%                 sumi=sumi+((q+1)/100);
%                 
%             end
%             qq=qq+1;
%         end
%         
%         %x(cont_bact,1:c_b)=data(1,1:c_b);
%         x(cont_bact,conti_b:4)=100;        
%         x(cont_bact,5)=indice_real; %guardo en la última posicion el valor objetivo
%         indice_real=rand;
%         
%     end
%     
%     data = fgetl(archivo);  %me muevo a la siguiente linea  
%     
%     %caso de prueba con dos entradas ( posteriormente hay que removerlo)
%     
% %     if cont_arch==2000
% %         break;
% %     end
%     %disp(cont_arch);
% end
% 
% fclose(archivo);
% 
% 
% x(:,1:4)=x(:,1:4)/10000;



[bb_f,bb_c]=size(bacterias);

%char(bacterias(:,3:bb_c)) %desplegar el nombre de la bacteria

%% Entrenamiento

alfa=0.25;

%n va a tener la misma cantidad de neuronas que las columnas de entrada
[n,nn] =  size(x);
nn=nn-1;

%n=4;
%nn=4;

w=[];%este se tiene que llenar como de forma aleatoria, si es que no se ha entrenado
v=[];%este se tiene que llenar como de forma aleatoria, si es que no se ha entrenado

% %Inicialización de pesos W
% for i=1:nn  
% 	for j=1:nn	 
% 		w(i,j)=rand;
%     end
% end
% 
% %Inicialización de pesos V
% for i=1:nn 
% 	v(1,i)=rand; 
% end


filename = 'w.txt';
delimiterIn = '\t';
headerlinesIn = 1;
w = importdata(filename,delimiterIn,headerlinesIn);

filename = 'v.txt';
delimiterIn = '\t';
headerlinesIn = 1;
v = importdata(filename,delimiterIn,headerlinesIn);





% %Ciclo de entrenamiento
% for i=1:n 
%     
% 	aprender=1;	
% 	h=[];
% 
% 	while  aprender==1 
% 	
% 		for s=1:nn		 
% 			h(1,s) = hi(w.data , x(i,:), i);
%         end
% 
% 		o= Ok(h,v.data);
% 
% 		if o==x(i,nn+1) %la columna representa el valor esperado de un registro de aprendizaje
% 		
% 			aprender=0;
% 		
%         else %se deben de actualizar los pesos hasta llegar al objetivo
% 		
% 			error_=error(x(i,nn+1),o);
% 
% 			if error_<0			
% 				error_=error_*-1;
%             end
% 
% 			if error_<=0.05 %le doy un margen de aprendizaje permitido. 			
% 				aprender=0;			
%             else %tiene que aprender
% 			
% 				deltaK_=deltaK(x(i,nn+1),o);
% 				v.data=Vnuevos(v.data,alfa,h,deltaK_);%actualizo los pesos de V
% 				deltaJ_=deltaJ(h,deltaK_,v.data);%obtengo el arreglo de deltaJ
% 				w.data=Wnuevos(w.data, alfa,h, deltaJ_);%actualizo los pesos de W
%             end
%         end	        
%     end
% end
% 
% fid = fopen('pesos_neurona_.txt','wt');
% 
% fprintf(fid,'X:\n');
% 
% [xf,xc]=size(x);
% 
% for ii = 1:xf
%     fprintf(fid,'%f\t',x(ii,:));
%     fprintf(fid,'\n');
% end
% 
% fprintf(fid,'W:\n');
% 
% [wf,wc]=size(w.data);
% 
% for ii = 1:wf
%     fprintf(fid,'%f\t',w.data(ii,:));
%     fprintf(fid,'\n');
% end
% 
% fprintf(fid,'V:\n');
% fprintf(fid,'%f\t',v.data(1,:));
% fprintf(fid,'\n');
% 
% fprintf(fid,'Bacterias:\n');
% 
% for ii=1:bb_f
% fprintf(fid,'%d\t',bacterias(ii,1));
% fprintf(fid,'%f\t',bacterias(ii,2));
% fprintf(fid,'%c',char(bacterias(ii,3:bb_c)));
% fprintf(fid,'\n');
% end
% 
% fclose(fid);
% 
% 
% save('entrenado.mat','x','bacterias');

%% Predicciones

x_posterior=[];

x_posterior = LeerPruebas('prueba.txt',x_posterior);

[ff,~]=size(x_posterior);
h_=[];



for i=1:ff

	for j=1:nn		
		h_(1,j)=hi(w.data, x_posterior(i,:), i);
    end   

	o = Ok(h_,v.data);

    [indice_real,indice,error_predic]= Clasificar(x,o,v.data,w.data);  
    %disp(indice_real);
    for k=1:bb_f
        %disp(bacterias.data(k,2));
        if bacterias(k,2)==indice_real
            %disp(char(bacterias(k,3:bb_c)));
            %disp(bacterias(k,1));
                       
            if error_predic*10000000>0
                X_ = [num2str(error_predic),', la bacteria no se encuentra asociada a la base de datos'];
                disp(X_);
            else
                archivo = fopen('Ca1234NR_madre.txt','r'); 
                 cont_bact=0;
                 data = fgetl(archivo);%me posiciono en la primer linea del archivo

                 while ischar(data)

                     if data(1,1)=='>'

                         cont_bact=cont_bact+1;

                         if cont_bact==bacterias(k,1)%es la bacteria
                            %disp('Bacteria: ',data(1,:));
                             X_1 = ['Bacteria del cliente: ',num2str(data(1,:))];
                             disp(X_1);
                             break;
                         end

                         data = fgetl(archivo); % me muevo a la siguiente linea  

                     else 

                        data = fgetl(archivo); % me muevo a la siguiente linea  

                     end
                 end

                 fclose(archivo);
            end 
            
        end
    end     
end



end

