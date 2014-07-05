class Static
  include Mongoid::Document
  include Mongoid::Timestamps

  field :title, type: String
  field :subheadline, type: String
  field :content, type: String
  field :hidden, type: Boolean, default: false
  
  
end
