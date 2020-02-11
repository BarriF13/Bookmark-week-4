# User story 2 -- User to see the Bookmarks 
require 'pg'
feature 'Viewing bookmarks' do
  scenario 'user sees the list of bookmarks' do
    
    connection = PG.connect(dbname: 'bookmark_test')

    # add the test
    connection.exec("INSERT INTO bookmarks VALUES(1, 'http://www.makersacademy.com');")
    connection.exec("INSERT INTO bookmarks VALUES(2, 'http://www.destroyallsoftware.com');")
    connection.exec("INSERT INTO bookmarks VALUES(3, 'http://www.google.com');")

    visit('/bookmarks')
    
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end