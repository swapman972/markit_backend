Event.destroy_all
User.destroy_all
Train.destroy_all
Bike.destroy_all
Rating.destroy_all

# Multi Season
season = ["winter", "summer"]
response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=mta&limit=100&apiKey=#{ENV['API_KEY']}")
mta = JSON.parse(response)
count = 0
while count < mta["items"].count do
    Train.create(
        title: mta["items"][count]["title"], 
        website: "http://www.mta.info",
        category: "Train Station",
        season: season,
        lat: mta["items"][count]["position"]["lat"].to_f,
        lng: mta["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=event&limit=100&apiKey=#{ENV['API_KEY']}")
event = JSON.parse(response)
count = 0
while count < event["items"].count do
    hours = event["items"][count]["openingHours"]
    if (hours) 
        hours = event["items"][count]["openingHours"][0]["text"]
    end

    website = event["items"][count]["contacts"]
    if (website) 
        website = event["items"][count]["contacts"][0]["www"]
        if (website)
            website = event["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = event["items"][count]["contacts"]
    if (phone) 
        phone = event["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = event["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: event["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: event["items"][count]["address"]["label"],
        hours: hours,
        category: "Event",
        season: season.sample,
        zipcode: event["items"][count]["address"]["postalCode"].to_i,
        lat: event["items"][count]["position"]["lat"].to_f,
        lng: event["items"][count]["position"]["lng"].to_f
    )
    count += 1
end



# WINTER TIME
response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=ramen&limit=100&apiKey=#{ENV['API_KEY']}")
ramen = JSON.parse(response)

count = 0
while count < ramen["items"].count do
    hours = ramen["items"][count]["openingHours"]
    if (hours) 
        hours = ramen["items"][count]["openingHours"][0]["text"]
    end

    website = ramen["items"][count]["contacts"]
    if (website) 
        website = ramen["items"][count]["contacts"][0]["www"]
        if (website)
            website = ramen["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = ramen["items"][count]["contacts"]
    if (phone) 
        phone = ramen["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = ramen["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: ramen["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: ramen["items"][count]["address"]["label"],
        hours: hours,
        category: "Ramen",
        season: "winter",
        zipcode: ramen["items"][count]["address"]["postalCode"].to_i,
        lat: ramen["items"][count]["position"]["lat"].to_f,
        lng: ramen["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=soup&limit=100&apiKey=#{ENV['API_KEY']}")
soup = JSON.parse(response)
count = 0
while count < soup["items"].count do
    hours = soup["items"][count]["openingHours"]
    if (hours) 
        hours = soup["items"][count]["openingHours"][0]["text"]
    end

    website = soup["items"][count]["contacts"]
    if (website) 
        website = soup["items"][count]["contacts"][0]["www"]
        if (website)
            website = soup["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = soup["items"][count]["contacts"]
    if (phone) 
        phone = soup["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = soup["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: soup["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: soup["items"][count]["address"]["label"],
        hours: hours,
        category: "Soup",
        season: "winter",
        zipcode: soup["items"][count]["address"]["postalCode"].to_i,
        lat: soup["items"][count]["position"]["lat"].to_f,
        lng: soup["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=coffeeshop&limit=100&apiKey=#{ENV['API_KEY']}")
coffee = JSON.parse(response)
count = 0
while count < coffee["items"].count do
    hours = coffee["items"][count]["openingHours"]
    if (hours) 
        hours = coffee["items"][count]["openingHours"][0]["text"]
    end

    website = coffee["items"][count]["contacts"]
    if (website) 
        website = coffee["items"][count]["contacts"][0]["www"]
        if (website)
            website = coffee["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = coffee["items"][count]["contacts"]
    if (phone) 
        phone = coffee["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = coffee["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: coffee["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: coffee["items"][count]["address"]["label"],
        hours: hours,
        category: "Coffee Shop",
        season: "winter",
        zipcode: coffee["items"][count]["address"]["postalCode"].to_i,
        lat: coffee["items"][count]["position"]["lat"].to_f,
        lng: coffee["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=icerink&limit=50&apiKey=#{ENV['API_KEY']}")
iceRink = JSON.parse(response)
count = 0
while count < iceRink["items"].count do
    hours = iceRink["items"][count]["openingHours"]
    if (hours) 
        hours = iceRink["items"][count]["openingHours"][0]["text"]
    end

    website = iceRink["items"][count]["contacts"]
    if (website) 
        website = iceRink["items"][count]["contacts"][0]["www"]
        if (website)
            website = iceRink["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = iceRink["items"][count]["contacts"]
    if (phone) 
        phone = iceRink["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = iceRink["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: iceRink["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: iceRink["items"][count]["address"]["label"],
        hours: hours,
        category: "Ice Rink",
        season: "winter",
        zipcode: iceRink["items"][count]["address"]["postalCode"].to_i,
        lat: iceRink["items"][count]["position"]["lat"].to_f,
        lng: iceRink["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=holidaymarket&limit=50&apiKey=#{ENV['API_KEY']}")
holidayMarket = JSON.parse(response)
count = 0
while count < holidayMarket["items"].count do
    hours = holidayMarket["items"][count]["openingHours"]
    if (hours) 
        hours = holidayMarket["items"][count]["openingHours"][0]["text"]
    end

    website = holidayMarket["items"][count]["contacts"]
    if (website) 
        website = holidayMarket["items"][count]["contacts"][0]["www"]
        if (website)
            website = holidayMarket["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = holidayMarket["items"][count]["contacts"]
    if (phone) 
        phone = holidayMarket["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = holidayMarket["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: holidayMarket["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: holidayMarket["items"][count]["address"]["label"],
        hours: hours,
        category: "Holiday Market",
        season: "winter",
        zipcode: holidayMarket["items"][count]["address"]["postalCode"].to_i,
        lat: holidayMarket["items"][count]["position"]["lat"].to_f,
        lng: holidayMarket["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

# SUMMER TIME
response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=icecream&limit=100&apiKey=#{ENV['API_KEY']}")
iceCream = JSON.parse(response)
count = 0
while count < iceCream["items"].count do
    hours = iceCream["items"][count]["openingHours"]
    if (hours) 
        hours = iceCream["items"][count]["openingHours"][0]["text"]
    end

    website = iceCream["items"][count]["contacts"]
    if (website) 
        website = iceCream["items"][count]["contacts"][0]["www"]
        if (website)
            website = iceCream["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = iceCream["items"][count]["contacts"]
    if (phone) 
        phone = iceCream["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = iceCream["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: iceCream["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: iceCream["items"][count]["address"]["label"],
        hours: hours,
        category: "Ice Cream",
        season: "summer",
        zipcode: iceCream["items"][count]["address"]["postalCode"].to_i,
        lat: iceCream["items"][count]["position"]["lat"].to_f,
        lng: iceCream["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=rooftop&limit=50&apiKey=#{ENV['API_KEY']}")
rooftop = JSON.parse(response)
count = 0
while count < rooftop["items"].count do
    hours = rooftop["items"][count]["openingHours"]
    if (hours) 
        hours = rooftop["items"][count]["openingHours"][0]["text"]
    end

    website = rooftop["items"][count]["contacts"]
    if (website) 
        website = rooftop["items"][count]["contacts"][0]["www"]
        if (website)
            website = rooftop["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = rooftop["items"][count]["contacts"]
    if (phone) 
        phone = rooftop["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = rooftop["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: rooftop["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: rooftop["items"][count]["address"]["label"],
        hours: hours,
        category: "Rooftop",
        season: "summer",
        zipcode: rooftop["items"][count]["address"]["postalCode"].to_i,
        lat: rooftop["items"][count]["position"]["lat"].to_f,
        lng: rooftop["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://feeds.citibikenyc.com/stations/stations.json")
citiBike = JSON.parse(response)
count = 0
while count < citiBike["stationBeanList"].count do
    Bike.create(
        title: "City Bike", 
        website: "Status: #{citiBike["stationBeanList"][count]["statusValue"]}",
        category: "City Bike",
        season: "summer",
        lat: citiBike["stationBeanList"][count]["latitude"].to_f,
        lng: citiBike["stationBeanList"][count]["longitude"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=museum&limit=50&apiKey=#{ENV['API_KEY']}")
museum = JSON.parse(response)
count = 0
while count < museum["items"].count do
    hours = museum["items"][count]["openingHours"]
    if (hours) 
        hours = museum["items"][count]["openingHours"][0]["text"]
    end

    website = museum["items"][count]["contacts"]
    if (website) 
        website = museum["items"][count]["contacts"][0]["www"]
        if (website)
            website = museum["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = museum["items"][count]["contacts"]
    if (phone) 
        phone = museum["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = museum["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: museum["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: event["items"][count]["address"]["label"],
        hours: hours,
        category: "Museum",
        season: "summer",
        zipcode: museum["items"][count]["address"]["postalCode"].to_i,
        lat: museum["items"][count]["position"]["lat"].to_f,
        lng: museum["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=art&limit=50&apiKey=#{ENV['API_KEY']}")
art = JSON.parse(response)
count = 0
while count < art["items"].count do
    hours = art["items"][count]["openingHours"]
    if (hours) 
        hours = art["items"][count]["openingHours"][0]["text"]
    end

    website = art["items"][count]["contacts"]
    if (website) 
        website = art["items"][count]["contacts"][0]["www"]
        if (website)
            website = art["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = art["items"][count]["contacts"]
    if (phone) 
        phone = art["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = art["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: art["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: event["items"][count]["address"]["label"],
        hours: hours,
        category: "Art",
        season: "summer",
        zipcode: art["items"][count]["address"]["postalCode"].to_i,
        lat: art["items"][count]["position"]["lat"].to_f,
        lng: art["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=swimmingpool&limit=50&apiKey=#{ENV['API_KEY']}")
pool = JSON.parse(response)
count = 0
while count < pool["items"].count do
    hours = pool["items"][count]["openingHours"]
    if (hours) 
        hours = pool["items"][count]["openingHours"][0]["text"]
    end

    website = pool["items"][count]["contacts"]
    if (website) 
        website = pool["items"][count]["contacts"][0]["www"]
        if (website)
            website = pool["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = pool["items"][count]["contacts"]
    if (phone) 
        phone = pool["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = pool["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: pool["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: event["items"][count]["address"]["label"],
        hours: hours,
        category: "Swimming Pool",
        season: "summer",
        zipcode: pool["items"][count]["address"]["postalCode"].to_i,
        lat: pool["items"][count]["position"]["lat"].to_f,
        lng: pool["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=bbq&limit=50&apiKey=#{ENV['API_KEY']}")
bbq = JSON.parse(response)
count = 0
while count < bbq["items"].count do
    hours = bbq["items"][count]["openingHours"]
    if (hours) 
        hours = bbq["items"][count]["openingHours"][0]["text"]
    end

    website = bbq["items"][count]["contacts"]
    if (website) 
        website = bbq["items"][count]["contacts"][0]["www"]
        if (website)
            website = bbq["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = bbq["items"][count]["contacts"]
    if (phone) 
        phone = bbq["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = bbq["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: bbq["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: event["items"][count]["address"]["label"],
        hours: hours,
        category: "BBQ",
        season: "summer",
        zipcode: bbq["items"][count]["address"]["postalCode"].to_i,
        lat: bbq["items"][count]["position"]["lat"].to_f,
        lng: bbq["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

response = RestClient.get("https://discover.search.hereapi.com/v1/discover?in=circle:40.7533,-73.9069;r=13000&q=park-recreation&limit=50&apiKey=#{ENV['API_KEY']}")
park = JSON.parse(response)
count = 0
while count < park["items"].count do
    hours = park["items"][count]["openingHours"]
    if (hours) 
        hours = park["items"][count]["openingHours"][0]["text"]
    end

    website = park["items"][count]["contacts"]
    if (website) 
        website = park["items"][count]["contacts"][0]["www"]
        if (website)
            website = park["items"][count]["contacts"][0]["www"][0]["value"]
        end
    end

    phone = park["items"][count]["contacts"]
    if (phone) 
        phone = park["items"][count]["contacts"][0]["phone"]
        if (phone)
            phone = park["items"][count]["contacts"][0]["phone"][0]["value"]
        end
    end

    Event.create(
        title: park["items"][count]["title"], 
        website: website,
        phone: phone,
        fullAddress: event["items"][count]["address"]["label"],
        hours: hours,
        category: "Park-recreation",
        season: "summer",
        zipcode: park["items"][count]["address"]["postalCode"].to_i,
        lat: park["items"][count]["position"]["lat"].to_f,
        lng: park["items"][count]["position"]["lng"].to_f
    )
    count += 1
end

User.create( firstN: 'Jordan', lastN: 'Melidor-Fuxis', zipcode: 11372)
200.times do
    Rating.create(user_id: User.all.sample.id.to_i, event_id: Event.all.sample.id.to_i)
end