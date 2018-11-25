class Blog < ApplicationRecord
enum status:  {draft: 0, published: 1}

  extend FriendlyId
friendly_id :title, use: :slugged

has_many :comments, dependent: :destroy

validates_presence_of :title, :body, :topic_id

mount_uploader :thumb_image, BlogUploader


end
