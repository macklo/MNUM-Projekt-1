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
    
    %Przekszta³canie macierzy z czeœciowym wyborem elementu podstawowego
    for j = 1:x                         %j jest indeksem wiersza
        main = 0;                       %main bêdzie najwiêkszym co do modu³u elementem macierzy
        imain = j;                      %imain przechowuje indeks wiersza z g³ównym elementem
        for i = j:x                     %elementu g³ównego bêdziemy poszukiwali od obecnego wiersza do koñca
            if abs(P(i,j))> main        %jeœli znajdziemy element wiêkszy co do modu³u to zapamiêtujemy go
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
            %P(i,j) = l;
        end
        %P
    end
    
    %P
    
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
    
    %b
    %A
    %w
    %r jest residuum
    r = b - A * w;
    %Po obliczeniu normy zwracamy j¹ jako b³¹d obliczenia
    r = norm(r);
    t = toc;
end