# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  full_name: 'Avani Tavargeri',
  email: 'avani@zenmind.com',
  password: '123456',
  company_name: 'Zenmind Studio',
  company_address: '9, Untwadi Rd, Madhura Park, Tidke Nagar, Nashik, Maharashtra 422008',
  role: :user,
  phone_number: '+917456564578'
)

User.create(
  full_name: 'Akshat Kedia',
  email: 'akshat@zenmind.com',
  password: '123456',
  company_name: 'Zenmind Studio',
  company_address: '9, Untwadi Rd, Madhura Park, Tidke Nagar, Nashik, Maharashtra 422008',
  role: :user,
  phone_number: '+916788867689'
)

User.create(
  full_name: 'Harsh Sagar',
  email: 'harsh@zenmind.com',
  password: '123456',
  company_name: 'Zenmind Studio',
  company_address: '9, Untwadi Rd, Madhura Park, Tidke Nagar, Nashik, Maharashtra 422008',
  role: :admin,
  phone_number: '+918516906963'
)
