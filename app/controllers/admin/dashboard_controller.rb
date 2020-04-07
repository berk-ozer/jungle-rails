class Admin::DashboardController < Admin::BaseController
  def show
    @product_count = Product.count
    @category_count = Category.count
  end
end
