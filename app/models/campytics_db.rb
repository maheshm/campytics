require 'couchrest_model'

class CampyticsDb < CouchRest::Model::Base

  use_database MAIN_DB
  timestamps!

end
