puts "Seeds: start"
TEACHER_TITLES = %w(Dr. Prof. TA)

3.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: TEACHER_TITLES.sample
  )
end

teachers = Teacher.all
5.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end

25.times do
  birthdate = ""
  if rand(1..10) > 3
    birthdate = Faker::Date.birthday(9, 30)
  end
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: birthdate
  )
end

students = Student.all
SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

students.each do |student|
  date_of_payment = ""
  if rand(1..10) > 4
    date_of_payment = Faker::Date.between(22.days.ago, Date.today)
  end
  Payment.create!(student: student, date_of_payment:date_of_payment, payment_deadline: "2017-04-01")
end

puts "Seeds: done"
