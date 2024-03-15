clear all;

%% 1
% A=[1,1,0;1,2,0;0,0,1];
% Q=[2,0.5,0;0.5,4,0;0,0,4];
% cvx_begin
%     variable x(3)
%     minimize(quad_form(x,A)+3*x(1)-4*x(2))
%     subject to
%         norm([(x(1)+x(2))/sqrt(2);sqrt(3/2)*x(1);sqrt(7/2)*x(2);2])+quad_over_lin((x(1)-x(2)+x(3)+1),(x(1)+x(2)))<=6
%         % norm(Q^0.5*[x(1);x(2);1])+quad_over_lin((x(1)-x(2)+x(3)+1),(x(1)+x(2)))<=6
%         x>=1
% cvx_end
% x
% cvx_optval

%% 2
% cvx_begin
%     variable x(4)
%     minimize(ones(1,4)*x)
%     subject to
%         (x(1)-x(2))^2+(x(3)+2*x(4))^4<=5
%         %(x(1)-x(2))^2+square_pos(square_pos((x(3)+2*x(4))))<=5
%         %square(x(1)-x(2))+(x(3)+2*x(4))^4<=5
%         [1,2,3,4]*x<=6
%         x>=0
% cvx_end
% x
% cvx_optval

%% 3
% A=[2,2,1;2,5,1;1,1,10];
% cvx_begin
%     variable x(3)
%     minimize(abs([2,3,1]*x)+sum_square(x)+norm([sqrt(2)*(x(1)+x(2));sqrt(5)*(x(2)+1);1]))
%     % minimize(norm([2,3,1]*x,1)+sum_square(x)+norm([sqrt(2)*(x(1)+x(2));sqrt(5)*(x(2)+1);1]))
%     % minimize(norm([2*x(1),3*x(2),x(3)],1)+quad_over_lin(x,1)+norm([sqrt( 2)*x(1)+sqrt(2)*x(2),sqrt(5)*x(2)+sqrt(2),1],2)) %(X)
%     % minimize(norm(A1*x, 1),1)+sum_square(x)+norm([sqrt(2)*(x(1)+x(2));sqrt(5)*(x(2)+1);1])) %(A1 is matrix,X)
%     subject to
%         quad_over_lin([x(1);1],x(2))+quad_form(x,A)<=7
%         max([x(1)+x(2);x(3);x(1)-(3)])<=19
%         x(1)>=0
%         x(2)>=1
% cvx_end
% x
% cvx_optval

%% 4
% A=[1,1,1;1,1,1;1,1,4];
% Q=[2,2,0,0;2,3,0,0;0,0,1,0;0,0,0,7];
% cvx_begin
%     variable x(3)
%     minimize(norm([sqrt(2)*(x(1)+x(2)),x(2),x(3),sqrt(7)])+square_pos(sum_square([x;1])))
%     % minimize(norm(Q^0.5*[x;1])+square_pos(sum_square([x;1])))
%     subject to
%         quad_over_lin(x(1)+x(2),x(3)+1)+x(1)^8<=7
%         quad_form(x,A)<=10
%         %(x(1)+x(2)-x(3))^2<=20
%         % norm(x(1) + x(2) - x(3), 1)^2 <= 20 %(X)
%         square_abs(x(1)+x(2)-x(3))<=20
%         x>=0
% cvx_end
% x
% cvx_optval

%% 5
cvx_begin
    variable x(3)
    minimize(square_pos(quad_over_lin(x(1),x(2))+quad_over_lin(x(2),x(1)))+norm(x+5,1))
    subject to
        square_pos(square_pos(sum_square(x)+1)+1)+x(1)^4+x(2)^4+x(3)^4<=200
        %square_pos(square_pos(sum_square(x)+1)+1)+norm(x,4)^4<=200 %(X)
        %square_pos(square_pos(sum_square(x)+1)+1)+sum(pow_p(x,4))<=200 %(X)
        %square_pos(square_pos(norm([x;1]))+1)+x(1)^4+x(2)^4+x(3)^4<=200 %(X)
        max([(x(1)+2*x(2))^2+5*x(2)^2;x(1);x(2)])<=40
        %max(max((x(1)+2*x(2))^2+5*x(2)^2,x(1)),x(2))<=40
        x(1)>=1
        x(2)>=1
cvx_end
x
cvx_optval