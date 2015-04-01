function [] = Zadanie3a()
    imax = 16;
    A = Matrix3();
    b = Vector3();
    x = Jacobi(A,b,imax)
    for i = 2:imax
        nrm(i-1) = abs(norm(x(:,i)) - norm(x(:,i-1)));
    end
    
    plot(1:imax-1, nrm);
    title('Zale�no�� b��du wyniku od ilo�ci iteracji')
    xlabel('Ilo�� iteracji');
    ylabel('B��d wyniku');
end