function varargout = recipeschange(varargin)
% RECIPESCHANGE MATLAB code for recipeschange.fig
%      RECIPESCHANGE, by itself, creates a new RECIPESCHANGE or raises the existing
%      singleton*.
%
%      H = RECIPESCHANGE returns the handle to a new RECIPESCHANGE or the handle to
%      the existing singleton*.
%
%      RECIPESCHANGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECIPESCHANGE.M with the given input arguments.
%
%      RECIPESCHANGE('Property','Value',...) creates a new RECIPESCHANGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before recipeschange_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to recipeschange_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help recipeschange

% Last Modified by GUIDE v2.5 29-Nov-2016 23:03:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @recipeschange_OpeningFcn, ...
                   'gui_OutputFcn',  @recipeschange_OutputFcn, ...
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


% --- Executes just before recipeschange is made visible.
function recipeschange_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to recipeschange (see VARARGIN)

% Choose default command line output for recipeschange
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes recipeschange wait for user response (see UIRESUME)
% uiwait(handles.figure1);
load modifynum;
load recipesmat;
set(handles.name,'String',retem1{num}(1,1));
l=size(retem1{num});
for ii=2:l(1)
    data1(ii-1,1)=retem1{num}(ii,1);
    data1(ii-1,2)=retem1{num}(ii,2);
end
set(handles.ingretable,'Data',data1);
% --- Outputs from this function are returned to the command line.
function varargout = recipeschange_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function name_Callback(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name as text
%        str2double(get(hObject,'String')) returns contents of name as a double


% --- Executes during object creation, after setting all properties.
function name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
% hObject    handle to save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 data1=get(handles.ingretable,'Data');
 l=size(data1);
 save test data1;
 load recipesmat;
 load modifynum;
 for ii=1:l(1)
     retem1{num}(ii+1,2)=data1(ii,2);
 end
  save recipesmat retem1;

% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
recipeschange('Visible','off');
recipes('Visible','on');
