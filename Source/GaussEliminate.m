function [r,t] = GaussEliminate(A, b)
    tic %rozpoczêcie pomiaru czsu
    P = [A b]; %stworzenie macierzy rozszerzonej A|b
    x=size(A,1); %x oznacza iloœæ równañ
    
    %w bêdzie naszym wektorm wynikowym
    w = zeros(x,1);
    
    if(det(A) == 0)
        fprintf(1,'Macierz jest osobliwa');
    end
    
    %Przekszta³canie macierzy z czeœciowym wyborem elementu podstawowego
    for j = 1:x                         %j jest indeksem wiersza
        main = 0;                       %main - g³ówny element macierzy
        imain = j;                      %imain - indeks wiersza z main
        for i = j:x                     %poszukiwanie elementu g³ównego
            if abs(P(i,j))> main        %
                main = abs(P(i,j));
                imain = i;
            end
        end
        
        %Zamieniamy wiersz z elementem g³ównym z obecnym wierszem
        tmp = P(j,:);
        P(j,:) = P(imain,:);
        P(imain, :) = tmp;
        
        %Eliminacja Gaussa - od wierszy kolejnych odejmujemy obecny wiersz
        %pomno¿ony przez odpowiedni wspó³czynnik - l
        for i = j+1:x
            l = P(i,j)/P(j,j);
            P(i,:) = P(i,:) - l * P(j,:);
        end
    end
    
    %Od koñca bêdziemy obliczaæ kolejne wartoœci wynikowe i wstawiaæ je do
    %wektora wynikowego - w, gdzie k to indeks oblicznej obecnie wartoœci
    %wynikowej
    k = x;
    while(k>=1)
        % Najpierw zapisujemy wartoœæ woln¹
        w(k) = P(k, x+1);
        
        %Odejmujemy po kolei obliczone ju¿ wartoœci wynikowe, z
        %odpowiednimi wspó³czynnikami, zaczynaj¹c od nastêpnego wyniku,
        %id¹c a¿ do koñca
        l = k+1;
        while(l<=x)
            w(k)= w(k) - P(k,l) * w(l);
            l = l+1;
        end
        
        %Na  koniec dzielimy przez wspó³czynnik przy obecnie oblicznej
        %niewiadomej
        w(k) = w(k)/ P(k,k);
        
        k = k-1;
    end
    
    %r jest residuum
    r = b - A * w;
    
    %Po obliczeniu normy zwracamy j¹ jako b³¹d obliczenia
    r = norm(r);
    t = toc;
end