#lang racket/base

(require ffi/unsafe)
         

(provide (all-defined-out))


(define libsdl (ffi-lib "libSDL" #f))

(define SDL_INIT_TIMER          #x00000001)
(define SDL_INIT_AUDIO          #x00000010)
(define SDL_INIT_VIDEO          #x00000020)
(define SDL_INIT_CDROM          #x00000100)
(define SDL_INIT_JOYSTICK       #x00000200)
(define SDL_INIT_NOPARACHUTE    #x00100000)
(define SDL_INIT_EVENTTHREAD    #x01000000)
(define SDL_INIT_EVERYTHING     #x0000FFFF)


(define SDL_SWSURFACE   #x00000000)
(define SDL_HWSURFACE   #x00000001)
(define SDL_ASYNCBLIT   #x00000004)
(define SDL_ANYFORMAT   #x10000000)
(define SDL_HWPALETTE   #x20000000)
(define SDL_DOUBLEBUF   #x40000000)
(define SDL_FULLSCREEN  #x80000000)
(define SDL_OPENGL      #x00000002)
(define SDL_OPENGLBLIT  #x0000000A)
(define SDL_RESIZABLE   #x00000010)
(define SDL_NOFRAME     #x00000020)




(define SDL_Init
  (get-ffi-obj "SDL_Init" libsdl
               (_fun _uint32 -> _int)))

(define SDL_Quit
  (get-ffi-obj "SDL_Init" libsdl
               (_fun -> _void)))


;; Not quite right...
(define SDL_Surface _pointer)


(define SDL_SetVideoMode
  (get-ffi-obj "SDL_SetVideoMode" libsdl
               (_fun _int _int _int _uint32 -> SDL_Surface)))



;; We want to expose libsdl for use with Racket programs.



;; SDL_Init

;; SDL_Quit