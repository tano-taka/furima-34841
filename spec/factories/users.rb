FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    email                  {Faker::Internet.free_email}
    password               {Faker::Internet.password(min_length: 6)}
    password_confirmation  {password}
    nickname               {Faker::Name.last_name}
    first_name             {Faker::Japanese::Name.first_name}
    last_name              {Faker::Japanese::Name.last_name}
    birthday               {Faker::Date.backward}
    first_name_kana        { person.first.katakana }
    last_name_kana         { person.last.katakana }
  end
end
