function varargout = ingredientchief(varargin)
% INGREDIENTCHIEF MATLAB code for ingredientchief.fig
%      INGREDIENTCHIEF, by itself, creates a new INGREDIENTCHIEF or raises the existing
%      singleton*.
%
%      H = INGREDIENTCHIEF returns the handle to a new INGREDIENTCHIEF or the handle to
%      the existing singleton*.
%
%      INGREDIENTCHIEF('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in INGREDIENTCHIEF.M with the given input arguments.
%
%      INGREDIENTCHIEF('Property','Value',...) creates a new INGREDIENTCHIEF or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ingredientchief_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ingredientchief_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ingredientchief

% Last Modified by GUIDE v2.5 14-Nov-2016 19:23:31

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ingredientchief_OpeningFcn, ...
                   'gui_OutputFcn',  @ingredientchief_OutputFcn, ...
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



% --- Executes just before ingredientchief is made visible.
function ingredientchief_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ingredientchief (see VARARGIN)

% Choose default command line output for ingredientchief
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

ingre_exist=exist('ingremat.mat','file');
if ingre_exist==0
else
    load ingremat;
    if isempty(ingretem1)==0
    l=size(ingretem1);
    for ii=1:l(1)
        data1(ii,1)=ingretem1{ii}(1);
        data1(ii,2)=ingretem1{ii}(2);
    end
    set(handles.uitable1,'data',data1);
    end
end

%set(handles.uitable1,'columneditable',true);


% UIWAIT makes ingredientchief wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ingredientchief_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in update2ingre.
function update2ingre_Callback(hObject, eventdata, handles)
% hObject    handle to update2ingre (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ingredientchief('Visible','off');
ingredientupdate('Visible','on');


% --- Executes on button press in delteButton.



% --- Executes on button press in return2chief.
function return2chief_Callback(hObject, eventdata, handles)
% hObject    handle to return2chief (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ingredientchief('Visible','off');
chief('Visible','on');



function numEdit_Callback(hObject, eventdata, handles)
% hObject    handle to numEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numEdit as text
%        str2double(get(hObject,'String')) returns contents of numEdit as a double


% --- Executes during object creation, after setting all properties.
function numEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function delteButton_Callback(hObject, eventdata, handles)
% hObject    handle to delteButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num=get(handles.numEdit,'String');
num=str2num(num);
  
load ingremat;  
l=size(ingretem1);
if num<=l(1)                          %仅当输入小于等于食材最大编号时有效
ingretem1{num}=[];                    %删除输入序号行数
ingretem1(num,:)=[];                  %缩短食材列表
save ingremat ingretem1               %更新数据
load ingremat;                        %重新导入
if isempty(ingretem1)==0              %仅当新数据有食材时进行data显示
 l=size(ingretem1);
 for ii=1:l(1)
       data1(ii,1)=ingretem1{ii}(1);
        data1(ii,2)=ingretem1{ii}(2);
   end
    set(handles.uitable1,'data','');
    set(handles.uitable1,'data',data1);
    set(handles.numEdit,'String','');
else                                   %如果无食材则清空显示
    set(handles.uitable1,'data','');
    set(handles.numEdit,'String','');
end
end