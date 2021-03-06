function ax=PlotSavedChiSpectra(avg,iz)
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%
% ax=PlotSavedChiSpectra(avg,iz)
%
%
%---------------------
% 07/15/16 - A.Pickering
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%%
ax=gca;
loglog(avg.ks(iz,:),avg.kspec(iz,:),'o-')
hold on
loglog(avg.kks(iz,:),avg.kkspec(iz,:));
grid on
xlim([1 150])
ylim([1e-10 1e0])
freqline(2/avg.fspd(iz),'k--');
freqline(avg.Params.fmax/avg.fspd(iz),'k--');
xlabel('Wavenumber [cpm]','fontsize',16)
ylabel('\Phi_{dT/dz}[K^2m^{-2}cpm^{-1}]','fontsize',16)
title(['P=' num2str(roundx(avg.P(iz),2)) ' [db] , u=' num2str(roundx(avg.fspd(iz),2)) ' [m/s] , \chi = ' num2str(avg.chi1(iz))])
text(avg.Params.fmax/avg.fspd(iz),1e-1,['fmax=' num2str(avg.Params.fmax) 'Hz'],'fontsize',15)
%text(1.5,1e-1,['\chi = ' num2str(avg.chi1(iz))],'fontsize',15)
%%