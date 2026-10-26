local Players = game:GetService("Players")
local PathfindingService = game:GetService("PathfindingService")

local player = Players.LocalPlayer
local maze = workspace:WaitForChild("Maze")
local souls = maze:WaitForChild("Souls")
local hunty = maze:WaitForChild("Hunty")

local UPDATE_INTERVAL = 1
local AVOID_DISTANCE = 15

local folder = Instance.new("Folder")
folder.Name = "SoulPathVisuals"
folder.Parent = workspace

local function getRoot()
    local character = player.Character
    return character and character:FindFirstChild("HumanoidRootPart")
end

local function getClosestTarget(root)
    local closest, shortest = nil, math.huge

    for _, obj in ipairs(souls:GetDescendants()) do
        if obj:IsA("BasePart") then
            local distance = (obj.Position - root.Position).Magnitude

            if distance < shortest then
                closest = obj
                shortest = distance
            end
        end
    end

    return closest
end

local function nearHunty(position)
    local parts = {}

    if hunty:IsA("BasePart") then
        table.insert(parts, hunty)
    end

    for _, obj in ipairs(hunty:GetDescendants()) do
        if obj:IsA("BasePart") then
            table.insert(parts, obj)
        end
    end

    for _, part in ipairs(parts) do
        if (part.Position - position).Magnitude < AVOID_DISTANCE then
            return true
        end
    end

    return false
end

local function drawSegment(startPos, endPos)
    local distance = (endPos - startPos).Magnitude
    if distance < 0.1 then
        return
    end

    local line = Instance.new("Part")
    line.Name = "PathLine"
    line.Anchored = true
    line.CanCollide = false
    line.CanTouch = false
    line.CanQuery = false
    line.Material = Enum.Material.Neon
    line.Color = Color3.fromRGB(0, 255, 0)
    line.Size = Vector3.new(0.18, 0.18, distance)
    line.CFrame = CFrame.lookAt((startPos + endPos) / 2, endPos)
    line.Parent = folder
end

local function updatePath()
    folder:ClearAllChildren()

    local root = getRoot()
    if not root then
        return
    end

    local target = getClosestTarget(root)
    if not target then
        return
    end

    local path = PathfindingService:CreatePath({
        AgentRadius = 2,
        AgentHeight = 5,
        AgentCanJump = true,
        AgentCanClimb = true
    })

    local success = pcall(function()
        path:ComputeAsync(root.Position, target.Position)
    end)

    if not success or path.Status ~= Enum.PathStatus.Success then
        return
    end

    local waypoints = path:GetWaypoints()

    for _, waypoint in ipairs(waypoints) do
        if nearHunty(waypoint.Position) then
            return
        end
    end

    local previous = root.Position

    for _, waypoint in ipairs(waypoints) do
        drawSegment(previous, waypoint.Position)
        previous = waypoint.Position
    end
end

while true do
    updatePath()
    task.wait(UPDATE_INTERVAL)
end
