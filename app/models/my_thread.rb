class MyThread < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, :presence => true, :allow_blank => false 
  validates :content, :presence => true, :allow_blank => false 
end

