namespace :utils do
  desc "Cria Adminsitradores Fake"
  task generate_admins: :environment do
    puts "Cadastrando Administrador Padrao"
    10.times do
      Admin.create!(
                  name: Faker::Name.name,
                  email: Faker::Internet.email,
                  password: "123456",
                  password_confirmation: "123456",
                  role: [0,0,1,1,1].sample
                )
              end
    puts "Adminsitrador cadastrado com Sucesso"
      end

  desc "Cria Anúncios Fake"
  task generate_ads: :environment do
    puts "Cadastrando Anúncios"
    100.times do
      Ad.create!(
      title: Faker::Lorem.sentence([2,3,4,5].sample),
                  description: LeroleroGenerator.paragraph(Random.rand(3)),
                  member: Member.all.sample,
                  category: Category.all.sample,
                  price: "#{Random.rand(500)},#{Random.rand(99)}",
                  picture: File.new(Rails.root.join('public', 'template', 'images-for-ads', "#{Random.rand(9)}.jpg"), 'r')
                )
              end
    puts "Anúncios cadastrados com sucesso!"
  end

end
