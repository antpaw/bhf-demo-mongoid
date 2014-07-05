class Author
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :name, type: String
  field :job_title, type: String
  field :email, type: String
  field :position, type: Integer, default: 0
  
  # option class_name is needed to make sure bhf finds the right class, otherwise it looks for class "Address"
  embeds_many :addresses, class_name: 'Author::Address', store_as: 'author_address'
  
  default_scope -> {order('position ASC')}
  
  class Address
    include Mongoid::Document
    include Mongoid::Timestamps
    
    field :city, type: String
    field :country, type: String
    embedded_in :author
    
    # this will display better looking name in bhf's forms
    def to_bhf_s
      "#{city} #{country}"
    end
  end
  
end