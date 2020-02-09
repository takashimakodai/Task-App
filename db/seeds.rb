# coding: utf-8

User.create!( name: "管理者",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)

100.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end

Task.create!(
  [
    {
      task_name: "Test",
      note: "sampletest",
      user_id: 2,
    },
    { task_name: "Test1",
      note: "sampletest1",
      user_id: 3,
    }
   ]           
)

50.times do |n|
  task_name = "test-#{n+2}"
  note = "sampletest-#{n+2}"
  Task.create!(task_name: task_name,
               note: note,
               user_id: 2)
end
              


               
