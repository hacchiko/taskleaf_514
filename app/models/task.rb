class Task < ApplicationRecord
  before_validation :set_nameless_name
  
  validates :name, presence: true
  belongs_to :user

  scope :recent, -> { order(created_at: desc) }

  private

  def set_nameless_name
    self.name = '風吹けばななし' if name.blank?
  end
end
