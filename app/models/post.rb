class Post
  include Mongoid::Document
  include Mongoid::Timestamps

  field :headline, type: String
  field :subheadline, type: String
  field :content, type: String
  field :published, type: Boolean
  field :published_at, type: DateTime
  field :tags, type: Array
  
  belongs_to :category
  belongs_to :author
  
  default_scope -> { order('published_at DESC') }
  default_scope -> { where(published: true) }
  
  def self.all_posts
    unscoped().order('published_at DESC')
  end
  
  
  validates_length_of :headline, minimum: 3
  validates_presence_of :category_id
  
  def published_at
    super || Time.now
  end
  
end
