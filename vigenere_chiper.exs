# Vigenere Cipher
# takes a key of any length string
# converts string characters to numbers
# uses that number sequence to shift plain text

key = 'No more secrets'

plain_text =
  'kogi DIY deep v fingerstache occupy Marfa bicycle rights biodiesel Wes Anderson pop-up crucifix fanny pack chambray Neutra meggings post-ironic butcher lo-fi locavore flannel disrupt hashtag pug artisan tofu Etsy master cleanse dreamcatcher squid High Life kale chips stumptown irony ethical mustache actually lomo Intelligentsia cornhole 3 wolf moon XOXO salvia sartorial slow-carb beard roof party Pitchfork Bushwick wolf mlkshk mumblecore gluten-free chia distillery Truffaut small batch retro cred freegan letterpress 8-bit kitsch vegan church-key pour-over whatever skateboard next level direct trade  Portland meh cliche gastropub shabby chic seitan Shoreditch drinking vinegar sriracha craft beer banh mi Godard VHS hella narwhal PBR Thundercats quinoa paleo umami gentrify swag yr authentic Brooklyn brunch literally bitters flexitarian +1 selvage pork belly sustainable ugh tattooed fap organic cray ennui plaid single-origin coffee Cosby sweater iPhone street art food truck tousled before they sold out keytar jean shorts Kickstarter Tumblr hoodie forage chillwave Carles Schlitz synth Pinterest asymmetrical Odd Future normcore twee selfies try-hard typewriter mixtape art party four loko blog bespoke readymade Helvetica polaroid YOLO keffiyeh put a bird on it Blue Bottle viral leggings American Apparel cardigan scenester fixie heirloom vinyl fashion axe tote bag semiotics you probably havent heard of them aesthetic banjo Austin Tonx Williamsburg photo booth PBR&B McSweeneys trust fund messenger bag pickled farm-to-table 90s Vice wayfarers raw denim Banksy Echo Park'

key_length = length(key)
plain_length = length(plain_text)

list_mult = (plain_length / key_length) |> ceil()

key_list =
  Enum.reduce(1..list_mult, [], fn _, acc -> [acc | key] end)
  |> List.flatten()

encoded_list =
  Enum.zip(plain_text, key_list)
  |> Enum.map(fn {char, shift} -> char + shift end)
  |> IO.inspect(label: "encoded")

decoded =
  Enum.zip(encoded_list, key_list)
  |> Enum.map(fn {char, shift} -> char - shift end)
  |> IO.inspect(label: "decoded")
