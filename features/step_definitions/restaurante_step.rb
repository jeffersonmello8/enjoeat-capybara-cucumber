Quando("acesso a lista de restaurantes") do
    visit '/restaurants'
    @restaurant_data = [
        {name: 'Bread & Bakery', category: 'Padaria', delivery_time: '25 minutos', rating: '4.9'},
        {name: 'Burguer House', category: 'Hamburgers', delivery_time: '30 minutos', rating: '3.5'}
    ]
    @restaurants = all('.restaurant-item')
end

Então("vejo todas as opções disponíveis") do
    expect(@restaurants.size).to be > 0
end

Então("cada restaurante deve exibir sua categoria") do
    @restaurant_data.each_with_index do |value, index|
        expect(@restaurants[index]).to have_text value[:category]
    end 
end

Então("cada restaurante deve exibir o tempo de entrega") do
    @restaurant_data.each_with_index do |value, index|
        expect(@restaurants[index]).to have_text value[:delivery_time]
    end 
end

Então("cada restaurante deve exibir sua nota de avaliação") do
    @restaurant_data.each_with_index do |value, index|
        expect(@restaurants[index]).to have_text value[:rating]
    end 
end