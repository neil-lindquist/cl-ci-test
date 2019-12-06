(uiop:define-package :foo-tests
  (:use :cl
        :iterate
        :fiveam))
(in-package :foo-tests)


(defun sum-linear-expressions (&rest exprs)
  "Takes some number of alists mapping symbols to numbers and combines all duplicated symbols by adding their values."
  (let ((sum nil))
    (iter (for next in (apply #'append exprs))
      (if-let (pair (assoc (car next) sum))
        (incf (cdr pair) (cdr next))
        (push (cons (car next) (cdr next)) sum)))
    sum))

(defun sum-linear-expressions-v2 (&rest exprs)
  "Takes some number of alists mapping symbols to numbers and combines all duplicated symbols by adding their values."
  (reduce #'(lambda (collected next)
              (if-let (pair (assoc (car next) collected))
                (progn
                  (incf (cdr pair) (cdr next))
                  collected)
                (cons (copy-list next) collected)))
          (apply 'append exprs)
          :initial-value nil))


(format t "Loading foo/tests")

(test :foo-tests
  (format t "Running tests~%")
  (is (= 2 (+ 1 1))))

(test :foo-tests-error
  (format t "Running error tests~%")
  (is (= 1 (+ 1 1))))
