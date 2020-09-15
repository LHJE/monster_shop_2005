require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As a Merchant' do
    before :each do
      @merchant = User.create!(name:"Leah", address:"123 Sesame Street", city:"New York", state:"NY", zip:"90210", email: "Leahsocool@gmail.com", password:"Imeanit", password_confirmation:"Imeanit", role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@merchant)

      visit "/"
    end

    it "I see the same links as a regular user and a link to merchant dashboard" do
      within 'nav' do
        expect(page).to have_content("Logged in as #{@merchant.name}")
        expect(page).to have_link("Profile")
        expect(page).to have_link("Logout")
        expect(page).to have_link("Merchant Dashboard")
        expect(page).to have_content("Cart")
      end
    end

    it "can redirect to 404 error if I try to access any path with /admin" do
      visit admin_dashboard_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it 'I can see a profile link if logged in on all pages' do
      within 'nav' do
        expect(page).to have_link("Profile")
      end
    end

    it 'I can see a logout link if logged in on all pages' do
      within 'nav' do
        expect(page).to have_link("Logout")
      end
    end

    it 'I cannot see a login or register link if logged in on all pages' do
      within 'nav' do
        expect(page).to_not have_link("Login")
        expect(page).to_not have_link("Register")
      end
    end

    it "I can see 'logged in as' message if logged in on all pages" do
      within 'nav' do
        expect(page).to have_content("Logged in as #{@merchant.name}")
      end
    end
  end
end
