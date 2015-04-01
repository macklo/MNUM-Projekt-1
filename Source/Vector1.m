function [B] = Vector1(rozmiar, podpunkt)
    B = zeros(rozmiar,1);
    if podpunkt == 1
        for i = 1:rozmiar;
            B(i) = 1.5 + 0.5*i;
        end
    elseif podpunkt == 2
        for i = 1:rozmiar;
            B(i) = 1 + 0.4*i;
        end
    elseif podpunkt == 3
        for i = 1:rozmiar;
            if mod(i,2) == 0
                B(i) = 8/(7*i);
            else
                B(i) = 0;
            end
        end
    end
end