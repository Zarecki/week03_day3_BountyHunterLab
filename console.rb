require_relative("models/bounty_hunter")

bounty1 = Bounty.new({'name' => 'Xenon', 'species' => 'Molluscoid', 'danger_level' => '6', 'last_known_location' => 'Mars'})
# bounty1.save()
# bounty1.name = 'Fred'
# bounty1.update()
# bounty2 = Bounty.new({"name" => "Walter", "species" => "Hummaloid", "danger_level" => "8", "last_known_location" => "Alpha Centauri"})


# all_bounties = Bounty.all
# p all_bounties
#
# bounty1.delete(3)


Bounty.find_by_name('Fred')
