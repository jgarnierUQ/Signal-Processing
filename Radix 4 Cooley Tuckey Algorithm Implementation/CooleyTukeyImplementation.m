%Jonathan Garnier
%12/10/2019

%Clear all Close all
clear all;
close all;

%% Input Parameters
N = 30;
ROWS = 5;
COLUMNS = 6;
uniqueCoefficients = 0;

%% Generate Arbitrary Input Signal
input = 0:N-1;
input = sin(input) + sin(4*input) + cos(1.2*input) + sin(2.6*input);

%% Reshape Vector Into Matrix
matrix_orig = reshape(input, COLUMNS, ROWS).';
matrix_col = zeros(size(matrix_orig));

%% Implement DFT along columns
for col = 1:COLUMNS
    for row = 1:ROWS
        for n = 1:ROWS
            matrix_col(row, col) = matrix_col(row,col) + matrix_orig(n ,col) * exp(-1i*2*pi*(row-1)*(n-1)/ROWS);
        end
    end
end
 
%% Multiply By Twiddle Factors
for col = 1:COLUMNS
    for row = 1:ROWS
        matrix_col(row, col) = matrix_col(row,col) * exp(-1i * 2*pi * (row -1) * (col -1) / N);
    end 
end
uniqueCoefficients = uniqueCoefficients + length(unique(matrix_col));

%% Implement DFT along rows
matrix_fin = zeros(size(matrix_col));
for row = 1:ROWS
    for col = 1:COLUMNS
        for n = 1:COLUMNS
            matrix_fin(row, col) = matrix_fin(row,col) + matrix_col(row ,n) * exp(-1i*2*pi*(col-1)*(n-1)/COLUMNS);
        end
    end
end

%% Reshape Back Into Vector
out = reshape(matrix_fin, 1, N);

%% Compare To Direct Application Of DFT Matrix
direct = input * dftmtx(N);
round(direct - out, 12)
