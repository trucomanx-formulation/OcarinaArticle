function h=print_table1(NOTES,p,R,E1,E2)
    N=length(NOTES);
    for II=1:N
        fprintf(stdout,'%7s & %.4f $f_0$ & %.4f $f_0$ & %6.3f \\%c & %7.3f \\%c \\\\ \\hline \n',NOTES{II},p(II),R(II),E1(II),'%',E2(II),'%')
    endfor
endfunction
