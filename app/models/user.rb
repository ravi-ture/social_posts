class User < ApplicationRecord
  has_many :identities
  has_many :posts
  has_many :list_users
  has_many :custom_list, through: :list_users
end