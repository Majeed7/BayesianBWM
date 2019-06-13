function [probability]  = plotGraph(w,labels)

w_opt = mean(w);
[sampleNo,criteriaNo] = size(w);

probability = zeros(size(w,2));

for i=1:size(w,2)
   for j=1:size(w,2)
      probability(i,j) = length(find(w(:,i) > w(:,j))) / sampleNo; 
   end
end


nonZeroProb = length(find(probability > 0.5));
edgeTable = zeros(nonZeroProb,3);
counter = 1;
for i=1:size(probability,1)
    for j=1:size(probability,1)
        if probability(i,j) > 0.5
           edgeTable(counter,:) = [i j probability(i,j)];
           counter = counter+1;
        end
    end
end

finalProb = zeros(size(probability));
finalProb(probability > 0.5) = probability(probability > 0.5);

directedGraph = probability > 0.5;

set(0,'defaultAxesFontSize', 12,'defaultAxesFontWeight','b')
G = digraph(directedGraph);
p = plot(G,'k','NodeLabel',labels,'EdgeLabel',round(edgeTable(:,3),2));
p.Marker = 's';
p.NodeColor = 'r';
p.MarkerSize = 7;
%p.LineStyle = '--';
axis off
NameArray = {'linewidth','markersize'};
ValueArray ={1.8,10};
set(p,NameArray,ValueArray);
set(gcf,'color','w');

p.NodeLabel = '';
xd = get(p, 'XData');
yd = get(p, 'YData');
text(xd, yd, labels, 'FontSize',12, 'FontWeight','bold', 'HorizontalAlignment','right', 'VerticalAlignment','bottom')

C = {[0	255	255]/255,'r','g','b',[238 154 0]/255,[139 58 58]/255,[.2 .5 .7],[.6 .2 .7],[255 0 255]/255,[.5 .7 .2]};
C = C(1:criteriaNo);
for j=1:length(labels)
    T = [];
    for i=1:size(G.Edges.EndNodes,1)
        if G.Edges.EndNodes(i,1) == j
           %T = [T;G.Edges.EndNodes(j,1:2)];
            highlight(p,G.Edges.EndNodes(i,1:2),'EdgeColor',C{j},'LineWidth',1.5)
        end
    end
    
end

end

   
    