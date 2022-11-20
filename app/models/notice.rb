class Notice < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { maximum: 50 }

  scope :active, -> {
    where(deleted_at: nil)
  }
end
