class ChargesController < ApplicationController
  def create
    # Creates a Stripe Customer object, for associating
    # with the c[harge
    customer = Stripe::Customer.create(
    email: current_user.email,
    card: params[:stripeToken]
    )

    @amount = 1500

    # Where the real magic happens
    charge = Stripe::Charge.create(
    customer: customer.id, # Note -- this is NOT the user_id in your app
    amount: @amount,
    description: "Premium Membership - #{current_user.email}",
    currency: 'usd'
    )

    if charge["paid"] == true
      current_user.role == 1
    end

    flash[:notice] = "Thank you for joining and supporting Blocipedia, #{current_user.email}!"
    redirect_to edit_user_registration_path(current_user) # or wherever

    # Stripe will send back CardErrors, with friendly messages
    # when something goes wrong.
    # This `rescue block` catches and displays those errors.
  rescue Stripe::CardError => e
    flash[:alert] = e.message
    redirect_to new_charge_path
  end

  def new
    @stripe_btn_data = {
      key: ENV['STRIPE_PUBLISHABLE_KEY'],
      description: "Premium Membership - #{current_user.email}",
      amount: @amount
    }
  end

end
