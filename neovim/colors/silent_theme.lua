--       _ _            _     _   _                         
--   ___(_) | ___ _ __ | |_  | |_| |__   ___ _ __ ___   ___ 
--  / __| | |/ _ \ '_ \| __| | __| '_ \ / _ \ '_ ` _ \ / _ \
--  \__ \ | |  __/ | | | |_  | |_| | | |  __/ | | | | |  __/
--  |___/_|_|\___|_| |_|\__|  \__|_| |_|\___|_| |_| |_|\___|
--                                                         
-- Maintainer: Ilshat Sultanov <ilshat@sultanov.team> 
-- Modified:   2022-10-22 23:06+0500
-- License:    MIT


vim.opt.background = 'light'
vim.g.colors_name = 'silent_theme'

package.loaded['silent_theme'] = nil

require('lush')(require('silent_theme'))
