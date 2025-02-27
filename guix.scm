(use-modules (guix git)
             (guix packages)
             (guix licenses)
             (guix build-system gnu)
             (gnu packages)
             (gnu packages fontutils)
             (gnu packages guile)
             (gnu packages pkg-config)
             (gnu packages sdl)
             (gnu packages texinfo)
             (gnu packages xorg))

(package
  (name "simplefuckingtimer")
  (version "0")
  (source
   (git-checkout (url (dirname (current-filename)))))
  (build-system gnu-build-system)
  (arguments
   '(#:phases (modify-phases %standard-phases
                (delete 'configure))))
  (native-inputs (list pkg-config))
  (inputs (list sdl2 sdl2-ttf fontconfig libx11))
  (synopsis
   "Minimal overlay timer for speedrunning with global hotkeys on Linux")
  (description
   "Minimal timer for speedrunning on Linux. Start, Stop, Reset/Revert, Pause/Resume. Always on Top. Global Hotkeys. That's it.")
  (home-page "https://github.com/yetanotherf0rked/simplefuckingtimer")
  (license expat))
