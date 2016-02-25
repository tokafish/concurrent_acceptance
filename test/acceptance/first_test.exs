defmodule ConcurrentAcceptance.FirstTest do
  use ConcurrentAcceptance.AcceptanceCase, async: true

  alias ConcurrentAcceptance.{Post,Repo}

  test "GET /" do
    Repo.insert!(%Post{title: "FirstPost", body: "The body"})
    navigate_to "/posts"

    assert page_source =~ "FirstPost"
    refute page_source =~ "ThirdPost"

    click({:class, "new-post"})

    title = "Post #{:rand.uniform}"
    fill_field({:id, "post_title"}, title)
    fill_field({:id, "post_body"}, "Another body")
    click({:class, "btn-primary"})

    assert page_source =~ "Post created successfully."
    assert page_source =~ title

    :timer.sleep(5000)
  end
end
