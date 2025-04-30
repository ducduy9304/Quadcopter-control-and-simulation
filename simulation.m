f1 = figure('units','normalized','outerposition',[0 0 1 1]); 

% Drone shape definition
Drone = [ 3 -3 0 0  0        
          0  0 0 3 -3        
          0  0 0 0  0];       
RotatedDrone = Drone;
% Main plot for 3D simulation
droneView = subplot(4,4,[1 2 3 5 6 7 9 10 11]);
p = plot3(RotatedDrone(1,:,1),RotatedDrone(2,:,1),RotatedDrone(3,:,1),'k.-');
animLine = animatedline('MaximumNumPoints',1000,...
                        'Color','r');
xlabel('x');ylabel('y');zlabel('z')
axisLim = 60;
axis([-axisLim 30 -axisLim 30 0 axisLim]);
grid on;
grid minor;
hold on
position1=[0,0,0];

angle1=[out.attitudes(1,1),out.attitudes(2,2),out.attitudes(3,3)];

numsteps = 50;
num_steps_available = min(100, size(out.position, 1)); % Adjust the loop limit
for i = 1:num_steps_available
%     phi = out.attitudes(i,1);
%     theta = out.attitudes(i,2);
%     psi = out.attitudes(i,2);
    
    angle(:,1) = out.attitudes(:,1);  % phi 
    angle(:,2) = out.attitudes(:,2);  % theta
    angle(:,3) = out.attitudes(:,3);  % psi
%     angle(i,2)
    position(:,1) = out.position(:,1);
    position(:,2) = out.position(:,2);
    position(:,3) = -out.position(:,3);
    
    thershold = 10e-5;
    road = trajectory(position1,position(i,:),numsteps);
    angles = trajectory(angle1,angle(i,:),numsteps);
    angles(abs(angles)<thershold)=0;

    for j=1:1:numsteps
        phi = angles(j,1);
        theta = angles(j,2);
        psi = angles(j,3);
        % Defining 3rd column of rotation matrix
        R(:) = [cos(psi)*sin(theta)*cos(phi)+sin(psi)*sin(phi);
                sin(psi)*sin(theta)*cos(phi)-cos(psi)*sin(phi);
                cos(theta)*cos(phi)];
        % Defining the three rotation matrices for 3d plotting
        Rx(:,:,1) = [ 1 0 0;
                      0 cos(phi) sin(phi);
                      0 -sin(phi) cos(phi)];
        Ry(:,:,1) = [cos(theta) 0 -sin(theta);
                     0 1 0;
                     sin(theta) 0 cos(theta)];
        Rz(:,:,1) = [cos(psi) sin(psi) 0;
                     -sin(psi) cos(psi) 0;
                     0 0 1];
        %% Plotting
        % 3d drone plot
    
        axisLim = 10/0.5;
    
        % Rotation of drone
        RotatedDrone(:,:) = Rx(:,:,1)'*Ry(:,:,1)'*Rz(:,:,1)*(Drone) + transpose(road(j,:));
        set(p, 'XData', RotatedDrone(1,:), ...
               'YData', RotatedDrone(2,:), ...
               'ZData', RotatedDrone(3,:));          
        % Drone's trail
        addpoints(animLine,road(j,1),road(j,2),road(j,3));
        drawnow;
    end
    position1=position(i,:);
    angles1=angle(i,:);
end