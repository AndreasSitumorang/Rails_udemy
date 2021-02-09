class News < ApplicationRecord
  belongs_to :user
  validates :headline, presence: true, length: { minimum: 6, maximum: 100 } 
  validates :information, presence: true, length: { minimum: 10, maximum: 300 }
end
