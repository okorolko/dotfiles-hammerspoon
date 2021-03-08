local headspace = {}
headspace.spaces = {}
table.insert(headspace.spaces, require('spaces/work'))
table.insert(headspace.spaces, require('spaces/relax'))
table.insert(headspace.spaces, require('spaces/write'))
table.insert(headspace.spaces, require('spaces/shutdown'))

local openAppsTaggedWith = function(spaceId)
    Fn.each(Config.applications, function(app)
        if app.tags == nil then return end

        local shouldOpen = Fn.some(app.tags, function(tag)
            if tag == spaceId then
                return true
            else
                return false
            end
        end)

        if shouldOpen then
            hs.application.launchOrFocusByBundleID(app.bundleID)
        end
    end)
end

local killApps = function(apps)
    Fn.each(apps, function(bundleID)
        local activeApp = hs.application.get(bundleID)
        if activeApp ~= nil then activeApp:kill() end
    end)
end

local switch = function(space)
    Fn.each(headspace.spaces, function(sp)
        if sp.id == space.id then
            print('starting space', space.id)
            killApps(sp.blacklist)

            openAppsTaggedWith(sp.id)
        end
    end)
end

local chooser = hs.chooser.new(switch)
chooser:placeholderText("Select mode")
chooser:choices(headspace.spaces)

headspace.prompt = function() chooser:show() end

return headspace
