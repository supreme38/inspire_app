class Post < ActiveRecord::Base
  # require for acts_as_votable gem
  acts_as_votable
  belongs_to :user
  has_many :comments
  # paperclip gem requirement to allow attachment/validation of files
  has_attached_file :image, styles: { medium: "800x600>", small: "500x500>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
