%Jonathan Garnier
%12/10/2019

%Clear all Close all
clear all;
close all;

%% Input Parameters
N = 30;
ROWS = 5;
COLUMNS = 6;

%% Generate Arbitrary Input Signal
input = 0:N-1;
input = sin(input) + sin(4*input) + cos(1.2*input) + sin(2.6*input);

%% Input Indexing
martix_orig = zeros([ROWS COLUMNS]);
for n = 0:N-1 
    matrix_orig(mod(n, ROWS) + 1, mod(n, COLUMNS) + 1) = input(n + 1);
end

%% Implement DFT along columns
matrix_col = zeros([ROWS, COLUMNS]);
for col = 1:COLUMNS
    for row = 1:ROWS
        for n = 1:ROWS
            matrix_col(row, col) = matrix_col(row,col) + matrix_orig(n ,col) * exp(-1i*2*pi*(row-1)*(n-1)/ROWS);
        end
    end
end

%% Implement DFT along rows
matrix_fin = zeros(size(matrix_col));
for row = 1:ROWS
    for col = 1:COLUMNS
        for n = 1:COLUMNS
            matrix_fin(row, col) = matrix_fin(row,col) + matrix_col(row ,n) * exp(-1i*2*pi*(col-1)*(n-1)/COLUMNS);
        end
    end
end

%% Output Indexing
out = zeros([1 N]);
for row = 1:ROWS
    for col = 1:COLUMNS
        k = mod((COLUMNS * (row-1) + ROWS * (col -1)), N);
        out(k+1) = matrix_fin(row,col);
    end
end

%% Compare To Direct Application Of DFT Matrix
direct = input * dftmtx(N);
disp(round(direct - out, 11));