#include <cmath>
#include <iostream>


double racEksp(double x) {
    return exp(3 * x);
}

double racArctan(double x, int iteracije) {
    double rezultat = 0.0;
    for (int i = 0; i < iteracije; ++i) {
        rezultat += (i % 2 == 0 ? 1 : -1) * pow(x, 2 * i + 1) / (2 * i + 1);
    }

    return rezultat;
}

double trapz(double (*f)(double), double a, double b, int n) {
    double h = (b - a) / n;
    double sestevek = 0.5 * (f(a) + f(b));
    for (int i = 1; i < n; ++i) {
        sestevek += f(a + i * h);
    }
    return h * sestevek;
}

int main() {

    double a = 0.0;
    double b = M_PI / 4.0;

    int n;
    std::cout << "Število podintervalov n: "; 
    std::cin >> n;

    double rezultat = trapz([](double x) {
        return racEksp(x) * racArctan(x, 20); 
    }, a, b, n);

    std::cout << "Rezultat trapezne integracije: " << rezultat << std::endl;

    return 0;
}

