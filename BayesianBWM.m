% A_B: a matrix containing best-to-others vectors from all decision-makers.
% A_W: a matrix containing other-to-worst vectors from all decision-makers.
%--------------------------------------------------------------------------
% Copyright @ Majid Mohammadi,2019
% m.mohammadi@tudelft.nl
%--------------------------------------------------------------------------


function [w_final,wall] = BayesianBWM(A_B,A_W)

     
k = size(A_B,1);
c = size(A_B,2);
wStar_prior = (1/10000000) * ones(size(A_W,2),1);
w = 1/k * ones(k,c);

% Save prior constants in a structure for later use with matjags
dataList = struct('AW',A_W,'AB',A_B,'wStarPrior',wStar_prior,'n',sum(A_B'),'m',sum(A_W'),'k',k,'c',c);

%% Specify MCMC properties
numSavedSteps = 300000;
nChains = 3;
thinSteps = 1;
burnInSteps = 50000;

parameters = {'wStar','w','beta','beta2','theta'};%'alpha'};

%% Initialize the chain
% Initial values of MCMC chains based on data:
wStar = 1/length(wStar_prior) * ones(length(wStar_prior),1);
alpha = 1;
beta = 1;
% Regarding initial values: (1) sigma will tend to be too big if
% the data have outliers, and (2) nu starts at 5 as a moderate value. These
% initial values keep the burn-in period moderate.

% Set initial values for latent variable in each chain
for i=1:nChains
    temp = struct('wStar', wStar, 'alpha',alpha,'beta',1,'w',w);
    initsList(i) = temp;
end


model = fullfile(pwd,'B2WME.txt');

%% Run the chains using matjags and JAGS
% In case you have the Parallel Computing Toolbox, use ('doParallel',1)
[~, ~, mcmcChain] = matjags(...
    dataList,...
    model,...
    initsList,...
    'monitorparams', parameters,...
    'doparallel',1,...
    'nChains', nChains,...
    'nBurnin', burnInSteps,...
    'thin', thinSteps,...
    'verbosity',1,...
    'nSamples',numSavedSteps);


wall = zeros(size(w));
wStarFinal = zeros(size(wStar));
for i=1:nChains
    for j=1:numSavedSteps
        for k=1:size(w,1)
            for l=1:size(w,2)
                wall(k,l) = wall(k,l) + mcmcChain(i).w(j,k,l);
            end
        end
    end
end

wall = wall / (nChains * numSavedSteps);
 
mcmcChain = mbe_restructChains(mcmcChain);
mcmcChain = mbe_concChains(mcmcChain);

w_final = [];
for i=1:size(A_B,2)
    w_final = [w_final eval(['mcmcChain.wStar' num2str(i)])];
end


end