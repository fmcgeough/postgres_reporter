require 'postgres_reporter/version'
require 'postgres_reporter/postgres_reader'

# Provide easy means of writing report SQL to files
module PostgresReporter
  # simple wrapper using PostgresReader
  class PostgresReporter
    # Read in the caller's provided options for connection to Postgres
    # and setup the input and output file variables
    def initialize(credentials_file, sql_file, output_file)
      @options = YAML.load(File.read(credentials_file))['postgres_reporter']
      @sql_file = sql_file
      @output_file = output_file
    end

    # Execute the read and put CSV (with header) results in caller's
    # specified file.
    def query
      rdr = PostgresReader.new(@options)
      query = File.open(@sql_file, 'r', &:read)
      File.open(@output_file, 'w') do |file|
        rdr.query(query, file)
      end
    end
  end
end
