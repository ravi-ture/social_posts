class PostsController < ApplicationController
  before_action :settle_dates

  def index
    @posts = Post.search(search_params)
    @lists = CustomList.all
    respond_to do |wants|
      wants.html
      wants.json {render json: {posts: @posts.collect{ |post| post.as_json(methods: :username, only: [:content, :posting_time, :site, :link] )}}}
    end
  end

  private

  def search_params
    params.permit( 
      site: [],
      legacy_lists: [],
      custom_list_ids: [],
      posted: [:after, :before]
    )
  end

  def settle_dates
    return unless params[:posted].present?
    if params[:posted]['after(1i)'].present?
      params[:posted][:after] = Date.new(params[:posted]['after(1i)'].to_i, params[:posted]['after(2i)'].to_i, params[:posted]['after(3i)'].to_i)
    end
    if params[:posted]['before(1i)'].present?
      params[:posted][:before] = Date.new(params[:posted]['before(1i)'].to_i, params[:posted]['before(2i)'].to_i, params[:posted]['before(3i)'].to_i)
    end
  end
end
