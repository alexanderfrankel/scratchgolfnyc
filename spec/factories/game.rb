FactoryBot.define do
  factory :game do
    course_name "Van Courtland Park"
    date { Date.tomorrow }
  end
end
