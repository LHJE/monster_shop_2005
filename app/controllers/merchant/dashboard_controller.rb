class Merchant::DashboardController < Merchant::BaseController
  before_action :require_merchant

  def index
    @merchant = Merchant.find(current_user.merchant_id)
  end

end
