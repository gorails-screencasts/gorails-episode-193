class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  has_many :tweets

  def name
    [first_name, last_name].join(" ")
  end
end
