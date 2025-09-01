restart;  
r:=[0,2.5,5,7.5,10,12.5,15,17.5,20];  
v:=[0.914,0.89,0.847,0.795,0.719,0.543,0.427,0.204,0];  
n:=nops(r); 
for i from 1 to n do 
	t:=1; 
	d:=1; 
	for j from 1 to n do 
		if i<> j then 
			L[i]:=(((x-r[j])/(r[i] -r[j]))*t)/(d);
			t:=x-r[j];
			d:=r[i]-r[j];
			end if; 
			end do;  
			L[i]:=L[i]*v[i]; 
			end do;
			print("Cac da thuc co so");
		for i from 1 to n do
			L[i];
			end do;
			f:=0:
	for i from 1 to n do
		f:=L[i] +f:
		end do;
		print("v(r)=");
		f; 
