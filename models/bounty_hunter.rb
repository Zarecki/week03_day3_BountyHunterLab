require ('pg')

class Bounty

attr_accessor :name, :species, :danger_level, :last_known_location

def initialize(options)
@id = options['id'].to_i if options['id']
@name = options['name']
@species = options['species']
@danger_level = options['danger_level'].to_i
@last_known_location = options['last_known_location']
end

  def save()
    db = PG.connect({dbname: 'bounties', host: 'localhost'})

    sql = "INSERT INTO wanted_list (name, species, danger_level, last_known_location) VALUES ($1, $2, $3, $4) RETURNING id;"

    values = [@name, @species, @danger_level, @last_known_location]

    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close()
  end

  def Bounty.all
    db = PG.connect({dbname: 'bounties', host: 'localhost'})

    sql = "SELECT * FROM wanted_list;"

    db.prepare("all", sql)
    bounty_hash = db.exec_prepared("all")
    db.close()
    return bounty_hash.map{ |hash| Bounty.new(hash)}
  end

  def delete(id_to_be_deleted)
    db = PG.connect({dbname: 'bounties', host: 'localhost'})

    sql = "DELETE FROM wanted_list WHERE id = #{id_to_be_deleted}"

    db.prepare("delete", sql)
    db.exec_prepared("delete")
    db.close()
  end

  def update
    db = PG.connect({dbname: 'bounties', host: 'localhost'})

    sql = "UPDATE wanted_list SET (name, species, danger_level, last_known_location) = ($1, $2, $3, $4) WHERE id = $5;"
    values = [@name, @species, @danger_level, @last_known_location, @id]
    db.prepare("update", sql)
    db.exec_prepared("update", values)
    db.close()
  end

  def Bounty.find_by_name(name)
    db = PG.connect({dbname: 'bounties', host: 'localhost'})

    sql = "SELECT * FROM wanted_list WHERE name = $1;"
    value = [name]
    db.prepare("find_by_name", sql)
    db.exec_prepared("find_by_name", value)
    db.close()
  end
end
