%
a=2^(1/12);
f0=440*a*a*a;

p=[ a^2 ; %% RE 
    a^4 ; %% MI 
    a^5 ; %% FA 
    a^7 ; %% SOL 
    a^9 ; %% LA 
    a^11; %% SI 
    a^12; %% DO2
    a^14]'%% RE2 
P=(p').^2;

L=ones(size(p')) %% [1; 1; ....; 1]

A=[ 1, 0, 0, 0, 0 ;
    0, 1, 0, 0, 0 ;
    1, 1, 0, 0, 0 ;
    1, 0, 1, 0, 0 ;
    1, 1, 1, 0, 0 ;
    0, 1, 1, 1, 0 ;
    1, 1, 1, 1, 0 ;
    1, 1, 1, 1, 1];

H=inv(A'*A)*A'*(P-L) % h=H h_0
RR=L+A*H;
R=sqrt(RR)'

% Ep1_max= 100*[ (1-sqrt(a))/sqrt(a) (sqrt(a)-1) ]
Ep1=100*(R-p)./(p)

% Ep2_max= 50
Ep2=100*(log(R)-log(p))/log(a)

NOTES={'$C$','$D$','$E$','$F$','$G$','$A$','$B$','$C$','$D$'};
disp('Table1')
print_table1(NOTES,[1,p],[1,R],[0,Ep1],[0,Ep2]);
disp('Table2')
print_table2(NOTES,[1,p],[1,R],f0,[0,Ep2]);
disp('Tableh')
print_tableh(H);
print_tableh2(H);

