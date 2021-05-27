defmodule Exlivery.Users.CreateOrUpdateTest do
  use ExUnit.Case

  alias Exlivery.Users.Agent, as: UserAgent
  alias Exlivery.Users.CreateOrUpdate

  describe "call/1" do
    setup do
      UserAgent.start_link(%{})
      :ok
    end

    test "when all params are valid saves the user" do
      params = %{
        name: "Roupa nova",
        address: "Rua",
        email: "c@a.com",
        cpf: "12345678900",
        age: 99
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:ok, "User created or updated sucessfuly"}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        name: "Roupa nova",
        address: "Rua",
        email: "c@a.com",
        cpf: "12345678900",
        age: 9
      }

      response = CreateOrUpdate.call(params)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
