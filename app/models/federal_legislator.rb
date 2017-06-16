class FederalLegislator < ApplicationRecord
  belongs_to :user

  delegate :first_name, to: :user
  delegate :last_name, to: :user
end
