function A=funcA(H,S)
    N=length(H);
    L=size(S,1);
    A=zeros(L,N);
    a=2^(1/12);

    for JJ=1:L
        SS=S(JJ,:)*H;
        for II=1:N    
            A(JJ,II)=S(JJ,II)/(2*a^(JJ)*sqrt(1+SS));
        endfor
    endfor
endfunction
