class CustomList < ApplicationRecord
  has_many :list_users
  has_many :users, through: :list_users
end
