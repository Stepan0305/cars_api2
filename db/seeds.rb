cars = {
    'Toyota' => ['Camry', 'Solara', 'Rav4', 'MarkII'], 
    'Nissan' => ['Skyline', 'Z-series', 'PathFinder'],
    'BMW' => ['i530', 'x5', 'x6', 'x7'],
    'Lexus' => ['LX570', 'LX470', 'RX300', 'RX270'],
    'Lada' => ['2101', '2107', '2121'],
    'Ferrari' => ['sf90', 'f40', 'enzo']}

corobka = ['mechanic', 'automat', 'robot']
complect = ['standart', 'premium', 'bomj', 'luxury']
brand, model = [nil, nil]

def get_rand_by_arr arr
    puts arr
    arr2 = arr.to_a[0][1]
    puts arr2
    brand = arr2[0]
    model = arr2[1].sample
    return "#{brand} #{model}"
end

def get_rand_govnum 
    return "#{('A'..'Z').to_a[rand(26)][0]}#{
        (0...3).map { ('0'..'9').to_a[rand(9)] }.join
    }#{
        (0...2).map { ('A'..'Z').to_a[rand(26)] }.join
    }_#{1 + rand(100)}"

end

100000.times {
    Company.find(1 + Random.rand(997))
    .cars.create(
        name: get_rand_by_arr(
            arr: cars.to_a.sample),
        brand: brand,
        model: model,
        price: (1000 + Random.rand(50000)) * 100,
        govnum: get_rand_govnum,
        box: corobka.sample,
        complect: complect.sample
    )
    }
