local a=game:GetService("Players").LocalPlayer.PlayerGui.InteractionGUI.ObectInteractionClient;a.Disabled=true;local b=game.Players.LocalPlayer;local c=b.Character or b.CharacterAdded:wait()local d=c:WaitForChild("Humanoid")c:WaitForChild("Head")local e=require(a.Parent.Parent:WaitForChild("BumpButton"))local f=require(game.ReplicatedStorage:WaitForChild("LocalizationUtil"))local g=game:GetService("HttpService")local h=game:GetService("StarterGui")local i=b:WaitForChild("CurrentlySavingOrLoading")local j=a.Parent:WaitForChild("Prompt")local k=a.Parent:WaitForChild("TouchDropTool")local l=a.Parent:WaitForChild("OwnerShow")local m=game.Players.LocalPlayer.PlayerGui:WaitForChild("TargetGui")local n=c;local o=d;b.CharacterAdded:connect(function()n=b.Character;o=n:WaitForChild("Humanoid")n:WaitForChild("Head")interactLoop()end)local p=b:GetMouse()local q=nil;local r=false;local s=nil;local t=nil;function interactLoop()n.ChildAdded:connect(function(u)if u:IsA("Tool")then q=u;setDropToolVisible(u.Name~="BlueprintTool")end end)n.ChildRemoved:connect(function(v)if v:IsA("Tool")then wait()if v==q then q=nil;setDropToolVisible(false)end end end)while true do wait()if not n:FindFirstChild("Head")then break end;r=false;local w=_G.CurrentRangeMyAss;if q then if q:FindFirstChild("Range")then w=q.Range.Value end end;if(n.Head.Position-input.GetMouseHit().p).magnitude<w then if b.IsChatting.Value<=1 then if not b.PlayerGui.IsPlacingStructure.Value then if not b.PlayerGui.ClientInfoIsOpen.Value then s=getInteractObject(input.GetMouseTarget())if s then b.PlayerGui.MouseoverInteractionEngaged.Value=true;showPrompt()else setPromptVisibility(false)if b.PlayerGui.MouseoverInteractionEngaged.Value then wait(0.5)b.PlayerGui.MouseoverInteractionEngaged.Value=false end end else s=nil;setPromptVisibility(false)if b.PlayerGui.MouseoverInteractionEngaged.Value then wait(0.5)b.PlayerGui.MouseoverInteractionEngaged.Value=false end end else s=nil;setPromptVisibility(false)if b.PlayerGui.MouseoverInteractionEngaged.Value then wait(0.5)b.PlayerGui.MouseoverInteractionEngaged.Value=false end end else s=nil;setPromptVisibility(false)if b.PlayerGui.MouseoverInteractionEngaged.Value then wait(0.5)b.PlayerGui.MouseoverInteractionEngaged.Value=false end end else s=nil;setPromptVisibility(false)if b.PlayerGui.MouseoverInteractionEngaged.Value then wait(0.5)b.PlayerGui.MouseoverInteractionEngaged.Value=false end end;l.Visible=r and t;if t then l.Text.Text=t.Name end;setReticleActive(not not s)end end;local x=require(game.ReplicatedStorage.Interaction.InteractionPermission)local y=""function getInteractObject(z)z=findHighestParent(z)if z then if 0<o.Health then if b.PlayerGui.IsPlacingStructure.Value then return nil end else return nil end else return nil end;if input.Device=="Touch"then if input.LastInputSoaked then if not input.HoveredButton then return nil end end end;if z.Parent then if not z.Parent then return end else return end;local A,B=x:UserCanInteract(b,z.Parent)t=B;if z then if not A then r=true;return nil end end;local C,D,E=pairs(n:GetChildren())while true do local F,G=C(D,E)if F then else break end;E=F;if G:IsA("Tool")then if G:FindFirstChild("CuttingTool")then if z.Parent:IsA("Model")then if z.Parent:FindFirstChild("TreeClass")then y=""return z.Parent else return nil end else return nil end else return nil end end end;if z.Parent then if z.Parent then if z.Parent:IsA("Model")then if z.Parent:FindFirstChild("PurchasedBoxItemName")then y="Open box"return z.Parent end end;if z.Parent:IsA("Model")then if not z.Parent:FindFirstChild("ButtonRemote_"..z.Name)then if z.Parent:FindFirstChild("ButtonRemote_"..z.Name)then y="Button interaction"return z.Parent:FindFirstChild("ButtonRemote_"..z.Name)or z.Parent:FindFirstChild("ButtonRemote_"..z.Name)end else y="Button interaction"return z.Parent:FindFirstChild("ButtonRemote_"..z.Name)or z.Parent:FindFirstChild("ButtonRemote_"..z.Name)end elseif z.Parent:FindFirstChild("ButtonRemote_"..z.Name)then y="Button interaction"return z.Parent:FindFirstChild("ButtonRemote_"..z.Name)or z.Parent:FindFirstChild("ButtonRemote_"..z.Name)end;if z.Parent:IsA("Model")then if z.Parent:FindFirstChild("ToolName")then y="Pick up tool"return z.Parent end end;if z.Parent:IsA("Model")then if z.Parent:FindFirstChild("BoxItemName")then if game.ReplicatedStorage.Purchasables:FindFirstChild(z.Parent.BoxItemName.Value,true):FindFirstChild("ItemName")then y="Shop get info"return z.Parent end end end;if z.Parent:IsA("Model")then if z.Parent:FindFirstChild("Settings")then if z.Parent.Settings:FindFirstChild("PropertySoldSign")then y="Take down sold sign"return z.Parent end end end;if z.Parent:IsA("Model")then if z.Parent:FindFirstChild("Type")then if z.Parent:FindFirstChild("ItemName")then if game.ReplicatedStorage.Purchasables:FindFirstChild(z.Parent.ItemName.Value,true):FindFirstChild("ItemName")then y="Structure get info"return z.Parent end end end end;if z.Parent:IsA("Model")then if z.Parent:FindFirstChild("TreeClass")then if z.Anchored then if not z.Parent:FindFirstChild("Handle")then if z.Parent:FindFirstChild("DraggableItem")then y=""return z.Parent end else y=""return z.Parent end else y=""return z.Parent end elseif not z.Parent:FindFirstChild("Handle")then if z.Parent:FindFirstChild("DraggableItem")then y=""return z.Parent end else y=""return z.Parent end end end end end;function findHighestParent(H)if not H then return nil end;if H.Parent:FindFirstChild("Owner")then return H end;if H.Parent~=workspace then if not H.Parent then return nil end else return nil end;return findHighestParent(H.Parent)end;function setReticleActive(I)m.Active.Value=I end;local J=b.PlayerGui.StructureDraggingGUI.DragItem;local K=game.ReplicatedStorage.PlaceStructure.ClientPlacedStructure;local L=false;local M=game.ReplicatedStorage.PlaceStructure.BoxIsParented;local N=b.PlayerGui.WireDraggingGUI.DragWire;local O=game.ReplicatedStorage.PlaceStructure.ClientPlacedWire;local P=a.Parent.Parent.ItemInfoGUI.ShowItemInfo;local Q=game.ReplicatedStorage.Interaction.ClientInteracted;function interactWithObject()if r then return end;if s then if not e.Bump(j)then return end;if s then if y=="Open box"then if s:FindFirstChild("Type")then if s.Type.Value~="Structure"then if s.Type.Value~="Furniture"then if s.Type.Value~="Vehicle"then if s.Type.Value~="Vehicle Spot"then if s.Type.Value~="Vehicle Spot"then if s.Type.Value=="Wire"then local v22=game.ReplicatedStorage.Purchasables:FindFirstChild(s.PurchasedBoxItemName.Value,true)if s.Type.Value~="Structure"then if s.Type.Value~="Furniture"then if s.Type.Value~="Vehicle"then if s.Type.Value~="Vehicle Spot"then if s.Type.Value=="Vehicle Spot"then if v22 then local v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then local l__Parent__24=s.Parent;s.Parent=nil;local l__Value__25=s.PurchasedBoxItemName.Value;local v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end elseif s.Type.Value=="Wire"then local l__Parent__28=s.Parent;s.Parent=nil;local v29,v30=N:Invoke(v22)if v29 then O:FireServer(v22,v29,v30,s,true)return else s.Parent=l__Parent__28;if M:InvokeServer(s,l__Parent__28)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Wire packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if s then if y=="Button interaction"then game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(s)return end end;if s then if y~="Shop get info"then if y=="Structure get info"then P:Fire(s,y)return end else P:Fire(s,y)return end end;Q:FireServer(s,y)end else v22=game.ReplicatedStorage.Purchasables:FindFirstChild(s.PurchasedBoxItemName.Value,true)if s.Type.Value~="Structure"then if s.Type.Value~="Furniture"then if s.Type.Value~="Vehicle"then if s.Type.Value~="Vehicle Spot"then if s.Type.Value=="Vehicle Spot"then if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end elseif s.Type.Value=="Wire"then l__Parent__28=s.Parent;s.Parent=nil;v29,v30=N:Invoke(v22)if v29 then O:FireServer(v22,v29,v30,s,true)return else s.Parent=l__Parent__28;if M:InvokeServer(s,l__Parent__28)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Wire packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end end else v22=game.ReplicatedStorage.Purchasables:FindFirstChild(s.PurchasedBoxItemName.Value,true)if s.Type.Value~="Structure"then if s.Type.Value~="Furniture"then if s.Type.Value~="Vehicle"then if s.Type.Value~="Vehicle Spot"then if s.Type.Value=="Vehicle Spot"then if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end elseif s.Type.Value=="Wire"then l__Parent__28=s.Parent;s.Parent=nil;v29,v30=N:Invoke(v22)if v29 then O:FireServer(v22,v29,v30,s,true)return else s.Parent=l__Parent__28;if M:InvokeServer(s,l__Parent__28)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Wire packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end end else v22=game.ReplicatedStorage.Purchasables:FindFirstChild(s.PurchasedBoxItemName.Value,true)if s.Type.Value~="Structure"then if s.Type.Value~="Furniture"then if s.Type.Value~="Vehicle"then if s.Type.Value~="Vehicle Spot"then if s.Type.Value=="Vehicle Spot"then if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end elseif s.Type.Value=="Wire"then l__Parent__28=s.Parent;s.Parent=nil;v29,v30=N:Invoke(v22)if v29 then O:FireServer(v22,v29,v30,s,true)return else s.Parent=l__Parent__28;if M:InvokeServer(s,l__Parent__28)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Wire packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end end else v22=game.ReplicatedStorage.Purchasables:FindFirstChild(s.PurchasedBoxItemName.Value,true)if s.Type.Value~="Structure"then if s.Type.Value~="Furniture"then if s.Type.Value~="Vehicle"then if s.Type.Value~="Vehicle Spot"then if s.Type.Value=="Vehicle Spot"then if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end elseif s.Type.Value=="Wire"then l__Parent__28=s.Parent;s.Parent=nil;v29,v30=N:Invoke(v22)if v29 then O:FireServer(v22,v29,v30,s,true)return else s.Parent=l__Parent__28;if M:InvokeServer(s,l__Parent__28)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Wire packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end end else v22=game.ReplicatedStorage.Purchasables:FindFirstChild(s.PurchasedBoxItemName.Value,true)if s.Type.Value~="Structure"then if s.Type.Value~="Furniture"then if s.Type.Value~="Vehicle"then if s.Type.Value~="Vehicle Spot"then if s.Type.Value=="Vehicle Spot"then if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end elseif s.Type.Value=="Wire"then l__Parent__28=s.Parent;s.Parent=nil;v29,v30=N:Invoke(v22)if v29 then O:FireServer(v22,v29,v30,s,true)return else s.Parent=l__Parent__28;if M:InvokeServer(s,l__Parent__28)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Wire packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end else if v22 then v23=v22:FindFirstChild("PlacingModel")and v22.PlacingModel:clone()or v22.Model:clone()else v23=v22.Model:clone()end;if v23 then l__Parent__24=s.Parent;s.Parent=nil;l__Value__25=s.PurchasedBoxItemName.Value;v26,v27=J:Invoke(v23)if v26 then K:FireServer(l__Value__25,v26,v27,nil,s,false,true)if l__Value__25=="Sawmill"then if not L then L=true;wait(1)game.ReplicatedStorage.Notices.ShowUserInstruction:Fire("BoughtSawmill")return end end else s.Parent=l__Parent__24;if M:InvokeServer(s,l__Parent__24)then game.ReplicatedStorage.Notices.SendUserNotice:Fire("Structure packed back into box.")return else game.ReplicatedStorage.Notices.SendUserNotice:Fire("Someone else already opened this box.")s:Destroy()return end end end end end else if s then if y=="Button interaction"then game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(s)return end end;if s then if y~="Shop get info"then if y=="Structure get info"then P:Fire(s,y)return end else P:Fire(s,y)return end end;Q:FireServer(s,y)end else if s then if y=="Button interaction"then game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(s)return end end;if s then if y~="Shop get info"then if y=="Structure get info"then P:Fire(s,y)return end else P:Fire(s,y)return end end;Q:FireServer(s,y)end else if s then if y=="Button interaction"then game.ReplicatedStorage.Interaction.RemoteProxy:FireServer(s)return end end;if s then if y~="Shop get info"then if y=="Structure get info"then P:Fire(s,y)return end else P:Fire(s,y)return end end;Q:FireServer(s,y)end end end;local R=game.ReplicatedStorage.Notices.ClientNoticeIsOpen;function dropTool()if R.Value then return end;if n.Parent then if not n:FindFirstChild("Head")then return end else return end;if b:FindFirstChild("CurrentlySavingOrLoading")then if b.CurrentlySavingOrLoading.HardReload.Value then return end else return end;if q then if q then if q:FindFirstChild("Handle")then if(q.Handle.CFrame.p-n.Head.CFrame.p).magnitude<20 then q=nil;local S=n:FindFirstChild("RightGrip",true)if S then S:Destroy()end;n.Humanoid:EquipTool(q)Q:FireServer(q,"Drop tool",q and q.Handle.CFrame or game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame)end end end end end;local T=""function showPrompt()if j.Visible then if T==y then if y~="Button interaction"then return end end end;T=y;if y=="Open box"then j.PromptText.Text="Open box"elseif y=="Pick up tool"then j.PromptText.Text=f:TranslateByKey("PickUpObject",{game.ReplicatedStorage.Purchasables.Tools.AllTools:FindFirstChild(s.ToolName.Value).ItemName.Value})elseif y=="Shop get info"then j.PromptText.Text="Check"elseif y=="Structure get info"then j.PromptText.Text="Check"elseif y=="Take down sold sign"then j.PromptText.Text="Remove sign"else if y=="Button interaction"then else setPromptVisibility(false)return end;if s:FindFirstChild("ButtonPrompt")then if s.ButtonPrompt:FindFirstChild("TranslateFormat")then local U=g:JSONDecode(s.ButtonPrompt.TranslateFormat.Value)if typeof(U.Key)=="string"then if typeof(U.Format)~="string"then if typeof(U.Format)~="table"then warn("Bad format type: ",interactWithObject,U.Key,U.Format)j.PromptText.Text="Interact"else j.PromptText.Text=f:TranslateByKey(U.Key,U.Format)end else j.PromptText.Text=f:TranslateByKey(U.Key,U.Format)end elseif typeof(U.Format)~="table"then warn("Bad format type: ",interactWithObject,U.Key,U.Format)j.PromptText.Text="Interact"else j.PromptText.Text=f:TranslateByKey(U.Key,U.Format)end else j.PromptText.Text=s.ButtonPrompt.Value end else j.PromptText.Text="Interact"end end;local V=50-1;while true do j.Size=UDim2.new(0,V,0,j.Size.Y.Offset)if j.PromptText.TextFits then j.Size=UDim2.new(0,V+j.PromptText.TextSize*0.5,0,j.Size.Y.Offset)break end;if 0<=1 then if V<350 then else break end elseif 350<V then else break end;V=V+1 end;setPlatformControls()setPromptVisibility(true)end;function setPlatformControls()if input.Device=="Touch"then j.PlatformButton.Visible=false;return end;j.PlatformButton.Visible=true;if input.Device=="Gamepad"then j.PlatformButton.Image=j.PlatformButton.Gamepad.Value;j.PlatformButton.KeyLabel.Text=""return end;if input.Device=="PC"then j.PlatformButton.Image=j.PlatformButton.PC.Value;j.PlatformButton.KeyLabel.Text="E"end end;function setPromptVisibility(W)if not W then if not s then setReticleActive(W)end end;j.Visible=W end;function setDropToolVisible(X)if input.Device=="Touch"then if X then if h:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack)then else k.Visible=false;return end else k.Visible=false;return end else k.Visible=false;return end;k.Visible=true;k.Position=UDim2.new(0.5,0,1,-72)end;function touchDropToolClicked()if not e.Bump(k)then return end;dropTool()end;wait(1)input=require(a.Parent.Parent:WaitForChild("Scripts"):WaitForChild("UserInput"))input.InteractSelectionMade(interactWithObject)j.MouseButton1Click:connect(interactWithObject)input.DropTool(dropTool)k.MouseButton1Click:Connect(touchDropToolClicked)interactLoop()