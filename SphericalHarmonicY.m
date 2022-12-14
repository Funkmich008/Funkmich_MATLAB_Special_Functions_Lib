function Y = SphericalHarmonicY(l, m, theta, phi)

    %% case distinction for postive and negative m
    c = 1;
    if m < 0
        m = - m;
        c = (-1)^m;
    end

    %% compute associated Legendre polynomials via reccurence relation
    x = cos(theta);    
    if l < m
        P = 0 * x;
    elseif l == m
        P = 0 * x + (-1)^m * factorial(2*m)/(2^m * factorial(m)) * (1 - x.^2).^(m/2);
    else
        Pl1 = 0; 
        Pl = (-1)^m * factorial(2*m)/(2^m * factorial(m)) * (1 - x.^2).^(m/2);
        for j = m+1:l
            P = ((2*j-1) * x .* Pl - (j+m-1) * Pl1)./(j-m);
            Pl1 = Pl;
            Pl = P;            
        end
    end

    %% compute spherical harmonic     
    Y = c * sqrt((2*l+1)/(4 * pi) * factorial(l-m)/factorial(l+m)) * P .* exp(1i * m * phi);
       
end
