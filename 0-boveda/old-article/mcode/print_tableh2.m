function h=print_tableh2(H)
    for II=1:length(H)
        if(II!=1)
            fprintf(stdout,"\&")
        endif
        fprintf(stdout,"%5.1f\\%c ",100*H(II)/H(1),'%')
    endfor
    fprintf(stdout," \\\\ \\hline \n")
endfunction
