function [x,y]=rkm45(xlhb,xrhb,y0,n,noeq)
  
  dx=(xrhb-xlhb)/n;
  x=linspace(xlhb,xrhb,n+1);
  y=zeros(length(x),noeq);
  y(1,:)=y0(:);
  
  for i=2:n+1
    
    k1=dx*calc_rhs(x(i-1),y(i-1,:));
    k2=dx*calc_rhs((x(i-1)+dx/2),(y(i-1,:)+k1*dx/2));
    k3=dx*calc_rhs((x(i-1)+dx/2),(y(i-1,:)+k2*dx/2));
    k4=dx*calc_rhs((x(i-1)+dx),(y(i-1,:)+k3*dx));
    
    y(i,:)=y(i-1,:)+((k1+2*k2+2*k3+k4)/6);
  endfor
  
endfunction