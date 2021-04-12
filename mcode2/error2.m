%
a=2^(1/12);
alpha=0.01;
f0=440*a*a*a;

p=[ a^1 ;
    a^2 ; %% RE 
    a^3 ;
    a^4 ; %% MI 
    a^5 ; %% FA 
    a^6 ;
    a^7 ; %% SOL 
    a^8 ;
    a^9 ; %% LA 
    a^10;
    a^11; %% SI 
    a^12; %% DO 
    a^13;
    a^14];%% RE2 
    
S=[ 0, 0, 0, 0, 0, 1 ;
    1, 0, 0, 0, 0, 0 ; % re 
    1, 0, 0, 0, 0, 1 ;
    0, 1, 0, 0, 0, 0 ; % mi
    1, 1, 0, 0, 0, 0 ; % fa
    0, 0, 1, 0, 0, 0 ;
    1, 0, 1, 0, 0, 0 ; % sol
    0, 1, 1, 0, 0, 0 ;
    1, 1, 1, 0, 0, 0 ; % la
    1, 0, 1, 1, 0, 0 ;
    0, 1, 1, 1, 0, 0 ; % si
    1, 1, 1, 1, 0, 0 ; % do
    0, 1, 1, 1, 1, 0 ;
    1, 1, 1, 1, 1, 0]; % re
I=eye(size(S,2));
q=ones(size(S,1),1);
Lmax=100000;

%H{1}=[0.29, 0.58, 0.96, 1.03,1.04,0.12]';
H{1}=[0.25, 0.25, 0.75, 1.0,1.0,0.125]';
for II=2:Lmax
    A=funcA(H{II-1},S);
    g=funcg(H{II-1},S);
    H{II} = H{II-1} + inv(A'*A+alpha*I)*A'*(q-g);
    
    ERRORH{II-1}=norm(H{II}-H{II-1});
    ERROR{II-1}=norm(q-g)^2;
    
    if ERRORH{II-1}<0.0001
        break;
    endif
end
ERRORH
ERROR
H{II}'
R=funcf(H{II},S)

function plot_errors(ERRORH,ERROR,FILENAMEH,FILENAME)
    NN=length(ERRORH);
    errh=zeros(NN,1);
    err =zeros(NN,1);
    FONTSIZE=18;
    MARKERSIZE=8;
    
    for II=1:NN
        err(II)=ERROR{II};
        errh(II)=ERRORH{II};
    endfor
       
    figure(1)
    semilogy([1:NN],errh,'-o','markersize',MARKERSIZE)
    set(gca,'fontsize',FONTSIZE);
    hx=xlabel("Iteration l-th");
    set(hx,'fontsize',FONTSIZE);
    hy=ylabel("Error of h");
    set(hy,'fontsize',FONTSIZE);
    daspect([1 0.5 1])
    
    print(gcf,FILENAMEH,'-deps',['-F:' num2str(FONTSIZE)],'-tight');

    figure(2)
    semilogy([1:NN],err,'-o','markersize',MARKERSIZE)
    set(gca,'fontsize',FONTSIZE);
    hx=xlabel("Iteration l-th");
    set(hx,'fontsize',FONTSIZE);
    hy=ylabel("e^2(h_l)");
    set(hy,'fontsize',FONTSIZE);
    daspect([1 0.05 1])
    
    print(gcf,FILENAME,'-deps',['-F:' num2str(FONTSIZE)],'-tight');
end

plot_errors(ERRORH,ERROR,"errorh.eps","error.eps");

%   0.26344   0.56628   0.98485   1.02421   1.04440   0.13352
%   0.26344   0.56628   0.98485   1.02420   1.04442   0.13352


% Ep1_max= 100*[ (1-sqrt(a))/sqrt(a) (sqrt(a)-1) ]
Ep1=100*(funcg(H{II},S)-q)


% Ep2_max= 50
Ep2=100*(log(R)-log(p))/log(a)



NOTES={"$C$","$C\\\#$","$D$","$D\\\#$","$E$","$F$","$F\\\#$","$G$","$G\\\#$","$A$","$A\\\#$","$B$","$C$","$C\\\#$","$D$"};
disp('Table1')
print_table1(NOTES,[1;p],[1;R],[0;Ep1],[0;Ep2]);
disp('Table2')
print_table2(NOTES,[1;p],[1;R],f0,[0;Ep2]);
disp('Tableh')
print_tableh(H{II});
print_tableh2(H{II});


