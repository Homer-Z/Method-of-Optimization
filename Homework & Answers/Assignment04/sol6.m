rand('seed',314);
x=rand(40,1);
y=rand(40,1);
class=[2*x<y+0.5]+1;
A1=[x(find(class==1)),y(find(class==1))];
A2=[x(find(class==2)),y(find(class==2))];

% cvx_begin quiet
%     variables w(2) b t
%     maximize(t)
%     subject to
%         A1*w+b>=t
%         A2*w+b<=-t
%         norm(w)<=1
% cvx_end

cvx_begin quiet
  variables w(2) b
  minimize(norm(w))
  subject to
      A1*w+b<=-1
      A2*w+b>=1
cvx_end

plot(A1(:,1),A1(:,2),'*','MarkerSize',6)
hold on
plot(A2(:,1),A2(:,2),'d','MarkerSize',6)
hold on
p1 = ezplot(@(x,y) w(1)*x+w(2)*y+b, [0,1]);
p2 = ezplot(@(x,y) w(1)*x+w(2)*y+b+1, [0,1]);
p3 = ezplot(@(x,y) w(1)*x+w(2)*y+b-1, [0,1]);
set(p2,'LineStyle','-.');
set(p3,'LineStyle','-.');
title("");
hold off
disp(w);
disp(b);