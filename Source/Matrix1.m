function [A] = Matrix1(x, podpunkt)
    A = zeros(x,x);
    if podpunkt == 1
        for i = 1:x;
            for j = 1:x
                if i ==j
                    A(i,j) = 9;
                    elseif i== j-1 || i == j+1
                    A(i,j) = 3;
                else
                    A(i,j) = 0;
                end
            end
        end
    elseif podpunkt==2
        for i = 1:x;
            for j = 1:x
                if i ==j
                    A(i,j) = 1/7;
                else
                    A(i,j) = 11*(i-j) + 2;
                end
            end
        end
    elseif podpunkt==3
        for i = 1:x;
            for j = 1:x
                A(i,j) = 2/[5*(i+j+1)];
            end
        end
    end
end