local r=Instance.new("RemoteEvent")
r.Parent=owner.PlayerGui
NLS([[print("loaded")
game:GetService("UserInputService").InputBegan:Connect(function(key)
	if not game:GetService("UserInputService"):GetFocusedTextBox() then
		if key.KeyCode==Enum.KeyCode.E then
			script.Parent:FireServer()
		end
	end
end)]],r)

r.OnServerEvent:Connect(function()
	local settled=false
	--11, 5.5, 2.75
	spawn(function()
		local b=Instance.new("Sound")
		b.SoundId="rbxasset://sounds/bass.mp3"
		b.Pitch=2.75
		b.Volume=1
		b.Parent=owner.Character.HumanoidRootPart
		local b2=Instance.new("Sound")
		b2.SoundId="rbxasset://sounds/bass.mp3"
		b2.Pitch=1.375
		b2.Volume=1
		b2.Parent=owner.Character.HumanoidRootPart

		b:Play()
		task.wait(0.1)
		b2.Pitch=2.75
		b.Pitch=5.5
		b:Play()
		b2:Play()
		task.wait(0.1)
		b2.Pitch=5.5
		b.Pitch=11
		b:Play()
		b2:Play()
		task.wait(0.1)
		b.Pitch=5.5
		b2.Pitch=2.75
		b:Play()
		b2:Play()
		task.wait(0.1)
		b.Pitch=11
		b:Play()
		b2:Play()
		task.wait(0.1)
		b:Destroy()
		b2:Destroy()
	end)

	local part=Instance.new("Part")
	part.CFrame=owner.Character.HumanoidRootPart.CFrame*CFrame.new(0,8,-8)
	part.Size=Vector3.one*8
	part.Material=Enum.Material.Neon
	part.Color=Color3.new(0.7,0,0.7)
	part.Anchored=true
	part.Parent=script

	local box=Instance.new("SelectionBox")
	box.Color3=Color3.new(1,0.5,0)
	box.Adornee=part
	box.Parent=part

	spawn(function()
		repeat
			if part.Anchored==false then
				if part.Velocity.Magnitude<1 then
					settled=true
					local hit=Instance.new("Sound")
					hit.SoundId="rbxasset://sounds/snap.mp3"
					hit.Pitch=0.2
					hit.TimePosition=0.1
					hit.Volume=1
					hit.PlayOnRemove=true
					hit.Parent=part
					hit:Destroy()
				end
			end
			task.wait()
		until settled==true
	end)

	local l=1
	for i=1,20 do
		if l==1 then
			l=2
			part.Color=Color3.new(1,0.4,1)
		else
			l=1
			part.Color=Color3.new(1,0,0)
		end
		task.wait(0.1)
	end
	l=1
	part.Anchored=false
	for i=1,20 do
		if l==1 then
			l=2
			part.Color=Color3.new(98/255,37/255,209/255)
			box.Color3=Color3.new(1,1,0)
		else
			l=1
			part.Color=Color3.new(1,1,1)
			box.Color3=Color3.new()
		end
		task.wait(0.05)
	end
	part.Color=Color3.new(1,0,0)
	box.Color3=Color3.new(0,1,0)

	task.wait(10)
	part.Color=Color3.new(98/255,37/255,209/255)
	box.Transparency=0.3
	task.wait(5)
	l=1
	for i=1,5 do
		if l==1 then
			l=2
			part.Transparency=0.5
			box.Transparency=0.5
		else
			l=1
			part.Transparency=0
			box.Transparency=0.3
		end
		task.wait(1)
	end
	settled=true
	part:Destroy()
end)