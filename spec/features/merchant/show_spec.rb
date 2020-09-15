require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As a Merchant' do
    before :each do
      @mike = Merchant.create!(name: "Mike's Print Shop", address: '123 Paper Rd.', city: 'Denver', state: 'CO', zip: 80203)
      @mikes_employee = User.create!(name:"Leah", address:"123 Sesame Street", city:"New York", state:"NY", zip:"90210", email: "Leahsocool@gmail.com", password:"Imeanit", password_confirmation:"Imeanit", role: 1, merchant_id: @mike.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@mikes_employee)

      visit "/merchant"
    end

    it "can see the name and full address of the merchant I work for" do
      expect(page).to have_content(@mike.name)
      expect(page).to have_content(@mike.address)
      expect(page).to have_content(@mike.city)
      expect(page).to have_content(@mike.state)
      expect(page).to have_content(@mike.zip)
    end

    it "if an employee logs in accidentally as a regular user, they cannot see the merchant dashboard, and must log back in as a merchant"

  end
end
