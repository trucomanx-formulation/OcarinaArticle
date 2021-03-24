%
FONTSIZE=16;
LINEWIDTH=3;

F=[559.9;
602;
732.1;
775.2;
818.3;
904.4;
947.5;
990.5;
1033;
1076.7;
1119.7;
1205.9;
1248.9;
1292.1;
1335.1];

A=[0;
12.56;
25.13;
37.69;
50.25;
62.81;
75.37;
87.93;
100.49;
113.05;
125.61;
138.17;
150.73;
163.29;
175.85];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Aproximacion linear
% F=d1+d2*A
% F=d2(A+d1/d2) --> d1/d2 = A0 --> F=d2(A+A0)
% F=[1s A][d1;d2] = P [d1;d2] 
P=[ones(size(A)),A];
D=inv(P'*P)*P'*F
F1=D(1)+D(2)*A

fprintf(stdout,"F = %f + %f * A\n",D(1),D(2))
fprintf(stdout,"F = %f ( %f + A)\n",D(2),D(1)/D(2))


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Aproximacion no-linear
% F=k1 sqrt(k2 + A)
% F^2 = K1^2 (k2 + A)
% F^2 = c1 + c2 A --> c1= K1^2 k2 , c2= k1^2
% F^2=[1s A][c1;c2] = P [c1;c2] 

C=inv(P'*P)*P'*F.^2
K=[sqrt(C(2)) C(1)/C(2)]
F2=K(1)*sqrt(K(2)+A)
fprintf(stdout,"F = %f sqrt( %f + A)\n",K(1),K(2))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MSE1=norm(F-F1)^2

MSE2=norm(F-F2)^2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plot
plot(   A,F,'ro','linewidth',LINEWIDTH,
        A,F1,'-b','linewidth',LINEWIDTH,
        A,F2,':g','linewidth',LINEWIDTH)
grid
hx=xlabel('Area (mm^2)');
set(hx,'fontsize',FONTSIZE)
hy=ylabel('Frequency (hz)');
set(hy,'fontsize',FONTSIZE)
hl=legend('Data',['Linear, MSE=' num2str(round(MSE1*10)/10)],['Root square, MSE=' num2str(round(MSE2*10)/10) ],'location','southeast');
set(hl,'fontsize',FONTSIZE)

print(gcf,'compara.eps','-deps',['-F:',int2str(FONTSIZE)]);

