function [qmini,qmaxi,got_bottom]=determine_depth_range(qtop)
% determine_depth_range(TOP) is a script to determine the slow-sampled
% indices which correspond to the begining and the end of the range over
% which most quantities will be calibrated.  TOP is the upper limit of the
% range; the bottom is determined using find_bottom


if nargin==0
  qtop=5;
end

global cal data

[qmaxi, got_bottom]=find_bot(cal.P,cal.AZ);
if qmaxi==length(cal.P)
  qmaxi=qmaxi-1;
end
qmaxi=qmaxi-1;

qmini=max(find(cal.P(1:qmaxi)<qtop));
if(isempty(qmini))
  qmini=101;
end
% if qmini<101
%   qmini=101;
% end
if qmaxi<(qmini+256)
  qmaxi=length(data.P)-1;
  qmini=101;
end



% (sjw August 2016) This gets rid of important data near the surface of the
% cast that I don't want to delete for Concorde16
%this seems to determine q.maxi correctly for home data
% if qmaxi-qmini>300
%     dif_P=diff(cal.P(qmini:50:qmaxi));
%     mdP=mean(dif_P(round(length(dif_P)/6):round(length(dif_P)/1.5)));
%     %find max depth before dramatical change of dif_P
%     ind=50*find(dif_P<0.6*mdP)-49;
%     ind1=ind+qmini;
%     ind2=find(ind1>0.35*length(cal.P));ind=ind1(ind2);
%     if ~isempty(ind) & cal.P(qmaxi)-cal.P(ind(1))<5;
%         qmaxi=min(qmaxi,ind(1));
%     end
%     clear ind ind2;
%     %find min depth where diff_P looks fine
%     ind2=find(ind1<0.2*length(cal.P(1:qmaxi)));ind=ind1(ind2);
%     if ~isempty(ind) & cal.P(ind(end))-cal.P(qmini)<5;
%         if ind(end)+50<qmaxi
%             qmini=max(qmini,ind(end)+50);
%         end
%     end
% end
