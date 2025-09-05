### 💻 Explanation of each command line:
```matlab
restart;  
% Restart Maple environment.

r := [0,2.5,5,7.5,10,12.5,15,17.5,20];  
% List of x-values (abscissas of interpolation points).

v := [0.914,0.89,0.847,0.795,0.719,0.543,0.427,0.204,0];  
% List of y-values (ordinates corresponding to r).

n := nops(r);  
% Number of points (length of r list).

for i from 1 to n do  
    t := 1;  
    d := 1;  
    % Initialize numerator product (t) and denominator product (d) 
    % for Lagrange formula.
    
    for j from 1 to n do  
        if i <> j then  
            L[i] := (((x - r[j])/(r[i] - r[j])) * t) / (d);  
            % Build the Lagrange basis polynomial step by step:
            %   L_i(x) = ∏ (x - r[j]) / (r[i] - r[j]), with j ≠ i.
            % Here t and d accumulate numerator and denominator terms.
            
            t := x - r[j];  
            % Multiply numerator by (x - r[j]).
            
            d := r[i] - r[j];  
            % Multiply denominator by (r[i] - r[j]).
        end if;  
    end do;  
    
    L[i] := L[i] * v[i];  
    % Multiply basis polynomial L_i(x) by its corresponding y-value v[i].
end do;  

print("Cac da thuc co so");  
% Print message: "The basis polynomials".

for i from 1 to n do  
    L[i];  
    % Display each basis polynomial L_i(x) (already multiplied by v[i]).
end do;  

f := 0:  
% Initialize interpolation polynomial f(x) = 0.

for i from 1 to n do  
    f := L[i] + f:  
    % Add each L[i] to build the full interpolation polynomial.
end do;  

print("v(r)=");  
% Print message: "v(r) =".

f;  
% Display the final interpolation polynomial f(x).
