function mcmcChainOut = mbe_restructChains(mcmcChain)
%% mbe_restructChains
%   Restructures MCMC output (of matjags). Matjags creates multiple 
%   structures when more than one chain is used, but stores parameters
%   with the same name in the same variable. This function splits up 
%   the parameters and creates one structure with all the monitored
%   parameters. Parameters are stored as matrix with NxMxT, where N is
%   the number of iterations per chain, M is the number of chains and T is
%   the number of time steps (only for time course analysis).
%
% INPUT:
%   mcmcChain
%       - structure containing the chains (default output created by 
%           matjags)
%   or mcmcChainTs
%       - cell array containing one mcmcChain structure per time point
%
% OUTPUT:
%   mcmcChainOut
%       - structure with one field for every parameter
%
% EXAMPLE:

% Nils Winter (nils.winter1@gmail.com)
% Johann-Wolfgang-Goethe University, Frankfurt
% Created: 2016-03-30
% Version: v1.2 (2016-04-12)
%------------------------------------------------------------------------

% Check if input is time series of multiple mcmc simulations or not
% Input is ts (multiple mcmc simulations with multiple chains)
if iscell(mcmcChain) 
    % Get parameter names
    names = fieldnames(mcmcChain{1});
    pNames = {};
    cnt = 1;
    for indField = 1:(numel(names)-1)  % -1 to skip 'deviance' parameter
        for indParam = 1:size(mcmcChain{1}(1).(names{indField}),2)
            pNames{cnt} = [names{indField} num2str(indParam)];
            cnt = cnt+1;
        end
    end
    
    % Get parameters
    cnt = 1;
    for indTime = 1:size(mcmcChain,2)
        for indChain = 1:size(mcmcChain{1},2)
            for indField = 1:(numel(names)-1)  % -1 to skip 'deviance' parameter
                for indParam = 1:size(mcmcChain{1}(1).(names{indField}),2)
                    mcmcChainOut.(pNames{cnt})(:,indChain,indTime) = mcmcChain{indTime}(indChain).(names{indField})(:,indParam);
                    cnt = cnt+1;
                end
            end
            cnt = 1;
        end
    end

    
% input is just one time step with one or more chains
elseif isstruct(mcmcChain) 
    % Get parameter names
    names = fieldnames(mcmcChain(1));
    pNames = {};
    cnt = 1;
    for indField = 1:(numel(names)-1)  % -1 to skip 'deviance' parameter
        for indParam = 1:size(mcmcChain(1).(names{indField}),2)
            pNames{cnt} = [names{indField} num2str(indParam)];
            cnt = cnt+1;
        end
    end
    
    % Get parameters
    cnt = 1;
    for indChain = 1:size(mcmcChain,2)
        for indField = 1:(numel(names)-1)  % -1 to skip 'deviance' parameter
            for indParam = 1:size(mcmcChain(1).(names{indField}),2)
                mcmcChainOut.(pNames{cnt})(:,indChain) = mcmcChain(indChain).(names{indField})(:,indParam);
                cnt = cnt+1;
            end
        end
        cnt = 1;
    end
    
else
    error(['Input must be either structure with mcmc chains (matjags output) '...
        'or a cell array containing multiple mcmc chains (i.e. for ERP analysis).']);
end



