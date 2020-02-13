require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_test')
else
  DatabaseConnection.setup('bookmarkbarridb')
end