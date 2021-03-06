(ert-deftest elpy-multiedit--overlays-in-p-should-return-nil-if-none ()
  (elpy-testcase ()
    (insert "foo")
    (make-overlay (point-min) (point-max))
    (should-not (elpy-multiedit--overlays-in-p (point-min)
                                               (point-max)))))

(ert-deftest elpy-multiedit--overlays-in-p-should-return-t-if-some ()
  (elpy-testcase ((:teardown (elpy-multiedit-stop)))
    (insert "foo")
    (elpy-multiedit-add-overlay (point-min)
                                (point-max))
    (should (elpy-multiedit--overlays-in-p (point-min)
                                           (point-max)))))
