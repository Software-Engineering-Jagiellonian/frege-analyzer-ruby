require 'active_record'

RUBY_LANGAUGE_ID = 9

# ref: https://www.devdungeon.com/content/ruby-activerecord-without-rails-tutorial

# Configure ActiveRecord connection
ActiveRecord::Base.establish_connection(
    adapter: 'postgresql',
    host: ENV['DB_HOST'],
    post: ENV['DB_PORT'],
    username: ENV['DB_USERNAME'],
    password: ENV['DB_PASSWORD'],
    database: ENV['DB_DATABASE']
)

# Create metrics database if required
unless ActiveRecord::Base.connection.table_exists? "ruby_metrics"
    ActiveRecord::Base.connection.exec_query(%Q[
        CREATE TABLE ruby_metrics (
            repo_id text PRIMARY KEY,
            metrics json NOT NULL
        )
    ])    
end

class Repository < ActiveRecord::Base
end

class RepositoryLanguage < ActiveRecord::Base
    self.table_name = "repository_language"
end

class RepositoryLanguageFile < ActiveRecord::Base
    self.table_name = "repository_language_file"
end

class RubyMetric < ActiveRecord::Base
end

# RubyMetric.columns.each { |column|
#     puts "#{column.name} => #{column.type}"
# }

# puts
# RepositoryLanguage.columns.each { |column|
#     puts "#{column.name} => #{column.type}"
# }

# puts
# RepositoryLanguageFile.columns.each { |column|
#     puts "#{column.name} => #{column.type}"
# }

# # Repository.create(repo_id: "hello", git_url: "", repo_url: "")
# # RepositoryLanguage.create(repository_id: "hello", language_id: RUBY_LANGAUGE_ID, present: true, analyzed: true)
# record = RepositoryLanguage.find_by(repository_id: "hello", language_id: RUBY_LANGAUGE_ID, present: true, analyzed: true)
# puts record.nil?
# puts record.id