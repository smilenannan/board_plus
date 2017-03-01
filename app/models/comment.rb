class Comment < ApplicationRecord
  belongs_to :my_thread

  validates :content, :presence => true, :allow_blank => false
end
