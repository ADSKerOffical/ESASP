local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/ionlyusegithubformcmods/1-Line-Scripts/main/Mobile%20Friendly%20Orion')))()

local Window = OrionLib:MakeWindow({Name = "Budgie Hub | Every second add +1 skill point", HidePremium = true, IntroEnabled = false, SaveConfig = false, ConfigFolder = "OrionTest"})

local Tab = Window:MakeTab({
 Name = "Main",
 Icon = "rbxassetid://4483345998",
 PremiumOnly = false
})
game:GetService("GuiService"):SetGameplayPausedNotificationEnabled(false)

local Section = Tab:AddSection({
  Name = "Sword and punch"
})

Tab:AddToggle({
 Name = "Hit all dummies by sword or punch",
 Default = false,
 Callback = function(Value)
     ooj = Value
while ooj and game:GetService("RunService").RenderStepped:Wait() do
    local LP = game:GetService("Players").LocalPlayer
local tool = LP.Character and LP.Character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Handle") then
                tool:Activate()
                for i, v in next, workspace:GetDescendants() do
                    if v:IsA("Humanoid") and not game:GetService("Players"):GetPlayerFromCharacter(v.Parent) then
                       for i, d in next, v.Parent:GetDescendants() do
                         if d:IsA("BasePart") then coroutine.wrap(function()
                           firetouchinterest(tool.Handle, d, 0)
                           firetouchinterest(tool.Handle, d, 1)
                        end)() end
                    end
                 end
             end
         end
     end
   end    
})

Tab:AddToggle({
 Name = "Hit all players by sword or punch",
 Default = false,
 Callback = function(Value)
oojh = Value
local LP = game.Players.LocalPlayer
while oojh and game:GetService("RunService").RenderStepped:Wait() do
    local p = game.Players:GetPlayers()
    for i = 2, #p do local v = p[i].Character
local tool = LP.Character and LP.Character:FindFirstChildOfClass("Tool")
            if tool and tool:FindFirstChild("Handle") then
                tool:Activate()
                for i,v in next, v:GetChildren() do
                    if v:IsA("BasePart") then
                        firetouchinterest(tool.Handle,v,0)
                        firetouchinterest(tool.Handle,v,1)
                    end
                end
            end
        end
     end
 end    
})

local iehh = false
Tab:AddToggle({
 Name = "Instant sword kill nearest dummies",
 Default = false,
 Callback = function(Value)
iehh = Value
 while iehh and task.wait() do
   if game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool"):FindFirstChild("Handle") then
     local humanoids = {}
for _, part in next, game.Workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 40) do
    if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and not part:IsDescendantOf(game.Players.LocalPlayer.Character) then
      if not table.find(humanoids, part.Parent:FindFirstChildOfClass("Humanoid")) then
        table.insert(humanoids, part.Parent:FindFirstChildOfClass("Humanoid"))
      end
    end
  end

     for _, humanoid in next, humanoids do coroutine.wrap(function()
      firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, humanoid.RootPart, 0)
       for _, part in next, humanoid.Parent:GetDescendants() do
         if part:IsA("BasePart") then
           firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool").Handle, part, 0)
         end
       end 
       
       coroutine.wrap(function()
       game.Players.LocalPlayer.SimulationRadius = math.huge
       sethiddenproperty(game.Players.LocalPlayer, "MaxSimulationRadius", math.huge)
       settings().Network.IncomingReplicationLag = 0
       game:GetService("TestService").IsSleepAllowed = false
       end)()
       
       humanoid.Health = 0
       humanoid:TakeDamage(math.huge)
       humanoid:ChangeState("Dead")
     end)() end
   end
 end
   end    
})

Tab:AddToggle({
 Name = "Teleport to boss torso at instant sword kill",
 Default = false,
 Callback = function(Value)
      pei = Value
     while pei and task.wait() do
       if iehh == true and game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool") then
         local humanoids = {}
for _, part in next, workspace:GetPartBoundsInRadius(game.Players.LocalPlayer.Character.HumanoidRootPart.Position, 100) do
    if part.Parent:IsA("Model") and part.Parent:FindFirstChildOfClass("Humanoid") and not part:IsDescendantOf(game.Players.LocalPlayer.Character) and part.Parent:IsDescendantOf(game.Workspace.mobs.BOSS) and part.Parent:FindFirstChildOfClass("Humanoid"):GetState() ~= "Dead" and part.Parent:FindFirstChildOfClass("Humanoid").Health > 0 then
      if not table.find(humanoids, part.Parent:FindFirstChildOfClass("Humanoid")) then
        table.insert(humanoids, part.Parent:FindFirstChildOfClass("Humanoid"))
      end
    end
  end

          for _, humanoid in next, humanoids do
           game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = humanoid.RootPart.CFrame * CFrame.new(0, humanoid.RootPart.Size.Y, 0)
         end
       end
     end
   end    
})

local Section = Tab:AddSection({
  Name = "<s>Staff modifiers</s> (Patched)"
})

Tab:AddButton({
 Name = "Modify staff small explosion",
 Callback = function()
      local staff = (game.Players.LocalPlayer.Backpack:FindFirstChild("Staff") or game.Players.LocalPlayer.Character:FindFirstChild("Staff"))
      if staff then
        staff.Activated:Connect(function()
          game:GetService("ReplicatedStorage"):WaitForChild("Staff Call"):WaitForChild("Small Explosion"):WaitForChild("shoot"):FireServer(game.Players.LocalPlayer:GetMouse().Hit.LookVector, game.Players.LocalPlayer:GetMouse().Hit.Position)
        end)
      end
   end    
})

Tab:AddButton({
 Name = "Modify staff light halo",
 Callback = function()
      local staff = (game.Players.LocalPlayer.Backpack:FindFirstChild("Staff") or game.Players.LocalPlayer.Character:FindFirstChild("Staff"))
      if staff then
        staff.Activated:Connect(function()
          game:GetService("ReplicatedStorage")["Staff Call"]["Light Halo"].shoot:FireServer()
        end)
      end
   end    
})

Tab:AddButton({
 Name = "Modify staff Poseidon",
 Callback = function()
      local staff = (game.Players.LocalPlayer.Backpack:FindFirstChild("Staff") or game.Players.LocalPlayer.Character:FindFirstChild("Staff"))
      if staff then
        staff.Activated:Connect(function()
          game:GetService("ReplicatedStorage")["Staff Call"].Poseidon.shoot:FireServer(game.Players.LocalPlayer:GetMouse().Hit.LookVector, game.Players.LocalPlayer:GetMouse().Hit.Position)
        end)
      end
   end    
})

Tab:AddButton({
 Name = "Modify staff Heal",
 Callback = function()
      local staff = (game.Players.LocalPlayer.Backpack:FindFirstChild("Staff") or game.Players.LocalPlayer.Character:FindFirstChild("Staff"))
      if staff then
        staff.Activated:Connect(function()
          game:GetService("ReplicatedStorage")["Staff Call"].Heal.shoot:FireServer(game.Players.LocalPlayer:GetMouse().Hit.LookVector, game.Players.LocalPlayer:GetMouse().Hit.Position)
        end)
      end
   end    
})

Tab:AddButton({
 Name = "Modify staff Shield",
 Callback = function()
      local staff = (game.Players.LocalPlayer.Backpack:FindFirstChild("Staff") or game.Players.LocalPlayer.Character:FindFirstChild("Staff"))
      if staff then
        staff.Activated:Connect(function()
          game:GetService("ReplicatedStorage")["Staff Call"].Shield.shoot:FireServer(game.Players.LocalPlayer:GetMouse().Hit.LookVector, game.Players.LocalPlayer:GetMouse().Hit.Position)
        end)
      end
   end    
})

Tab:AddButton({
 Name = "Modify staff Time Stop",
 Callback = function()
      local staff = (game.Players.LocalPlayer.Backpack:FindFirstChild("Staff") or game.Players.LocalPlayer.Character:FindFirstChild("Staff"))
      if staff then
        staff.Activated:Connect(function()
          game:GetService("ReplicatedStorage")["Staff Call"]["Time Stop"].shoot:FireServer(game.Players.LocalPlayer:GetMouse().Hit.LookVector, game.Players.LocalPlayer:GetMouse().Hit.Position)
        end)
      end
   end    
})

Tab:AddButton({
 Name = "Modify staff Big Explosion",
 Callback = function()
      local staff = (game.Players.LocalPlayer.Backpack:FindFirstChild("Staff") or game.Players.LocalPlayer.Character:FindFirstChild("Staff"))
      if staff then
        staff.Activated:Connect(function()
          game:GetService("ReplicatedStorage")["Staff Call"]["Big Explosion"].shoot:FireServer(game.Players.LocalPlayer:GetMouse().Hit.LookVector, game.Players.LocalPlayer:GetMouse().Hit.Position)
        end)
      end
   end    
})

Tab:AddButton({
 Name = "Super modify staff Big Explosion",
 Callback = function()
      local staff = (game.Players.LocalPlayer.Backpack:FindFirstChild("Staff") or game.Players.LocalPlayer.Character:FindFirstChild("Staff"))
      if staff then
        staff.Activated:Connect(function()
          for _ = 1, 5 do
            game:GetService("ReplicatedStorage")["Staff Call"]["Big Explosion"].shoot:FireServer(game.Players.LocalPlayer:GetMouse().Hit.LookVector, game.Players.LocalPlayer:GetMouse().Hit.Position)
          end
        end)
      end
   end    
})

local Section = Tab:AddSection({
  Name = "Teleports"
})

Tab:AddDropdown({
	Name = "To locality",
	Default = "",
	Options = {"Beach", "Winter", "Swamp", "Volcano", "Desert", "Coliseum", "Bamboo"},
	Callback = function(Value)
		if Value == "Beach" then
		  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1488, 46, -4050)
		elseif Value == "Winter" then
		  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(696, 3, -6993)
		elseif Value == "Swamp" then
		  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-506, 292, -1041)
		elseif Value == "Volcano" then
		  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(3395, 2, 548)
		elseif Value == "Desert" then
		  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(2361, 3, -2144)
		elseif Value == "Coliseum" then
		  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(1053, 3, -4494)
		elseif Value == "Bamboo" then
		  game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(5152, 2, -2649)
		end
	end    
})

local Dropdown = Tab:AddDropdown({
 Name = "To boss",
 Default = "",
 Options = {"The Duck?", "Huge Snail", "Mountain Golem", "Lava Wolf", "Machine Snowman", "Pharaoh", "Huge Goblin", "Sun God", "Ice Witch", "Poseidon", "Siren", "Red Dragon", "Lava General", "Panda Master", "Smurf Cat", "Golden Skeleton", "Shadow Demon", "Santa", "Clock Tower", "Zeus", "Medieval Colonel", "Priest", "Sand Worm", "Technoblade", "Napoleon", "MrBeast", "Red Samurai", "Guan Yu", "Lu Bu"},
 Callback = function(Value)
   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.mobs.BOSS:FindFirstChild(Value).WorldPivot * CFrame.new(0, 0, -50)
 end    
})

local Tab = Window:MakeTab({
 Name = "Other",
 Icon = "rbxassetid://4483345998",
 PremiumOnly = false
})

Tab:AddButton({
 Name = "Display full power",
 Callback = function()
 local a = 0
for _, val in next, game.Players.LocalPlayer.leaderstats:GetDescendants() do
  if val:IsA("IntValue") and val.Name ~= "SP" then
    a += val.Value
  end
end

      OrionLib:MakeNotification({
	Name = "Budgie Hub",
	Content = `Your the sum of all statistics is {a} ({string.format("%.1e", a)})`,
	Image = "rbxassetid://4483345998",
	Time = 5
})
   end    
})

Tab:AddButton({
 Name = "Display skill points",
 Callback = function()
 local as = {}
for _, player in next, game.Players:GetPlayers() do
  table.insert(as, `{player.Name} – {player.leaderstats.SP.Value}`)
end

OrionLib:MakeNotification({
	Name = "Budgie Hub",
	Content = table.concat(as, "\n"),
	Image = "rbxassetid://4483345998",
	Time = 5
})
   end    
})

local Tab = Window:MakeTab({
  Name = "Explanation",
  Icon = "rbxassetid://4483345998",
  PremiumOnly = false
})

Tab:AddParagraph("Explanation of functions", [[
  All sword functions work if you equip a sword
  You cannot deal damage to all entities at once due to Streaming (method of optimization) and it can't be disabled because only a plugin or the same server can do this
  But "Instant sword kill nearest dummies" work otherwise because it uses a method with part simulation and humanoid control
  It is advisable to use "Instant sword kill nearest dummies" and "Hit all dummies by sword or punch" so that after a kill there is a higher probability 
  of skill points being awarded
  Function "Instant sword kill nearest dummies" work on radius <=40 studs
]])

Tab:AddParagraph("What can I do and what can\'t I do", [[
  I'll say right away that I can't make infinite stats or remove the delay for the staff since only the server can do this, and exploits work on the client side
]])
