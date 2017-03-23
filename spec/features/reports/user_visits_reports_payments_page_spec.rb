require 'spec_helper'

feature 'User visits reports subjects page'  do
  let!(:teacher) { create :teacher, first_name: 'Pies', last_name: 'Pluto', academic_title: 'Dr.' }
  let!(:student) { create :student, first_name: 'Jan', last_name: 'Nowak', birthdate: '2000-10-21' }
  let!(:subject_item) { create :subject_item, title: 'Math', teacher: teacher }
  let!(:participant) { create :participation, student: student, subject_item: subject_item }
  let!(:subject_item_note) { create :subject_item_note, value: 5, subject_item: subject_item, student: student }

  background do
    sign_in
    expect(page).to have_content 'Logout'
    visit report_subjects_path
  end

  scenario 'should see subjects list' do
    within('.breadcrumbs') do
      expect(page).to have_content 'RoR Workhops » Subjects'
    end

    expect(page).to have_content 'Pies'
    expect(page).to have_content 'Pluto'
    expect(page).to have_content 'Jan'
    expect(page).to have_content 'Nowak'
    expect(page).to have_content '2000-10_21'
    expect(page).to have_content '5.00'
  end

  scenario 'only when sign in' do
    logout
    visit report_subjects_path
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
