class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db
  
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(id, name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type) VALUES (?, ?)
    db.execute(sql)
  end
  
end
