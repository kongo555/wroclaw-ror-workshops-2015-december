require 'spec_helper'

feature 'User visits reports payments page'  do
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak' }
  let!(:payment) { create :payment, date_of_payment: '2017-10-21', payment_deadline: '2017-10-31', student: student}

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit report_payments_path
  end

  scenario 'should see payments list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Payments'
    end

    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Nowak'
    expect(page).to have_content '2017-10-21'
    expect(page).to have_content '2017-10-31'
  end

  scenario 'only when sign in' do
    logout
    visit report_payments_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
