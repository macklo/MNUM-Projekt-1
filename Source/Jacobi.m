function [x] = Jacobi(A, b, iter)
    s =size(A,1);
    L = zeros(s,s);
    D = zeros(s,s);
    U = zeros(s,s);
    
    x = zeros(s,1);
    
    %Sprawdzenie warunku dostatecznego zbie�no�ci - silnej dominacji
    %diagonalnej macierzy A
    for i = 1:s
        %Sumujemy wszystkie elementy w wierszu, poza diagonalnym
        sum = 0;
        for j = 1:s    
            if i~=j
                sum = sum + abs(A(i,j));
            end
        end
        %Je�li suma jest wi�ksza od elementu to warunek nie jest spe�niony
        if sum > abs(A(i,i))
            disp('Uwaga: Warunek dominacji diagonalnej nie jest spe�niony')
            break
        end
    end

    %Stworzenie macierzy tr�jk�tnych oraz diagonalnej
    for i = 1:s
        for j = 1:s
            if(i<j)
                U(i,j) = A(i,j);
            elseif(i>j)
                L(i,j) = A(i,j);
            else
                D(i,j) = A(i,j);
            end
        end
    end
    
    %Sk�adniki wykorzystane przy obliczniu kolejnych iteracji
    P = inv(D)*(L+U);
    O = inv(D)*b;
    
    for k = 2:iter
        x(:,k) = (-1)*P * x(:,k-1) + O;

    end
end