#lang racket/base

(require ffi/unsafe)
         

(define libsdl (ffi-lib "libSDL" #f))


(define SDL_INIT_TIMER          #x00000001)
(define SDL_INIT_AUDIO          #x00000010)
(define SDL_INIT_VIDEO          #x00000020)
(define SDL_INIT_CDROM          #x00000100)
(define SDL_INIT_JOYSTICK       #x00000200)
(define SDL_INIT_NOPARACHUTE    #x00100000)
(define SDL_INIT_EVENTTHREAD    #x01000000)
(define SDL_INIT_EVERYTHING     #x0000FFFF)


(define SDL_Init
  (get-ffi-obj "SDL_Init" libsdl
               (_fun _uint32 -> _int)))

(define SDL_Quit
  (get-ffi-obj "SDL_Init" libsdl
               (_fun -> _void)))





;; We want to expose libsdl for use with Racket programs.



;; SDL_Init

;; SDL_Quit