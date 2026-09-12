local Players=game:GetService("Players")
local UIS=game:GetService("UserInputService")
local RS=game:GetService("RunService")
local LG=game:GetService("Lighting")
local CG=game:GetService("CoreGui")
local LP=Players.LocalPlayer
local Cam=workspace.CurrentCamera
local function N(t,x,d)pcall(function()game:GetService("StarterGui"):SetCore("SendNotification",{Title=tostring(t),Text=tostring(x),Duration=d or 3})end)end
pcall(function()local v=game:GetService("VirtualUser")LP.Idled:Connect(function()v:Button2Down(Vector2.new(0,0),Cam.CFrame)task.wait(1)v:Button2Up(Vector2.new(0,0),Cam.CFrame)end)end)
local W=loadstring(game:HttpGet("https://github.com/WasKKal/WasUI-For-Roblox/raw/refs/heads/main/WasUIPro.lua"))()
W:SetDefaultTheme("Dark")W:SetDefaultRainbowMode("流动")W:SetLanguage("中文")
local _N=W.Notify
W.Notify=function(s,o)if o and o.Title then o.Title="兔小黑🐰 · "..tostring(o.Title)end return _N(s,o)end
local MW=W:CreateWindow({Title="兔小黑🐰",WelcomeText="脚本演示.lua",MinimizedText="兔小黑🐰",Theme="Dark",RainbowMode="流动",DialogTitle="确认关闭",GroupText="加入兔小黑🐰群",GroupCopy="1124808244",SnowEnabled=false,Folder="TuXiaoHei_Config",TitleTag={{text="ai制作",backgroundColor=Color3.fromRGB(255,130,180),textColor=Color3.new(1,1,1)}}})
local ESPC={Enabled=false,Boxes=true,Names=true,Distance=true,Skeleton=true,Weapons=true,AimLine=true,LookingAtYou=true,Shield=true,Offscreen=true,Tracers=false,Velocity=false,TeamCheck=false,TeamAttributeName="Team",MaxDist=2000}
do
local EP=game:GetService("Players")local ER=game:GetService("RunService")local EL=EP.LocalPlayer
local T={VisibilityRefreshRate=.15,WeaponRefreshRate=2,ShieldDuration=1.5,BoxWidthRatio=.6,NameOffset=18,DistOffset=4,WeaponOffset=8,LookingOffset=35,ShieldOffset=50,OffscreenEdgeDist=50,OffscreenArrowSize=12,AimLineLength=15,LookingThreshold=.85}
local C={Enemy=Color3.fromRGB(255,50,50),EnemyVisible=Color3.fromRGB(0,255,0),Lobby=Color3.fromRGB(150,150,150),Shielded=Color3.fromRGB(255,200,0),Skeleton=Color3.fromRGB(255,255,255),SkeletonVisible=Color3.fromRGB(0,255,0),LookingAtYou=Color3.fromRGB(255,255,0),AimDir=Color3.fromRGB(255,150,0),Weapon=Color3.fromRGB(255,200,100),Tracer=Color3.fromRGB(255,100,100)}
local Tm={lv=0,lw=0}local Ca={vis={},wp={},sh={}}
local function pfc(c)for _,p in pairs(EP:GetPlayers())do if p.Character==c then return p end end return nil end
local function gta(p)local a=p:GetAttribute(ESPC.TeamAttributeName)if a~=nil then return a end if p.Character then a=p.Character:GetAttribute(ESPC.TeamAttributeName)if a~=nil then return a end end return nil end
local function ist(c)if not ESPC.TeamCheck then return false end local p=pfc(c)if not p then return false end local m=gta(EL)local t=gta(p)if m==nil or t==nil then return false end return m==t end
local function iil(c)local p=pfc(c)if not p then return false end return gta(p)=="Lobby" end
local function ish(c)return Ca.sh[c] and tick()<Ca.sh[c] end
local function ash(c)Ca.sh[c]=tick()+T.ShieldDuration end
local function iv(c)if not c then return false end local cam=workspace.CurrentCamera if not cam then return false end local o=cam.CFrame.Position local pts={"Head","UpperTorso","Torso","HumanoidRootPart"}local rp=RaycastParams.new()rp.FilterType=Enum.RaycastFilterType.Blacklist local f={cam}if EL.Character then table.insert(f,EL.Character)end table.insert(f,c)rp.FilterDescendantsInstances=f for _,n in pairs(pts)do local pt=c:FindFirstChild(n)if pt then local d=pt.Position-o local r=workspace:Raycast(o,d.Unit*d.Magnitude,rp)if not r or (r.Position-pt.Position).Magnitude<5 then return true end end end return false end
local function ila(c)if not EL.Character then return false end local mh=EL.Character:FindFirstChild("Head")local h=c:FindFirstChild("Head")if not mh or not h then return false end return (mh.Position-h.Position).Unit:Dot(h.CFrame.LookVector)>T.LookingThreshold end
local function gw(c)local t=c:FindFirstChildWhichIsA("Tool")if t then return t.Name end return nil end
local function ir6(c)return c:FindFirstChild("Torso")~=nil end
local B={{"Head","UpperTorso"},{"UpperTorso","LowerTorso"},{"UpperTorso","LeftUpperArm"},{"LeftUpperArm","LeftLowerArm"},{"LeftLowerArm","LeftHand"},{"UpperTorso","RightUpperArm"},{"RightUpperArm","RightLowerArm"},{"RightLowerArm","RightHand"},{"LowerTorso","LeftUpperLeg"},{"LeftUpperLeg","LeftLowerLeg"},{"LeftLowerLeg","LeftFoot"},{"LowerTorso","RightUpperLeg"},{"RightUpperLeg","RightLowerLeg"},{"RightLowerLeg","RightFoot"}}
local B6={{"Head","Torso"},{"Torso","Left Arm"},{"Torso","Right Arm"},{"Torso","Left Leg"},{"Torso","Right Leg"}}
local function rfv()local c=0 for _,p in ipairs(EP:GetPlayers())do if p~=EL and p.Character then c=c+1 if c>20 then Ca.vis[p]=false else Ca.vis[p]=iv(p.Character)end end end end
local function rfw()for _,p in ipairs(EP:GetPlayers())do if p~=EL and p.Character then Ca.wp[p]=gw(p.Character)end end end
local M={cache={},vd={}}
local function eC()local s={}for i=1,14 do s[i]=Drawing.new("Line")end return{Box={Drawing.new("Line"),Drawing.new("Line"),Drawing.new("Line"),Drawing.new("Line")},Name=Drawing.new("Text"),Dist=Drawing.new("Text"),Weapon=Drawing.new("Text"),Skel=s,Off=Drawing.new("Triangle"),Aim=Drawing.new("Line"),Lk=Drawing.new("Text"),Sh=Drawing.new("Text"),Tr=Drawing.new("Line"),VL=Drawing.new("Line"),VA=Drawing.new("Triangle")}end
local function eS(e)for _,l in pairs(e.Box)do l.Thickness=1 end e.Name.Size=14 e.Name.Font=Drawing.Fonts.Monospace e.Name.Center=true e.Name.Outline=true e.Dist.Size=12 e.Dist.Font=Drawing.Fonts.Monospace e.Dist.Center=true e.Dist.Outline=true e.Weapon.Size=12 e.Weapon.Font=Drawing.Fonts.Monospace e.Weapon.Outline=true for _,l in pairs(e.Skel)do l.Thickness=1 end e.Off.Filled=true e.Off.Thickness=2 e.Aim.Thickness=2 e.Lk.Size=14 e.Lk.Font=Drawing.Fonts.Monospace e.Lk.Center=true e.Lk.Outline=true e.Sh.Size=14 e.Sh.Font=Drawing.Fonts.Monospace e.Sh.Center=true e.Sh.Outline=true e.Sh.Color=C.Shielded e.Tr.Thickness=1 e.Tr.Color=C.Tracer e.VL.Thickness=2 e.VL.Color=Color3.fromRGB(0,255,255)e.VA.Filled=true e.VA.Color=Color3.fromRGB(0,255,255)end
local function eH(e)for _,l in pairs(e.Box)do l.Visible=false end e.Name.Visible=false e.Dist.Visible=false e.Weapon.Visible=false for _,l in pairs(e.Skel)do l.Visible=false end e.Off.Visible=false e.Aim.Visible=false e.Lk.Visible=false e.Sh.Visible=false e.Tr.Visible=false e.VL.Visible=false e.VA.Visible=false end
local function eD(e)pcall(function()for _,l in pairs(e.Box)do l:Remove()end e.Name:Remove()e.Dist:Remove()e.Weapon:Remove()for _,l in pairs(e.Skel)do l:Remove()end e.Off:Remove()e.Aim:Remove()e.Lk:Remove()e.Sh:Remove()e.Tr:Remove()e.VL:Remove()e.VA:Remove()end)end
local function eCl()local v={}for _,p in ipairs(EP:GetPlayers())do v[p]=true end for p,e in pairs(M.cache)do if not v[p]then eH(e)eD(e)M.cache[p]=nil M.vd[p]=nil end end end
local function eHA()for _,e in pairs(M.cache)do eH(e)end end
local function eR(e,pl,ch,rt,cam,ss,sc,ds,il)
local hd=ch:FindFirstChild("Head")
local hp=hd and hd.Position or(rt.Position+Vector3.new(0,2,0))
local fp=rt.Position-Vector3.new(0,3,0)
local tp=hp+Vector3.new(0,.5,0)
local rs,rn=cam:WorldToViewportPoint(rt.Position)
local hs=cam:WorldToViewportPoint(tp)
local fs=cam:WorldToViewportPoint(fp)
local oS=rn and rs.Z>0
local vis=Ca.vis[pl]or false
local sh=ish(ch)
local col
if sh and ESPC.Shield then col=C.Shielded elseif il then col=C.Lobby else col=vis and C.EnemyVisible or C.Enemy end
local skCol=vis and C.SkeletonVisible or C.Skeleton
local lk=vis and ila(ch)or false
if not oS then eH(e)if ESPC.Offscreen and vis then local sp=cam:WorldToViewportPoint(rt.Position)local dx,dy=sp.X-sc.X,sp.Y-sc.Y local a=math.atan2(dy,dx)local ax=math.clamp(sc.X+math.cos(a)*(ss.X/2-T.OffscreenEdgeDist),T.OffscreenEdgeDist,ss.X-T.OffscreenEdgeDist)local ay=math.clamp(sc.Y+math.sin(a)*(ss.Y/2-T.OffscreenEdgeDist),T.OffscreenEdgeDist,ss.Y-T.OffscreenEdgeDist)local fw=Vector2.new(math.cos(a),math.sin(a))local r2=Vector2.new(-fw.Y,fw.X)local ps=Vector2.new(ax,ay)e.Off.PointA=ps+fw*T.OffscreenArrowSize e.Off.PointB=ps-fw*T.OffscreenArrowSize/2-r2*T.OffscreenArrowSize/2 e.Off.PointC=ps-fw*T.OffscreenArrowSize/2+r2*T.OffscreenArrowSize/2 e.Off.Color=C.EnemyVisible e.Off.Visible=true end return end
e.Off.Visible=false
local bt,bb=hs.Y,fs.Y
local bh=math.abs(bb-bt)
local bw=bh*T.BoxWidthRatio
local cx=rs.X
if ESPC.Boxes then e.Box[1].From=Vector2.new(cx-bw/2,bt)e.Box[1].To=Vector2.new(cx+bw/2,bt)e.Box[2].From=Vector2.new(cx+bw/2,bt)e.Box[2].To=Vector2.new(cx+bw/2,bb)e.Box[3].From=Vector2.new(cx+bw/2,bb)e.Box[3].To=Vector2.new(cx-bw/2,bb)e.Box[4].From=Vector2.new(cx-bw/2,bb)e.Box[4].To=Vector2.new(cx-bw/2,bt)for _,l in pairs(e.Box)do l.Color=col l.Visible=true end else for _,l in pairs(e.Box)do l.Visible=false end end
if ESPC.Names then e.Name.Text=pl.Name e.Name.Position=Vector2.new(cx,hs.Y-T.NameOffset)e.Name.Color=col e.Name.Visible=true else e.Name.Visible=false end
if ESPC.Distance then e.Dist.Text=math.floor(ds).."m" e.Dist.Position=Vector2.new(cx,fs.Y+T.DistOffset)e.Dist.Color=Color3.fromRGB(180,180,180)e.Dist.Visible=true else e.Dist.Visible=false end
if ESPC.Weapons then local w=Ca.wp[pl]if w then e.Weapon.Text="["..w.."]" e.Weapon.Position=Vector2.new(cx+bw/2+T.WeaponOffset,rs.Y)e.Weapon.Color=C.Weapon e.Weapon.Visible=true else e.Weapon.Visible=false end else e.Weapon.Visible=false end
if ESPC.Skeleton then local bn=ir6(ch)and B6 or B for i,b in pairs(bn)do if e.Skel[i]then local p1,p2=ch:FindFirstChild(b[1]),ch:FindFirstChild(b[2])if p1 and p2 then local s1,o1=cam:WorldToViewportPoint(p1.Position)local s2,o2=cam:WorldToViewportPoint(p2.Position)if o1 and o2 and s1.Z>0 and s2.Z>0 then e.Skel[i].From=Vector2.new(s1.X,s1.Y)e.Skel[i].To=Vector2.new(s2.X,s2.Y)e.Skel[i].Color=skCol e.Skel[i].Visible=true else e.Skel[i].Visible=false end else e.Skel[i].Visible=false end end end for i=#bn+1,#e.Skel do if e.Skel[i]then e.Skel[i].Visible=false end end else for _,l in pairs(e.Skel)do l.Visible=false end end
if ESPC.AimLine and hd then local ae=hd.Position+hd.CFrame.LookVector*T.AimLineLength local asc,aon=cam:WorldToViewportPoint(ae)local hsc=cam:WorldToViewportPoint(hd.Position)if aon and hsc.Z>0 then e.Aim.From=Vector2.new(hsc.X,hsc.Y)e.Aim.To=Vector2.new(asc.X,asc.Y)e.Aim.Color=C.AimDir e.Aim.Visible=true else e.Aim.Visible=false end else e.Aim.Visible=false end
if ESPC.LookingAtYou and lk then e.Lk.Text="[!] LOOKING" e.Lk.Position=Vector2.new(cx,hs.Y-T.LookingOffset)e.Lk.Color=C.LookingAtYou e.Lk.Visible=true else e.Lk.Visible=false end
if ESPC.Shield and sh then local rem=Ca.sh[ch]-tick()e.Sh.Text="[SHIELD "..string.format("%.1f",math.max(0,rem)).."s]" e.Sh.Position=Vector2.new(cx,hs.Y-T.ShieldOffset)e.Sh.Visible=true else e.Sh.Visible=false end
if ESPC.Tracers then e.Tr.From=Vector2.new(sc.X,ss.Y)e.Tr.To=Vector2.new(cx,fs.Y)e.Tr.Color=vis and C.EnemyVisible or C.Tracer e.Tr.Visible=true else e.Tr.Visible=false end
local vd=M.vd[pl]if not vd then vd={pos=rt.Position,vel=Vector3.zero,time=tick()}M.vd[pl]=vd end
local nw=tick()local dt=nw-vd.time
if dt>.03 then local rv=(rt.Position-vd.pos)/dt vd.vel=vd.vel*.7+rv*.3 vd.pos=rt.Position vd.time=nw end
if ESPC.Velocity then local vf=Vector3.new(vd.vel.X,0,vd.vel.Z)local vm=vf.Magnitude if vm>2 then local fpz=rt.Position+vf.Unit*math.clamp(vm*.4,5,20)local fs2,fon=cam:WorldToViewportPoint(fpz)if fon and fs2.Z>0 then e.VL.From=Vector2.new(rs.X,rs.Y)e.VL.To=Vector2.new(fs2.X,fs2.Y)e.VL.Visible=true local dx,dy=fs2.X-rs.X,fs2.Y-rs.Y local ln=math.sqrt(dx*dx+dy*dy)if ln>5 then local fx,fy=dx/ln,dy/ln e.VA.PointA=Vector2.new(fs2.X,fs2.Y)e.VA.PointB=Vector2.new(fs2.X-fx*10+fy*5,fs2.Y-fy*10-fx*5)e.VA.PointC=Vector2.new(fs2.X-fx*10-fy*5,fs2.Y-fy*10+fx*5)e.VA.Visible=true else e.VA.Visible=false end else e.VL.Visible=false e.VA.Visible=false end else e.VL.Visible=false e.VA.Visible=false end else e.VL.Visible=false e.VA.Visible=false end
end
local function eSt(cam,ss,sc)
if not ESPC.Enabled then eHA()return end
eCl()
for _,p in ipairs(EP:GetPlayers())do
if p~=EL then
local c=p.Character
if not c or not c:FindFirstChild("HumanoidRootPart")then if M.cache[p]then eH(M.cache[p])end
else
if ist(c)then if M.cache[p]then eH(M.cache[p])end
else
local r=c:FindFirstChild("HumanoidRootPart")
if not M.cache[p]then M.cache[p]=eC()eS(M.cache[p])end
local e=M.cache[p]
local mc=EL.Character
local mr=mc and mc:FindFirstChild("HumanoidRootPart")
local d=mr and(r.Position-mr.Position).Magnitude or 0
local lb=iil(c)
if d>ESPC.MaxDist then eH(e)else eR(e,p,c,r,cam,ss,sc,d,lb)end
end
end
end
end
end
ER.RenderStepped:Connect(function()
local cam=workspace.CurrentCamera
if not cam then return end
local ss=cam.ViewportSize
local sc=Vector2.new(ss.X/2,ss.Y/2)
local nw=tick()
if nw-Tm.lv>T.VisibilityRefreshRate then Tm.lv=nw rfv()end
if nw-Tm.lw>T.WeaponRefreshRate then Tm.lw=nw rfw()end
eSt(cam,ss,sc)
end)
EP.PlayerAdded:Connect(function(p)p.CharacterAdded:Connect(function(c)ash(c)end)end)
for _,p in pairs(EP:GetPlayers())do if p~=EL then p.CharacterAdded:Connect(function(c)ash(c)end)end end
end
local T1=MW:Tab({Title="信息"})
T1:Paragraph({Title="作者",Desc="兔小黑🐰出品",Icon="user"})
T1:Paragraph({Title="QQ群",Desc="1124808244",Icon="users"})
T1:Paragraph({Title="用户名",Desc=LP.Name,Icon="hash"})
T1:Paragraph({Title="用户ID",Desc=tostring(LP.UserId),Icon="hash"})
T1:Paragraph({Title="账号年龄",Desc=tostring(LP.AccountAge).." 天",Icon="calendar"})
T1:Paragraph({Title="执行器",Desc=tostring(identifyexecutor and identifyexecutor() or "未知"),Icon="terminal"})
T1:Button({Text="复制群号",Icon="copy",Callback=function()pcall(function()setclipboard("1124808244")end)N("提示","已复制",2)end})
local T2=MW:Tab({Title="通用"})
local C2F=T2:Category({Title="飞行",IconName="send"})
C2F:Paragraph({Title="飞行功能",Desc="点击下面按钮加载飞行脚本",Icon="info"})
C2F:Button({Text="启动飞行",Icon="play",Callback=function()
local ok,err=pcall(function()loadstring(game:HttpGet("https://pastefy.app/z1mFBr9I/raw"))()end)
if ok then N("飞行","启动成功",2)else N("失败",tostring(err):sub(1,80),4)end
end})
local C2N=T2:Category({Title="穿墙",IconName="shield-off"})
C2N:Paragraph({Title="穿墙说明",Desc="开启后角色可穿所有墙体和地面",Icon="info"})
local nConn
local function enNC()local c=LP.Character if c then for _,p in ipairs(c:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=false end end end nConn=RS.Stepped:Connect(function()local ch=LP.Character if not ch then return end for _,p in ipairs(ch:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=false end end end)end
local function disNC()if nConn then nConn:Disconnect()nConn=nil end local c=LP.Character if c then for _,p in ipairs(c:GetDescendants())do if p:IsA("BasePart")then p.CanCollide=true end end end end
C2N:Toggle({Title="穿墙",Value=false,FeatureName="穿墙",Icon="shield-off",Callback=function(s)if s then enNC()else disNC()end end})
local C2C=T2:Category({Title="相机",IconName="camera"})
C2C:Paragraph({Title="第三人称",Desc="开启后切换到第三人称视角，可以把镜头拉很远",Icon="info"})
C2C:Toggle({Title="第三人称",Value=false,FeatureName="第三人称",Icon="camera",Callback=function(s)
if s then LP.CameraMode=Enum.CameraMode.Classic LP.CameraMaxZoomDistance=128 LP.CameraMinZoomDistance=0.5 N("相机","已切换第三人称",2)
else LP.CameraMode=Enum.CameraMode.Classic LP.CameraMaxZoomDistance=128 LP.CameraMinZoomDistance=0.5 N("相机","已恢复默认",2)end
end})
C2C:Paragraph({Title="放大距离",Desc="默认128。数字改大镜头能拉更远，输入后按回车生效",Icon="info"})
C2C:TextInput({Title="",Placeholder="输入最大视距，如 500",Value="128",Callback=function(t)local n=tonumber(t)if n then LP.CameraMaxZoomDistance=n N("相机","最大视距 "..n,2)end end})
local T3=MW:Tab({Title="玩家"})
local C3L=T3:Category({Title="本地玩家",IconName="user"})
C3L:Paragraph({Title="移动速度",Desc="默认16。数字改大跑得快，输入后按回车生效",Icon="info"})
C3L:TextInput({Title="",Placeholder="输入速度数字，如 16",Value="16",Callback=function(t)local n=tonumber(t)if n and LP.Character then local h=LP.Character:FindFirstChildOfClass("Humanoid")if h then h.WalkSpeed=n end end end})
C3L:Paragraph({Title="跳跃高度",Desc="默认50。数字改大跳得高，输入后按回车生效",Icon="info"})
C3L:TextInput({Title="",Placeholder="输入跳跃数字，如 50",Value="50",Callback=function(t)local n=tonumber(t)if n and LP.Character then local h=LP.Character:FindFirstChildOfClass("Humanoid")if h then h.UseJumpPower=true h.JumpPower=n end end end})
C3L:Paragraph({Title="重力",Desc="默认196.2。数字改小跳得飘，改大往下沉，输入后按回车生效",Icon="info"})
C3L:TextInput({Title="",Placeholder="输入重力数字，如 196.2",Value="196.2",Callback=function(t)local n=tonumber(t)if n then workspace.Gravity=n N("重力","已设为 "..n,2)end end})
C3L:Paragraph({Title="无限跳",Desc="开启后空中也能跳，一直按跳跃键就能一直往上飞",Icon="info"})
local IJ
C3L:Toggle({Title="无限跳",Value=false,FeatureName="无限跳",Icon="arrow-up",Callback=function(s)
if s then IJ=UIS.JumpRequest:Connect(function()if LP.Character then local h=LP.Character:FindFirstChildOfClass("Humanoid")if h then h:ChangeState(Enum.HumanoidStateType.Jumping)end end end)N("无限跳","已开启",2)
else if IJ then IJ:Disconnect()IJ=nil end N("无限跳","已关闭",2)end
end})
local C3P=T3:Category({Title="玩家列表",IconName="users"})
local selP=nil
local function bldP()local l={}for _,p in ipairs(Players:GetPlayers())do table.insert(l,p.Name)end if #l==0 then l={"无"}end return l end
local pList=bldP()
local pDD
pDD=C3P:Dropdown({Title="选择玩家",Values=pList,Value=pList[1],Multi=false,Callback=function(s)selP=s N("玩家","已选 "..tostring(s),1)end})
C3P:Button({Text="刷新列表",Icon="refresh-cw",Callback=function()pList=bldP()pDD:UpdateOptions(pList,pList[1])selP=pList[1]N("刷新","共 "..#pList.." 名",2)end})
C3P:Button({Text="传送到所选玩家",Icon="send",Callback=function()if not selP or selP=="无" then N("错误","请先选",2)return end local t=Players:FindFirstChild(selP)if t and t.Character and LP.Character then LP.Character:PivotTo(t.Character:GetPivot())N("传送","已传送",2)end end})
C3P:Button({Text="拉到身边",Icon="arrow-down",Callback=function()if not selP or selP=="无" then N("错误","请先选",2)return end local t=Players:FindFirstChild(selP)if t and t.Character and LP.Character then t.Character:PivotTo(LP.Character:GetPivot())N("拉取","已拉",2)end end})
C3P:Paragraph({Title="甩飞",Desc="强力甩飞，自动保存位置，结束归位。自己也会飞，正常",Icon="info"})
local function TXH_SkidFling(TargetPlayer)
local Player=LP
local Character=Player.Character
local Humanoid=Character and Character:FindFirstChildOfClass("Humanoid")
local RootPart=Humanoid and Humanoid.RootPart
if not(Character and Humanoid and RootPart)then return end
local TCharacter=TargetPlayer.Character
if not TCharacter then return end
local THumanoid=TCharacter:FindFirstChildOfClass("Humanoid")
local TRootPart=THumanoid and THumanoid.RootPart
local THead=TCharacter:FindFirstChild("Head")
local Accessory=TCharacter:FindFirstChildOfClass("Accessory")
local Handle=Accessory and Accessory:FindFirstChild("Handle")
if RootPart.Velocity.Magnitude<50 then getgenv().TXH_OldPos=RootPart.CFrame end
if THumanoid and THumanoid.Sit then return end
if THead then workspace.CurrentCamera.CameraSubject=THead
elseif Handle then workspace.CurrentCamera.CameraSubject=Handle
elseif THumanoid and TRootPart then workspace.CurrentCamera.CameraSubject=THumanoid end
if not TCharacter:FindFirstChildWhichIsA("BasePart")then return end
local oldFPDH=workspace.FallenPartsDestroyHeight
local function FPos(BasePart,Pos,Ang)
RootPart.CFrame=CFrame.new(BasePart.Position)*Pos*Ang
Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position)*Pos*Ang)
RootPart.Velocity=Vector3.new(9e7,9e7*10,9e7)
RootPart.RotVelocity=Vector3.new(9e8,9e8,9e8)
end
local function SFBasePart(BasePart)
local TimeToWait=2
local Time=tick()
local Angle=0
repeat
if RootPart and THumanoid then
if BasePart.Velocity.Magnitude<50 then
Angle=Angle+100
FPos(BasePart,CFrame.new(0,1.5,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(Angle),0,0))task.wait()
FPos(BasePart,CFrame.new(0,-1.5,0)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(Angle),0,0))task.wait()
FPos(BasePart,CFrame.new(2.25,1.5,-2.25)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(Angle),0,0))task.wait()
FPos(BasePart,CFrame.new(-2.25,-1.5,2.25)+THumanoid.MoveDirection*BasePart.Velocity.Magnitude/1.25,CFrame.Angles(math.rad(Angle),0,0))task.wait()
FPos(BasePart,CFrame.new(0,1.5,0)+THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))task.wait()
FPos(BasePart,CFrame.new(0,-1.5,0)+THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle),0,0))task.wait()
else
FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()
FPos(BasePart,CFrame.new(0,-1.5,-THumanoid.WalkSpeed),CFrame.Angles(0,0,0))task.wait()
FPos(BasePart,CFrame.new(0,1.5,THumanoid.WalkSpeed),CFrame.Angles(math.rad(90),0,0))task.wait()
FPos(BasePart,CFrame.new(0,1.5,TRootPart.Velocity.Magnitude/1.25),CFrame.Angles(math.rad(90),0,0))task.wait()
FPos(BasePart,CFrame.new(0,-1.5,-TRootPart.Velocity.Magnitude/1.25),CFrame.Angles(0,0,0))task.wait()
FPos(BasePart,CFrame.new(0,1.5,TRootPart.Velocity.Magnitude/1.25),CFrame.Angles(math.rad(90),0,0))task.wait()
end
else break end
until BasePart.Velocity.Magnitude>500 or BasePart.Parent~=TargetPlayer.Character or TargetPlayer.Parent~=Players or not TargetPlayer.Character==TCharacter or THumanoid.Sit or Humanoid.Health<=0 or tick()>Time+TimeToWait
end
workspace.FallenPartsDestroyHeight=0/0
local BV=Instance.new("BodyVelocity")
BV.Name="TXHVel"
BV.Parent=RootPart
BV.Velocity=Vector3.new(9e8,9e8,9e8)
BV.MaxForce=Vector3.new(1/0,1/0,1/0)
Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)
if TRootPart and THead then
if (TRootPart.CFrame.p-THead.CFrame.p).Magnitude>5 then SFBasePart(THead)else SFBasePart(TRootPart)end
elseif TRootPart then SFBasePart(TRootPart)
elseif THead then SFBasePart(THead)
elseif Handle then SFBasePart(Handle)end
BV:Destroy()
Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)
workspace.CurrentCamera.CameraSubject=Humanoid
workspace.FallenPartsDestroyHeight=oldFPDH
repeat
RootPart.CFrame=getgenv().TXH_OldPos*CFrame.new(0,.5,0)
Character:SetPrimaryPartCFrame(getgenv().TXH_OldPos*CFrame.new(0,.5,0))
Humanoid:ChangeState("GettingUp")
for _,x in ipairs(Character:GetChildren())do if x:IsA("BasePart")then x.Velocity=Vector3.new()x.RotVelocity=Vector3.new()end end
task.wait()
until (RootPart.Position-getgenv().TXH_OldPos.p).Magnitude<25
end
C3P:Button({Text="甩飞所选玩家",Icon="alert-triangle",Callback=function()
if not selP or selP=="无" then N("错误","请先选玩家",2)return end
local t=Players:FindFirstChild(selP)
if not t then N("错误","目标无效",2)return end
local ok,err=pcall(function()TXH_SkidFling(t)end)
if ok then N("甩飞","已甩 "..selP,2)else N("失败",tostring(err):sub(1,80),4)end
end})
C3P:Paragraph({Title="循环甩飞",Desc="持续甩飞所选玩家。很猛但容易被踢",Icon="info"})
local autoFlingOn=false
C3P:Toggle({Title="循环甩飞",Value=false,FeatureName="循环甩飞",Icon="repeat",Callback=function(t)
autoFlingOn=t
if t then
if not selP or selP=="无" then N("错误","请先选玩家",2)autoFlingOn=false return false end
task.spawn(function()
while autoFlingOn do
task.wait()
pcall(function()
local target=Players:FindFirstChild(selP)
if target then TXH_SkidFling(target)end
end)
end
end)
N("循环甩飞","已开启",2)
else N("循环甩飞","已关闭",2)end
end})
C3P:Paragraph({Title="自瞄目标",Desc="视角锁定所选玩家",Icon="info"})
local aimbotOn=false
C3P:Toggle({Title="自瞄选择目标",Value=false,FeatureName="自瞄目标",Icon="crosshair",Callback=function(a)
aimbotOn=a
if a then
task.spawn(function()
while aimbotOn do
local Cam2=workspace.CurrentCamera
local tp=Players:FindFirstChild(selP)
local target=tp and tp.Character and tp.Character:FindFirstChild("HumanoidRootPart")
if target and Cam2 then
local lv=(target.Position-Cam2.CFrame.Position).Unit
Cam2.CFrame=CFrame.new(Cam2.CFrame.Position,Cam2.CFrame.Position+lv)
end
task.wait()
end
end)
end
end})
local T4=MW:Tab({Title="透视"})
local C4V=T4:Category({Title="夜视",IconName="sun"})
C4V:Paragraph({Title="夜视",Desc="开启后环境变亮，夜里也能看清",Icon="info"})
C4V:Toggle({Title="夜视",Value=false,FeatureName="夜视",Icon="sun",Callback=function(s)LG.Ambient=s and Color3.new(1,1,1)or Color3.new(0,0,0)end})
local C4E=T4:Category({Title="ESP 视觉辅助",IconName="eye"})
C4E:Paragraph({Title="ESP 主开关",Desc="开启后下方元素生效",Icon="info"})
C4E:Toggle({Title="启用 ESP",Value=false,FeatureName="ESP",Icon="eye",Callback=function(s)ESPC.Enabled=s end})
C4E:Paragraph({Title="视觉元素",Desc="开启/关闭各显示元素",Icon="info"})
C4E:Toggle({Title="方框",Value=true,FeatureName="方框",Icon="square",Callback=function(s)ESPC.Boxes=s end})
C4E:Toggle({Title="名字",Value=true,FeatureName="名字",Icon="type",Callback=function(s)ESPC.Names=s end})
C4E:Toggle({Title="距离",Value=true,FeatureName="距离",Icon="ruler",Callback=function(s)ESPC.Distance=s end})
C4E:Toggle({Title="骨骼",Value=true,FeatureName="骨骼",Icon="bone",Callback=function(s)ESPC.Skeleton=s end})
C4E:Toggle({Title="武器",Value=true,FeatureName="武器",Icon="sword",Callback=function(s)ESPC.Weapons=s end})
C4E:Toggle({Title="瞄准线",Value=true,FeatureName="瞄准线",Icon="crosshair",Callback=function(s)ESPC.AimLine=s end})
C4E:Toggle({Title="正在看你",Value=true,FeatureName="正在看你",Icon="eye",Callback=function(s)ESPC.LookingAtYou=s end})
C4E:Toggle({Title="护盾指示",Value=true,FeatureName="护盾",Icon="shield",Callback=function(s)ESPC.Shield=s end})
C4E:Toggle({Title="屏幕外箭头",Value=true,FeatureName="屏幕外",Icon="arrow-up-right",Callback=function(s)ESPC.Offscreen=s end})
C4E:Toggle({Title="轨迹线",Value=false,FeatureName="轨迹线",Icon="activity",Callback=function(s)ESPC.Tracers=s end})
C4E:Toggle({Title="速度线",Value=false,FeatureName="速度线",Icon="zap",Callback=function(s)ESPC.Velocity=s end})
C4E:Paragraph({Title="队伍检测",Desc="开启后不显示队友的 ESP（需要游戏有队伍系统）",Icon="info"})
C4E:Toggle({Title="队伍检测",Value=false,FeatureName="队伍检测",Icon="users",Callback=function(s)ESPC.TeamCheck=s end})
C4E:Paragraph({Title="队伍属性名",Desc="游戏里队伍的属性名，常见：Team / Side / Faction",Icon="info"})
C4E:Dropdown({Title="",Values={"Team","Side","Faction","PlayerTeam","TeamName","Lobby","阵营","队伍"},Value="Team",Multi=false,Callback=function(t)ESPC.TeamAttributeName=t end})
C4E:Paragraph({Title="最大显示距离",Desc="默认2000，越大越吃性能",Icon="info"})
C4E:Slider({Title="最大距离",Min=500,Max=5000,Default=2000,Ticks=45,Callback=function(v)ESPC.MaxDist=v end})
local TM=MW:Tab({Title="消息"})
local CM=TM:Category({Title="自动发言设置",IconName="message-circle"})
local sayMessage=""
local sayCount=1
local isSpeaking=false
local speakThread=nil
local function SendChatMessage(msg)
local TCS=game:GetService("TextChatService")
local RS2=game:GetService("ReplicatedStorage")
if TCS.ChatVersion==Enum.ChatVersion.TextChatService then TCS.TextChannels.RBXGeneral:SendAsync(msg)
else RS2.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(msg,"All")end
end
CM:Paragraph({Title="消息内容",Desc="输入你要说的话，输入后按回车生效",Icon="info"})
CM:TextInput({Title="",Placeholder="在此输入消息",Value="",Callback=function(txt)sayMessage=txt end})
CM:Paragraph({Title="发言次数",Desc="默认1次，输入数字后按回车生效",Icon="info"})
CM:TextInput({Title="",Placeholder="输入次数，如 1",Value="1",Callback=function(txt)sayCount=tonumber(txt) or 1 end})
CM:Paragraph({Title="发言开关",Desc="开启后按上方次数自动发送，每条间隔0.5秒",Icon="info"})
CM:Toggle({Title="发言开关",Value=false,FeatureName="自动发言",Icon="send",Callback=function(s)
isSpeaking=s
if s then
if sayMessage=="" then N("错误","请先输入要说的内容",3)isSpeaking=false return false end
speakThread=task.spawn(function()
for i=1,sayCount do
if not isSpeaking then break end
SendChatMessage(sayMessage)
task.wait(0.5)
end
isSpeaking=false
end)
N("消息","开始发送",2)
else if speakThread then task.cancel(speakThread)speakThread=nil end N("消息","已停止",2)end
end})
local T5=MW:Tab({Title="杂项"})
local C5=T5:Category({Title="快捷操作",IconName="zap"})
C5:Paragraph({Title="刷新角色",Desc="让角色重生一次，相当于自杀复活",Icon="info"})
C5:Button({Text="刷新角色",Icon="refresh-cw",Callback=function()if LP.Character then LP.Character:BreakJoints()end end})
C5:Paragraph({Title="重新加入",Desc="重新连接到当前服务器",Icon="info"})
C5:Button({Text="重新加入",Icon="log-out",Callback=function()game:GetService("TeleportService"):Teleport(game.PlaceId,LP)end})
C5:Button({Text="复制群号",Icon="copy",Callback=function()pcall(function()setclipboard("1124808244")end)N("提示","已复制",2)end})
C5:Paragraph({Title="显示FPS",Desc="开启后屏幕右上角显示当前帧率",Icon="info"})
C5:Toggle({Title="显示FPS",Value=false,FeatureName="显示帧率",Icon="activity",Callback=function(s)if s then local g=Instance.new("ScreenGui")g.Name="TXH_FPS"g.ResetOnSpawn=false pcall(function()g.Parent=CG end)if not g.Parent then g.Parent=LP:WaitForChild("PlayerGui")end local l=Instance.new("TextLabel")l.Parent=g l.BackgroundTransparency=1 l.Position=UDim2.new(.78,0,0,0)l.Size=UDim2.new(0,130,0,30)l.Font=Enum.Font.GothamBold l.TextSize=14 l.TextColor3=Color3.new(1,1,1)l.TextStrokeTransparency=0 l.Text="FPS: 0"local n=0 RS.RenderStepped:Connect(function(dt)n=n+1 if n>=10 then l.Text="FPS: "..math.floor(1/dt)n=0 end end)else local g=CG:FindFirstChild("TXH_FPS")if g then g:Destroy()end local g2=LP:FindFirstChild("PlayerGui")if g2 then local g3=g2:FindFirstChild("TXH_FPS")if g3 then g3:Destroy()end end end end})
local TS=MW:Tab({Title="脚本大全"})
local CS=TS:Category({Title="外部脚本加载器",IconName="download"})
CS:Paragraph({Title="提示",Desc="点按钮加载对应脚本，弹出的是脚本自带的UI，跟兔小黑同时存在",Icon="info"})
CS:Button({Text="XA脚本",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.gitcode.com/Xingtaiduan/Scripts/raw/main/Loader.lua"))()end)if ok then N("脚本大全","XA脚本加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="夜脚本",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://raw.githubusercontent.com/ylt410/roblox-Script/refs/heads/main/yejiaoben"))()end)if ok then N("脚本大全","夜脚本加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="黑脚本",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("\x68\x74\x74\x70\x73\x3a\x2f\x2f\x72\x61\x77\x2e\x67\x69\x74\x68\x75\x62\x75\x73\x65\x72\x63\x6f\x6e\x74\x65\x6e\x74\x2e\x63\x6f\x6d\x2f\x68\x67\x76\x75\x79\x67\x75\x79\x67\x2f\x48\x45\x49\x4a\x49\x41\x4f\x42\x45\x4e\x2f\x6d\x61\x69\x6e\x2f\x61\x61\x61"))()end)if ok then N("脚本大全","黑脚本加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="R6🦌管",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://pastefy.app/wa3v2Vgm/raw"))()end)if ok then N("脚本大全","R6加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="R15🦌管",Icon="play",Callback=function()local ok,err=pcall(function()loadstring(game:HttpGet("https://pastefy.app/YZoglOyJ/raw"))()end)if ok then N("脚本大全","R15加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="皮脚本",Icon="play",Callback=function()local ok,err=pcall(function()getgenv().XiaoPi="皮脚本QQ群1002100032" loadstring(game:HttpGet("https://raw.githubusercontent.com/xiaopi77/xiaopi77/main/QQ1002100032-Roblox-Pi-script.lua"))()end)if ok then N("脚本大全","皮脚本加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Button({Text="BS黑洞脚本",Icon="play",Callback=function()local ok,err=pcall(function()BS="\104\116\116\112\115\58\47\47\103\105\116\101\101\46\99\111\109\47\66\83\95\115\99\114\105\112\116\47\115\99\114\105\112\116\47\114\97\119\47\109\97\115\116\101\114\47\66\83\95\83\99\114\105\112\116\46\76\117\97\117" loadstring(game:HttpGet(BS))()end)if ok then N("脚本大全","BS黑洞加载成功",2)else N("失败",tostring(err):sub(1,80),4)end end})
CS:Paragraph({Title="说明",Desc="所有脚本均来自网络，用之前请用小号测试",Icon="alert-triangle"})
W:Notify({Title="加载完成",Content="兔小黑🐰 已就绪",Duration=4})
print("[兔小黑🐰] 加载完成 | 群:1124808244")
