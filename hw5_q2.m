clc;
clear;
close all;
% 
% A_index=[1 2 3 4];
% idx=randperm(length(A_index),1);
% A=A_index(idx);

% randperm(4,1);

load('11.mat');

% compute all the connection nodes to a node
connections = zeros(518);
for i = 1:518
    k = 1;
    for j = 1:518
        
        if (A(j,i)~=0)
            connections(i,k)=j;
            k = k+1;
        end
    end
end
            
% Monte Carlo simulation

simulation_times = 10000;     % the number of simulation
rest1 = zeros([500,1]);
for i = 1:simulation_times
    node = 6; % start from node 6
    t = 0;    % start from t=0
    while true
        t = t+1;
        len = sum(connections(node,:)~=0);
        rand_idx = randperm(len,1); % randomly choose a next_node from its neighbors
        list = connections(node,:);
        next_node = list(rand_idx);
        if (next_node == 409)
            break
        end
%         if (next_node == 103)
%             break
%         end
        node = next_node;
    end
    rest1(i) = t;
end

m1 = mean(rest1);

rest2 = zeros([500,1]);
for i = 1:simulation_times
    node = 6; % start from node 6
    t = 0;    % start from t=0
    while true
        t = t+1;
        len = sum(connections(node,:)~=0);
        rand_idx = randperm(len,1); % randomly choose a next_node from its neighbors
        list = connections(node,:);
        next_node = list(rand_idx);

        if (next_node == 103)
            break
        end
        node = next_node;
    end
    rest2(i) = t;
end
m2 = mean(rest2);