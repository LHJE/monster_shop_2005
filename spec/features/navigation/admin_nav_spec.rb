require 'rails_helper'

RSpec.describe 'Site Navigation' do
  describe 'As an Admin' do
    before :each do
      @admin = User.create!(name:"Priya", address:"13 Elm Street", city:"Denver", state:"CO", zip:"66666", email: "priyavcooltoo@gmail.com", password:"yuuuuuup", password_confirmation:"yuuuuuup", role: 2)

      visit "/"

      within 'nav' do
        click_link "Login"
      end

      fill_in :email, with: @admin.email
      fill_in  :password, with: @admin.password
      click_button "Login"
    end

    it "I can see Admin Dashboard when logged in as an admin" do
      within 'nav' do
        expect(page).to have_content("Admin Dashboard")
      end
    end

    it "I can see All Users when logged in as an admin" do
      within 'nav' do
        expect(page).to have_content("Users")
      end
    end

    it "I cannot see cart when logged in as an admin" do
      within 'nav' do
        expect(page).to_not have_content("Cart")
      end
    end

    it "can redirect an admin to 404 error if they try to access any path with /merchant" do
      visit merchants_dashboard_path
      expect(page).to have_content("The page you were looking for doesn't exist.")
    end

    it "can redirect an admin to 404 error if they try to access any path with /admin" do
      visit "/cart"
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
        expect(page).to have_content("Logged in as #{@admin.name}")
      end
    end
  end
end
