class ListUser < ApplicationRecord
  belongs_to :user
  belongs_to :custom_list
end
