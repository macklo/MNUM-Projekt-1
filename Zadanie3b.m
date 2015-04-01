function [] = Zadanie3b(podpkt, rozm, iteracje)
    %iteracje = 50;
    %rozm = 2560;
    %i = 1;
    %rozmw(i) = rozm;
    A = Matrix1(rozm, podpkt);
    b = Vector1(rozm, podpkt);
    x = Jacobi(A,b,iteracje);
    for i = 2:iteracje
        nrm(i-1) = abs(norm(x(:,i)) - norm(x(:,i-1)));
    end
    
    plot(1:iteracje-1, nrm);
    title('Zale�no�� b��du wyniku od ilo�ci iteracji')
    xlabel('Ilo�� iteracji');
    ylabel('B��d wyniku');
end