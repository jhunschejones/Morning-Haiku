class User < ApplicationRecord
  include Hashid::Rails

  has_secure_password

  encrypts :email, :name
  blind_index :email, :name

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :password, presence: true

  has_many :haikus
end
