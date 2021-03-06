FactoryGirl.define do
  factory :tournament do
    name            "Syrenka"
    start_date      2.days.from_now
    rank            "Master"
    city            "Warszawa"
    number_of_rounds 3
  end

  factory :post do
    association :tournament, factory: :tournament
    association :user, factory: :user
    name 'Post fajny'
    body 'Lorem ipsum'
  end

  factory :user do
    sequence(:username) { |i| "Ziutek#{i}" }
    sequence(:email)  { |i| "malo+#{i}@maslo.com" }
    password 'maslo1111'
    password_confirmation 'maslo1111' 
  end

  factory :registration, class: TournamentRegistration do
    association :tournament, factory: :tournament
    association :player, factory: :player
  end

  factory :pairing, class: TournamentPairing do
    association :tournament, factory: :tournament
    association :player1_id, factory: :player  
    association :player2_id, factory: :player 
  end

  factory :player do
    first_name   "Albert" 
    last_name    "Motyka"
    nick         "Hatchet"
    sequence(:league_id) do |i| 
      case i
      when 1...10
        "WW00#{i}"
      when 10...100
        "WW0#{i}"
      else 
        "WW#{i}"
      end
    end
  end

end
