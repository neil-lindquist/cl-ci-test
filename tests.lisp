(uiop:define-package :foo-tests
  (:use :cl
        :fiveam))
(in-package :foo-tests)

(format t "Loading foo/tests")

(test :foo-tests
  (format t "Running tests~%")
  (is (= 2 (+ 1 1))))

(test :foo-tests-error
  (format t "Running error tests~%")
  (is (= 1 (+ 1 1))))
