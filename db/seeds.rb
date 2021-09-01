seed_user_password = SecureRandom.hex
seed_user_1 = User.create(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: seed_user_password,
  password_confirmation: seed_user_password,
)
seed_user_2 = User.create(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: seed_user_password,
  password_confirmation: seed_user_password,
)

# From: https://www.readpoetry.com/10-vivid-haikus-to-leave-you-breathless/
Haiku.create!(
  title: "The Old Pond",
  body: "An old silent pond\nA frog jumps into the pond—\nSplash! Silence again.",
  user: seed_user_1
)
Haiku.create!(
  title: "A World of Dew",
  body: "A world of dew,\nAnd within every dewdrop\nA world of struggle.",
  user: seed_user_1
)
Haiku.create!(
  title: "Lighting One Candle",
  body: "The light of a candle\nIs transferred to another candle—\nSpring twilight",
  user: seed_user_1
)
Haiku.create!(
  title: "A Poppy Blooms",
  body: "I write, erase, rewrite\nErase again, and then\nA poppy blooms.",
  user: seed_user_1
)
Haiku.create!(
  title: "Over the Wintry",
  body: "Over the wintry\nForest, winds howl in rage\nWith no leaves to blow.",
  user: seed_user_1
)
Haiku.create!(
  title: "Haiku [for you]",
  body: "love between us is\nspeech and breath. loving you is\na long river running.",
  user: seed_user_2
)
Haiku.create!(
  title: "Lines on a Skull",
  body: "life’s little, our heads\nsad. Redeemed and wasting clay\nthis chance. Be of use.",
  user: seed_user_2
)
