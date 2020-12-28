function LeerParasitos()

%limpiar memoria y consola
clear
clc

%% Entrada

y=zeros(65722,1);
for i=1:65722
    y(i,1)=i;
end    

X=zeros(65722,4000);%arreglo de entrada

%x=ProblemXOR();%entrada de arreglo prueba XOR----

%entrada de archivo-----

archivo = fopen('Ca1234NR_madre.txt','r');
cont_bact=0;


data = fgetl(archivo);%me posiciono en la primer linea del archivo
%disp(data(1,:));
while ischar(data)
    
    if data(1,1)=='>'%la linea es del índice
        
        cont_bact=cont_bact+1;
        
    else %es la secuenciación
        
        [~,c_b]=size(data);
        X(cont_bact,1:c_b)=data(1,1:c_b);
    end
    
    data = fgetl(archivo);  %me muevo a la siguiente linea  
    
  
%     %caso de prueba con dos entradas ( posteriormente hay que removerlo)
%     if cont_bact==2
%         break;
%     end
    
    
end

fclose(archivo);

%A=65  C=67   G=71  T=84    codigo ASCII de los alelos
X(X==65)=0.2;
X(X==67)=0.4;
X(X==71)=0.6;
X(X==84)=0.8;
X(X==78)=0.3;%N

save('ex4data22.mat','X','y')

%X(1,:)

end

