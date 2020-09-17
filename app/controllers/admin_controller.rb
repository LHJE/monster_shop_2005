class AdminController < Admin::BaseController
  def index
    @users = User.all
  end
end
