(ns playground
  (:require
   [goog.dom :as gdom]
   [reagent.dom :as dom]
   [re-frame.core :as rf]))

;; Defaults

(def system-theme
  (if (.. js/window (matchMedia "(prefers-color-scheme: dark)") -matches)
    "dark"
    "light"))


;; Initial state

(rf/reg-event-fx
 ::init
 [(rf/inject-cofx :local-storage/get-items [:metaverse/theme :metaverse/user])]
 (fn [{{:metaverse/keys [theme user]} :local-storage} _]
   (let [theme (or theme system-theme)]
     {:db {:app  {:initialized? false}
           :user user}
      :fx [[:dispatch-later {:ms 1000 :dispatch [:app/initialized]}]
           [:dispatch [:app/set-theme theme]]]})))


;; Initialization

(rf/reg-event-db
 :app/initialized
 (fn [db _]
   (assoc-in db [:app :initialized?] true)))


(rf/reg-sub
 :app/initialized?
 (fn [db]
   (get-in db [:app :initialized?] false)))


;; Readiness

(rf/reg-sub
 :app/readiness
 (fn [db]
   (get-in db [:app :readiness])))


(rf/reg-event-fx
 :set-readiness
 (fn [{db :db} [_ key state]]
   (case state
     :ready {:db             (assoc-in db [:app :readiness key] state)
             :dispatch-later [{:ms 1500, :dispatch [:set-readiness key nil]}]}
     nil {:db (update-in db [:app :readiness] dissoc key)}
     {:db (assoc-in db [:app :readiness key] state)})))


;; Theme

(defn toggle-theme
  [theme]
  (case theme
    "light" "dark"
    "dark" "light"
    system-theme))


(rf/reg-fx
 :app/set-theme
 (fn [next-theme]
   (let [previous-theme (toggle-theme next-theme)]
     (when previous-theme
       (.remove (.. js/document -documentElement -classList) (name previous-theme)))
     (when next-theme
       (.add (.. js/document -documentElement -classList) (name next-theme))))))


(rf/reg-event-fx
 :app/set-theme
 (fn [{db :db} [_ theme]]
   {:db                     (assoc-in db [:app :theme] theme)
    :app/set-theme          theme
    :local-storage/set-item [:metaverse/theme theme]}))


(rf/reg-event-fx
 :app/toggle-theme
 (fn [{db :db} _]
   (let [current-theme (get-in db [:app :theme])
         next-theme    (toggle-theme current-theme)]
     {:dispatch [:app/set-theme next-theme]})))


(rf/reg-sub
 :app/theme
 (fn [db]
   (get-in db [:app :theme] system-theme)))


;; Components

(defn page
  "Root page."
  []
  (if-not @(rf/subscribe [:app/initialized?])
    [:div.w-screen.h-screen.flex.justify-center.justify-items-center.content-center.items-center.gap-2
     [:span "Loading..."]]
    [:div.relative.h-screen
     [:h1 "Home page"]]))


(defn mount-root
  "Mount root component."
  {:dev/after-load true}
  []
  (when-some [root-elem (gdom/getElement "root")]
    (rf/clear-subscription-cache!)
    (dom/render [page] root-elem)))


(defn -main
  "Renderer entry point."
  {:export true}
  [& _args]
  (rf/dispatch-sync [::init])
  (mount-root))
