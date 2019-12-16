require 'test_helper'

class ListingBooksTest < ActionDispatch::IntegrationTest
  setup do
    Book.create!(title: 'Pragmatic Programmer', rating: 5)
    Book.create!(title: "Ender's Game", rating: 5)
  end
  
  test 'listing books' do
    get '/books'
    
    assert_equal 200, response.status
    assert_equal Mime::JSON, response.content_type
    
    assert_equal Book.count, JSON.parse(response.body).size
  end
  
  test 'lists top rated books' do
    get '/books?rating=5'
    
    assert_equal 200, reponse.status
    assert_equal Mime::JSON, reponse.content_type
    
    assert_equal 1, JSON.parse(reponse.body).size
  end
end