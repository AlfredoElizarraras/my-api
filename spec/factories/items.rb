FactoryBot.define do
  factory :item do
    name { Faker::StarWars.charcter }
    done false
    todo_id nil
  end
end
