require 'spec_helper'

feature 'User checks student details' do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak', birthdate: '2000-10-21' }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit students_path
    find(:xpath, "//a[@title='show']").click
  end

  scenario do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Students » Jan Nowak'
    end

    expect(page).to have_content '2000-10-21'
  end
end
