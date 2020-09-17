require 'rails_helper'

RSpec.describe "Admin User Index Page", type: :feature do
  describe "As a logged-in admin user" do
    before :each do
      @admin_user = User.create!(name:"Luke Hunter James-Erickson", address:"123 Lane", city:"Denver", state:"CO", zip:"88888", email: "chadrick@gmail.com", password:"Iamapassword", password_confirmation:"Iamapassword", role: 2)
      @bike_shop = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @merchant_employee = @bike_shop.users.create(name: "Grant", address: "121 Grantville St.", city: "Granville", state: "CO", zip: "34565", email: "grant@gmail.com", password: "password", password_confirmation: "password", role: 1)
      @reg_user = User.create!(name:"Leah", address:"123 Hello", city:"Austin", state:"TX", zip:"89394", email: "leah@yahoo.com", password:"Iamapassword", password_confirmation:"Iamapassword", role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin_user)
    end

    it "has link to Users in nav only available to Admins" do

      visit '/'

      click_link "Users"

      expect(page).to have_link("Leah")
      expect(page).to have_link("Grant")
      expect(page).to have_link("Luke Hunter James-Erickson")
      expect(current_path).to eq("/admin/users")
      expect(page).to have_content("#{@admin_user.created_at}")
      expect(page).to have_content("#{@reg_user.created_at}")
      expect(page).to have_content("#{@merchant_employee.created_at}")
      expect(page).to have_content("User Role: #{@admin_user.role}")

    end
  end
end
