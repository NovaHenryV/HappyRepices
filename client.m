function varargout = client(varargin)
% CLIENT MATLAB code for client.fig
%      CLIENT, by itself, creates a new CLIENT or raises the existing
%      singleton*.
%
%      H = CLIENT returns the handle to a new CLIENT or the handle to
%      the existing singleton*.
%
%      CLIENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLIENT.M with the given input arguments.
%
%      CLIENT('Property','Value',...) creates a new CLIENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before client_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to client_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help client

% Last Modified by GUIDE v2.5 30-Nov-2016 14:02:33

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @client_OpeningFcn, ...
                   'gui_OutputFcn',  @client_OutputFcn, ...
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


% --- Executes just before client is made visible.
function client_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to client (see VARARGIN)

% Choose default command line output for client
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes client wait for user response (see UIRESUME)
% uiwait(handles.figure1);
ingre8_exist=exist('ingreallmat.mat','file');
if ingre8_exist==0
else
    load ingreallmat;
    if isempty(ingretem8)==0
    l=size(ingretem8);
    for ii=1:l(1)
        data1(ii,1)=ingretem8{ii}(1,1);
        data1(ii,2)=ingretem8{ii}(1,2);
        data1(ii,3)=ingretem8{ii}(1,3);
        data1(ii,4)=ingretem8{ii}(1,4);
    end
    set(handles.realshow,'data',data1);
    end
end
set(handles.predictshow,'data','');
% --- Outputs from this function are returned to the command line.
function varargout = client_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function predictclientnum_Callback(hObject, eventdata, handles)
% hObject    handle to predictclientnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of predictclientnum as text
%        str2double(get(hObject,'String')) returns contents of predictclientnum as a double


% --- Executes during object creation, after setting all properties.
function predictclientnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to predictclientnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in return2recipes.
function return2recipes_Callback(hObject, eventdata, handles)
% hObject    handle to return2recipes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
recipes('Visible','on');
client('Visible','off');

% --- Executes on button press in perdict.
function perdict_Callback(hObject, eventdata, handles)
% hObject    handle to perdict (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ingre8_exist=exist('ingreallmat.mat','file');
if ingre8_exist==0
else
    clientnum=get(handles.predictclientnum,'String');
    clientnum=str2num(clientnum);
    load ingreallmat;
    if isempty(ingretem8)==0
    l=size(ingretem8);
    for ii=1:l(1)
        data1(ii,1)=ingretem8{ii}(1,1);
        data1(ii,2)=ingretem8{ii}(1,2);
        data1(ii,3)=ingretem8{ii}(1,3);
        data1(ii,4)={clientnum*cellfun(@double,ingretem8{ii}(1,3))};
    end
    set(handles.predictshow,'data',data1);
    end
end

% --- Executes on button press in return2chief.
function return2chief_Callback(hObject, eventdata, handles)
% hObject    handle to return2chief (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
chief('Visible','on');
client('Visible','off');
