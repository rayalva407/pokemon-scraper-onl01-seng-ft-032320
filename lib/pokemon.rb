class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type) VALUES (?, ?)
      SQL
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
      pokemon = db.execute("SELECT * FROM pokemon (name, type) WHERE id=?", id)
      new_pokemon = self.new(pokemon)
      new_pokemon.id = pokemon[0][0]
      new_pokemon.name = pokemon[0][1]
      new_pokemon.type = pokemon[0][2]
      
  end
  
end
