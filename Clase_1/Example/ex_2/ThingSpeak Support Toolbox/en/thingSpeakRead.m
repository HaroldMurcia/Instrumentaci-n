%THINGSPEAKREAD Read data stored in a ThingSpeak channel.
%
%   Syntax
%   ------
%   data = thingSpeakRead(channelID)
%   data = thingSpeakRead(channelID,Name,Value)
%   data = thingSpeakRead(___,'ReadKey',readAPIKey)
%   [data,timestamps] = thingSpeakRead(___)
%   [data,timestamps,channelInfo] = thingSpeakRead(___) 
%   
%   Description
%   ------------
%   data = thingSpeakRead(channelID) reads the most recent data from
%   all fields of the specified public channel on ThingSpeak.com.
%
%   data = thingSpeakRead(channelID,Name,Value) uses additional options 
%   specified by one or more Name,Value pair arguments.
% 
%   data = thingSpeakRead(___,'ReadKey',readAPIKey) uses the ThingSpea 
%   read API key stored in variable readAPIKey to read from a private
%   channel.
%
%   [data,timestamps] = thingSpeakRead(___) also returns timestamps from 
%   the specified channel on ThingSpeak.com and can include any of the 
%   input arguments in previous syntaxes.
%
%   [data,timestamps,channelInfo] = thingSpeakRead(___) also returns 
%   channel information.
%
%   The structure of the channel information is:
%                ChannelID: 12397
%                     Name: 'WeatherStation'
%              Description: 'MathWorks Weather Station, West Garage, Natick, MA 01760, USA'
%                 Latitude: 42.2997
%                Longitude: -71.3505
%                 Altitude: 60
%                  Created: [1x1 datetime]
%                  Updated: [1x1 datetime]
%                LastEntry: 188212
%        FieldDescriptions: {1x8 cell}
%                 FieldIDs: [1 2 3 4 5 6 7 8]
%                      URL: 'http://api.thingspeak.com/channels/12397/feed.json?'
%
%   Input Arguments
%   ---------------
%
%   Name         Description                             Data Type
%   ----    --------------------                         ---------
%   channelID
%           Channel identification number.               positive integer
%
%   Name-Value Pair Arguments
%   -------------------------
%
%   Name         Description                             Data Type
%   ----    --------------------                         ---------
%
%   DateRange
%           Range of data to return, specified as an     1x2 array of datetime
%           an array of values that have 
%           [startdate,enddate], in MATLAB datetime
%           values. The number of points returned is
%           always limited to a maximum of 8000 by the
%           ThingSpeak.com server. Adjust your ranges 
%           or make multiple calls if you need more 
%           than 8000 points of data.
%
%           DateRange cannot be used with:
%           - NumDays
%           - NumMinutes
%
%   Fields
%           Channel Field IDs to retrieve data from.     1x8 positive integer/s
%           You can specify up to 8 fields to read 
%           data from.
%
%   Location                                             logical
%           Positional information of data from the
%           channel. Location information includes 
%           latitude, longitude, and altitude.
%
%   NumDays
%           Number of 24 hour periods to retrieve from   positive integer
%           the present time. The number of points
%           returned is always limited to a maximum
%           of 8000 by the ThingSpeak.com server
%           and therefore if you hit the limit you may
%           wish to use DateRange instead.
%
%           NumDays cannot be used with:
%           - NumMinutes
%           - DateRange
%
%   NumMinutes
%           Number of minutes from the present time to   positive integer
%           retrieve data from. The number of points
%           returned is always limited to a maximum of
%           8000 by the ThingSpeak.com server and
%           therefore if you hit the limit you may wish
%           to use DateRange instead.
%
%           NumMinutes cannot be used with:
%           - NumDays
%           - DateRange
%
%   NumPoints
%           Number of data points to retrieve           positive integer
%           from the present moment. The number of
%           points returned is limited to a maximum
%           of 8000 by the ThingSpeak.com server.
%
%           NumPoints cannot be used with:
%           - DateRange
%           - NumDays
%           - NumMinutes
%
%   OutputFormat
%           Specify the class of the output data.        string
%           Valid values are: 'matrix' or 'table'
%           or 'timetable'.
%           If 'table' or 'timetable' is chosen,
%           the right hand side outputs become:
%           [ table, channelInfo ]
%           The table will contain the timestamps and
%           the data from the fields. If OutputFormat is
%           not specified, the default value is
%           'matrix'.
%
%   ReadKey
%           Specify the Read APIKey of the channel.      string
%           
%
%   Timeout                                              positive number
%          Specify the timeout (in seconds) for
%          connecting to the server and reading data.
%          Default value is 10 seconds.
%
%   % Example 1
%   % ---------
%   % Retrieve the most recent result for all fields of a
%   % public channel including the timestamp.
%   [data,time] = thingSpeakRead(12397)
%
%   % Example 2
%   % ---------
%   % Retrieve data for August 8, 2014 through August 12, 2014 for
%   % fields 1 and 4 of a public channel, including the timestamp, and
%   % channel information.
%   [data,time,channelInfo] = ...
%   thingSpeakRead(12397,'Fields',[1 4],'DateRange',[datetime('Aug 8, 2014'),...
%                  datetime('Aug 12, 2014')])
%
%   % Example 3
%   % ---------
%   % Retrieve last ten points of data from fields 1 and 4 of a public
%   % channel. Return the data and timestamps in a table, and include the
%   % channel information.
%   [data,channelInfo] = ...
%   thingSpeakRead(12397,'Fields',[1 4],'NumPoints',10,'OutputFormat','table')
%
%   % Example 4
%   % ---------
%   % Retrieve last ten points of data from fields 1 and 4 of a public
%   % channel. Return the data in a timetable, and include the channel
%   % information.
%
%   [data,channelInfo] = ...
%   thingSpeakRead(12397,'Fields',[1, 4],'NumPoints',10,'OutputFormat','timetable');
%
%   % Example 5
%   % ---------
%   % Retrieve last 5 minutes of data from fields 1 and 4 of a public
%   % channel. Return only the data and timestamps.
%   [data, time] = thingSpeakRead(12397, 'Fields', [1, 4], 'NumMinutes', 5)
%
%   % Example 6
%   % ---------
%   % Retrieve last 2 days of data from fields 1 and 4 of a public
%   % channel. Return only the data and timestamps.
%   [data, time] = thingSpeakRead(12397, 'Fields', [1, 4], 'NumDays', 2)
%
%   % Example 7
%   % ---------
%   % Retrieve the most recent result for all fields of a private channel.
%   channelID = <Enter Channel ID>
%   readKey   = <Enter Read API Key>
%   data = thingSpeakRead(channelID, 'ReadKey', readKey)
%
%   % Example 8
%   % ---------
%   % Retrieve latitude, longitude and altitude data along with the last
%   % 10 channel updates for all fields in a public channel and return the
%   % data as a table.
%   channelID = <Enter Channel ID>
%   data = thingSpeakRead(channelID, 'NumPoints', 10, 'Location', true, ...
%          'OutputFormat', 'table')
%
%   % Example 9
%   % ---------
%   % Set the timeout for reading 8000 data points from field 1 of a public
%   % channel.
%   data = thingSpeakRead(12397, 'Fields', 1, 'NumPoints', 8000, ...
%          'Timeout', 10)
%

% Copyright 2015-2018 The MathWorks, Inc.
 

