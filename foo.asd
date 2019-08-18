
(defsystem "foo"
  :description "A dummy system for CI platform tests"
  :version "1.0.0"
  :author "Neil Lindquist <NeilLindquist5@gmail.com>"
  :license "MIT"
  :in-order-to ((test-op (test-op "ci-utils/test"))))


(defsystem "foo/test"
  :description "The test system for foo"
  :author "Neil Lindquist <NeilLindquist5@gmail.com>"
  :license "MIT"
  :depends-on ("foo"
               "fiveam")
  :pathname "t"
  :components ((:file "tests"))
  :perform (test-op (o c) (symbol-call '#:fiveam '#:run! :foo-tests)))
