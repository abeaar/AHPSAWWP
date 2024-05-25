function varargout = jawaban2_123220109(varargin)
% JAWABAN2_123220109 MATLAB code for jawaban2_123220109.fig
%      JAWABAN2_123220109, by itself, creates a new JAWABAN2_123220109 or raises the existing
%      singleton*.
%
%      H = JAWABAN2_123220109 returns the handle to a new JAWABAN2_123220109 or the handle to
%      the existing singleton*.
%
%      JAWABAN2_123220109('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in JAWABAN2_123220109.M with the given input arguments.
%
%      JAWABAN2_123220109('Property','Value',...) creates a new JAWABAN2_123220109 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before jawaban2_123220109_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to jawaban2_123220109_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help jawaban2_123220109

% Last Modified by GUIDE v2.5 23-May-2024 22:23:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @jawaban2_123220109_OpeningFcn, ...
                   'gui_OutputFcn',  @jawaban2_123220109_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before jawaban2_123220109 is made visible.
function jawaban2_123220109_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to jawaban2_123220109 (see VARARGIN)

% Choose default command line output for jawaban2_123220109
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes jawaban2_123220109 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = jawaban2_123220109_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btnProses.
function btnProses_Callback(hObject, eventdata, handles)
% hObject    handle to btnProses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%NGAMBIL DATA DARI CSV
opts = detectImportOptions('data-kamera.csv');
opts.SelectedVariableNames(1:7); %pilih kolom mana aja yang mau dipanggil, pastiin jumlahnya pas
data = readtable('data-kamera.csv', opts);
data = table2cell(data); %buat ngubah datanya ke cell
data = data(:, 1:7);
set(handles.tableMain, 'Data', data); 

%SET BOBOT + K, NGAMBIL DATA DARI TABLE
bobot = [0.25 0.15 0.20 0.40]; %dari soal yang persenan itu 
k = [1, 1, 1, -1]; %1 kalo benefit -1 kalo cost
%contoh color depth benefit karena makin tinggi makin worth it, price cost
%karena makin mahal makin ga worth it
dataTable = get(handles.tableMain, 'Data'); %ngambil data dari table
dataTable = dataTable(:, 4:7)
dataTable = cell2mat(dataTable); %ngubah cell ke mat
disp('dataTable');

%NORMALISASI
bobot = bobot./sum(bobot);
disp('bobot');
disp(bobot); 

%NORMALISASI MATRIKS
[m n] = size(dataTable);
R = zeros(m, n);
skor = zeros(m, 1);
for j = 1:n,
    %ini teorinya lupa nanti balik lagi ya maniezku 
    if k(j)==1
        R(:, j)= dataTable(:, j)./max(dataTable(:, j));
    else 
        R(:, j)= min(dataTable(:, j))./dataTable(:, j);
    end
end
disp('Hasil normalisasi matriks');
disp(R);
%done 4

%PERANGKINGAN 
for i = 1:m
    skor(i)= sum(bobot.*R(i, :));
end 
disp('skor');
disp(skor);
skor = num2cell(skor);
disp('skor');
disp(skor);

%HASIL AKHIR 10 BESAR
data = readtable('data-kamera.csv');
data = table2cell(data); %jangan lupa diganti dlu.. 
data = data(:, 8); %diambil linknya
data = [skor, data]; 
data = sortrows(data, -1);

data = data(1:10, :) %biar munculnya 10 aja
set(handles.tableRekomendasi, 'data', data);
disp('data');
disp(data);
