%% Humanizer: Input script

% The Humanizer reads a song and writes a humanized MIDI file back to disk. 
% Input: a text file or MIDI file (example: filename='mysong.txt' or 'mysong.mid')
% Note: A MIDI file is converted to a text file. The text file then needs to be
%   adjusted by hand (see readme.docx).
% Output: The filename of the humanized song is filename_type_sigma_alpha.mid
%
% The following parameters can be adjusted. For a quick start, ignore the parameters, all you need is a MIDI file.
% The default values are typical values that have been determined for professional musicians.
% 1. Humanizing type. Default: type=2
%   type=0: exact
%   type=1: Group humanize: Coupling the time series using two-component ARFIMA process
%   type=2: Humanize drum and bass with the same deviations
%   type=3: Humanize drum and bass separately
%   type=4: Group humanize: Coupling the time series using MICS model
%
% 2. alpha: strength of correlations between errors (1/f^alpha noise). Default: alpha=1
%    The larger alpha, the stronger an error depends on previous errors.
%    In experiments with test subjects, a range 0.3<alpha<1.4 was found.
%
% 3. sigma: standard deviation of the introduced delays of the notes in milliseconds. Default: sigma=10ms
%    The larger sigma, the larger is the delay. 
%    Deviations will be cut off at 2*sigma to exclude rare extreme events.
%
% 4. seed: pick a seed to reproduce results. Example: seed=42.
%   The Humanizer is based on stochastic models. Thus, if no seed is
%   specified, every time a song is humanized, a unique humanized song is obtained.
%
% 5. verbose. Default: verbose=1
%    The Humanizer is talkative by default and write misc files and figures
%    to disk. To only obtain the humanized MIDI file, set verbose=0.
%
% Example Input: notes_humanize = humanizer(filename);
% Output: notes_humanized. Columns of notes_humanized:
    % 1: track number 
    % 2: channel number
    % 3: pitch
    % 4: velocity
    % 5: start time (seconds)
    % 6: end time (seconds)
    % 7: message number of note_on, 
    % 8: message number of note_off

%% enter path to working directory. The Humanizer will write output files into this directory
% example: 
cd /Users/myusername/demo

% add path to bin
setenv('PATH',[getenv('PATH') ':/Users/holgerh/bin/'])

%% enter path to text file or MIDI file
% example: filename = 'mysong.txt'
filename = 'org/org_BillieJean_core.txt'; 
%filename = 'org/org_BillieJean.mid';

%% input parameters (optional)
 sigma = 15; % standard deviation of delays in ms
 alpha = 0.9; % fractal exponent
 type = 4; % humanizing type
 seed = round(10*sigma); % for reproducible results
 verbose = 0;

%[notes_humanized, seed, sort_ind] = humanizer(filename);
[notes_humanized, seed, sort_ind] = humanizer(filename,sigma,alpha,type,seed,verbose);


