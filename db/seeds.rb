# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

puts "Populando o banco de dados com usuários..."

10.times do
  name = Faker::Name.name
  email = Faker::Internet.email(name: name)

  User.find_or_create_by!(email: email) do |user|
    user.name = name
  end
end

puts "10 usuários criados com sucesso!"
