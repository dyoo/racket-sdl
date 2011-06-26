#lang racket/base

;; Quick and dirty exercise file.

(require "sdl.rkt"
         ffi/unsafe)

(define racketlib (ffi-lib #f))


(define current-cb-box (make-parameter (box #f)))

(define scheme_add_managed (get-ffi-obj "scheme_add_managed"
                                        racketlib
                                        (_fun _racket ; custodian
                                 _racket ; object
                                 (_fun #:atomic? #t #:keep (lambda (v) (set-box! (current-cb-box) v))
                                       _racket _racket -> _void)
                                 _racket ; data
                                 _int ; strong?
                                 -> _gcpointer)))


(define (shutdown-sdl! ignored1 ignored2)
  (printf "Exiting SDL\n")
  (SDL_Quit))



(printf "initializing SDL\n")
(void (SDL_Init (bitwise-ior SDL_INIT_AUDIO
                             SDL_INIT_VIDEO)))

(void (scheme_add_managed (current-custodian)
                    #f
                    shutdown-sdl!
                    current-cb-box
                    0))

(custodian-shutdown-all (current-custodian))