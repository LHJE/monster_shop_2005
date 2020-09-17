class CartController < Cart::BaseController


  def add_item
    item = Item.find(params[:item_id])
    cart.add_item(item.id.to_s)
    if cart.contents[item.id] == 0
      cart.empty_cart
      flash[:failure] = "There are limited supplies in inventory - this item has reached it's max! Please try again later."
    else
      flash[:success] = "#{item.name} was successfully added to your cart"
      redirect_to "/items"
    end
  end

  def increase_quantity
    item = Item.find(params[:item_id])
    temp_inventory = cart.contents[item.id.to_s]
    cart.update_item(item.id.to_s)
    if cart.contents[item.id.to_s] > temp_inventory
      flash[:success] = "You have updated a quantity in your cart"
      redirect_to request.referrer
    else
      flash[:failure] = "There are limited supplies in inventory - this item has reached it's max! Please try again later."
      redirect_to request.referrer
    end
  end

  def show
    @items = cart.items
  end

  def empty
    session.delete(:cart)
    redirect_to '/cart'
  end

  def remove_item
    session[:cart].delete(params[:item_id])
    item = Item.find(params[:item_id])
    flash[:success] = "You have removed this item from your cart: #{item.name}"
    redirect_to '/cart'
  end

  def decrease_quantity
    decrease_item_id = (params[:item_id])
    if session[:cart][decrease_item_id] == 1
      remove_item
    else
      session[:cart][decrease_item_id] -= 1
      flash[:success] = "You have updated a quantity in your cart"
      redirect_to request.referrer
    end
  end


end
