# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ItemOrder.destroy_all
User.destroy_all
Item.destroy_all
Merchant.destroy_all

#merchants
bike_shop = Merchant.create(name: "Meg's Bike Shop", address: '123 Bike Rd.', city: 'Denver', state: 'CO', zip: 80203)
dog_shop = Merchant.create(name: "Brian's Dog Shop", address: '125 Doggo St.', city: 'Denver', state: 'CO', zip: 80210)

#bike_shop items
tire = bike_shop.items.create(name: "Gatorskins", description: "They'll never pop!", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 12)

#dog_shop items
pull_toy = dog_shop.items.create(name: "Pull Toy", description: "Great pull toy!", price: 10, image: "http://lovencaretoys.com/image/cache/dog/tug-toy-dog-pull-9010_2-800x800.jpg", inventory: 32)
dog_bone = dog_shop.items.create(name: "Dog Bone", description: "They'll love it!", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", active?:false, inventory: 21)

#users
tom = User.create(name: "Tom", address: "121 Tomville St.", city: "Tomville", state: "CO", zip: "34565", email: "tombrokegmail.com", password: "thisismypassword", password_confirmation: "thisismypassword" )

item_1 = bike_shop.items.create!(name: "Bike pump", description: "XYZ", price: 20, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 30)
item_2 = bike_shop.items.create!(name: "Tready tire", description: "XYZ", price: 100, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 20)
item_3 = bike_shop.items.create!(name: "Shoe clips", description: "XYZ", price: 50, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 10)
item_4 = bike_shop.items.create!(name: "Bottle cage", description: "XYZ", price: 10, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 30)
item_5 = bike_shop.items.create!(name: "Handlebar tape", description: "XYZ", price: 10, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 15)
item_6 = pet_shop.items.create!(name: "Dog treats", description: "XYZ", price: 10, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 40)
item_7 = pet_shop.items.create!(name: "Frisbee", description: "XYZ", price: 15, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 10)
item_8 = pet_shop.items.create!(name: "Collar", description: "XYZ", price: 20, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 30)
item_9 = pet_shop.items.create!(name: "Leash", description: "XYZ", price: 25, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 20)
item_10 = pet_shop.items.create!(name: "Bone", description: "XYZ", price: 6, image: "https://www.rei.com/media/4e1f5b05-27ef-4267-bb9a-14e35935f218?size=784x588", inventory: 55)
#inactive item
item_11 = bike_shop.items.create(name: "Dog Bone", description: "They'll love it!", price: 21, image: "https://www.sefiles.net/merchant/2166/images/site/tbs-hp-shop-rec-bikes-slimC.jpg?t=1595367301789", active?:false, inventory: 21)
#"other" item (not popular and not un-popular)
item_12 = bike_shop.items.create(name: "Watch", description: "Track your times", price: 21, image: "https://img.chewy.com/is/image/catalog/54226_MAIN._AC_SL1500_V1534449573_.jpg", inventory: 5)

order_1 = Order.create!(name: "Tommy boy", address: "1234 Street", city: "Metropolis", state: "CO", zip: 12345)
order_2 = Order.create!(name: "Susie", address: "12 Sunshine Road", city: "LA", state: "CA", zip: 55555)
order_3 = Order.create!(name: "Larry David", address: "555 Palm Dr", city: "LA", state: "CA", zip: 55555)

item_order_1 = ItemOrder.create!(order: order_1, item: item_1, price: item_1.price, quantity: 10)
item_order_1 = ItemOrder.create!(order: order_2, item: item_1, price: item_1.price, quantity: 500)
item_order_2 = ItemOrder.create!(order: order_1, item: item_2, price: item_2.price, quantity: 20)
item_order_3 = ItemOrder.create!(order: order_2, item: item_3, price: item_3.price, quantity: 30)
item_order_4 = ItemOrder.create!(order: order_2, item: item_4, price: item_4.price, quantity: 40)
item_order_5 = ItemOrder.create!(order: order_1, item: item_5, price: item_5.price, quantity: 50)
item_order_6 = ItemOrder.create!(order: order_3, item: item_6, price: item_6.price, quantity: 60)
item_order_7 = ItemOrder.create!(order: order_2, item: item_7, price: item_7.price, quantity: 70)
item_order_8 = ItemOrder.create!(order: order_3, item: item_8, price: item_8.price, quantity: 80)
item_order_9 = ItemOrder.create!(order: order_2, item: item_9, price: item_9.price, quantity: 90)
item_order_10 = ItemOrder.create!(order: order_3, item: item_10, price: item_10.price, quantity: 100)
item_order_11 = ItemOrder.create!(order: order_3, item: item_12, price: item_10.price, quantity: 61)
item_order_12 = ItemOrder.create!(order: order_3, item: item_11, price: item_10.price, quantity: 600)