(uiop:define-package :foo-tests
  (:use :cl
        :fiveam))
(in-package :foo-tests)

(test :foo-tests
  (format t "Running tests~%")
  (is (= 2 (+ 1 1))))
