require 'pg'

def setup_test_database

connection = PG.connect(dbname: 'bookmark_test')

# clear the bookmarks table
connection.exec("TRUNCATE bookmarks, comments;")

end