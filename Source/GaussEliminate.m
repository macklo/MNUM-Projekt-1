function [r,t] = GaussEliminate(A, b)
    tic %rozpocz�cie pomiaru czsu
    P = [A b]; %stworzenie macierzy rozszerzonej A|b
    x=size(A,1); %x oznacza ilo�� r�wna�
    
    %w b�dzie naszym wektorm wynikowym
    w = zeros(x,1);
    
    if(det(A) == 0)
        fprintf(1,'Macierz jest osobliwa');
    end
    
    %Przekszta�canie macierzy z cze�ciowym wyborem elementu podstawowego
    for j = 1:x                         %j jest indeksem wiersza
        main = 0;                       %main - g��wny element macierzy
        imain = j;                      %imain - indeks wiersza z main
        for i = j:x                     %poszukiwanie elementu g��wnego
            if abs(P(i,j))> main        %
                main = abs(P(i,j));
                imain = i;
            end
        end
        
        %Zamieniamy wiersz z elementem g��wnym z obecnym wierszem
        tmp = P(j,:);
        P(j,:) = P(imain,:);
        P(imain, :) = tmp;
        
        %Eliminacja Gaussa - od wierszy kolejnych odejmujemy obecny wiersz
        %pomno�ony przez odpowiedni wsp�czynnik - l
        for i = j+1:x
            l = P(i,j)/P(j,j);
            P(i,:) = P(i,:) - l * P(j,:);
        end
    end
    
    %Od ko�ca b�dziemy oblicza� kolejne warto�ci wynikowe i wstawia� je do
    %wektora wynikowego - w, gdzie k to indeks oblicznej obecnie warto�ci
    %wynikowej
    k = x;
    while(k>=1)
        % Najpierw zapisujemy warto�� woln�
        w(k) = P(k, x+1);
        
        %Odejmujemy po kolei obliczone ju� warto�ci wynikowe, z
        %odpowiednimi wsp�czynnikami, zaczynaj�c od nast�pnego wyniku,
        %id�c a� do ko�ca
        l = k+1;
        while(l<=x)
            w(k)= w(k) - P(k,l) * w(l);
            l = l+1;
        end
        
        %Na  koniec dzielimy przez wsp�czynnik przy obecnie oblicznej
        %niewiadomej
        w(k) = w(k)/ P(k,k);
        
        k = k-1;
    end
    
    %r jest residuum
    r = b - A * w;
    
    %Po obliczeniu normy zwracamy j� jako b��d obliczenia
    r = norm(r);
    t = toc;
end