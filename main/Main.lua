-- Contains the source

--[[
	Still on beta
	
	Thanks

]]

if not Game:IsLoaded() then
	Game.Loaded:Wait()
	print('Script loaded, please wait until the game loads')
end

--HINT: 1: Workspace; 2: CoreGui; 3: Debris, 4: Players
local Model={[1]=Game:GetService'Workspace',[2]=Game:GetService'StarterGui',[3]=Game:GetService'Debris',[4]=Game:GetService'Players',[5]=Game:GetService'TweenService',[6]=Game:GetService('HttpService'),[7]=Game:GetService'UserInputService'};
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

local LucideLibrary=require(script.Parent.Lucide);

local Icons={
	Tag=LucideLibrary.GetAsset('tag',32)
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
		Parent=Model[4].LocalPlayer.PlayerGui,
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
	__Title=Instance.new'Frame';
	UICorner=Instance.new'UICorner';
	UICornerrr=Instance.new'UICorner';
	TitleText=Instance.new'TextLabel';-- This
	CornerCover=Instance.new'Frame';
	__TabFrame=Instance.new'Frame';
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
};
--The property of all contexts in InstanceContexts. TO parent something, you should do: Parent=InstanceContexts['OBJECT_NAME']
--Those top-listed-objects are not created automatically. They're used later on creating elements like: notifications, tabs...
local Contexts={
	TabMenu=Instance.new'Frame'; --Tab Container
	Frame=Instance.new'Frame';
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
		Text='Made by',
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
		CellSize=UDim2.new(0.281, 0,0.063, 0)
	};
	Button={-- Button
		--Parent=Contexts['ContentFrame'],
		Parent=InstanceContexts['InstancesInNil'],
		Name='Button',
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(45, 45, 45),
		Size=UDim2.new(0.281, 0,0.063, 0)
	};--enf
	ButtonCorner={
		Parent=Contexts['Button'],
		CornerRadius=UDim.new(0, 3)
	};
	StrokeButton={
		Parent=Contexts['Button'],
		Transparency=0.5,
		Thickness=1,
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
		Position=UDim2.new(0,0,0,0),
		Size=UDim2.new(1,0,1,0)
	};
	Keybind={--Keybind Button
		--Parent=Contexts['ContentFrame'],
		Parent=InstanceContexts['InstancesInNil'],
		Name='Keybind',
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(45, 45, 45),
		Size=UDim2.new(0.281, 0,0.063, 0),
	};
	CornerKeybind={
		Parent=Contexts['Keybind'],
		CornerRadius=UDim.new(0,3)
	};
	StrokeKeybind={
		Parent=Contexts['Keybind'],
		Transparency=0.5,
		Thickness=1,
		ZIndex=2
	};
	ToggleFrame={
		Parent=Contexts['Keybind'],
		BorderSizePixel=0,
		Name='ToggleFrame',
		BackgroundColor3=Color3.fromRGB(32, 32, 32),
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
		Position=UDim2.new(0.451, 0,1.026, 0),
		Size=UDim2.new(0.646, 0,0.474, 0)
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
		BackgroundColor3=Color3.fromRGB(45, 45, 45),
		BackgroundTransparency=0,
		Size=UDim2.new(0.281, 0,0.063, 0)
	};
	CornerTogle={
		Parent=Contexts['Togel'],
		CornerRadius=UDim.new(0,3)
	};
	StrokeToggle={
		Parent=Contexts['Togel'],
		Transparency=0.5,
		Thickness=1,
		ZIndex=2
	};
	TaggleFrame={
		Parent=Contexts['Togel'],
		BackgroundTransparency=0,
		BorderSizePixel=0,
		BackgroundColor3=Color3.fromRGB(32,32,32),
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
		IgnoreGuiInset=true
	};
	ScreenGui2={
		Name='DNotification',
		IgnoreGuiInset=true
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
		ImageTransparency=0.96,
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

	local PlayerGui=Model[4].LocalPlayer.PlayerGui;

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
	local num=0
	if typeof(SETTINGS)=='table'then-- This needs a table. If you put, for example: Darkz:MakeWindow('make this window'), or something else, it wont work.
		InstanceContexts.Main.Parent=InstanceContexts.ScreenGui;
		InstanceContexts.ScreenGui.Parent=Model[4].LocalPlayer.PlayerGui;
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
				Tabss.Parent=InstanceContexts['Scroll']
				Tabss.Name=Tabss.Name..num
				if SETTINGS1.Image then
					local Img=Tabss:FindFirstChild('Frame'):FindFirstChild('ImageLabel');
					if Img then
						if typeof(Img)=='number' then
						Img.Image='rbxassetid://'..SETTINGS1.Image;elseif typeof(Img)=='string' then Img.Image=SETTINGS1.Image;end
					end
				end
				Tabss.Frame:WaitForChild('TextLabel').Text=SETTINGS1.Title or 'Tab '..num
				--Contexts['ScrollingFrameeeeeeeeeeeeee'].Parent=InstanceContexts['__ContentFrame']
				function tab:MakeButton(SETTINGS1)
					local btn={}
					if typeof (SETTINGS1)=='table'then
						local ScrollingContent=Contexts['ScrollingContent']
						local Button=Contexts['Button']:clone();
						ScrollingContent.Parent=InstanceContexts['__ContentFrame']
						Button.Parent=Contexts['ContentFrame'];
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
						local ScrollingContent=Contexts['ScrollingContent']
						local TWI=TweenInfo.new(0.095,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut)
						local Toggle=Contexts['Togel']:clone();
						local Piza=SETTINGS1.Toggle;
						ScrollingContent.Parent=InstanceContexts['__ContentFrame']
						Toggle.Parent=Contexts['ContentFrame'];
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
					if typeof (SETTINGS1)=='table' then
						
					end
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
	InstanceContexts['InstancesInNil'].Parent=Model[4].LocalPlayer.PlayerGui
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








