require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  test "visiting the index user sees 5 products" do
    visit "/"

    assert_selector "h1", text: "Awesome Products"
    assert_selector ".card-product", count: 2
  end

  test "visiting the index while logged in" do
    login_as users(:john_doe)
    visit "/"

    assert_selector "h1", text: "Awesome Products"
  end

  test "user adds a products" do
    products_count_before = Product.count

    login_as users(:john_doe)
    visit "/products/new"

    fill_in "product_name", with: "Frizz Bird"
    fill_in "product_tagline", with: "Best products for you hair"
    click_on "Create Product"

    assert_equal(products_count_before + 1, Product.count)
    assert_equal("/", page.current_path)
    assert_text("Best products for you hair")
  end
end
