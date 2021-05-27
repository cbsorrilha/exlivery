defmodule Exlivery.Orders.ItemTest do
  use ExUnit.Case

  alias Exlivery.Orders.Item

  import Exlivery.Factory

  describe "build/4" do
    test "when all params are valid, returns an item" do
      response = Item.build("calabresa", :pizza, "35.5", 1)

      # function from ExMachina to help generating structs
      expected_response = {:ok, build(:item)}

      assert response == expected_response
    end

    test "when there is an invalid category, returns an error" do
      response = Item.build("calabresa", :sanduiche, "35.5", 1)

      # function from ExMachina to help generating structs
      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end

    test "when there is an invalid price, returns an error" do
      response = Item.build("calabresa", :pizza, "ngh", 1)

      # function from ExMachina to help generating structs
      expected_response = {:error, "Invalid price"}

      assert response == expected_response
    end

    test "when there is an invalid quantity, returns an error" do
      response = Item.build("calabresa", :pizza, "35.5", 0)

      # function from ExMachina to help generating structs
      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
