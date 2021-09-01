class Haiku < ApplicationRecord
  include Hashid::Rails

  validates :title, presence: true
  validates :body, presence: true

  belongs_to :user
end
