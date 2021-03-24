function h=print_table2(NOTES,p,R,f0,E2)
    N=length(NOTES);
    for II=1:N
        fprintf(stdout,'%7s & %.4f & %.4f & %7.3f \\%c \\\\ \\hline \n',NOTES{II},p(II)*f0,R(II)*f0,E2(II),'%')
    endfor
endfunction
