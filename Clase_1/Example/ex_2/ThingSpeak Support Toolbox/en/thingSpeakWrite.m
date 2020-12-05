%THINGSPEAKWRITE Write data to a ThingSpeak channel.
%
%   Syntax
%   ------
%
%   thingSpeakWrite(channelID, data, 'WriteKey', writeAPIKey)
%   thingSpeakWrite(__, Name, Value)
%   response = thingSpeakWrite(__)
%
%   Description
%   -----------
%
%   thingSpeakWrite(channelID, data, 'WriteKey', writeAPIKey) writes the 
%   data to the specified channel. The write API key is specified as a 
%   comma-separated pair consisting of 'WriteKey' and a character vector 
%   or string representing the channel write key.
%
%   thingSpeakWrite(__, Name, Value) uses additional options 
%   specified by one or more Name,Value pair arguments.
%
%   response = thingSpeakWrite(__) returns the response provided by the 
%   ThingSpeak server on successful completion of the write operation.
%
%   Input Arguments
%   ---------------
%
%   Name         Description                            Data Type
%   ----      ------------------                        ---------
%   channelID
%            Channel identification number.             positive integer
%
%
%   data
%            Data to be written to the fields in        numeric scalar or
%            a channel. Values can be specified         numeric array or
%            as either a scalar, numeric array,         cell array or table
%            cell array, table or timetable.            or timetable
%
%            If the specified value is a scalar,
%            and FIELDS parameter has not been
%            specified, then it is written to
%            Field1 of the specified channel.
%
%            If the specified value is a vector,
%            it can be a numeric vector or a 1-D
%            cell array. In this case the vector
%            can have a maximum of 8 elements.
%            Each consecutive value in the vector
%            will be written to a consecutive
%            field, starting with Field1, in the
%            specified channel.
%
%            If the specified value is a matrix or
%            table or timetable, then each row of
%            the specified data is assumed to
%            correspond to a single timestamp. For
%            data specified as a matrix the
%            timestamp associated with each row of
%            the matrix needs to be provided using
%            the TIMESTAMP parameter.
%            For data specified as a table,
%            timestamps have be provided as either the
%            first column of the table or using the
%            TIMESTAMP parameter.
%
%
%   Name-Value Pair Arguments
%   -------------------------
%
%   Name         Description                            Data Type
%   ----      ------------------                        ---------
%
%   Fields
%             Field indicies in a channel to            1x8 positive integer/s
%             write data. There can only be a
%             maximum of 8 elements in the
%             Fields input vector.
%
%   Location
%             Write [Latitude, Longitude, Altitude]     1x3 numeric vector or
%             data to the channel feed. You can also    Nx3 array
%             specify just [Latitude, Longitude], if
%             Altitude information is not present.
%
%   Timestamp
%             Specify the timestamp of the datetime     datetime
%             value/s being written to the channel
%             feed.
%
%   Timeout
%             Specify the timeout (in seconds) for      positive number
%             connecting to the server and reading
%             data. Default value is 10 seconds.
%
%   Values
%             Values to be written to the channel       numeric scalar or
%             fields specified with the Fields          numeric array  or
%             parameter.                                cell array     or
%                                                       string         or
%                                                       table or timetable
%
%   WriteKey
%             Specify the write APIKey of the channel.  string
%
%
%   % Example 1
%   % ---------
%   % Write a value to Field1 of a channel. Change the channel ID to
%   % write data to your channel.
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%   thingSpeakWrite(channelID, 2.3, 'WriteKey', writeKey);
%
%   % Example 2
%   % ---------
%   % Write numeric values to the first 4 consecutive fields [1, 2, 3, 4]
%   % of a channel. Change the channel ID to write data to your
%   % channel.
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%   thingSpeakWrite(channelID, [2.3, 1.2, 3.2, 0.1], 'WriteKey', writeKey)
%
%   % Example 3
%   % ---------
%   % Write non-numeric data to the first 3 consecutive fields [1, 2, 3]
%   % of a channel. Change the channel ID to write data to your
%   % channel.
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%   thingSpeakWrite(channelID, {2.3, 'on', 'good'}, 'WriteKey', writeKey)
%
%   % Example 4
%   % ---------
%   % Write values to non-consecutive fields, for e.g., [1, 4, 6] of a
%   % channel. Change the channel ID to write data to your channel.
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%   thingSpeakWrite(channelID, {2.3, 'on', 'good'}, 'Fields', [1, 4, 6], 'WriteKey', writeKey)
%
%   % Example 5
%   % ---------
%   % Write latitude and longitude to the channel feed along with values to
%   % consecutive fields. Change the channel ID to write data to
%   % your channel.
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%   thingSpeakWrite(17504, {2.3, 'on', 'good'}, 'Location', [-40, 23], 'WriteKey', writeKey)
%
%   % Example 6
%   % ---------
%   % Write latitude, longitude and altitude data to a channel without
%   % adding values to fields. Change the channel ID to write data to
%   % your channel.
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%   thingSpeakWrite(17504, 'Location', [-40, 23, 3500], 'WriteKey', writeKey)
%
%   % Example 7
%   % ---------
%   % Write timestamp for the value being written to a channel. Timestamp
%   % provided is interpreted in local timezone.
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%   tStamp = datetime('2/6/2015 9:27:12', 'InputFormat', 'MM/dd/yyyy HH:mm:ss')
%   thingSpeakWrite(17504, [2.3, 1.2, 3.2, 0.1], 'TimeStamp', tStamp, 'WriteKey', writeKey)
%
%   % Example 8
%   % ---------
%   % Write timestamp for the value being written to a channel. Timestamp
%   % provided is interpreted in local timezone.
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%   tStamp = datetime('2/6/2015 9:27:12', 'InputFormat', 'MM/dd/yyyy HH:mm:ss')
%   thingSpeakWrite(17504, [2.3, 1.2, 3.2, 0.1], 'TimeStamp', tStamp, 'WriteKey', writeKey)
%
%   % Example 9
%   % ----------
%   % Write a matrix of values to your channel
%   % Generate Random Data
%   data = randi(10, 10, 3);
%
%   % Generate timestamps for the data
%   tStamps = datetime('now')-minutes(9):minutes(1):datetime('now');
%
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%
%   % Write 10 values to each field of your channel along with timestamps
%   thingSpeakWrite(channelID, data, 'TimeStamp', tStamps, 'WriteKey', writeKey)
%
%   % Example 10
%   % ----------
%   % Write a table of values to your channel
%   % Generate Random Data
%   dataField1 = randi(10, 10, 1);
%   dataField2 = randi(10, 10, 1);
%   % Generate timestamps for the data
%   tStamps = [datetime('now')-minutes(9):minutes(1):datetime('now')]';
%
%   % Create table
%   dataTable = table(tStamps, dataField1, dataField2);
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%
%   % Write 10 values to each field of your channel along with timestamps
%   thingSpeakWrite(channelID, dataTable, 'WriteKey', writeKey)
%
%   % Example 11
%   % ----------
%   % Write a timetable of values to your channel
%   % Generate Random Data
%   dataField1 = randi(10, 10, 1);
%   dataField2 = randi(10, 10, 1);
%   % Generate timestamps for the data
%   Timestamps = [datetime('now')-minutes(9):minutes(1):datetime('now')]';
%
%   % Create timetable
%   dataTimeTable = timetable(Timestamps, dataField1, dataField2);
%   channelID = <Enter Channel ID>
%   writeKey  = <Enter Write API Key>
%
%   % Write 10 values to each field of your channel along with timestamps
%   thingSpeakWrite(channelID, dataTimeTable, 'WriteKey', writeKey)

% Copyright 2015-2018, The MathWorks Inc.

