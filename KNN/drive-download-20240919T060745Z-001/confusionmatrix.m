function [CON, A, P, R, F1] = confusionmatrix(ypred, yactual)
    % Initialize counters
    a = 0; 
    b = 0; 
    c = 0; 
    d = 0; 
    for i = 1:length(ypred)
        if ypred(i) == 1 && yactual(i) == 1
            a = a + 1;
        elseif ypred(i) == 1 && yactual(i) == 0
            b = b + 1;
        elseif ypred(i) == 0 && yactual(i) == 1
            
            c = c + 1;
        elseif ypred(i) == 0 && yactual(i) == 0
            d = d + 1;
        end
    end
    CON = [a c; b d]; % [TP FN; FP TN]
    A = ((a + d) / (a + b + c + d)) * 100; 
    if (a + b) == 0
        P = 0; 
    else
        P = a / (a + b); 
    end
    if (a + c) == 0
        R = 0; 
    else
        R = a / (a + c);
    end
    if (P + R) == 0
        F1 = 0; 
    else
        F1 = 2 * P * R / (P + R); 
    end
end