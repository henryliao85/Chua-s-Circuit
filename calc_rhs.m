function rhs=calc_rhs(x,y)

  c1=15.6;
  c2=1;
  c3=28;
  m0=-1.143;
  m1=-0.714;
  f=@(x) m1*x.+0.5*(m0-m1).*(abs(x+1)-abs(x-1));
  rhs(1)=c1*(y(2)-y(1)-f(y(1)));
  rhs(2)=c2*(y(1)-y(2)+y(3));
  rhs(3)=-c3*y(2);

endfunction











