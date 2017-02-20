function varargout = recipesupdate(varargin)
% RECIPESUPDATE MATLAB code for recipesupdate.fig
%      RECIPESUPDATE, by itself, creates a new RECIPESUPDATE or raises the existing
%      singleton*.
%
%      H = RECIPESUPDATE returns the handle to a new RECIPESUPDATE or the handle to
%      the existing singleton*.
%
%      RECIPESUPDATE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RECIPESUPDATE.M with the given input arguments.
%
%      RECIPESUPDATE('Property','Value',...) creates a new RECIPESUPDATE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before recipesupdate_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to recipesupdate_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help recipesupdate

% Last Modified by GUIDE v2.5 29-Nov-2016 21:10:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @recipesupdate_OpeningFcn, ...
                   'gui_OutputFcn',  @recipesupdate_OutputFcn, ...
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


% --- Executes just before recipesupdate is made visible.
function recipesupdate_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to recipesupdate (see VARARGIN)

% Choose default command line output for recipesupdate
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
        data1(ii,1)=ingretem1{ii}(1,1);
        data1(ii,2)={0};
    end
    set(handles.ingretable,'data',data1);
    end
end

% UIWAIT makes recipesupdate wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = recipesupdate_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function nameforrec_Callback(hObject, eventdata, handles)
% hObject    handle to nameforrec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nameforrec as text
%        str2double(get(hObject,'String')) returns contents of nameforrec as a double


% --- Executes during object creation, after setting all properties.
function nameforrec_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nameforrec (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function name1_Callback(hObject, eventdata, handles)
% hObject    handle to name1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name1 as text
%        str2double(get(hObject,'String')) returns contents of name1 as a double


% --- Executes during object creation, after setting all properties.
function name1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in savebutton.
function savebutton_Callback(hObject, eventdata, handles)
% hObject    handle to savebutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
name=get(handles.nameforrec,'String');
recip_exist=exist('recipesmat.mat','file');
if recip_exist==0
    
   if isempty(name)==0
       
       retem1{1}={name,0};
       
       data1=get(handles.ingretable,'Data');
       l=size(data1);
       for ii=1:l(1)
       retem1{1}(ii+1,1)=data1(ii,1);
       retem1{1}(ii+1,2)=data1(ii,2);
       end
      % retem1={retem1};
       save recipesmat retem1
       set(findobj('style','edit'),'string','');
   end
else
          if isempty(name)==0
          retem2{1}={name,0};
          data1=get(handles.ingretable,'Data');
          l=size(data1);
           for ii=1:l(1)
           retem2{1}(ii+1,1)=data1(ii,1);
           retem2{1}(ii+1,2)=data1(ii,2);
           end
           load recipesmat
           l=size(retem1);
           retem1{l(1)+1,1}=retem2{1};
           save recipesmat retem1
           set(findobj('style','edit'),'string','');
          end
end

        

% --- Executes on button press in return2recipes.


function return2recipes_Callback(hObject, eventdata, handles)
% hObject    handle to return2recipes (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
recipesupdate('Visible','off');
recipes('Visible','on');
%recipes('Visible','on');


% --- Executes on selection change in ingretable.


% --- Executes during object creation, after setting all properties.
function ingretable_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ingretable (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over ingretable.
