function linkages(scene)
if nargin < 1
	scene = 0;
end

% Set up the scene here.
% Note that links don't have to be placed exactly. The first call to
% solveLinkage() will automatically snap the links so that all the
% constraints are satisfied.
links = [];
pins = [];
sliders = [];
particles = [];
oscillation = false; % turn oscillation off by default.
switch scene
	case 0
		% Crank-rocker
		% Bottom link
		links(1).angle = 0; % rotation from the positive x-axis
		links(1).pos = [-1 0]'; % position of the center of rotation
		links(1).verts = [ % display vertices
			 0.0  2.0  2.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Left link
		links(2).angle = pi/2;
		links(2).pos = [-1 0]';
		links(2).verts = [
			 0.0  1.0  1.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Right link
		links(3).angle = pi/2;
		links(3).pos = [1 0]';
		links(3).verts = [
			 0.0  2.0  2.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Top link
		links(4).angle = 0;
		links(4).pos = [-1 1]';
		links(4).verts = [
			 0.0  3.0  3.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		
		% Which link is grounded?
		grounded = 1;
		% Which link is the driver?
		% Note: the driver must be attached (with a pin) to the ground.
		driver = 2;
		
		% Bottom-left
		pins(1).linkA = 1;
		pins(1).linkB = 2;
		pins(1).pointA = [0,0]';
		pins(1).pointB = [0,0]';
		% Bottom-right
		pins(2).linkA = 1;
		pins(2).linkB = 3;
		pins(2).pointA = [2,0]';
		pins(2).pointB = [0,0]';
		% Left-top
		pins(3).linkA = 2;
		pins(3).linkB = 4;
		pins(3).pointA = [1,0]';
		pins(3).pointB = [0,0]';
		% Right-top
		pins(4).linkA = 3;
		pins(4).linkB = 4;
		pins(4).pointA = [1+rand(1),0]'; % pin location on link3 is randomized
		pins(4).pointB = [2,0]';
		
		% List of tracer particles for display
		particles(1).link = 4; % which link?
		particles(1).point = [0.5,0.1]'; % tracer particle point in local coords
		particles(2).link = 4;
		particles(2).point = [2.5,-0.1]';
	case 1
		% Drag-link % s = 2, l = 5, p = 4, q = 4
		% Bottom link
		links(1).angle = 0; % rotation from the positive x-axis
		links(1).pos = [-1 0]'; % position of the center of rotation
		links(1).verts = [ % display vertices
			 0.0  2.0  2.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Left link
		links(2).angle = pi/2;
		links(2).pos = [-1 0]';
		links(2).verts = [
			 0.0  4.0  4.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Right link
		links(3).angle = pi/2;
		links(3).pos = [1 0]';
		links(3).verts = [
			 0.0   5    5   0.0
			-0.1 -0.1  0.1  0.1
			];
		% Top link
		links(4).angle = 0;
		links(4).pos = [-1 1]';
		links(4).verts = [
			 0.0   4    4  0.0
			-0.1 -0.1  0.1  0.1
			];
		
		% Which link is grounded?
		grounded = 1;
		% Which link is the driver?
		% Note: the driver must be attached (with a pin) to the ground.
		driver = 2;
		
		% Bottom-left
		pins(1).linkA = 1;
		pins(1).linkB = 2;
		pins(1).pointA = [0,0]';
		pins(1).pointB = [0,0]';
		% Bottom-right
		pins(2).linkA = 1;
		pins(2).linkB = 3;
		pins(2).pointA = [2,0]';
		pins(2).pointB = [0,0]';
		% Left-top
		pins(3).linkA = 2;
		pins(3).linkB = 4;
		pins(3).pointA = [4,0]';
		pins(3).pointB = [0,0]';
		% Right-top
		pins(4).linkA = 3;
		pins(4).linkB = 4;
		pins(4).pointA = [5,0]'; % pin location on link3 is randomized
		pins(4).pointB = [4,0]';
		
		% List of tracer particles for display
		particles(1).link = 4; % which link?
		particles(1).point = [0.5,0.1]'; % tracer particle point in local coords
		particles(2).link = 4;
		particles(2).point = [2.5,-0.1]';
	case 2
        
		% Double-rocker % s = 1, l = 4, p = 4, q = 3
        % first enable oscillation
        oscillation = true; % decides whether to make the driver link oscillate or not.
        % (double rocker)
        min_angle = acos(3/5)-0.095; % oscillation range 
        max_angle = pi/2+0.005; % uscillation range


		% Bottom link
		links(1).angle = 0; % rotation from the positive x-axis
		links(1).pos = [-1 0]'; % position of the center of rotation
		links(1).verts = [ % display vertices
			 0.0  3.0  3.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Left link
		links(2).angle = acos(1/4);
		links(2).pos = [-1 0]';
		links(2).verts = [
			 0.0  4.0  4.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Right link
		links(3).angle = pi/2;
		links(3).pos = [1 0]';
		links(3).verts = [
			 0.0  4.0  4.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Top link
		links(4).angle = 0;
		links(4).pos = [-1 1]';
		links(4).verts = [
			 0.0  1.0  1.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		
		% Which link is grounded?
		grounded = 1;
		% Which link is the driver?
		% Note: the driver must be attached (with a pin) to the ground.
		driver = 2;
		
		% Bottom-left
		pins(1).linkA = 1;
		pins(1).linkB = 2;
		pins(1).pointA = [0,0]';
		pins(1).pointB = [0,0]';
		% Bottom-right
		pins(2).linkA = 1;
		pins(2).linkB = 3;
		pins(2).pointA = [3,0]';
		pins(2).pointB = [0,0]';
		% Left-top
		pins(3).linkA = 2;
		pins(3).linkB = 4;
		pins(3).pointA = [4,0]';
		pins(3).pointB = [0,0]';
		% Right-top
		pins(4).linkA = 3;
		pins(4).linkB = 4;
		pins(4).pointA = [4,0]'; % pin location on link3 is randomized
		pins(4).pointB = [1,0]';
		
		% List of tracer particles for display
		particles(1).link = 4; % which link?
		particles(1).point = [0,0]'; % tracer particle point in local coords
		particles(2).link = 4;
		particles(2).point = [1,0]';
	case 3
		% Hoekens/Chebyshev
        % Double-rocker % s = 1, l = 2, p = 2.5, q = 5
		% Bottom link
		links(1).angle = 0; % rotation from the positive x-axis
		links(1).pos = [-1 0]'; % position of the center of rotation
		links(1).verts = [ % display vertices
			 0.0  2.0  2.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Left link
		links(2).angle = 0;
		links(2).pos = [-1 0]';
		links(2).verts = [
			 0.0  1.0  1.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Right link
		links(3).angle = pi/2;
		links(3).pos = [1 0]';
		links(3).verts = [
			 0.0  2.5  2.5  0.0
			-0.1 -0.1  0.1  0.1
			];
		% Top link
		links(4).angle = 0;
		links(4).pos = [-1 1]';
		links(4).verts = [
			 0.0  5.0  5.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		
		% Which link is grounded?
		grounded = 1;
		% Which link is the driver?
		% Note: the driver must be attached (with a pin) to the ground.
		driver = 2;
		
		% Bottom-left
		pins(1).linkA = 1;
		pins(1).linkB = 2;
		pins(1).pointA = [0,0]';
		pins(1).pointB = [0,0]';
		% Bottom-right
		pins(2).linkA = 1;
		pins(2).linkB = 3;
		pins(2).pointA = [2,0]';
		pins(2).pointB = [0,0]';
		% Left-top
		pins(3).linkA = 2;
		pins(3).linkB = 4;
		pins(3).pointA = [1,0]';
		pins(3).pointB = [0,0]';
		% Right-top
		pins(4).linkA = 3;
		pins(4).linkB = 4;
		pins(4).pointA = [2.5,0]'; % pin location on link3 is randomized
		pins(4).pointB = [2.5,0]';
		
		% List of tracer particles for display
		particles(1).link = 4; % which link?
		particles(1).point = [0,0]'; % tracer particle point in local coords
		particles(2).link = 4;
		particles(2).point = [5,0]';
	case 4
		% Peaucellier-Lipkin
        
        % (Peaucellier-Lipkin linkage) set oscillation on
        oscillation = true;
        min_angle = -pi/2.1; % oscillation range 
        max_angle = pi/2.1; % uscillation range
        
        % stationary link
        % s = 1, 
		links(1).angle = 0; % rotation from the positive x-axis
		links(1).pos = [-1 0]'; % position of the center of rotation
		links(1).verts = [ % display vertices
			 0.0  1.0  1.0  0.0
             0.0  0.0  0.0  0.0
			];
		% driver link
		links(2).angle = 0;
		links(2).pos = [0 0]';
		links(2).verts = [
			 0.0  1.0  1.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% parallelogram link1
		links(3).angle = pi/2;
		links(3).pos = [1 0]';
		links(3).verts = [
			 0.0  2.0  2.0  0.0
			-0.1 -0.1  0.1  0.1
			];
		% parallelogram link2
		links(4).angle = -pi/5;
		links(4).pos = [1 0]';
		links(4).verts = [
			 0.0  2.0  2.0  0.0
			-0.1 -0.1  0.1  0.1
			];
        % parallelogram link3
		links(5).angle = -pi/9;
		links(5).pos = [2 sqrt(3)]';
		links(5).verts = [
			 0.0  2.0  2.0  0.0
			-0.1 -0.1  0.1  0.1
			];
        % parallelogram link4
		links(6).angle = pi/3;
		links(6).pos = [2 -sqrt(3)]';
		links(6).verts = [
			 0.0  2.0  2.0  0.0
			-0.1 -0.1  0.1  0.1
			];
        % long link 1
		links(7).angle = pi/6;
		links(7).pos = [-1 0]';
		links(7).verts = [
			 0.0  2*sqrt(3)  2*sqrt(3)  0.0
			-0.1 -0.1  0.1  0.1
			];
        % long link 1
		links(8).angle = -pi/6;
		links(8).pos = [-1 0]';
		links(8).verts = [
			 0.0  2*sqrt(3)  2*sqrt(3)  0.0
			-0.1 -0.1  0.1  0.1
			];
        grounded = 1;
        driver = 2;
        
        pins(1).linkA = 1;
        pins(1).linkB = 2;
        pins(1).pointA = [1,0]';
        pins(1).pointB = [0,0]';
        pins(2).linkA = 2;
        pins(2).linkB = 3;
        pins(2).pointA = [1,0]';
        pins(2).pointB = [0,0]';
        pins(3).linkA = 2;
        pins(3).linkB = 4;
        pins(3).pointA = [1,0]';
        pins(3).pointB = [0,0]';
        pins(4).linkA = 3;
        pins(4).linkB = 5;
        pins(4).pointA = [2,0]';
        pins(4).pointB = [0,0]';
        pins(5).linkA = 4;
        pins(5).linkB = 6;
        pins(5).pointA = [2,0]';
        pins(5).pointB = [0,0]';
        pins(6).linkA = 5;
        pins(6).linkB = 6;
        pins(6).pointA = [2,0]';
        pins(6).pointB = [2,0]';
        pins(7).linkA = 1;
        pins(7).linkB = 7;
        pins(7).pointA = [0,0]';
        pins(7).pointB = [0,0]';
        pins(8).linkA = 1;
        pins(8).linkB = 8;
        pins(8).pointA = [0,0]';
        pins(8).pointB = [0,0]';
        pins(9).linkA = 5;
        pins(9).linkB = 7;
        pins(9).pointA = [0,0]';
        pins(9).pointB = [2*sqrt(3),0]';
        pins(10).linkA = 6;
        pins(10).linkB = 8;
        pins(10).pointA = [0,0]';
        pins(10).pointB = [2*sqrt(3),0]';
        
        particles(1).link = 5;
        particles(1).point = [2,0]';
        
        
	case 5
		% Klann
        % stationary
        links(1).angle = 0; % rotation from the positive x-axis
        links(1).pos = [0 0]'; % position of the center of rotation
        links(1).verts = [
        -266.16  0.0  -266.16
        61.45 0.0  -130
        ];
        
        links(2).angle = 3*pi/2;
        links(2).pos = [0 0]';
        links(2).verts = [
            0.0 110 110 0
            -5  -5  5   5
        ];
    
        links(3).angle = 0;
        links(3).pos = [0 0]';
        links(3).verts = [
            0.0 130 130 0
            -5  -5  5   5
        ];
    
        links(4).angle = 0;
        links(4).pos = [0 0]';
        links(4).verts = [
            0.0 182 182 0
            -5  -5  5   5
        ];
    
        links(5).angle = 0;
        links(5).pos = [0 0]';
        links(5).verts = [
            0.0 288 288 0 -216.65 -216.65
            -5  -5  5 5 43.20 33.20 
        ];
    
        links(6).angle = 0;
        links(6).pos = [0 0]';
        links(6).verts = [
            0.0 265 734.57 734.57 265 0
            -5  -5 135 145 5   5
        ];
    
    

        pins(1).linkA = 1;
        pins(1).linkB = 2;
        pins(1).pointA = [0 0]';
        pins(1).pointB = [0 0]';
        
        pins(2).linkA = 1;
        pins(2).linkB = 3;
        pins(2).pointA = [-266.16 -130]';
        pins(2).pointB = [0 0]';
        
        pins(3).linkA = 1;
        pins(3).linkB = 4;
        pins(3).pointA = [-266.16 61.45]';
        pins(3).pointB = [0 0]';
        
        pins(4).linkA = 2;
        pins(4).linkB = 5;
        pins(4).pointA = [110 0]';
        pins(4).pointB = [288 0]';
        
        pins(5).linkA = 4;
        pins(5).linkB = 6;
        pins(5).pointA = [182 0]';
        pins(5).pointB = [0 0]';

        pins(6).linkA = 3;
        pins(6).linkB = 5;
        pins(6).pointA = [130 0]';
        pins(6).pointB = [0 0]';
        
        
        pins(7).linkA = 6;
        pins(7).linkB = 5;
        pins(7).pointA = [265 0]';
        pins(7).pointB = [-216.65 38.53]';
        
        
        grounded = 1;
        driver = 2;
        
        particles(1).link = 6;
        particles(1).point = [734.57,140]';
        
        
	case 6
		% Another linkage
	case 10
		% Extra credit!
end

% Initialize
for i = 1 : length(links)
	links(i).grounded = (i == grounded); %#ok<*AGROW>
	links(i).driver = (i == driver);
	% These target quantities are only used for grounded and driver links
	links(i).angleTarget = links(i).angle;
	links(i).posTarget = links(i).pos;
end
for i = 1 : length(particles)
	particles(i).pointsWorld = zeros(2,0); % transformed points, initially empty
end

% Debug: drawing here to debug scene setup
drawScene(0,links,pins,sliders,particles);

% lsqnonlin options
if verLessThan('matlab','8.1')
	opt = optimset(...
		'Jacobian','on',...
		'DerivativeCheck','off',...
		'Display','off'); % final-detailed iter-detailed off
else
	opt = optimoptions('lsqnonlin',...
		'Jacobian','on',...
		'DerivativeCheck','off',...
		'Display','off'); % final-detailed iter-detailed off
end

% Simulation loop
t = 0; % current time
T = 2; % final time
dt = 0.01; % time step
angVel = -2*pi; % driver angular velocity
w = 20; % radius frequency of the oscillation

while t < T
	% Procedurally set the driver angle.
	% Right now, the target angle is being linearly increased, but you may
	% want to do something else.
    if ~oscillation
        links(driver).angleTarget = links(driver).angleTarget + dt*angVel;
    else
        %oscillatory motion code blcok
        links(driver).angleTarget = ...
            (max_angle - min_angle) * sin(w*t) / 2 + (max_angle + min_angle) / 2;
    end    
    
	% Solve for linkage orientations and positions
	[links,feasible] = solveLinkage(links,pins,sliders,opt);
	% Update particle positions
	particles = updateParticles(links,particles);
	% Draw scene
	drawScene(t,links,pins,sliders,particles);
	% Quit if over-constrained
	if ~feasible
		break;
	end
	t = t + dt;
end

end

%%
function [R,dR] = rotationMatrix(angle)
c = cos(angle);
s = sin(angle);
% Rotation matrix
R = zeros(2);
R(1,1) = c;
R(1,2) = -s;
R(2,1) = s;
R(2,2) = c;
if nargout >= 2
	% Rotation matrix derivative
	dR = zeros(2);
	dR(1,1) = -s;
	dR(1,2) = -c;
	dR(2,1) = c;
	dR(2,2) = -s;
end
end

%%
function [links,feasible] = solveLinkage(links,pins,sliders,opt)
nlinks = length(links);
% Extract the current angles and positions into a vector
angPos0 = zeros(3*nlinks,1);
for i = 1 : nlinks
	link = links(i);
	ii = (i-1)*3+(1:3);
	angPos0(ii(1)) = link.angle;
	angPos0(ii(2:3)) = link.pos;
end
% Limits
lb = -inf(size(angPos0));
ub =  inf(size(angPos0));
% Solve for angles and positions
[angPos,r2] = lsqnonlin(@(angPos)objFun(angPos,links,sliders,pins),angPos0,lb,ub,opt);
% If the mechanism is feasible, then the residual should be zero
feasible = true;
if r2 > 1e-4
	fprintf('Mechanism is over constrained!\n');
	feasible = false;
end
% Extract the angles and positions from the values in the vector
for i = 1 : length(links)
	ii = (i-1)*3+(1:3);
	links(i).angle = angPos(ii(1));
	links(i).pos = angPos(ii(2:3));
end
end

%%
function [c,J] = objFun(angPos,links,sliders,pins)
nlinks = length(links);
npins = length(pins);
nsliders = length(sliders);
% Temporarily change angles and positions of the links. These changes will
% be undone when exiting this function.
for i = 1 : nlinks
	ii = (i-1)*3+(1:3);
	links(i).angle = angPos(ii(1));
	links(i).pos = angPos(ii(2:3));
end

% Evaluate constraints
ndof = 3*nlinks;
ncon = 3 + 3 + 2*npins; % 3 for ground, 3 for driver, 2*npins for pins
c = zeros(ncon,1);
J = zeros(ncon,ndof);
k = 0;
% Some angles and positions are fixed
for i = 1 : nlinks
	link = links(i);
	if link.grounded || link.driver
		% Grounded and driver links have their angles and positions
		% prescribed.
		c(k+1,    1) = link.angle - link.angleTarget;
		c(k+(2:3),1) = link.pos - link.posTarget;
		% The Jacobian of this constraint is the identity matrix
		colAng = (i-1)*3 + 1;
		colPos = (i-1)*3 + (2:3);
		J(k+1,    colAng) = 1;
		J(k+(2:3),colPos) = eye(2);
		k = k + 3;
	end
end
% Pin constraints
for i = 1 : npins
	pin = pins(i);
	rows = k+(1:2); % row index of this pin constraint
	k = k + 2;
	indLinkA = pin.linkA; % array index of link A
	indLinkB = pin.linkB; % array index of link B
	linkA = links(indLinkA);
	linkB = links(indLinkB);
	[Ra,dRa] = rotationMatrix(linkA.angle);
	[Rb,dRb] = rotationMatrix(linkB.angle);
	% Local positions
	ra = pin.pointA;
	rb = pin.pointB;
	% World positions
	xa = Ra * ra + linkA.pos;
	xb = Rb * rb + linkB.pos;
	p = xa(1:2) - xb(1:2);
	c(rows,1) = p;
	%
	% Optional Jacobian computation
	%
	% Column indices for the angles and positions of links A and B
	colAngA = (indLinkA-1)*3 + 1;
	colPosA = (indLinkA-1)*3 + (2:3);
	colAngB = (indLinkB-1)*3 + 1;
	colPosB = (indLinkB-1)*3 + (2:3);
	% The Jacobian of this constraint is the partial derivative of f wrt
	% the angles and positions of the two links.
	J(rows,colAngA) = dRa * ra;
	J(rows,colPosA) = eye(2);
	J(rows,colAngB) = -dRb * rb;
	J(rows,colPosB) = -eye(2);
end
end

%%
function particles = updateParticles(links,particles)
% Transform particle position from local to world
for i = 1 : length(particles)
	particle = particles(i);
	link = links(particle.link);
	% IMPLEMENT ME: compute x, the world space position of the particle.
    theta = link.angle;
    coor = link.pos;
	x = [cos(theta) -sin(theta); sin(theta) cos(theta)] * particle.point + coor;
	% Append world position to the array (grows indefinitely)
	particles(i).pointsWorld(:,end+1) = x;
end
end

%%
function drawScene(t,links,pins,sliders,particles)
if t == 0
	clf;
	axis equal;
	hold on;
	grid on;
	xlabel('X');
	ylabel('Y');
end
cla;
% Draw links
for i = 1 : length(links)
	link = links(i);
	R = rotationMatrix(link.angle);
	% Draw frame
	p = link.pos; % frame origin
	s = 0.2; % frame display size
	px = p + s*R(:,1); % frame x-axis
	py = p + s*R(:,2); % frame y-axis
	plot([p(1),px(1)],[p(2),px(2)],'r','LineWidth',3);
	plot([p(1),py(1)],[p(2),py(2)],'g','LineWidth',3);
	% Draw link geometry
	if link.grounded
		color = [1 0 0];
	elseif link.driver
		color = [0 1 0];
	else
		color = [0 0 1];
	end
	E = [R,link.pos;0,0,1]; % transformation matrix
	vertsLocal = [link.verts;ones(1,size(link.verts,2))];
	vertsWorld = E * vertsLocal;
	plot(vertsWorld(1,[1:end,1]),vertsWorld(2,[1:end,1]),'Color',color);
end
% Draw pins
for i = 1 : length(pins)
	pin = pins(i);
	linkA = links(pin.linkA);
	linkB = links(pin.linkB);
	Ra = rotationMatrix(linkA.angle);
	Rb = rotationMatrix(linkB.angle);
	xa = Ra * pin.pointA + linkA.pos;
	xb = Rb * pin.pointB + linkB.pos;
	plot(xa(1),xa(2),'co','MarkerSize',10,'MarkerFaceColor','c');
	plot(xb(1),xb(2),'mx','MarkerSize',10,'LineWidth',2);
end
% Draw particles
for i = 1 : length(particles)
	particle = particles(i);
	if ~isempty(particle.pointsWorld)
		plot(particle.pointsWorld(1,:),particle.pointsWorld(2,:),'k');
		plot(particle.pointsWorld(1,end),particle.pointsWorld(2,end),'ko');
	end
end
%axis equal;
title(sprintf('t=%.3f',t));
drawnow;
end
