touches=0
touchessec=0

function rs()
	local length = math.random(10,20)
	local array = {}
	for i = 1, length do
		array[i] = string.char(math.random(32, 126))
	end
	return table.concat(array)
end

running=true

player="FF01_luau"
local ball=Instance.new("Part")
ball.Parent=workspace
ball.Shape=Enum.PartType.Ball
ball.Name="main"
ball.Size=Vector3.new(2,2,2)
ball.Position=game.Players[player].Character.HumanoidRootPart.Position+Vector3.new(0,10,0)

sound=Instance.new("Sound")
sound.Parent=ball
sound.Name="main"
sound.SoundId="rbxasset://sounds/bass.mp3" --"rbxasset://sounds//Rubber band sling shot.mp3"
sound.Volume=.5
sound.Pitch=6
sound.Looped=true
sound:Play()

ball.Touched:Connect(function(a)
	if running==true then
		ball.Name=rs(10)
		touches=touches+1
		touchessec=touchessec+1
		sound.Pitch=6
		ball.Velocity=Vector3.new((math.random(-99, 99)),(math.random(-99, 99)),(math.random(-99, 99)))
		local sound=Instance.new("Sound")
		local ball2=Instance.new("Part")
		ball2.CustomPhysicalProperties=PhysicalProperties.new(100,0,25,0,90)
		ball2.Name="mini"
		ball2.Parent=ball
		snd=Instance.new("Sound")
		snd.Parent=ball
		snd.Name="mini"
		snd.SoundId="rbxasset://sounds/snap.mp3" --"rbxasset://sounds//Rubber band sling shot.mp3"
		snd.Volume=.5
		snd.Pitch=math.random(6)
		snd.PlayOnRemove=true
		snd:Destroy()
		local l=Instance.new("PointLight")
		l.Parent=ball2
		l.Color=ball2.Color
		l.Range=5
		l.Brightness=0.2
		l.Shadows=true
		ball2.Shape=Enum.PartType.Ball
		ball2.Size=Vector3.new(1,1,1)
		ball2.Position=ball.Position+Vector3.new(math.random(-3,3),0,math.random(-3,3))
		ball2.Color=Color3.fromRGB(math.random(255),math.random(255),math.random(255))
		ball2.Velocity=Vector3.new((math.random(-99, 99)),(math.random(-99, 99)),(math.random(-99, 99)))
		ball2.Material=Enum.Material:GetEnumItems()[math.random(#Enum.Material:GetEnumItems())]
		wait(1.45)
		ball2:Remove()
		if touchessec>=10 and touchessec<25 then
			local sound2=Instance.new("Sound")
			sound2.Parent=ball
			sound2.Name="over10"
			sound2.SoundId="rbxasset://sounds/bass.mp3" --"rbxasset://sounds//Rubber band sling shot.mp3"
			sound2.Volume=.5
			sound2.Pitch=6
			sound2.Looped=false
			repeat
				sound2.Pitch=sound2.Pitch-0.5
				local part=Instance.new("Part")
				local l=Instance.new("PointLight")
				l.Name="PowerUpLight"
				l.Parent=part
				l.Range=20
				l.Brightness=0.2
				l.Shadows=true
				part.Parent=ball
				part.Position=ball.Position
				part.Anchored=true
				part.Transparency=0.7
				part.Name="PowerUp"
				part.Material=Enum.Material.Neon
				part.Shape=Enum.PartType.Ball
				part.CanTouch=false
				part.CanCollide=false
				part.Size=Vector3.new(4,4,4)
				sound2:Play()
				wait(0.1)
				part:Destroy()
				l:Destroy()
			until sound2.Pitch<=0.5
			task.wait(1)
			sound2:Destroy()
		end
		if touchessec>=25 then
			local lz=Instance.new("Part")
			local sn5=Instance.new("Sound")
			lz.Parent=ball
			lz.Size=Vector3.new(1,5,1)
			lz.Material=Enum.Material.Neon
			lz.Transparency=0.5
			lz.Anchored=true
			lz.CanTouch=false
			lz.CanCollide=false
			lz.Position=ball.Position
			sn5.Parent=lz
			sn5.TimePosition=0.1
			sn5.Name="lazer"
			sn5.Volume=.5
			sn5.SoundId="rbxasset://sounds/electronicpingshort.wav"
			sn5.Pitch=2
			wait(0.05)
			repeat
				sn5.Pitch=sn5.Pitch-0.05
				sn5:Play()
				lz.Color=Color3.fromRGB(math.random(255),math.random(255),math.random(255))
				lz.Position=lz.Position+Vector3.new(0,1,0)
				task.wait(0.1)
			until sn5.Pitch<=1
			local balll=Instance.new("Part")
			local saod=Instance.new("Sound")
			saod.Parent=balll
			saod.Parent=lz
			saod.TimePosition=0.1
			saod.Name="snoud"
			saod.Volume=.5
			saod.SoundId="rbxasset://sounds/snap.mp3"
			saod.Pitch=1
			balll.Parent=ball
			balll.Name="xplosion"
			balll.Shape=Enum.PartType.Ball
			balll.Size=Vector3.new(10,10,10)
			balll.Color=lz.Color
			balll.Anchored=true
			balll.Material=Enum.Material.Neon
			balll.Transparency=0.5
			balll.CanCollide=false
			balll.Position=lz.Position
			lz:Destroy()
			sn5:Destroy()
			wait(0.5)
			balll:Destroy()
		end
	end
end)

check=owner.Chatted:Connect(function(msg)
	if msg==">end" then
		ball:Destroy()
		running=false
		check:Disconnect()
	end
end)

spawn(function()
	while task.wait(1) do
		if running==true then
			print(touchessec)
			touchessec=0
		end
	end
end)

while task.wait(0.1) do
	if running==true then
		sound.Pitch=sound.Pitch-0.1
		sound:Play()
	end
end
