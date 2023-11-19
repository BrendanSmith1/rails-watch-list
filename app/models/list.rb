class List < ApplicationRecord
  has_one_attached :photo

  has_many :bookmarks
  has_many :reviews
  has_many :movies, through: :bookmarks, dependent: :destroy
  # What does dependent destroy actually do here?

  validates :name, presence: true, uniqueness: true

  def capitalize_name
    self.name = self.name.split.collect(&:capitalize).join(' ') if self.name && !self.name.blank?
  end
end
