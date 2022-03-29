
GAUCHE = [0 0 0 1 1 0 1; 0 0 1 1 0 0 1; 0 0 1 0 0 1 1; 0 1 1 1 1 0 1; 0 1 0 0 0 1 1; 0 1 1 0 0 0 1; 0 1 0 1 1 1 1; 0 1 1 1 0 1 1; 0 1 1 0 1 1 1; 0 0 0 1 0 1 1];
DROITE = [1 1 0 0 1 1 0; 1 1 0 1 1 0 0; 1 0 0 0 0 1 0; 1 0 1 1 1 0 0; 1 0 0 1 1 1 0; 1 0 1 0 0 0 0; 1 0 0 0 1 0 0; 1 0 0 1 0 0 0; 1 1 1 0 1 0 0; 1 1 1 0 0 1 0];
CODETEST = [0, 3, 6, 0, 0, 0, 2, 9, 1, 4, 5, 2] ;


%Génération du code-barres
x_i=input('x_i: ');
y_i=input('y_i: ');
alpha_c=input("Angle du code-barres: ");
if alpha_c > 10
    error("Angle de code-barres invalide");
end
if alpha_c < -10
    error("Angle de code-barres invalide");
end
START=[ 1 0 1];
END=[1 0 1];
MIDDLE=[0 1 0 1 0];
CGAUCHE=[];
CDROITE=[];
QUIET=[zeros([1,9])];


for i = 1: 6
    val=CODETEST(i);
    val = val+1;
    CGAUCHE = [CGAUCHE;GAUCHE(val,:)];
end


for j = 7 : 12
    val=CODETEST(j);
    val = val+1;
    CDROITE = [CDROITE;DROITE(val,:)];
end 

CGAUCHE=transpose(CGAUCHE); 
CGAUCHE=reshape(CGAUCHE,1,42);
CDROITE=transpose(CDROITE);
CDROITE=reshape(CDROITE,1,42);
CODE=[ QUIET START CGAUCHE MIDDLE CDROITE END QUIET];
CODEBAS= [ QUIET START zeros([1 42]) MIDDLE zeros([1 42]) END QUIET];
GRAND=1;
CODE=(repelem(CODE,GRAND));

CODEBAS=(repelem(CODEBAS,GRAND));

for i=1:(77*GRAND)
    CODE=[CODE;CODE(1,:)];
end
for i=1:(5*GRAND)
    CODE=[CODE;CODEBAS(1,:)];
end

%split le code barres en 113 matrices
    matrice{1}=CODE(:,1:GRAND);
for i=1:112

    matrice{i+1}=CODE(:, (i*GRAND)+1:(i*GRAND)+GRAND);
end


BRDF=1;

%MATRICE D'ANGLE DE CODE-BARRES
angle=zeros(1, 113);
for i = 1:113*GRAND
    x=0.33/GRAND*(i-1)*cosd(alpha_c)+x_i;
    y=0.33/GRAND*(i-1)*sind(alpha_c)+y_i;
   angle(i)=atand(x/y);
end
%creation de l'image réfléchie
sommation=zeros(83,113);
for i=1:113
x_c = 0.33/GRAND*i; 
x=x_i+cosd(alpha_c)*x_c;
z = sqrt(x^2+y^2);

w_0 = 0.4;
z_0 = 773;
I=1;
w = (w_0*sqrt(1+(z/z_0)^2));
pas=0.33/GRAND;
for col= 1 : 4*GRAND
    for row = 1 : 4*GRAND
        col_1= (col*pas)-pas;
        row_1= (row*pas)-pas;
        rayon=sqrt(row_1^2+col_1^2);
laser4(row, col) = (I*(w_0/w)^(2)*exp((-2*((rayon)^2))/(w^2)));

    end
end
laser3=fliplr(laser4);
laser1=flipud(laser4);
laser2=fliplr(laser1);
laser=[laser2 laser1; laser3 laser4];


scan=conv2(matrice{i},laser);

reflexion=BRDF*scan;

sommation(:,i)=mean(mean(reflexion(:)));
disp("Itération "+{i});
end
