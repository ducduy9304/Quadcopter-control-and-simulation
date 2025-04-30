function intermediatePoints = trajectory(A, B, numSteps)
    % A: Điểm xuất phát (A là một vector 3D)
    % B: Điểm đích (B là một vector 3D)
    % numSteps: Số bước trung gian
    
    % Kiểm tra xem A và B có cùng kích thước hay không
    if numel(A) ~= 3 || numel(B) ~= 3
        error('A và B phải là vector 3D.');
    end

    % Sử dụng hàm linspace để tạo các điểm trung gian
    t1 = linspace(A(1), B(1), numSteps);
    t2 = linspace(A(2), B(2), numSteps);
    t3 = linspace(A(3), B(3), numSteps);

    % Kết hợp các điểm trung gian thành ma trận 3D
    intermediatePoints = [t1; t2; t3]';

    % Trả về ma trận chứa các điểm trung gian
end
