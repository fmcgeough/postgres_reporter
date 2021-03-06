require 'pg'

module PostgresReporter
  # Can read data (using read-only user if desired) from
  # the Posgres database.
  class PostgresReader
    # Create a PostgresReader with a hash of options used to connect
    # to Postgres
    def initialize(options)
      @db = PGconn.open(options)
    end

    # SELECT data from database and dumps it as CSV into caller's file
    # remove trailing semicolon if SQL file had one. Otherwise it
    # won't work with the COPY command we build.
    def query(sql, file)
      return if sql.nil? || file.nil?
      sql.strip!
      get_copy_data(sql.chomp(';'), file)
    end

    private

    # use Postgres copy facility (exposed in pg gem) to get large
    # amounts of data faster. a waste on small amounts of data but
    # extremely useful for the data that we are getting
    def get_copy_data(sql, file)
      query = 'COPY (' + sql + ") TO STDOUT WITH DELIMITER ',' CSV HEADER"
      @db.copy_data query do
        until (row = @db.get_copy_data).nil?
          file.write(row)
        end
      end
    end
  end
end
