# PostgresReporter

This gem provides a simple command line to produce a CSV report. provided
as an example of how to use Postgresql COPY from Ruby code.

## Installation

Note: version of gem may change. You should look in directory after build
to ensure the version is correct for install otherwise it'll get "file not
found".

```
git clone git@github.com/fmcgeough/postgres_reporter.git
cd postgres_reporter
gem build postgres_reporter.gemspec
gem install --local postgres_reporter-1.0.0.gem --verbose
```

## Usage

This gem installs a command line utility ```postgres_reporter``` that takes a
YAML file for Postgres connect options, a SQL file to execute that does a
SELECT out of Postgres and the path to the file to create with the SELECT statement.

## YAML File for Postgres connect options
```
postgres_reporter:
  dbname: <DB_NAME>
  host: <DB_HOST>
  port: <PORT_NUMBER>
  user: <DB_USER>
  password: <DB_PASSWORD>
```

## Development

There's not much to this code. Here's some information on standard
rake tasks that I tend to include when building gems.

* Running ```rake``` by itself from top directory runs the unit tests. The
  goal is 100% pass rate. The unit test produces a coverage report into
  the ```coverage``` directory. The goal for coverage is to have > 90% coverage.
  There's no tests at the moment for this incredibly simple code.
* Running ```rake doc_coverage``` gives statistics on how much doc coverage
  the gem has and displays what is undocumented. The goal is 100% doc coverage.
* Running ```rake doc``` generates the gem documentation into the ```doc```
  directory.
* Running ```rake rubocop``` runs rubocop over the source code. The goal is
  0 rubocop failures.
* Running ```rake console``` starts up irb with the gem code loaded in
  path. Useful for testing things by hand.
