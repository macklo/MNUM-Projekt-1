function [r,t] = GaussEliminate(A, b)
    tic
    P = [A b];
    x=size(A,1);
    
    w = zeros(x,1);
    %w = 1:x;
    %for n = 1:x
    %    w(n)=0;
    %end
    
    if(det(A) == 0)
        fprintf(1,'Macierz jest osobliwa');
    end
    
    %Przekszta�canie macierzy z cze�ciowym wyborem elementu podstawowego
    for j = 1:x                         %j jest indeksem wiersza
        main = 0;                       %main b�dzie najwi�kszym co do modu�u elementem macierzy
        imain = j;                      %imain przechowuje indeks wiersza z g��wnym elementem
        for i = j:x                     %elementu g��wnego b�dziemy poszukiwali od obecnego wiersza do ko�ca
            if abs(P(i,j))> main        %je�li znajdziemy element wi�kszy co do modu�u to zapami�tujemy go
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
            %P(i,j) = l;
        end
        %P
    end
    
    %P
    
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
    
    %b
    %A
    %w
    %r jest residuum
    r = b - A * w;
    %Po obliczeniu normy zwracamy j� jako b��d obliczenia
    r = norm(r);
    t = toc;
end