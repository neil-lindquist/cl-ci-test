
(defsystem "foo"
  :description "A dummy system for CI platform tests"
  :version "1.0.0"
  :author "Neil Lindquist <NeilLindquist5@gmail.com>"
  :license "MIT"
  :components ((:file "foo-src"))
  :in-order-to ((test-op (test-op "ci-utils/test"))))


(defsystem "foo/test"
  :description "The test system for foo"
  :author "Neil Lindquist <NeilLindquist5@gmail.com>"
  :license "MIT"
  :depends-on ("foo"
               "fiveam")
  :components ((:file "tests"))
  :perform (test-op (o c) (symbol-call '#:fiveam '#:run! :foo-tests)))

(defsystem "foo/test-parachute"
  :description "The test system for foo using parachute"
  :author "Neil Lindquist <NeilLindquist5@gmail.com>"
  :license "MIT"
  :depends-on ("foo"
               "parachute")
  :components ((:file "tests-parachute"))
  :perform (test-op (o c) (symbol-call '#:parachute '#:test :foo-parachute-tests)))
