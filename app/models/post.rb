class Post < ApplicationRecord
  belongs_to :user

  validates :link, :site, presence: true

  def self.search(params)
    posts = Post.includes(user: [:identities])
    
    user_ids = []
    if params['legacy_lists'].present?
      user_ids = user_ids + FederalLegislator.pluck(:user_id) if params['legacy_lists'].include?('federal_legislator')
      user_ids = user_ids + StateGovernor.pluck(:user_id) if params['legacy_lists'].include?('state_governor')
    end
    user_ids = user_ids + CustomList.where(id: params[:custom_list_ids]) if params[:custom_list_ids].present?

    if params[:posted].present?
      posts = posts.where('posting_time >= ?', params[:posted][:after].beginning_of_day) if params[:posted][:after].present?
      posts = posts.where('posting_time <= ?', params[:posted][:before].end_of_day) if params[:posted][:before].present?
    end

    posts = posts.where(user_id: user_ids) unless user_ids.blank?
    posts = posts.where(site: params[:site]) if params[:site].present?
    return posts.order('posting_time DESC')
  end

  # Gives the social name by which post was made
  def username
    user.identities.find_by(social_site: self.site).try(:username)
  end
end
