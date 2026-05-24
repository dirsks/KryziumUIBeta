--[[
	Still on beta
	
	Thanks

]]

if not Game:IsLoaded() then
	Game.Loaded:Wait()
	print('Script loaded, please wait until the game loads')
end

--HINT: 1: Workspace; 2: CoreGui; 3: Debris, 4: Players
local Model={[1]=Game:GetService'Workspace',[2]=Game:GetService'CoreGui',[3]=Game:GetService'Debris',[4]=Game:GetService'Players',[5]=Game:GetService'TweenService',[6]=Game:GetService('HttpService'),[7]=Game:GetService'UserInputService'};
--local Enemies=Model[1]['Enemies'];
--local NPCS=Model[1]['NPCs']

local KryziumLib={}
local LibraryName=nil;
-- Instances that we will not use now
local bool=false;
local Spawned=Instance.new'BindableEvent';
local versions =nil
local GetVersion,Result=pcall(function()
	Model[6]:GetAsync'https://raw.githubusercontent.com/dirsks/new/refs/heads/main/API-GetVersion/fad58de7366495db4650cfefac2fcd61.txt'
end)
if GetVersion then
	versions=Model[6]:GetAsync'https://raw.githubusercontent.com/dirsks/new/refs/heads/main/API-GetVersion/fad58de7366495db4650cfefac2fcd61.txt'
else
	print('Could not fetch library version:',Result)
	--print('More versions will be avaible on GitHub soon!')
end

local LucideLibrary=loadstring(game:HttpGet('https://raw.githubusercontent.com/dirsks/KryziumUIBeta/refs/heads/main/utility/Lucide.lua'))();

local Icons={
	Tag=LucideLibrary.GetAsset('tag',32),
	Farm=LucideLibrary.GetAsset('magnet',32)
};

local Avaible='Kryzium UI'

local AudioSFX={
	['Index']=Instance.new('Folder');
	['old intro sound']=Instance.new('Sound');
	['ToggleSound']=Instance.new'Sound';
	['Okaysunshine']=Instance.new'Sound';
};
local Audios={
	Index={
		Parent=Model[2],
		Name='AudioSFX'
	};
	['old intro sound']={
		Parent=AudioSFX['Index'];
		Name='old intro sound';
		SoundId='rbxassetid://138719267809645';
	};
	ToggleSound={
		Parent=AudioSFX['Index'];
		Name='ToggleSound';
		SoundId='rbxassetid://136892652038388';
	};
	Okaysunshine={
		Parent=AudioSFX['Index'];
		Name='Sunshine';
		SoundId='rbxassetid://104168085061939';
	};
};

local InstanceContexts={
	InstancesInNil=Instance.new'Folder';
	ScreenGui2=Instance.new'ScreenGui';
	ScreenGui=Instance.new'ScreenGui';
	Main=Instance.new'Frame';
	Toggle=Instance.new'ImageButton';--Toggle
	UICorner=Instance.new'UICorner';
	UIAspectRatioConstraint=Instance.new'UIAspectRatioConstraint';--End of toggle
	__Main1=Instance.new'Frame';
	--UIDragDetector1=Instance.new'UIDragDetector';
	textttttttttttttttttttttttttext=Instance.new'TextLabel';
	__Title=Instance.new'Frame';
	UICorner=Instance.new'UICorner';
	UICornerrr=Instance.new'UICorner';
	TitleText=Instance.new'TextLabel';-- This
	CornerCover=Instance.new'Frame';
	__TabFrame=Instance.new'Frame';
	TextButton127=Instance.new'TextButton';
	UICorner1=Instance.new'UICorner';
	UICorner2=Instance.new'UICorner';
	CornerCover2=Instance.new'Frame';
	Scroll=Instance.new'ScrollingFrame';
	DropShadowBox=Instance.new'ImageLabel',
	Minimize=Instance.new'ImageButton',
	IconImage=Instance.new'ImageLabel';
	Iconimagecorner=Instance.new'UICorner';
	Cornerrrrrr=Instance.new'UICorner',
	UIGridLayout=Instance.new'UIGridLayout';
	__ContentFrame=Instance.new'Frame';
	__Decor=Instance.new'Frame';
	ImageLabel=Instance.new'ImageLabel';
	UIAspectRatioConstraint=Instance.new'UIAspectRatioConstraint';
	ImageLabel1=Instance.new'ImageLabel';
	Brillant=Instance.new'ImageLabel';


	--Intro Container
	Intro=Instance.new'Frame';
	Container=Instance.new'Frame';
	IntroContainerGradient=Instance.new'UICorner';
	UIGradient=Instance.new'UIGradient';
	Image=Instance.new'ImageLabel';
	ImageCorner=Instance.new'UICorner';	
	Loading=Instance.new'TextLabel';
	Madeby=Instance.new'TextLabel';
	Version=Instance.new'TextLabel';
	
	NoContentLabel=Instance.new'TextLabel';
};
--The property of all contexts in InstanceContexts. TO parent something, you should do: Parent=InstanceContexts['OBJECT_NAME']
--Those top-listed-objects are not created automatically. They're used later on creating elements like: notifications, tabs...
local Contexts={
	TabMenu=Instance.new'Frame'; --Tab Container
	Frame=Instance.new'Frame';
	ACtive=Instance.new'Frame';
	ActiveCorner=Instance.new'UICorner';
	UICorner2Tab=Instance.new'UICorner';
	TextLabeltab=Instance.new'TextLabel';
	TextButtontabb=Instance.new'TextButton';
	UICorner3Tab=Instance.new'UICorner';

	NotificationMain=Instance.new'Frame'; --Notification Container
	__Container=Instance.new'Frame';
	NotificationNoButtons=Instance.new'Frame';
	UICornerNotifiuf8uf7=Instance.new'UICorner';
	TextLabell2=Instance.new'TextLabel';--label
	Textsss=Instance.new'TextLabel';--lable
	NotificationButtons=Instance.new'Frame';
	UICorner4=Instance.new'UICorner';
	Okay=Instance.new'TextButton';
	No=Instance.new'TextButton';
	Yes=Instance.new'TextButton';
	TextLabelNotify1=Instance.new'TextLabel';--label
	TextLabelNotify2=Instance.new'TextLabel';--label

	Slider=Instance.new'Frame';
	UICornerSlider=Instance.new'UICorner';
	UIStrokeSlider=Instance.new'UIStroke';
	Back=Instance.new'Frame';
	UICornerBack=Instance.new'UICorner';
	Fill=Instance.new'Frame';
	UICornerFill=Instance.new'UICorner';
	Drag=Instance.new'ImageButton';
	TextButtonSlider=Instance.new'TextButton';
	TextLabelSlidrr=Instance.new'TextLabel';



	Warning=Instance.new'Frame';
	CornerWarn=Instance.new'UICorner';
	StrokeWarn=Instance.new'UIStroke';
	WarnBtn=Instance.new'TextButton';
	TitleWarn=Instance.new'TextLabel';
	DescWarn=Instance.new'TextLabel';

	ColourPicker=Instance.new'Frame';
	Cornerpick=Instance.new'UICorner';
	Strokepick=Instance.new'UIStroke';
	ColorFrame=Instance.new'Frame'	 ;
	CornerFolor=Instance.new'UICorner';
	frameFramesFramesFRAMES=Instance.new'Frame';
	Sax=Instance.new'TextBox';
	ImageLabels8s=Instance.new'ImageLabel';
	InteractBax=Instance.new'TextButton';

	ScrollingContent=Instance.new'ScrollingFrame';
	ContentFrame=Instance.new'Frame';
	Button=Instance.new'Frame';
	ButtonCorner=Instance.new'UICorner';
	StrokeButton=Instance.new'UIStroke';
	ButtonButton=Instance.new'TextButton';
	LabelButtons=Instance.new'TextLabel';

	Keybind=Instance.new'Frame';
	CornerKeybind=Instance.new'UICorner';
	StrokeKeybind=Instance.new'UIStroke';
	ToggleFrame=Instance.new'Frame';
	CornerToggle=Instance.new'UICorner';
	InteractBox=Instance.new'TextButton';--
	ToggleLabel=Instance.new'TextLabel';--
	info=Instance.new'Frame';
	infoCorner=Instance.new'UICorner';
	infoLabel=Instance.new'TextLabel';
	LabelKeybind=Instance.new'TextLabel';

	Togel=Instance.new'Frame';
	CornerTogle=Instance.new'UICorner';
	StrokeToggle=Instance.new'UIStroke';
	TaggleFrame=Instance.new'Frame';--
	UICornerAgainnnn=Instance.new'UICorner';
	On=Instance.new'Frame';
	Letsgobaby=Instance.new'UICorner';
	Off=Instance.new'Frame';
	CornerCornersCornr=Instance.new'UICorner';
	ToggleInteractButton=Instance.new'TextButton';
	notepad=Instance.new'UIGridLayout';
	aaaa=Instance.new'ImageLabel';
	TaggelLabel=Instance.new'TextLabel';
};--[[

end config:
size:{0.377, 0},{0.196, 0}

pos:{0.311, 0},{0.399, 0}

init config:
size:{0.004, 0},{0.196, 0}

pos:{0.497, 0},{0.4, 0}

]]
local PropertyInstances={
	Minimize={
		Parent=InstanceContexts['__Title'],
		BackgroundColor3=Color3.fromRGB(32, 32, 32),
		BorderSizePixel=0,
		ZIndex=2,
		Image='rbxassetid://109033957910209',
		Position=UDim2.new(0.922, 0,0.133, 0),
		Size=UDim2.new(0.063, 0,1.067, 0)
	};
	IconImage={
		Parent=InstanceContexts['__Title'],
		BackgroundColor3=Color3.fromRGB(32, 32, 32),
		BorderSizePixel=0,
		ZIndex=2,
		Image='rbxassetid://128728496976785',--The icon image on corner. Default image set
		Position=UDim2.new(0.008, 0,0.155, 0),
		Size=UDim2.new(0.063, 0,1.067, 0)
	};
	Iconimagecorner={
		Parent=InstanceContexts ['IconImage']
	};
	Cornerrrrrr={
		Parent=InstanceContexts['Minimize']	,

	};
	DropShadowBox={
		Parent=InstanceContexts['__Main1'],
		ZIndex=-1,
		BackgroundTransparency=1,
		ImageTransparency=0.67,
		Image='rbxassetid://297774371',
		Position=UDim2.new(-0.049, 0,-0.157, 0),
		Size=UDim2.new(0, 562,0, 380)
	};



	--Intro container
	Intro={
		Parent=InstanceContexts['Main'],
		Name='Intro',
		Visible=false,
		ZIndex=999,
		BackgroundColor3=Color3.fromRGB(0, 0, 0),
		BackgroundTransparency=0.4,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1.001,0,1.001,0)
	};
	Container={
		Parent=InstanceContexts['Intro'],
		Name='Container',
		ClipsDescendants=true,
		ZIndex=999,
		BackgroundColor3=Color3.fromRGB(40, 40, 40),
		BackgroundTransparency=0.1,
		Position=UDim2.new(0.495, 0,0.402, 0),
		Size=UDim2.new(0.008, 0,0.196, 0)
	};
	Brillant={
		Parent=InstanceContexts['Container'],
		BackgroundTransparency=1,
		Name='Brillant',
		ZIndex=1007,
		ImageTransparency=0.67,
		Image='rbxassetid://108315025781462',
		Position=UDim2.new(-0.405, 0,-0.18, 0),
		Size=UDim2.new(0.436, 0,1.348, 0)
	};
	IntroContainerGradient={
		Parent=InstanceContexts['Container'],
	};
	UIGradient={
		Parent=InstanceContexts['Container'],
		Enabled=false
	};
	Image={
		Parent=InstanceContexts['Container'],
		Name='Image',
		ZIndex=999,
		BackgroundColor3=Color3.fromRGB(0, 0, 0),
		BackgroundTransparency=0.4,
		Position=UDim2.new(0.398, 0,0.269, 0),
		Size=UDim2.new(0.207, 0,0.577, 0)
	};
	ImageCorner={
		Parent=InstanceContexts['Image'],
		Name='ImageCorner'
	};
	Loading={
		Parent=InstanceContexts['Container'],
		Name='Loading',
		ZIndex=1002,
		Font=Enum.Font.SourceSansBold,
		BackgroundTransparency=1,
		TextScaled=true,
		TextStrokeTransparency=0.7,
		TextColor3=Color3.fromRGB(255,255,255),
		Position=UDim2.new(0.292, 0,0, 0),
		Size=UDim2.new(0.414, 0,0.269, 0)
	};
	Madeby={
		Parent=InstanceContexts['Container'],
		Name='Made by dircs',
		ZIndex=1002,
		Font=Enum.Font.SourceSansBold,
		BackgroundTransparency=1,
		TextScaled=true,
		TextStrokeTransparency=0.7,
		TextTransparency=0.8,
		TextColor3=Color3.fromRGB(255,255,255),
		Position=UDim2.new(0.292, 0,0.897, 0),
		Size=UDim2.new(0.414, 0,0.103, 0)
	};
	Version={
		Parent=InstanceContexts['Container'],
		Name='Version',
		ZIndex=1002,
		Font=Enum.Font.SourceSansBold,
		Text=versions or '',
		BackgroundTransparency=1,
		TextScaled=true,
		TextStrokeTransparency=0.7,
		TextTransparency=0.8,
		TextColor3=Color3.fromRGB(255,255,255),
		Position=UDim2.new(0, 0,0.897, 0),
		Size=UDim2.new(0.104, 0,0.103, 0)
	};
	--Intro container Ends
	--im sotired
	ScrollingContent={--line 294, im done here so im gonna sleep
		Parent=InstanceContexts['InstancesInNil'],
		BackgroundTransparency=1,
		ScrollBarThickness=6,
		Position=UDim2.new(0, 0,0, 0),
		Size=UDim2.new(1.003, 0,1.003, 0)
	};
	ContentFrame={
		Parent=Contexts['ScrollingContent'],
		Name='Content',
		BackgroundTransparency=1,
		Position=UDim2.new(0, 0,0, 18),
		Size=UDim2.new(1,0,1,0)
	};
	notepad={
		Parent=Contexts['ContentFrame'],
		FillDirection=Enum.FillDirection.Vertical,
		CellPadding=UDim2.new(0, 5,0, 20),
		CellSize=UDim2.new(0.719, 0,0.081, 0)--0.281, 0,0.063, 0
	};
	Button={-- Button
		--Parent=Contexts['ContentFrame'],
		Parent=InstanceContexts['InstancesInNil'],
		Name='Button',
		BackgroundColor3=Color3.fromRGB(45, 32, 32),
		BorderSizePixel=0,
		Size=UDim2.new(0.281, 0,0.063, 0)
	};--enf
	ButtonCorner={
		Parent=Contexts['Button'],
		CornerRadius=UDim.new(0, 3)
	};
	StrokeButton={
		Parent=Contexts['Button'],
		Color=Color3.fromRGB(90, 64, 64),
		Transparency=0.5,
		Thickness=2,
		ZIndex=2
	};
	ButtonButton={
		Parent=Contexts['Button'],
		BackgroundTransparency=1,
		TextTransparency=1,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1,0,1,0)
	};
	LabelButtons={
		Parent=Contexts['Button'],
		Font=Enum.Font.SourceSansBold,
		TextScaled=true,
		RichText=true,
		Text='Button',
		BackgroundTransparency=1,
		TextColor3=Color3.fromRGB(255, 255, 255),
		TextStrokeTransparency=0.6,
		Position=UDim2.new(0.021,0,0,0),
		Size=UDim2.new(0.979, 0,1, 0)
	};
	Slider={
		Parent=InstanceContexts['InstancesInNil'],
		Name='Slider',
		BackgroundColor3=Color3.fromRGB(45, 32, 32),
		BackgroundTransparency=0,
		Size=UDim2.new(0.966, 0,0.081, 0)
	};
	UICornerSlider={
		Parent=Contexts['Slider'],
		CornerRadius=UDim.new(0,3)
	};
	UIStrokeSlider={
		Parent=Contexts['Slider'],
		Color=Color3.fromRGB(90, 64, 64),
		Transparency=0.5,
		Thickness=2,
		ZIndex=2
	};
	Back={
		Parent=Contexts['Slider'],
		Name='Back',
		BackgroundColor3=Color3.fromRGB(30, 21, 21),
		BackgroundTransparency=0,
		Position=UDim2.new(0.021, 0,0.369, 0),
		Size=UDim2.new(0, 277,0, 23),
		ClipsDescendants=true
	}	;
	UICornerBack={
		Parent=Contexts['Back'],
		CornerRadius=UDim.new(0,3)
	};
	Fill={
		Parent=Contexts['Back'],
		Name='Fill',
		BackgroundColor3=Color3.fromRGB(85, 0, 0),
		BackgroundTransparency=0,
		Position=UDim2.new(0, 0,0.24, 0),
		Size=UDim2.new(0,6,0,13)
	};
	UICornerFill={
		Parent=Contexts['Fill'],
		CornerRadius=UDim.new(0,3)
	};
	Drag={
		Parent=Contexts['Back'],
		Name='Drag',
		BackgroundTransparency=1,
		Position=UDim2.new(0.016, 0,0, 0),
		Size=UDim2.new(0,16,0,23),
		Image=''
	};
	TextButtonSlider={
		Parent=Contexts['Slider'],
		BackgroundTransparency=1,
		TextTransparency=1,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1,0,1,0)
	};
	TextLabelSlidrr={
		Parent=Contexts['Slider'],
		BackgroundTransparency=1,
		Font=Enum.Font.SourceSansBold,
		RichText=true,
		TextScaled=true,
		TextColor3=Color3.fromRGB(255,255,255),
		Text='Slider',
		TextStrokeTransparency=0.6,
		Position=UDim2.new(0.021,0,0,0),
		Size=UDim2.new(0.979,0,0.386,0)
	};
	--ColorPicker contaner Start
	ColourPicker={
		Parent=InstanceContexts['InstancesInNil'],
		Name='ColourPicker',
		BackgroundColor3=Color3.fromRGB(45, 32, 32),
		BorderSizePixel=0,
		Size=UDim2.new(0.719, 0,0.081, 0)
	};
	textttttttttttttttttttttttttext={
		Parent=Contexts['ColourPicker'],
		BackgroundTransparency=1,
		Size=UDim2.new(0.522,0,1,0),
		TextStrokeTransparency=0.6,
		Font=Enum.Font.SourceSansBold,
		TextColor3=Color3.fromRGB(255,255,255),
		Text='Colour Picker',
		TextScaled=true,
		RichText=true
	};
	Cornerpick={
		Parent=Contexts['ColourPicker'],
		CornerRadius=UDim.new(0,3)
	};
	Strokepick={
		Parent=Contexts['ColourPicker'],
		Color=Color3.fromRGB(90, 64, 64),
		Transparency=0.5,
		Thickness=2,
		ZIndex=2
	};
	ColorFrame={
		Parent=Contexts['ColourPicker'],
		Name='ColorFrame',
		BackgroundColor3=Color3.fromRGB(6, 174, 189),
		BorderSizePixel=0,
		Position=UDim2.new(0.593, 0,0.079, 0),
		Size=UDim2.new(0.389, 0,0.816, 0)
	};
	CornerFolor={
		Parent=Contexts['ColorFrame'],
		CornerRadius=UDim.new(0,3),
	};
	frameFramesFramesFRAMES={
		Parent=Contexts['ColorFrame'],
		Visible=false,
		BackgroundColor3=Color3.fromRGB(20, 20, 20),
		Position=UDim2.new(1.114, 0,-0.101, 0),
		Size=UDim2.new(0, 100,0, 117)
	};
	Sax={
		Parent=Contexts['frameFramesFramesFRAMES'],
		Name='Color3InputBox',
		BackgroundColor3=Color3.fromRGB(50, 50, 50),
		BackgroundTransparency=0,
		TextColor3=Color3.fromRGB(255,255,255),
		Font=Enum.Font.SourceSans,
		Text='',
		PlaceholderText='Color3',
		Position=UDim2.new(0, 0,0.855, 0),
		Size=UDim2.new(0, 100,0, 17)
	};
	ImageLabels8s={
		Parent=Contexts['frameFramesFramesFRAMES'],
		BackgroundTransparency=1,
		Image='rbxassetid://1003599877',
		Size=UDim2.new(0, 100,0, 100)
	};
	TextButton127={
		Parent=Contexts['ImageLabels8s'],
		Name='InteractBox',
		BackgroundTransparency=1,
		Size=UDim2.new(1,0,1,0),
		TextTransparency=1
	};
	InteractBax={
		Parent=Contexts['ColorFrame'],
		BackgroundTransparency=1,
		TextTransparency=1,
		Size=UDim2.new(1,0,1,0)
	},
	--COlorPicker container end
	--Warning Container start
	Warning={
		Parent=InstanceContexts['InstancesInNil'],
		Name='Warning',
		BackgroundColor3=Color3.fromRGB(76, 67, 22),
		BorderSizePixel=0,
		Size=UDim2.new(0.719, 0,0.081, 0)
	};
	CornerWarn={
		Parent=Contexts['Warning'],
		CornerRadius=UDim.new(0,3)
	};
	StrokeWarn={
		Parent=Contexts['Warning'],
		Color=Color3.fromRGB(202, 178, 59),
		Transparency=0.5,
		Thickness=2,
		ZIndex=2
	};
	WarnBtn={
		Parent=Contexts['Warning'],
		BackgroundTransparency=1,
		TextTransparency=1,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1,0,1,0)
	};
	TitleWarn={
		Parent=Contexts['Warning'],
		BackgroundTransparency=1,
		Name='TitleWarn',
		TextScaled=true,
		RichText=true,
		Font=Enum.Font.SourceSansBold,
		Text='Placeholder',
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1,0,0.288,0),
		TextColor3=Color3.fromRGB(255,255,255),
		TextStrokeTransparency=0.6
	};
	DescWarn={
		Parent=Contexts['Warning'],
		BackgroundTransparency=1,
		Name='DescWarn',
		TextScaled=true,
		RichText=true,
		Font=Enum.Font.SourceSansBold,
		Text='Placeholder',
		Position=UDim2.new(0, 0,0.288, 0),
		Size=UDim2.new(1,0,0.712,0),
		TextColor3=Color3.fromRGB(255,255,255),
		TextStrokeTransparency=0.6
	};
	--Warning container ends
	Keybind={--Keybind Button
		--Parent=Contexts['ContentFrame'],
		Parent=InstanceContexts['InstancesInNil'],
		Name='Keybind',
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(45, 32, 32),
		Position=UDim2.new(0.593,0,0.079,0),
		Size=UDim2.new(0.389, 0,0.816, 0),
	};
	CornerKeybind={
		Parent=Contexts['Keybind'],
		CornerRadius=UDim.new(0,3)
	};
	StrokeKeybind={
		Parent=Contexts['Keybind'],
		Color=Color3.fromRGB(90, 64, 64),
		Transparency=0.5,
		Thickness=2,
		ZIndex=2
	};
	ToggleFrame={
		Parent=Contexts['Keybind'],
		BorderSizePixel=0,
		Name='ToggleFrame',
		BackgroundColor3=Color3.fromRGB(30, 21, 21),
		Position=UDim2.new(0.593, 0,0.079, 0),
		Size=UDim2.new(0.389, 0,0.816, 0)
	};
	CornerToggle={
		Parent=Contexts['ToggleFrame'],
		CornerRadius=UDim.new(0,3)--0m,3,9
	};
	InteractBox={
		Parent=Contexts['ToggleFrame'],
		Name='InteractBox',
		BorderSizePixel=0,
		TextTransparency=1,
		BackgroundTransparency=1,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1,0,1,0)
	};
	ToggleLabel={
		Parent=Contexts['ToggleFrame'],
		BackgroundTransparency=1,
		Font=Enum.Font.SourceSans,
		RichText=true,
		Text='F',
		TextScaled=true,
		TextColor3=Color3.fromRGB(127, 127, 127),
		Size=UDim2.new(1,0,1,0)
	};
	info={
		Parent=Contexts['Keybind'],
		Name='info',
		Visible=false,
		BackgroundColor3=Color3.fromRGB(40, 40, 40),
		BackgroundTransparency=0,
		Position=UDim2.new(0.744, 0,1.026, 0),
		Size=UDim2.new(0.071, 0,0.236, 0)
	};
	infoCorner={
		Parent=Contexts['info'],
		CornerRadius=UDim.new(0, 3)
	};
	infoLabel={
		Parent=Contexts['info'],
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Font=Enum.Font.SourceSans,
		TextScaled=true,
		Text='You must input a key',
		TextColor3=Color3.fromRGB(255,255,255),
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1,0,1,0)
	};
	LabelKeybind={
		Parent=Contexts['Keybind'],
		BackgroundTransparency=1,
		Font=Enum.Font.SourceSansBold,
		RichText=true,
		TextScaled=true,
		TextStrokeTransparency=0.6,
		TextColor3=Color3.fromRGB(255,255,255),
		Text='Keybind',
		Size=UDim2.new(0.522, 0,1, 0)
	};
	Togel={
		--Parent=Contexts['ContentFrame'],
		Parent=InstanceContexts['InstancesInNil'],
		Name='Toggle',
		BackgroundColor3=Color3.fromRGB(45, 32, 32),
		BackgroundTransparency=0,
		Size=UDim2.new(0.281, 0,0.063, 0)
	};
	CornerTogle={
		Parent=Contexts['Togel'],
		CornerRadius=UDim.new(0,3)
	};
	StrokeToggle={
		Parent=Contexts['Togel'],
		Color=Color3.fromRGB(90, 64, 64),
		Transparency=0.5,
		Thickness=2,
		ZIndex=2
	};
	TaggleFrame={
		Parent=Contexts['Togel'],
		BackgroundTransparency=0,
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(30, 21, 21),
		Position=UDim2.new(0.593, 0,0.079, 0),
		Size=UDim2.new(0.389, 0,0.816, 0)
	};
	UICornerAgainnnn={
		Parent=Contexts['TaggleFrame'],
		CornerRadius=UDim.new(0, 3)
	};
	Off={
		Parent=Contexts['TaggleFrame'],
		Name='Off',
		BackgroundColor3=Color3.fromRGB(85, 85, 85),
		BorderSizePixel=0,
		Position=UDim2.new(0.011, 0,0.047, 0),
		Size=UDim2.new(0.523, 0,0.935, 0),
	};
	Letsgobaby={
		Parent=Contexts['Off'],
		CornerRadius=UDim.new(0, 3)
	};
	On={
		Parent=Contexts['TaggleFrame'],
		Name='On',
		Visible=false,
		BackgroundColor3=Color3.fromRGB(85, 0, 0),
		BackgroundTransparency=0,
		BorderSizePixel=0,
		Position=UDim2.new(0.476, 0,0.047, 0),
		Size=UDim2.new(0.523, 0,0.935, 0)
	};
	CornerCornersCornr={
		Parent=Contexts['On'],
		CornerRadius=UDim.new(0, 3)
	};
	ToggleInteractButton={
		Parent=Contexts['Togel'],
		Name='ToggleInteractButton',
		BackgroundTransparency=1,
		TextTransparency=1,
		Size=UDim2.new(1,0,1,0)
	};
	--microwave
	ScreenGui={
		Name='Main',
		IgnoreGuiInset=true,
		ResetOnSpawn=false
	};
	ScreenGui2={
		Name='DNotification',
		IgnoreGuiInset=true,
		ResetOnSpawn=false
	};
	--Tabs container
	TabMenu={
		Name='TabMenu',
		BackgroundTransparency=1,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(0, 100,0, 32)
	};
	aaaa={--Named tabName
		Parent=Contexts['Frame'],
		BackgroundTransparency=1,
		Image=Icons['Tag'].Url,
		ImageRectSize=Icons['Tag'].ImageRectSize,
		ImageRectOffset=Icons['Tag'].ImageRectOffset,
		Position=UDim2.new(0.087, 0,0.103, 0),
		Size=UDim2.new(0.25, 0,0.759, 0)
	};
	NoContentLabel={
		Parent=InstanceContexts['InstancesInNil'],
		Name='NoContentLabel',
		BackgroundTransparency=1,
		Font=Enum.Font.SourceSansBold,
		Text='There is no content yet!',
		TextScaled=true,
		TextTransparency=0.9,
		Position=UDim2.new(0.052,0,0.307,0),
		Size=UDim2.new(0,360,0,75)
	};
	ACtive={
		Parent=Contexts['Frame'],
		BackgroundColor3=Color3.fromRGB(85,0,0),
		BackgroundTransparency=1,
		Position=UDim2.new(0,0,0.069,0),
		Size=UDim2.new(0,7,0,25)
	};
	ActiveCorner={
		Parent=Contexts['ACtive']
	};
	TaggelLabel={
		Parent=Contexts['Togel'],
		BackgroundTransparency=1,
		Text='Toggle',
		TextColor3=Color3.fromRGB(255,255,255),
		TextScaled=true,
		RichText=true,
		Font=Enum.Font.SourceSansBold,
		TextStrokeTransparency=0.6,
		Position=UDim2.new(0, 0,0, 0),
		Size=UDim2.new(0.522, 0,1, 0)
	};
	Frame={
		Parent=Contexts['TabMenu'],
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(32, 32, 32),
		Position=UDim2.new(0.01, 0,0.036, 0),
		Size=UDim2.new(0, 92,0, 29)
	};
	UICorner2Tab={
		Parent=Contexts['Frame']
	};
	TextLabeltab={
		Parent=Contexts['Frame'],
		BackgroundTransparency=1,
		Font=Enum.Font.SourceSansBold,
		TextColor3=Color3.fromRGB(255, 255, 255),
		RichText=true,
		TextScaled=true,
		TextStrokeTransparency=0.6,
		Position=UDim2.new(0.337, 0,0, 0),
		Size=UDim2.new(0, 60,0, 29)
	};
	TextButtontabb={
		Parent=Contexts['Frame'],
		BackgroundTransparency=1,
		TextTransparency=1,
		TextStrokeTransparency=1,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(0, 92,0, 29)
	};
	--Tab session en d


	--00Notification Containr-
	NotificationMain={
		Name='NotificationMain',
		BackgroundTransparency=1,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1.001, 0,1.001, 0)
	};
	__Container={
		Parent=Contexts['NotificationMain'],
		Name='__Container',
		BackgroundColor3=Color3.fromRGB(0,0,0),
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Position=UDim2.new(0.999, 0,0.588, 0),
		Size=UDim2.new(0.143, 0,0.172, 0)
	};
	NotificationNoButtons={
		Parent=Contexts['__Container'],
		Name='NotificationNoButtons',
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(32,32,32),
		BackgroundTransparency=0.1,
		Position=UDim2.new(0, 0,0.131, 0),
		Size=UDim2.new(1, 0,0.73, 0)
	};
	UICornerNotifiuf8uf7={Parent=Contexts['NotificationNoButtons']};
	TextLabell2={
		Parent=Contexts['NotificationButtons'],
		Name='Title',
		BackgroundTransparency=1,
		TextColor3=Color3.fromRGB(255,255,255),
		TextScaled=true;
		Font=Enum.Font.SourceSansBold,
		TextStrokeTransparency=0.4,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1, 0,0.29, 0)
	};
	TextLabelNotify1={
		Parent=Contexts['NotificationButtons'],
		Name='Text',
		BackgroundTransparency=1,
		TextColor3=Color3.fromRGB(255,255,255),
		TextScaled=true;
		Font=Enum.Font.SourceSans,
		RichText=true,
		TextStrokeTransparency=0.4,
		Position=UDim2.new(0, 0,0.29, 0),
		Size=UDim2.new(1, 0,0.71, 0)
	};
	NotificationButtons={
		Parent=Contexts['__Container'],
		Name='NotificationButtons',
		BackgroundColor3=Color3.fromRGB(32,32,32),
		BackgroundTransparency=0.1,
		Position=UDim2.new(0, 0,0, 0),
		Size=UDim2.new(1, 0,1, 0)
	};
	TextLabelNotify2={
		Parent=Contexts['NotificationNoButtons'],
		Name='Title',
		BackgroundTransparency=1,
		TextColor3=Color3.fromRGB(255,255,255),
		TextScaled=true;
		Font=Enum.Font.SourceSansBold,
		TextStrokeTransparency=0.4,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1, 0,0.212, 0)
	};
	Textsss={
		Parent=Contexts['NotificationNoButtons'],
		Name='Text',
		BackgroundTransparency=1,
		TextColor3=Color3.fromRGB(255,255,255),
		TextScaled=true;
		RichText=true,
		Font=Enum.Font.SourceSans,
		TextStrokeTransparency=0.4,
		Position=UDim2.new(0, 0,0.21, 0),
		Size=UDim2.new(1, 0,0.518, 0)
	};
	UICorner4={Parent=Contexts['NotificationButtons']};
	Okay={
		Parent=Contexts['NotificationButtons'],
		Name='Okay',
		Text='Okay',
		Style=Enum.ButtonStyle.RobloxRoundButton,
		Font=Enum.Font.SourceSansBold,
		TextColor3=Color3.fromRGB(255,255,255),
		Position=UDim2.new(0, 0,0.701, 0),
		Size=UDim2.new(1, 0,0.299, 0)
	};
	No={
		Parent=Contexts['NotificationButtons'],
		Name='No',
		Text='No',
		ZIndex=2,
		Style=Enum.ButtonStyle.RobloxRoundButton,
		Font=Enum.Font.SourceSansBold,
		TextColor3=Color3.fromRGB(255,255,255),
		Position=UDim2.new(0.54, 0,0.701, 0),
		Size=UDim2.new(0.46, 0,0.299, 0)
	};
	Yes={
		Parent=Contexts['NotificationButtons'],
		Name='Yes',
		Text='Yes',
		ZIndex=2,
		Style=Enum.ButtonStyle.RobloxRoundButton,
		Font=Enum.Font.SourceSansBold,
		TextColor3=Color3.fromRGB(255,255,255),
		Position=UDim2.new(0, 0,0.701, 0),
		Size=UDim2.new(0.5, 0,0.299, 0)
	};
	--Notification Container Ends--


	Main={
		Name='Main',
		BackgroundTransparency=1,
		BorderSizePixel=0,
		Position=UDim2.new(0, 0,0, 0),
		Size=UDim2.new(1, 1,1, 1)
	};
	Toggle={
		Parent=InstanceContexts['Main'],
		Name='Toggle',
		Visible=false,
		BackgroundColor3=Color3.fromRGB(32,32,32),
		ZIndex=2,
		Image='rbxassetid://128728496976785',
		Position=UDim2.new(0, 0,0.088, 0),
		Size=UDim2.new(0.055, 0,0.088, 0)
	};
	UICornerrr={
		Parent=InstanceContexts['Toggle']
	};
	UIAspectRatioConstraint={
		Parent=InstanceContexts['Toggle'],
		AspectRatio=1,
		AspectType=Enum.AspectType.FitWithinMaxSize,
		DominantAxis=Enum.DominantAxis.Width
	};
	__Main1={
		Parent=InstanceContexts['Main'],
		Name='__Main1',
		Visible=false,
		BorderSizePixel=0,
		Draggable=true,
		BackgroundColor3=Color3.fromRGB(32, 32, 32),
		Position=UDim2.new(0, 342,0, 240),
		Size=UDim2.new(0, 512,0, 312)
	};
	__Title={
		Parent=InstanceContexts['__Main1'],
		Name='__Title',
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(50, 50, 50),
		Position=UDim2.new(0, 0,0, -30),
		Size=UDim2.new(0, 512,0, 30)
	};
	TitleText={
		Parent=InstanceContexts['__Title'],
		Name='TitleText',
		ZIndex=5,
		Font=Enum.Font.SourceSansBold,
		TextXAlignment=Enum.TextXAlignment.Left,
		RichText=true,
		TextScaled=true,
		BackgroundTransparency=1,
		TextColor3=Color3.fromRGB(255, 255, 255),
		TextStrokeColor3=Color3.fromRGB(0, 0, 0),
		TextStrokeTransparency=0,
		BorderSizePixel=0,
		Position=UDim2.new(0, 0,0, 0),
		Size=UDim2.new(0, 512,0, 41)
	};
	__TabFrame={
		Parent=InstanceContexts['__Main1'],
		Name='__TabFrame',
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(15, 15, 15),
		Position=UDim2.new(0, 0,0.035, 0),
		Size=UDim2.new(0, 101,0, 301)
	};
	CornerCover2={
		Parent=InstanceContexts['__TabFrame'],
		Name='CornerCover2',
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(15,15,15),
		Position=UDim2.new(0.465, 0,0.929, 0),
		Size=UDim2.new(0, 54,0, 21)
	};
	CornerCover={
		Parent=InstanceContexts['__Title'],
		Name='ConrerCover',
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(50, 50, 50),
		Position=UDim2.new(0, 0,0, 19),
		Size=UDim2.new(0, 512,0, 22)
	};
	UICorner={
		Parent=InstanceContexts['__TabFrame']
	};
	UICorner1={
		Parent=InstanceContexts['__Title']
	};
	UICorner2={
		Parent=InstanceContexts['__Main1']
	};

	Scroll={
		Parent=InstanceContexts['__TabFrame'],
		Name='Scroll',
		ZIndex=2,
		BorderSizePixel=1,
		BorderColor3=Color3.fromRGB(27, 42, 53),
		ScrollBarThickness=5,
		BackgroundTransparency=1,
		Position=UDim2.new(0, 0,0.02, 0),
		Size=UDim2.new(0, 101,0, 294)
	};
	UIGridLayout={
		Parent=InstanceContexts['Scroll'],
		CellPadding=UDim2.new(0, 5,0, 0),
		CellSize=UDim2.new(0, 100,0, 50)
	};
	__ContentFrame={
		Parent=InstanceContexts['__Main1'],
		Name='__ContentFrame',
		BorderSizePixel=0,
		BackgroundTransparency=1,
		Position=UDim2.new(0.197, 0,0.035, 0),
		Size=UDim2.new(0, 400,0, 300)
	};
	__Decor={
		Parent=InstanceContexts['__Main1'],
		Name='__Decor',
		ClipsDescendants=true,
		BorderSizePixel=0,
		BackgroundTransparency=1,
		Position=UDim2.new(0.002, 0,0.035, 0),
		Size=UDim2.new(0, 511,0, 301)
	};
	ImageLabel={ --Right Corner Red Image
		Parent=InstanceContexts['__Decor'],
		Name='ImageLabel',
		BorderSizePixel=0,
		ZIndex=5,
		Image='rbxassetid://72369033405617',
		ImageColor3=Color3.fromRGB(85, 0, 127),
		ImageTransparency=0.9,
		BackgroundTransparency=1,
		Position=UDim2.new(0.589, 0,0.383, 0),
		Size=UDim2.new(0, 513,0, 435)
	};
	ImageLabel1={ -- Red Forms
		Parent=InstanceContexts['__Decor'],
		Name='ImageLabel',
		BorderSizePixel=0,
		ZIndex=5,
		Image='rbxassetid://88409692799170',
		ImageColor3=Color3.fromRGB(170, 0, 0),
		ImageTransparency=0.9,
		BackgroundTransparency=1,
		Position=UDim2.new(0, 0,0.542, 0),
		Size=UDim2.new(0, 114,0, 137)
	};




};


local Toggle=InstanceContexts['Toggle']
local MainFrame=InstanceContexts['__Main1']

Toggle.MouseButton1Click:connect(function()
	MainFrame.Visible=not MainFrame.Visible
end)

--Visible=not

-- FUNCTIONS
--[[
KryziumLib:Notify({
	Title='',
	Container='',
	Buttons=false,
	Okay=false
})

]]
local DisableNotifih=function(T)
	T.Visible=false
end;
--Notify yummy
function KryziumLib:Notify(SETTINGS)
	if not(SETTINGS.Title and SETTINGS.Container)then return end;
	local NotificMain=Contexts['NotificationMain'];
	local Container=Contexts['__Container'];
	local Buttons=Contexts['NotificationButtons'];
	local NoButtons=Contexts['NotificationNoButtons'];

	local PlayerGui=Model[2];

	InstanceContexts.ScreenGui2.Parent=PlayerGui;
	NotificMain.Parent=InstanceContexts.ScreenGui2;
	--	local PlayerGui=Model[4].LocalPlayer.PlayerGui;
	--	local Gui=PlayerGui:FindFirstChild('DNotification');
	--	if not Gui then Gui=InstanceContexts.ScreenGui2;
	--Gui.Name='DNotification';
	--	Gui.Parent=PlayerGui;
	--	end
	--	NotificMain.Parent=Gui;
	--	InstanceContexts.ScreenGui2.Parent=PlayerGui;
	NotificMain.Visible=true;
	Container.Visible=true;
	local Active={Position=UDim2.new(0.856,0,0.588,0)};
	local Hidden={Position=UDim2.new(0.999,0,0.588,0)};
	local N1=Model[5]:Create(Container,TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),Active);
	local Ml=Model[5]:Create(Container,TweenInfo.new(0.15,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),Hidden);
	Buttons.Visible=false;
	NoButtons.Visible=false;
	Buttons.No.Visible=true;
	Buttons.Yes.Visible=true;
	Buttons.Okay.Visible=true;
	if SETTINGS.Buttons==true then
		Buttons.Visible=true;
		Buttons:WaitForChild('Title').Text=SETTINGS.Title;
		Buttons:WaitForChild('Text').Text=SETTINGS.Container;
		Buttons.Okay.Visible=false;
		Buttons.No.MouseButton1Click:Once(function()Ml:Play();end);
		Buttons.Yes.MouseButton1Click:Once(function()Ml:Play();end);
	elseif SETTINGS.Okay==true then
		Buttons.Visible=true;
		Buttons.No.Visible=false;
		Buttons.Yes.Visible=false;
		Buttons.Okay.Visible=true;
		Buttons:WaitForChild('Title').Text=SETTINGS.Title;
		Buttons:WaitForChild('Text').Text=SETTINGS.Container;
		Buttons.Okay.MouseButton1Click:Once(function()
			Ml:Play();
		end);
	else
		NoButtons.Visible=true;
		NoButtons:WaitForChild('Title').Text=SETTINGS.Title;
		NoButtons:WaitForChild('Text').Text=SETTINGS.Container;
		wait(5);--wait5)
		Ml:Play();
		Ml.Completed:Once(function()
			NotificMain.Visible=false;
		end);
	end
	N1:Play();
	--N1:Play();
	--N1.Completed:Once(function()
	--	wait(5);
	--	Ml:Play();
	--	Ml.Completed:Once(function()
	--NotificMain.Visible=false;
	--	end);
	--end);
end

--
--[[
-Contexts
PropertyTable:
	TabMenu={
		Name='TabMenu',
		BackgroundTransparency=1,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(0, 100,0, 32)
	};
	Frame={
		Parent=Contexts['TabMenu'],
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(32, 32, 32),
		Position=UDim2.new(0.01, 0,0.036, 0),
		Size=UDim2.new(0, 92,0, 29)
	};
	UICorner2Tab={
		Parent=Contexts['Frame']
	};
	TextLabeltab={
		Parent=Contexts['Frame'],
		BackgroundTransparency=1,
		TextColor3=Color3.fromRGB(255, 255, 255),
		TextScaled=true,
		TextStrokeTransparency=1,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(0, 78,0, 29)
	};
	TextButtontabb={
		Parent=Contexts['Frame'],
		BackgroundTransparency=1,
		TextTransparency=1,
		TextStrokeTransparency=1,
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(0, 92,0, 29)
	};

]]
--[[
	ScrollingFrame=Instance.new'ScrollingFrame';--Elements only
		Content=Instance.new'Frame';
			Button=Instance.new'Frame';
				TextButton=Instance.new'TextButton';
				TextLabel_1=Instance.new'TextLabel';
				TextLabel_2=Instance.new'TextLabel';

			Keybind=Instance.new'Frame';
				ToggleFrame_1=Instance.new'Frame';
					InteractBox=Instance.new'TextButton';
					TextLabel_3=Instance.new'TextLabel';
					On=Instance.new'Frame';
					Off=Instance.new'Frame';

			Toggle=Instance.new'Frame';
				ToggleFrame=Instance.new'Frame';
				TextLabel_4=Instance.new'TextLabel';
				info=Instance.new'Frame';
]]
local DragTitllll=function()
	local S=function(_,x)return Game:GetService(x)end;
	local UIS=Model[7];
	local TS=Model[5];
	local Drag=false;
	local MousePos;
	local FramePos;
	local Frame=InstanceContexts['__Main1'];
	local TWI=TweenInfo.new(.09);
	InstanceContexts['__Title'].InputBegan:Connect(function(Input)
		if Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then
			Drag=true;
			MousePos=Input.Position;
			FramePos=Frame.Position;
			Input.Changed:Connect(function()
				if Input.UserInputState==Enum.UserInputState.End then
					Drag=false;
				end
			end)
		end
	end)
	UIS.InputChanged:Connect(function(Input)
		if Drag and(Input.UserInputType==Enum.UserInputType.MouseMovement or Input.UserInputType==Enum.UserInputType.Touch)then
			local Delta=Input.Position-MousePos;
			TS:Create(Frame,TWI,{
				Position=UDim2.new(
					FramePos.X.Scale,
					FramePos.X.Offset+Delta.X,
					FramePos.Y.Scale,
					FramePos.Y.Offset+Delta.Y
				)
			}):Play();
		end
	end)
end
local DragToggle=function()
	local UIS=Model[7];
	local Drag=false;
	local MousePos;
	local FramePos=nil
	InstanceContexts['Toggle'].InputBegan:Connect(function(Input)
		if Input.UserInputType==Enum.UserInputType.MouseButton1 or Input.UserInputType==Enum.UserInputType.Touch then
			Drag=true;
			MousePos=Input.Position;
			FramePos=InstanceContexts['Toggle'].Position;
			Input.Changed:Connect(function()
				if Input.UserInputState==Enum.UserInputState.End then
					Drag=false
				end
			end)
		end
	end)
	UIS.InputChanged:Connect(function(Input)
		if Drag and(Input.UserInputType==Enum.UserInputType.MouseMovement or Input.UserInputType==Enum.UserInputType.Touch)then
			local Delta=Input.Position-MousePos
			InstanceContexts['Toggle'].Position=UDim2.new(FramePos.X.Scale,FramePos.X.Offset+Delta.X,FramePos.Y.Scale,FramePos.Y.Offset+Delta.Y)
		end
	end)
end
function KryziumLib:MakeWindow(SETTINGS)-- KryziumLib:MakeWindow({Image,Name...})
	local Window={}
	local SK={}
	local num=0
	if typeof(SETTINGS)=='table'then-- This needs a table. If you put, for example: Darkz:MakeWindow('make this window'), or something else, it wont work.
		InstanceContexts.Main.Parent=InstanceContexts.ScreenGui;
		InstanceContexts.ScreenGui.Parent=Model[2];
		DragTitllll()
		DragToggle()
		if SETTINGS.Image and SETTINGS.Image=='Default' then
			Toggle.Image='rbxassetid://128728496976785';
			InstanceContexts['IconImage'].Image='rbxassetid://128728496976785';			
			InstanceContexts['Image'].Image='rbxassetid://128728496976785';
		else
			Toggle.Image=SETTINGS.Image;
			InstanceContexts['IconImage'].Image=SETTINGS.Image;			
			InstanceContexts['Image'].Image=SETTINGS.Image;
		end
		if SETTINGS.Name then
			InstanceContexts['TitleText'].Text='      '..SETTINGS.Name
			Avaible=SETTINGS.Name
			InstanceContexts['Madeby'].Text='Made by '..SETTINGS.Author
		else
			InstanceContexts['TitleText'].Text='      Kryzium UI'
			Avaible='Kryzium UI'
		end
		if SETTINGS.Discord and SETTINGS.DiscordLink and SETTINGS.Notifications then
			KryziumLib:Notify({
				Title='Notification',
				Container=SETTINGS.DiscordLink,
				Buttons=false,
				Okay=true
			})
		end
		function Window:MakeTab(SETTINGS1)
			local tab={}
			if typeof(SETTINGS1)=='table'then
				local Tabtab=Contexts['TabMenu']
				if Tabtab.Name~='TabMenu'then warn('Something went wrong when creating a tab. Error: 0xC0001004')end
				num=num+1;
				local Tabss=Tabtab:Clone();
				local TabScorl=Contexts['ScrollingContent']:clone()
				TabScorl.Name=TabScorl.Name..num
				TabScorl.Parent=InstanceContexts['__ContentFrame']
				SK[TabScorl]=true
				Tabss.Parent=InstanceContexts['Scroll']
				Tabss.Name=Tabss.Name..num
				local function Hide(Tab)
					for _,v in pairs(Tab:GetDescendants())do
						if not v:GetAttribute'_Saved'then
							v:SetAttribute('_Saved',true)
							if v:IsA'GuiObject'then v:SetAttribute('BT',v.BackgroundTransparency);end
							if v:IsA'TextLabel'or v:IsA'TextButton'or v:IsA'TextBox'then v:SetAttribute('TT',v.TextTransparency);v:SetAttribute('TST',v.TextStrokeTransparency);end
							if v:IsA'ImageLabel'or v:IsA'ImageButton'then v:SetAttribute('IT',v.ImageTransparency);end
						end
						local C={}
						if v:IsA'GuiObject'then C.BackgroundTransparency=1;end
						if v:IsA'TextLabel'or v:IsA'TextButton'or v:IsA'TextBox'then C.TextTransparency=1;C.TextStrokeTransparency=1;end
						if v:IsA'ImageLabel'or v:IsA'ImageButton'then C.ImageTransparency=1;end
						if next(C)then Model[5]:Create(v,TweenInfo.new(.25),C):Play();end
					end
				end;
				local function Show(Tab)
					Tab.Visible=true;
					for _,v in pairs(Tab:GetDescendants())do
						local C={}
						if v:IsA'GuiObject'then C.BackgroundTransparency=v:GetAttribute'BT'or 0 end
						if v:IsA'TextLabel'or v:IsA'TextButton'or v:IsA'TextBox'then C.TextTransparency=v:GetAttribute'TT'or 0 C.TextStrokeTransparency=v:GetAttribute'TST'or 1 end
						if v:IsA'ImageLabel'or v:IsA'ImageButton'then C.ImageTransparency=v:GetAttribute'IT'or 0 end
						if next(C)then Model[5]:Create(v,TweenInfo.new(.25),C):Play() end
					end
				end;
				if SETTINGS1.Image then
					local Img=Tabss:FindFirstChild('Frame'):FindFirstChild('ImageLabel');
					if Img then
						if typeof(SETTINGS1.Image)=='number'then
							Img.Image='rbxassetid://'..SETTINGS1.Image
						else
							
							Img.Image=SETTINGS1.Image
							
						end
						if SETTINGS1.Image=='Default' then
							Img.Image=Icons['Tag'].Url
							Img.ImageRectSize=Icons['Tag'].ImageRectSize
							Img.ImageRectOffset=Icons['Tag'].ImageRectOffset
						end
					end
				end
				Tabss.Frame:WaitForChild'TextLabel'.Text=SETTINGS1.Title or'Tab '..num
				if num==1 then
					TabScorl.Visible=true;
					Tabss.Frame.Frame.BackgroundTransparency=0;
				else
					TabScorl.Visible=false;
					Hide(TabScorl)
					Tabss.Frame.Frame.BackgroundTransparency=1;
				end;

				Tabss.Frame.TextButton.MouseButton1Click:Connect(function()

					for Frame,_ in pairs(SK)do
						Frame.Visible=false;
						Frame.CanvasPosition=Vector2.new(0,0)
						Hide(Frame);
					end;

					Show(TabScorl);

					for _,d in pairs(InstanceContexts.Scroll:GetChildren())do
						if d:IsA'Frame'then
							Model[5]:Create(
								d.Frame.Frame,
								TweenInfo.new(.25),
								{BackgroundTransparency=1}
							):Play()
						end
					end;

					Model[5]:Create(
						Tabss.Frame.Frame,
						TweenInfo.new(.25),
						{BackgroundTransparency=0}
					):Play()

					Show(TabScorl)

				end)
				
				--Contexts['ScrollingFrameeeeeeeeeeeeee'].Parent=InstanceContexts['__ContentFrame']
				function tab:MakeButton(SETTINGS1)
					local btn={}
					if typeof (SETTINGS1)=='table'then
						local ScrollingContent=Contexts['ScrollingContent']
						local Button=Contexts['Button']:clone();
						Button.Parent=TabScorl.Content;
						Button:WaitForChild('TextLabel').Text=SETTINGS1.Title
						Button:WaitForChild'TextButton'.MouseButton1Click:connect(function()
							AudioSFX.ToggleSound:Play();
							SETTINGS1.Callback()
						end)
					end
					return btn
				end
				function tab:MakeToggle(SETTINGS1)
					local btn={}
					if typeof (SETTINGS1)=='table'then
						local ScrollingContent=tab
						local TWI=TweenInfo.new(0.095,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut)
						local Toggle=Contexts['Togel']:clone();
						local Piza=SETTINGS1.Toggle;
						Toggle.Parent=TabScorl.Content;
						local off={
							Position=UDim2.new(0.476, 0,0.047, 0),
							BackgroundColor3=Color3.fromRGB(85, 0, 0)
						};
						local on={
							Position=UDim2.new(0.011, 0,0.047, 0),
							BackgroundColor3=Color3.fromRGB(85, 85, 85)
						};
						if Piza then
							local On=Model[5]:Create(Toggle.Frame.Off,TWI,on)
							On:Play()
							AudioSFX.ToggleSound:Play()
							SETTINGS1.Callback(Piza)
						else
							local Off=Model[5]:Create(Toggle.Frame.Off,TWI,off)
							Off:Play()
							AudioSFX.ToggleSound:Play();
							SETTINGS1.Callback(Piza)
						end
						Toggle:WaitForChild('TextLabel').Text=SETTINGS1.Title
						Toggle:WaitForChild'ToggleInteractButton'.MouseButton1Click:connect(function()
							Piza=not Piza
							if Piza then
								local Off=Model[5]:Create(Toggle.Frame.Off,TWI,off)
								Off:Play()
								AudioSFX.ToggleSound:Play();
								SETTINGS1.Callback(Piza)
							else
								local On=Model[5]:Create(Toggle.Frame.Off,TWI,on)
								On:Play()
								AudioSFX.ToggleSound:Play()
								SETTINGS1.Callback(Piza)
							end
						end)
					end
					return btn
				end
				function tab:MakeKeybind(SETTINGS1)
					local btn={}
					if typeof(SETTINGS1)=='table' then
						if not SETTINGS1.Keybind then return end
						local ScrollingContent=Contexts['ScrollingContent'];
						local Button=Contexts['Keybind']:Clone();
						local Connection;
						Button.Parent=TabScorl.Content;
						local o={
							Position=UDim2.new(0.451,0,1.026,0),
							Size=UDim2.new(0.646,0,0.474,0)
						};
						local g={
							Position=UDim2.new(0.744,0,1.026,0),
							Size=UDim2.new(0.071,0,0.236,0)
						};
						local InputWarn=function()
							local Anim1=Model[5]:Create(Button.info,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),o);
							local Anim2=Model[5]:Create(Button.info,TweenInfo.new(.5,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),g);
							Button.info.Visible=true;
							Anim1:Play();
							Anim1.Completed:Connect(function()
								wait(2.4);
								Anim2:Play();
							end);
							Anim2.Completed:Connect(function()
								Button.info.Visible=false;
							end);
						end;
						Button.TextLabel.Text=SETTINGS1.Title or 'Keybind';
						Button.ToggleFrame.InteractBox.MouseButton1Click:Connect(function()
							AudioSFX.ToggleSound:Play();
							Button.ToggleFrame.TextLabel.Text='...';
							if Connection then
								Connection:Disconnect();
							end
							Connection=Model[7].InputBegan:Connect(function(inpt,gmpce)
								if gmpce then return end
								if inpt.KeyCode==Enum.KeyCode.Unknown then
									InputWarn();
									return;
								end
								Button.ToggleFrame.TextLabel.Text=inpt.KeyCode.Name;
								SETTINGS1.Keybind=inpt.KeyCode
								Connection:Disconnect();
								Connection=nil;
							end)
						end)
						Model[7].InputBegan:Connect(function(inpt,gmpce)
							if gmpce then return end
							if inpt.KeyCode==SETTINGS1.Keybind then
								if SETTINGS1.Callback then
									SETTINGS1.Callback(inpt.KeyCode)
								end
							end
						end)
					end
					return btn
				end
				function tab:MakeSlider(SETTINGS1)
					local btn={};
					if typeof(SETTINGS1)=='table'then
						local ScrollingContent=Contexts['ScrollingContent']
						local Button=Contexts['Slider']:clone();
						local S=function(_,x)return Game:GetService(x)end;
						local UIS=Model[7];
						local Player=S(Game,'Players').LocalPlayer;
						local Mouse=Player:GetMouse();
						local Slider=Button;
						local Back=Slider:WaitForChild'Back';
						local Fill=Back:WaitForChild('Fill');
						local Drag=Back:WaitForChild'Drag';
						local Holding=false;
						local Max=Back.AbsoluteSize.X;
						local Value=SETTINGS1.Value or 0;
						local MinValue=SETTINGS1.MinValue or 0;
						local MaxValue=SETTINGS1.MaxValue or 100;
						Drag.MouseButton1Down:Connect(function()Holding=true;end)
						UIS.InputEnded:Connect(function(Input)if Input.UserInputType==Enum.UserInputType.MouseButton1 then Holding=false;end;end)
						UIS.InputChanged:Connect(function(Input)
							if Holding and Input.UserInputType==Enum.UserInputType.MouseMovement then
								local X=math.clamp(Mouse.X-Back.AbsolutePosition.X,0,Max);
								Fill.Size=UDim2.new(0,X,0,13);
								Drag.Position=UDim2.new(0,X-(Drag.AbsoluteSize.X/2),0.5,-(Drag.AbsoluteSize.Y/2));
								Value=math.floor(MinValue+((X/Max)*(MaxValue-MinValue)));
								SETTINGS1.Callback(Value)
							end
						end)
						Button.Parent=TabScorl.Content;
						Button:WaitForChild('TextLabel').Text=SETTINGS1.Title
					end
					return btn
				end
				function tab:MakeWarning(SETTINGS1)
					local btn={}
					if typeof (SETTINGS1)=='table'then
						local ScrollingContent=Contexts['ScrollingContent']
						local Button=Contexts['Warning']:clone();
						Button.Parent=TabScorl.Content;
						Button:WaitForChild('TitleWarn').Text=SETTINGS1.Title or 'Placeholder'
						Button:WaitForChild'DescWarn'.Text=SETTINGS1.Container or 'Placeholder'
					end
					return btn
				end
				function tab:MakeColourPicker(SETTINGS1)
					local btn={}
					if typeof(SETTINGS1)~='table' then return btn end
					local Button=Contexts['ColourPicker']:Clone();
					local UIS=Game:GetService'UserInputService';
					Button.Parent=TabScorl.Content;
					Button.TextLabel.Text=SETTINGS1.Title or 'Colour Picker';
					local Wheel=Button.ColorFrame.Frame.ImageLabel;
					local Preview=Button.ColorFrame;
					local Hitbox=Button.ColorFrame:WaitForChild'TextButton';
					local Cursor=Wheel:WaitForChild'InteractBox';
					local Drag=false;
					local H,S,V=0,1,1;
					local function Update()
						local Color=Color3.fromHSV(H,S,V);
						Preview.BackgroundColor3=Color;
						if SETTINGS1.Callback then
							SETTINGS1.Callback(Color);
						end
					end;
					Hitbox.InputBegan:Connect(function(Input)
						if Input.UserInputType==Enum.UserInputType.MouseButton1 then
							Drag=true;
						end
					end);
					UIS.InputEnded:Connect(function(Input)
						if Input.UserInputType==Enum.UserInputType.MouseButton1 then
							Drag=false;
						end
					end);
					UIS.InputChanged:Connect(function(Input)
						if not Drag then return end;
						if Input.UserInputType~=Enum.UserInputType.MouseMovement then return end;
						local Mouse=UIS:GetMouseLocation();
						local Center=Vector2.new(
							Wheel.AbsolutePosition.X+Wheel.AbsoluteSize.X/2,
							Wheel.AbsolutePosition.Y+Wheel.AbsoluteSize.Y/2
						);
						local Offset=Mouse-Center;
						local Radius=Wheel.AbsoluteSize.X/2;
						if Offset.Magnitude>Radius then
							Offset=Offset.Unit*Radius;
						end;
						local Distance=math.clamp(
							Offset.Magnitude/Radius,
							0,
							1
						);
						local Angle=math.atan2(Offset.Y,Offset.X);H=((Angle/(math.pi*2))+0.5)%1;
						S=Distance;
						Cursor.Position=UDim2.fromOffset(
							Offset.X+Radius-Cursor.AbsoluteSize.X/2,
							Offset.Y+Radius-Cursor.AbsoluteSize.Y/2
						);
						Update();
					end);
					Update();
					return btn
				end
			end
			return tab
		end;
	end
	return Window
end

--[[

		Position=UDim2.new(0.495, 0,0.402, 0),
		Size=UDim2.new(0.008, 0,0.196, 0)
]]


--[[
Brillant={
	0.982, 0,-0.18, 0
}
]]
function Animate(Time)
	local obj=InstanceContexts['Container'];
	local Info=InstanceContexts['Intro']
	local tnInfo=TweenInfo.new(0.7,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
	local snickers=TweenInfo.new(1.3,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
	local Brillant={
		Position=UDim2.new(0.982, 0,-0.18, 0);
	};
	local ps1={
		Size=UDim2.new(0.377, 0,0.196, 0);
		Position=UDim2.new(0.311, 0,0.399, 0)
	};
	local just={
		Position=UDim2.new(0.495, 0,0.402, 0),
		Size=UDim2.new(0.008, 0,0.196, 0)
	};
	local AAAA={
		BackgroundTransparency=1
	}
	local tweeeeeeeen=Model[5]:Create(obj,tnInfo,ps1)
	local Dogfight=Model[5]:Create(InstanceContexts['Brillant'],TweenInfo.new(0.67,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut),Brillant)
	local makingmywaydowntownwalkingfastfacespastinahomebound=Model[5]:Create(obj,tnInfo,just)
	wait()
	do
		tweeeeeeeen:Play()
		wait(0.4)
		Dogfight:Play()
		AudioSFX.Okaysunshine:Play();
		local fade=Model[5]:Create(Info,snickers,AAAA)
		wait(Time)
		fade:Play()
		fade.Completed:Connect(function()
			makingmywaydowntownwalkingfastfacespastinahomebound:Play()
		end)
		makingmywaydowntownwalkingfastfacespastinahomebound.Completed:connect(function()
			for _,v in pairs(Info:GetChildren()) do
				if v.className=='Frame'then
					local fade=Model[5]:Create(v,snickers,AAAA)
					fade:Play()
				elseif v.className=='TextLabel'then
					local fade=Model[5]:Create(v,snickers,{TextTransparency=1})
					fade:Play()
				elseif v.className=='ImageLabel'then
					local fade=Model[5]:Create(v,snickers,{ImageTransparency=1})
					fade:Play()
				end
			end
			InstanceContexts['__Main1'].Visible=true
			InstanceContexts['Toggle'].Visible=true
			InstanceContexts['Intro'].Visible=false;
		end)
	end
end

function KryziumLib:init(SETTINGS)
	InstanceContexts['InstancesInNil'].Parent=Model[2];
	for Name,Properties in next,PropertyInstances do
		local Object=InstanceContexts[Name];
		if Object then
			for Property,Value in next,Properties do
				Object[Property]=Value;
			end;
		end;
	end
	for Name,Properties in next,PropertyInstances do
		local Object=Contexts[Name];
		if Object then
			for Property,Value in next,Properties do
				Object[Property]=Value;
			end;
		end;
	end
	for Name,Properties in next,Audios do
		local Object=AudioSFX[Name];
		if Object then
			for Property,Value in next,Properties do
				Object[Property]=Value;
			end;
		end;
	end
	if SETTINGS and typeof(SETTINGS)=='table'then
		--if SETTINGS.Name then
		--	InstanceContexts['Loading'].Text='Loading '..tostring(SETTINGS.Name)..'...'
		--else
		--	InstanceContexts['Loading'].Text='Library Loading'
		--end
		--if SETTINGS.Gradient and SETTINGS.GradientColor then
		InstanceContexts['UIGradient'].Enabled=true;
		InstanceContexts['UIGradient'].Color=SETTINGS.GradientColor
		--end
		if SETTINGS.GradientRotation then
			InstanceContexts['UIGradient'].Rotation=tonumber(SETTINGS.GradientRotation) or 0
		end
		if SETTINGS.CustomFont then
			for _,v in pairs(InstanceContexts)do
				if v.className=='TextLabel' or v.className=='TextButton'then
					v.Font=SETTINGS.Font or Enum.Font.SourceSansBold
				end
			end
			for _,v in pairs(Contexts)do
				if v.className=='TextLabel' or v.className=='TextButton'then
					v.Font=SETTINGS.Font or Enum.Font.SourceSansBold
				end
			end
		end
		if SETTINGS.CustomBGColor and SETTINGS.BackgroundColor then
			if typeof(SETTINGS.BackgroundColor)=='Color3'then
				InstanceContexts['Container'].BackgroundColor3=SETTINGS.BackgroundColor
			elseif typeof(SETTINGS.BackgroundColor)=='BrickColor'then
				InstanceContexts['Container'].BackgroundColor=SETTINGS.BackgroundColor
			end
			InstanceContexts['UIGradient'].Enabled=false;
		end
		if SETTINGS.CustomIntro and SETTINGS.IntroColor then
			if typeof (SETTINGS.IntroColor)=='Color3'then
				InstanceContexts['Intro'].BackgroundColor3=SETTINGS.IntroColor
			end
		end
		if SETTINGS.IntroTransparency then
			if typeof(SETTINGS.IntroTransparency)=='number'then
				InstanceContexts['Intro'].BackgroundTransparency=tonumber(SETTINGS.IntroTransparency)
			end
		end
	end

	InstanceContexts['Loading'].Text='Loading '..Avaible..'...'

end
KryziumLib:init()--Just init

spawn(function()
	InstanceContexts['Intro'].Visible=true
	Animate(3)
end)

return KryziumLib








