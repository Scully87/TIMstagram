class Post < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "500x500#", :thumb => "250x250#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments, dependent: :destroy
  has_many :likes
end
