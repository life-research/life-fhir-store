(ns blaze.interaction.search.util
  (:require
    [blaze.fhir.spec.type :as type]
    [blaze.handler.fhir.util :as fhir-util]))


(def ^:const match
  #fhir/BundleEntrySearch{:mode #fhir/code"match"})


(def ^:const include
  #fhir/BundleEntrySearch{:mode #fhir/code"include"})


(defn entry
  ([router resource]
   (entry router resource match))
  ([router {:fhir/keys [type] :keys [id] :as resource} mode]
   {:fhir/type :fhir.Bundle/entry
    :fullUrl (type/->Uri (fhir-util/instance-url router (name type) id))
    :resource resource
    :search mode}))
