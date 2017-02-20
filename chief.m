function varargout = chief(varargin)
% CHIEF MATLAB code for chief.fig
%      CHIEF, by itself, creates a new CHIEF or raises the existing
%      singleton*.
%
%      H = CHIEF returns the handle to a new CHIEF or the handle to
%      the existing singleton*.
%
%      CHIEF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CHIEF.M with the given input arguments.
%
%      CHIEF('Property','Value',...) creates a new CHIEF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before chief_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to chief_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help chief

% Last Modified by GUIDE v2.5 04-Nov-2016 15:13:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @chief_OpeningFcn, ...
                   'gui_OutputFcn',  @chief_OutputFcn, ...
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


% --- Executes just before chief is made visible.
function chief_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to chief (see VARARGIN)

% Choose default command line output for chief
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes chief wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = chief_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in finish2client.
function finish2client_Callback(hObject, eventdata, handles)
% hObject    handle to finish2client (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
chief('Visible','off');
client('Visible','on');

% --- Executes on button press in manage2ingre.
function manage2ingre_Callback(hObject, eventdata, handles)
% hObject    handle to manage2ingre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
chief('Visible','off');
ingredientchief('Visible','on');

% --- Executes on button press in managerecipes.
function managerecipes_Callback(hObject, eventdata, handles)
% hObject    handle to managerecipes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
chief('Visible','off');
recipes('Visible','on');
