function [pos,vel] = creat_2_random_matrix(num_drones,D)

pos = rand(num_drones, D) * 20;
vel = rand(num_drones, D) * 2;