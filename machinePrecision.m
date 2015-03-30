function [eps] = machinePrecision() %Obliczanie dok³adnoœci maszynowej komputera
    x = 1.0;
    t = 1.0 + x;
    while (t > 1.0)
        eps = x;        %Zapamiêtujemy ostatni x który po zsumowaniu dawa³ wiêcej ni¿ 1
        x = x/2;        %Sprawdzamy czy x/2 bêdzie spe³nia³o warunek pêtli
        t = 1.0 + x;    %Jeœli nie oznacza to ¿e poprzedni x (zapamiêtany w eps) jest dok³adnoœci¹ maszynow¹
    end
end
