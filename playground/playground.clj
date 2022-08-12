(ns playground
  (:refer-clojure :exclude [rand rand-int rand-nth bytes])
  (:require
   [clojure.string :as str])
  (:import
   (java.util UUID)))

;; TODO: [2022-08-12, ilshat@sultanov.team] todo

(set! *warn-on-reflection* true)

(defmacro safe
  [& body]
  `(try
     ~@body
     (catch Exception _)))

(def ^:const ^UUID some-id
  (UUID/randomUUID))

(comment
  (+ 1 2 1.2 1/2) ; comment
  #_(+ 1 2)
  nil
  "foo\nbar"
  #"foo"
  #'var
  \newline
  'symbol
  :keyword
  :qualified/keyword
  {:type :map}
  [:type :vector]
  #{:type :set}
  true, false
  (System/currentTimeMillis)
  (str "foo" "bar")
  (str/lower-case "FOO")
  (clojure.string/upper-case "bar"))
