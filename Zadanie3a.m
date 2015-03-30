function [] = Zadanie3a()
    imax = 15;
    A = Matrix3();
    b = Vector3();
    x = Jacobi(A,b,imax);
    for i = 2:imax
        nrm(i-1) = abs(norm(x(:,i)) - norm(x(:,i-1)));
    end
    plot(1:imax-1, nrm);
end