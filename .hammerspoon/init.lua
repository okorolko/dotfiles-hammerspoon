require('window')
require('settings')

Fn = hs.fnutils

Config = {}
Config.spaces = {}
local tags = {work = 'work', coding = 'coding', relax = 'relax'}
Config.applications = {
    ['md.obsidian'] = {bundleID = 'md.obsidian', hyper_key = 'o'},
    ['com.microsoft.VSCode'] = {
        bundleID = 'com.microsoft.VSCode',
        hyper_key = 'c',
        tags = {tags['work'], tags['coding']}
    },
    ['ru.keepcoder.Telegram'] = {
        bundleID = 'ru.keepcoder.Telegram',
        hyper_key = 't'
    },
    ['us.zoom.xos'] = {bundleID = 'us.zoom.xos', hyper_key = 'z'},
    ['com.brave.Browser'] = {bundleID = 'com.brave.Browser', hyper_key = 'b'},
    ['org.mozilla.firefox'] = {
        bundleID = 'org.mozilla.firefox',
        hyper_key = 'f'
    },
    ['com.docker.docker'] = {
        bundleID = 'com.docker.docker',
        hyper_key = 'd',
        tags = {tags['work']}
    },
    ['com.tinyspeck.slackmacgap'] = {
        bundleID = 'com.tinyspeck.slackmacgap',
        hyper_key = 's',
        tags = {tags['work']}
    },
    ['com.TickTick.task.mac'] = {
        bundleID = 'com.TickTick.task.mac',
        tags = {tags['work']}
    },
    ['com.googlecode.iterm2'] = {
        bundleID = 'com.googlecode.iterm2',
        hyper_key = 'i'
    },
    ['com.microsoft.Outlook'] = {
        bundleID = 'com.microsoft.Outlook',
        hyper_key = 'e',
        tags = {tags['work']}
    },
    ['com.apple.mail'] = {bundleID = 'com.apple.mail', hyper_key = 'e'},
    ['org.jkiss.dbeaver.core.product'] = {
        bundleID = 'org.jkiss.dbeaver.core.product',
        hyper_key = 'v',
        tags = {tags['coding']}
    }
}

Hyper = require('hyper')
Hyper.start(Config)

local headspace = require('headspace')
Hyper:bind({}, 'l', nil, function() headspace.prompt() end)
