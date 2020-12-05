%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%  UNIVERSIDAD DE IBAGU?  %%%
%%%  Master in Control      %%%
%%%  Instrumentacion        %%%
%%%  Harold F MURCIA        %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Data and IoT
% Link: https://www.mathworks.com/matlabcentral/fileexchange/52244-thingspeak-support-toolbox

clear,clc,close all

directory = pwd;
directory = [directory,'/ThingSpeak Support Toolbox'];
addpath(directory)

data=[1;2];
% TODO - Replace the [] with channel ID to write data to:
writeChannelID = 767327;
% TODO - Enter the Write API Key between the '' below:
writeAPIKey = 'P7C4MP5Z9K2S1P6V';


response = thingSpeakWrite(writeChannelID, 4, 'Writekey', writeAPIKey);
