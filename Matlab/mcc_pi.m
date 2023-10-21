function [znotraj_kroga, znotraj_kvadrata] = mcc_pi(n)
    % Funkcija za Monte Carlo simulacijo za računanje približka števila π.

    % Generiraj naključne točke v kvadratu [0, 1] x [0, 1]
    x = rand(1, n);
    y = rand(1, n);

    % Preveri, katere točke so znotraj kroga
    notraje_tocke = (x.^2 + y.^2 <= 1);

    % Koordinate točk znotraj kroga in kvadrata
    znotraj_kroga = [x(notraje_tocke); y(notraje_tocke)];
    znotraj_kvadrata = [x; y];
end
