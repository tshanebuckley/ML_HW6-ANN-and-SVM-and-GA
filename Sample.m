classdef Sample < matlab.mixin.Copyable
   properties
      num_epochs = 0;
      hidden_layers = [];
   end
   methods
       function obj = gen_hidden_layers(obj)
          s = randi([1,5],[1,1]); % size of random array for NN layers
          obj.hidden_layers = randi([1,8],[1,s]); % random vector for layers
       end
       function obj = gen_num_epochs(obj)
          r = randi([1,8],[1,1]);
          obj.num_epochs = 1000*r;
       end
       function obj = set.hidden_layers(obj,h)
           obj.hidden_layers = h;
       end
       function obj = set.num_epochs(obj,e)
           obj.num_epochs = e;
       end
       function obj = rand_sample(obj)
           r = randi([1,3],[1,1]);
           if r == 1
                obj.hidden_layers = obj.gen_hidden_layers.hidden_layers;
                obj.num_epochs = obj.gen_num_epochs.num_epochs;
           elseif r == 2
               obj.hidden_layers = obj.gen_hidden_layers.hidden_layers;
           else
               obj.num_epochs = obj.gen_num_epochs.num_epochs;
           end
       end
   end
end