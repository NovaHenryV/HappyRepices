function varargout = recipes(varargin)
% RECIPES MATLAB code for recipes.fig
%      RECIPES, by itself, creates a new RECIPES or raises the existing
%      singleton*.
%
%      H = RECIPES returns the handle to a new RECIPES or the handle to
%      the existing singleton*.
%
%      RECIPES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECIPES.M with the given input arguments.
%
%      RECIPES('Property','Value',...) creates a new RECIPES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before recipes_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to recipes_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help recipes

% Last Modified by GUIDE v2.5 30-Nov-2016 12:37:57

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @recipes_OpeningFcn, ...
                   'gui_OutputFcn',  @recipes_OutputFcn, ...
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


% --- Executes just before recipes is made visible.
function recipes_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to recipes (see VARARGIN)

% Choose default command line output for recipes
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes recipes wait for user response (see UIRESUME)
% uiwait(handles.figure1);
recipes_exist=exist('recipesmat.mat','file');
if recipes_exist==0
else
    load recipesmat;
    if isempty(retem1)==0
    l=size(retem1);
    for ii=1:l(1)
        data1(ii,1)=retem1{ii}(1,1);
        data1(ii,2)=retem1{ii}(1,2);
    end
    set(handles.uitable1,'data',data1);
    end
end

% --- Outputs from this function are returned to the command line.
function varargout = recipes_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in repipe2update.
function repipe2update_Callback(hObject, eventdata, handles)
% hObject    handle to repipe2update (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%recipes('Visible','off');
recipesupdate('Visible','on');

% --- Executes on button press in delterecipes.
function delterecipes_Callback(hObject, eventdata, handles)
% hObject    handle to delterecipes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num=get(handles.numdelte,'String');
num=str2num(num);
  
load recipesmat;  
l=size(retem1);
if(num<=l(1))&&(num>=1)                %仅当输入小于等于菜谱最大编号时有效
retem1{num}=[];                        %删除输入序号行数
retem1(num,:)=[];                      %缩短菜谱列表
save recipesmat retem1                 %更新数据
load recipesmat;                       %重新导入
if isempty(retem1)==0                  %仅当新数据有菜谱时进行data显示
 l=size(retem1);  
 for ii=1:l(1)
        data1(ii,1)=retem1{ii}(1,1);
        data1(ii,2)=retem1{ii}(1,2);

   end
    set(handles.uitable1,'data','');
    set(handles.uitable1,'data',data1);
    set(handles.numdelte,'String','');
else                                   %如果无菜谱则清空显示
    set(handles.uitable1,'data','');
    set(handles.numdelte,'String','');
end
end

% --- Executes on button press in return2chief.
function return2chief_Callback(hObject, eventdata, handles)
% hObject    handle to return2chief (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
recipes('Visible','off');
chief('Visible','on');


% --- Executes on button press in updaterecipes.
function updaterecipes_Callback(hObject, eventdata, handles)
% hObject    handle to updaterecipes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function numupdate_Callback(hObject, eventdata, handles)
% hObject    handle to numupdate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numupdate as text
%        str2double(get(hObject,'String')) returns contents of numupdate as a double


% --- Executes during object creation, after setting all properties.
function numupdate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numupdate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function numdelte_Callback(hObject, eventdata, handles)
% hObject    handle to numdelte (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numdelte as text
%        str2double(get(hObject,'String')) returns contents of numdelte as a double


% --- Executes during object creation, after setting all properties.
function numdelte_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numdelte (see GCBO)
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
 data1=get(handles.uitable1,'Data');
 l=size(data1);
 load recipesmat
 for ii=1:l(1)
     retem1{ii}(1,2)=data1(ii,2);
 end
 save recipesmat retem1
  load recipesmat;
    if isempty(retem1)==0
    l=size(retem1);
    for ii=1:l(1)
        data1(ii,1)=retem1{ii}(1,1);
        data1(ii,2)=retem1{ii}(1,2);
    end
    set(handles.uitable1,'data',data1);
    end
    


% --- Executes on button press in modify.
function modify_Callback(hObject, eventdata, handles)
% hObject    handle to modify (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num=get(handles.numupdate,'String');
num=str2num(num);
if isempty(num)==0
    load recipesmat;  
    l=size(retem1);
    if (num<=l(1))&&(num>=1)           
    save modifynum num;
    set(handles.numupdate,'String','');
    recipes('Visible','off');
    recipeschange('Visible','on');
    end
end



function clientnum_Callback(hObject, eventdata, handles)
% hObject    handle to clientnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of clientnum as text
%        str2double(get(hObject,'String')) returns contents of clientnum as a double


% --- Executes during object creation, after setting all properties.
function clientnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to clientnum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in base.
function base_Callback(hObject, eventdata, handles)
% hObject    handle to base (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
num=get(handles.clientnum,'String');
num=str2num(num);
load recipesmat;
load ingremat;
l1=size(ingretem1);
l2=size(retem1);
if isempty(num)==0
for ii=1:l1(1)
    ingretem8{ii,1}(1,1)=ingretem1{ii,1}(1,1);
    ingretem8{ii,1}(1,2)=ingretem1{ii,1}(1,2);
end

for jj=1:l1(1)
    ingretem8{jj,1}(1,4)={0};
end

for ii=1:l2(1)
    recipesnum=cellfun(@double,retem1{ii,1}(1,2));
    for jj=1:l1(1)
        ingretem8{jj,1}(1,4)={cellfun(@double,ingretem8{jj,1}(1,4))+recipesnum*cellfun(@double,retem1{ii,1}(jj+1,2))};
       end
       
    end


for ii=1:l1(1)
    ingretem8{ii,1}(1,3)={cellfun(@double,ingretem8{ii}(1,4))/num};
end
save ingreallmat ingretem8;
set(handles.clientnum,'String','');
recipes('Visible','off');
client('Visible','on');
end
