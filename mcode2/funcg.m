function g=funcg(H,S)
    N=length(H);
    L=size(S,1);
    g=zeros(L,1);
    a=2^(1/12);

    for JJ=1:L
        g(JJ)=sqrt(1+S(JJ,:)*H)/a^(JJ);
    endfor
endfunction
