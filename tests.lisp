(uiop:define-package :foo-tests-parachute
  (:use :cl
        :parachute))
(in-package :foo-tests-parachute)

(format t "Loading foo/tests-parachute")

(define-test :foo-parachute-tests
  (format t "Running tests~%")
  (is (= 2 (+ 1 1))))

(define-test :foo-parachute-tests-error
  (format t "Running error tests~%")
  (is (= 1 (+ 1 1))))
