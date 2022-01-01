num_cpus = 0
width = 12
handle_width = 12

function Initialize()
    -- Initialize global variables
    width = SKIN:GetVariable('Width') + SKIN:GetVariable('Padding')
    handle_width = SKIN:GetVariable('HandleWidth') + SKIN:GetVariable('Padding')
end

function Update()
    for i = num_cpus + 1, 32 do
        local measure = SKIN:GetMeasure('DetectCpu' .. i)
        if measure:GetValue() > 0 then
            local meter = SKIN:GetMeter('MeterMask' .. i)
            meter:SetX(num_cpus * width + handle_width)
            meter:Show()

            num_cpus = i
        else
            break
        end
    end
end
