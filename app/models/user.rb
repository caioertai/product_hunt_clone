class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def full_name
    if last_name.nil?
      first_name.capitalize
    else
      "#{first_name.capitalize} #{last_name.capitalize}"
    end
  end
end
