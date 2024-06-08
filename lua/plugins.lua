-- splitting up our plugins 
-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-structuring-your-plugins
-- Lazy allows us to create the lua/plugins.lua and plugins/ directory to split plugins
-- Any lua files in /plugins will get concatenated when loading
-- Also, in the table that sppecifies the plugin, we can add the config function
-- which allows us to specify commands that will run as if we placed them
-- in the init.lua; lazy will execute these after loading the plugin
return {}
