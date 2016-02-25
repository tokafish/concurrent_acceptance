defmodule ConcurrentAcceptance.ThirdTest do
  use ConcurrentAcceptance.AcceptanceCase, async: true

  alias ConcurrentAcceptance.{Post,Repo}

  test "GET /" do
    Repo.insert!(%Post{title: "ThirdPost", body: "The body"})
    navigate_to "/posts"

    assert page_source =~ "ThirdPost"
    refute page_source =~ "FirstPost"

    :timer.sleep(5000)

    click({:class, "new-post"})

    title = "Post #{:rand.uniform}"
    fill_field({:id, "post_title"}, title)
    fill_field({:id, "post_body"}, "Another body")
    click({:class, "btn-primary"})

    assert page_source =~ "Post created successfully."
    assert page_source =~ title
  end
end
