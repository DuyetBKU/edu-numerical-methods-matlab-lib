restart;  
pi:=3.14;
f:=pi*h^2*(9-h)/3 - 30;
E:=10^(-5);
a:=0.5;
b:=2;
fa:=subs(h=a,f);
fb:=subs(h=b,f);
x1:=a-(b-a)*fa/(fb-fa);
i:=1;
X[i]:=x1;
e:=abs(x1-a); fx:=subs(h=x1,f);
k:=fa*fx;
if k<0 then
	b:=x1;
	else a:=x1;
end if;
 while e>E do
	i:=i+1;
  fa:=subs(h=a,f);
   fb:=subs(h=b,f);
    x1:=a-(b-a)*fa/(fb-fa);
     e:=abs(x1-X[i-1]); fx:=subs(h=x1,f);
   X[i]:=x1;
   if fa*fx<0 then
	b:=x1;
	else a:=x1;
   end if;
 end do;
print(X);
