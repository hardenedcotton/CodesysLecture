x = zeros(2,500);
u = zeros(1,500);
T  = 5;             
Ts = 1e-2;          
x = [0;1];       
error = 0;          
error_integral = 0; 
a11 = 0; a12 = 1; a21 = -3; a22 = -2; b11 = 0; b21 = 1; 
c11 = 1; c12 = 0;
Kp = 8;    
Ki = 5;    
error = 0; 
error_integral = 0;
for k = 1:T/Ts
    t(k) = k*Ts;
    yref(k) = 1;
    y(k) = c11*x(1,k)+c12*x(2,k); 
    error = yref(k)-y(k);         
    error_integral = error_integral + error*Ts; 
    u(k) = Kp*error +Ki*error_integral; %
    xdot(:,k) = [a11*x(1,k)+a12*x(2,k)+b11*u(k);
                 a21*x(1,k)+a22*x(2,k)+b21*u(k)];
    x(:,k+1) = x(:,k) + Ts*xdot(:,k);
end
%{
# Ki # Kp # T # Ts # error # error_integral # k
# a11 # a12 # a21 # a22 # b11 # b21 # c11 # c12 
[1x500] t
[1x500] u
[2x501] x
[2x500] xdot
[1x500] y
[1x500] yref
}%

%%%%%%%%%%%%%%%%%%%%%%%%%%

%{
x(1,1:20)
0        0.0100   0.0206   0.0318   0.0436   0.0559   0.0687   0.0821
0.0959   0.1102   0.1250   0.1402   0.1558   0.1718   0.1881   0.2049
0.2219   0.2392   0.2569   0.2748

x(1,480:500)
0.9937   0.9941   0.9944   0.9947   0.9949   0.9952   0.9954   0.9956
0.9957   0.9959   0.9960   0.9961   0.9962   0.9962   0.9962   0.9962
0.9962   0.9962   0.9961   0.9961   0.9960

u(1,1:20)
8.0500   8.0195   7.9836   7.9425   7.8962   7.8450   7.7888   7.7279
7.6624   7.5924   7.5180   7.4394   7.3568   7.2702   7.1799   7.0859
6.9885   6.8878   6.7839   6.6770

u(1,480:500)
2.7939   2.7915   2.7893   2.7872   2.7854   2.7837   2.7822   2.7810
2.7799   2.7789   2.7782   2.7776   2.7773   2.7771   2.7771   2.7772
2.7775   2.7780   2.7787   2.7795   2.7805

y(1,1:20)
0        0.0100   0.0206   0.0318   0.0436   0.0559   0.0687   0.0821
0.0959   0.1102   0.1250   0.1402   0.1558   0.1718   0.1881   0.2049
0.2219   0.2392   0.2569   0.2748

y(1,480:500)
0.9937   0.9941   0.9944   0.9947   0.9949   0.9952   0.9954   0.9956
0.9957   0.9959   0.9960   0.9961   0.9962   0.9962   0.9962   0.9962
0.9962   0.9962   0.9961   0.9961   0.9960

xdot(1,1:20)
1.0000   1.0605   1.1192   1.1760   1.2310   1.2840   1.3351   1.3842
1.4314   1.4765   1.5196   1.5606   1.5996   1.6365   1.6713   1.7040
1.7347   1.7632   1.7896   1.8140

xdot(1,480:500)
3.3864e-02   3.1313e-02   2.8779e-02   2.6265e-02   2.3771e-02   2.1301e-02
1.8857e-02   1.6440e-02   1.4054e-02   1.1699e-02   9.3775e-03   7.0918e-03
4.8435e-03   2.6342e-03   4.6569e-04  -1.6605e-03  -3.7428e-03  -5.7797e-03
-7.7698e-03  -9.7119e-03  -1.1605e-02
}%