local target = workspace:WaitForChild("BossHunty")

local highlight = Instance.new("Highlight")
highlight.Name = "BossHuntyHighlight"
highlight.Adornee = target
highlight.FillColor = Color3.fromRGB(255, 0, 0)
highlight.OutlineColor = Color3.fromRGB(255, 255, 0)
highlight.FillTransparency = 0.5
highlight.OutlineTransparency = 0
highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
highlight.Parent = target
