function mse = computeMSE(orginalFrame,outputFrame)
   [M, N,w] = size(orginalFrame);
   mse = 0;
   for y=1:N
       for x=1:M
           originalValue = double(orginalFrame(x,y));
           outputValue = double(outputFrame(x,y));
           difference =  originalValue - outputValue;
           squared = difference*difference;
           mse = mse + squared;
       end
   end
   k = 1/(M*N);
   mse = k*mse;
end