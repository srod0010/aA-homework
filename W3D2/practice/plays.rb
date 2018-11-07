require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_has = true
  end
end


class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    #.instance grabs one instance bc we included singleton model
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} is already in database if" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
      plays(title, year, playwright_id)
      VALUES
        (?, ?, ?)

    SQL

    @id = PlayDBConnection.instance.last_insert_row_id
    #question marks pull values from <<-SQL line
    #protect against drop table/ injection attacks
    #heredoc - when you dont want to go over character limit
    # <<-SQL text SQL
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?

    SQL
  end
end
