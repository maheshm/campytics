if Rails.env.development?
  MAIN_DB = CouchRest.database!("campytics_dev")
elsif Rails.env.test?
  MAIN_DB = CouchRest.database!("campytics_test")
else
  MAIN_DB = CouchRest.database!("campytics_prod")
end
