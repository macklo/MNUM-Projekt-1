function [] = Zadanie2(podpkt)
    rozm = 10;
    i = 1;
    rozmw(i) = rozm;
    t = 1;
    while(t<120)
        [A,b] = Generate(rozm,podpkt);
        [eps(i),t] = GaussEliminate(A,b);
        t
        i = i+1;
        rozm = rozm*2
        rozmw(i) = rozm;
    end
        (rozmw(1:i-1))'
        eps'
    plot(rozmw(1:i-1), eps);
        title('Zale�no�� b��du wyniku od ilo�ci r�wna�')
        xlabel('Ilo�� r�wna�');
        ylabel('B��d wyniku');
end