class Campaign < CampyticsDb

  property :campaign_name
  property :scheduled_date, Date
  property :rules
  collection_of :offers, :class_name => "Offer"
  belongs_to :user


  design do
    view :by_user_id
  end
  
end
