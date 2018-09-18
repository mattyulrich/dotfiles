import XMonad
import XMonad.Config.Desktop
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Config.Kde
import XMonad.Layout
import XMonad.Util.Run -- for spawnPipe
import qualified XMonad.StackSet as W -- to shift and float windows

myManageHook = composeAll
	[ className =? "plasma" --> doFloat
	, className =? "Plasma" --> doFloat
	, className =? "plasma-desktop" --> doFloat
	, className =? "Plasma-desktop" --> doFloat
	, className =? "krunner" --> doFloat
	, className =? "ksplashsimple" --> doFloat
	, className =? "ksplashqml" --> doFloat
	, className =? "ksplashx" --> doFloat
	]

{-
statusBarCmd ="dzen2" ++
	" -bg '#3f3c6d'" ++
	" -fg '#a8a3f7'" ++
	" -sa c" ++
	" -fn '-misc-fixed-medium-r-semicondensed-12-110-75-75-c-60-iso8859-1'" ++
	" -w 808 -x 114 -y 0 -ta 1 -e '"

dzen ::
	(XConfig
		(ModifiedLayout AvoidStruts
			(Choose Tall (Choose (Mirror Tall) Full))) -> IO t) -> IO t

dzen f = do
	h <- spawnPipe ("dzen2" ++ " " ++ flags)
	f $ defaultConfig
		{ logHook = dynamicLogWithPP dzenPP
				{ ppOutput = hPutStrLn h }
		, layoutHook = avoidStrutsOn [U] (layoutHook defaultConfig)
		, keys = \c -> toggleStrutsKey c `M.union` keys defaultConfig c
		, manageHook = manageDocks <+> myManageHook <+> manageHook desktopConfig
		}
	where
		fg = "'#a8a3f7'" -- n.b. quoting
		bg = "'#3f3c6d'"
		flags = "-e 'onstart=lower' -w 400 -ta l -fg " ++ fg ++ " -bg " ++ bg

main = dzen monad kde4Config
 
main = do
	dzenpipe <- spawnPipe statusBarCmd
	xmonad $ kde4Config
	{ modMask = mod4Mask -- use the Windows button as mod 
	, manageHook = manageDocks <+> myManageHook <+> manageHook desktopConfig
	, logHook = dynamicLogWithPP $ mPP dzenpipe
	}
-}

main = xmonad kde4Config
	{ modMask = mod4Mask -- use the Windows button as mod 
	, startupHook = setWMName "LG3D"
	, manageHook = manageDocks <+> myManageHook <+> manageHook desktopConfig
	}
