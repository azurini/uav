function [Nd]=plot_som_V1_1(w,x_t,y_t)
%PLOTSOM Plot self-organizing map.
%
% Obsoleted in R2008b NNET 6.0.  Last used in R2007b NNET 5.1.
%
%  Syntax
%
%    plotsom(pos)
%    plotsom(W,d,nd)
%
%  Description
%
%    PLOTSOM(POS) takes one argument,
%      POS - NxS matrix of S N-dimension neural positions.
%    and plots the neuron positions with red dots, linking
%    the neurons within a Euclidean distance of 1.
%
%    PLOTSOM(W,D,ND) takes three arguments,
%      W  - SxR weight matrix.
%      D  - SxS distance matrix.
%      ND - Neighborhood distance, default = 1.
%    and plots the neuron's weight vectors with connections
%    between weight vectors whose neurons are within a
%    distance of 1.
%
%  Examples
%
%    These examples generate plots of various layer topologies.
%
%      pos = hextop(5,6); plotsom(pos)
%      pos = gridtop(4,5); plotsom(pos)
%      pos = randtop(18,12); plotsom(pos)
%      pos = gridtop(4,5,2); plotsom(pos)
%      pos = hextop(4,4,3); plotsom(pos)
%
%    See PLOTSOMPOS for an example of plotting a layer's
%    weight vectors with the input vectors they map.
%
%  See also PLOTSOMPOS, LEARNSOM.

% Mark Beale, 11-31-97
% Copyright 1992-2014 The MathWorks, Inc.

% Arguments

  d = dist(w);
  w = w';
  t = 'Neuron Positions';

nd = 1;

[S,R] = size(w);
if R < 3
  w = [w zeros(S,3-R)];
elseif R > 3
  disp('Warning - PLOTSOM only shows first three dimensions.');
  w = w(:,1:3);
end 

[I,J] = meshgrid(1:S,1:S);
[i,j] = find((d <= (nd+1e-10)) & (I<J));
keep = find((w(i,1) ~= w(j,1)) | (w(i,2) ~= w(j,2)) | (w(i,3) ~= w(j,3)));
i = i(keep);
j = j(keep);
numLines = length(i);
x = [w(i,1)'; w(j,1)'; zeros(1,numLines)+NaN];
y = [w(i,2)'; w(j,2)'; zeros(1,numLines)+NaN];
z = [w(i,3)'; w(j,3)'; zeros(1,numLines)+NaN];
x = reshape(x,1,3*numLines);
y = reshape(y,1,3*numLines);
z = reshape(z,1,3*numLines);

w(:,1)=w(:,1)*x_t/8.0829;   % 10*10*10=1000个点的 固定参数
w(:,2)=w(:,2)*y_t/10;
w(:,3)=w(:,3)/7.3485;

x=x*x_t/8.0829;   % 10*10*10=1000个点的 固定参数
y=y*y_t/10;
z=z/7.3485;

% Plot
plot3(x,y,z,'b',w(:,1),w(:,2),w(:,3),'.r','markersize',15)