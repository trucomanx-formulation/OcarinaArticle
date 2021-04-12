function f=funcf(H,S)
    N=length(H);
    L=size(S,1);
    f=zeros(L,1);

    for JJ=1:L
        f(JJ)=sqrt(1+S(JJ,:)*H);
    endfor
endfunction
