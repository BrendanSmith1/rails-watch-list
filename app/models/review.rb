class Review < ApplicationRecord
  belongs_to :list

  validates :content, :rating, presence: true
  validates :content, length: { minimum: 6 }
end
