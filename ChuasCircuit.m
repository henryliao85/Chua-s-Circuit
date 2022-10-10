noeq=3;

xlhb=0;
xrhb=0.1;
dx=0.01;
n=fix((xrhb-xlhb)/dx);
nt=1000;

xAll=zeros(n*nt,1);
z=zeros(n*nt,noeq);

xl=-3;xr=3;
yl=-0.6;yr=0.6;
zl=-6;zr=6;

y0(1)=0.7;
y0(2)=0;
y0(3)=0;

for i=1:nt

  [x,y]=rkm45(xlhb,xrhb,y0,n,noeq);
  k=size(y(:,1))(1,1);
  
  for j=1:n
    
    xAll((i-1)*n+j)=x(j);
    
    for m=1:noeq
      z((i-1)*n+j,m)=y(j,m);
    endfor
  
  endfor
    
  figure(1)
%    subplot(2,1,1)
    
    plot(y(:,3),y(:,2),"b",y(k,3),y(k,2),"o","markersize",8);
    title(sprintf('t=%5.1f',i*0.1))

    axis([zl,zr,yl,yr],"square");
    
    xlabel("z")
    ylabel("y")
  
  figure(2)
%    subplot(2,1,2)

    plot(y(:,1),y(:,2),"b",y(k,1),y(k,2),"o","markersize",8);
    title(sprintf('t=%5.1f',i*0.1))
  
    xlabel("x")
    ylabel("y")
    
    axis([xl,xr,yl,yr],"square");
  
  drawnow

  y0(1)=y(k,1);
  y0(2)=y(k,2);
  y0(3)=y(k,3);
 
  xlhb=xrhb;
  xrhb=xrhb+n*dx;

endfor

figure(3)

  plot3(z(:,1),z(:,2),z(:,3))

  xlabel("x")
  ylabel("y")
  zlabel("z")
  
figure(4)

  subplot (3, 1, 1)
    plot (xAll(:),z(:,1));

    xlabel("t")
    ylabel("x")
  
  subplot (3, 1, 2)
    plot (xAll(:),z(:,2));

    xlabel("t")
    ylabel("y")
  
  subplot (3, 1, 3)
    plot (xAll(:),z(:,3));

    xlabel("t")
    ylabel("z")
  
hold off;



