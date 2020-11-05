# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

product = Product.new(name: "Apple Macbook Pro", price: 1299, image_url: "https://images-na.ssl-images-amazon.com/images/I/71BMVOs2xML._AC_SL1500_.jpg", description: "2020 Space Gray 13.3 inch Apple with Retina Display")

product = Product.new(name: "HP ProBook 450 G7", price: 1119, image_url: "https://static.bhphoto.com/images/images500x500/hp_8wc04ut_aba_hp_powerbook_450_g7_15_6_1579005466_1538620.jpg", description: "HP 15.6 ProBook 450 G7 Laptop")
product.save

