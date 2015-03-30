function [eps] = machinePrecision() %Obliczanie dok�adno�ci maszynowej komputera
    x = 1.0;
    t = 1.0 + x;
    while (t > 1.0)
        eps = x;        %Zapami�tujemy ostatni x kt�ry po zsumowaniu dawa� wi�cej ni� 1
        x = x/2;        %Sprawdzamy czy x/2 b�dzie spe�nia�o warunek p�tli
        t = 1.0 + x;    %Je�li nie oznacza to �e poprzedni x (zapami�tany w eps) jest dok�adno�ci� maszynow�
    end
end
