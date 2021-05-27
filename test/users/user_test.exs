defmodule Exlivery.Users.UserTest do
  use ExUnit.Case

  alias Exlivery.Users.User

  import Exlivery.Factory

  describe "build/5" do
    test "when all params are valid, returns the user" do
      response = User.build("Rua dos testes", "Rafoso", "teste@teste.com", "12345678900", 28)

      # function from ExMachina to help generating structs
      expected_response = {:ok, build(:user)}

      assert response == expected_response
    end

    test "when there are invalid params, returns an error" do
      response = User.build("Rua dos testes", "Rafoso", "teste@teste.com", "12345678900", 8)

      expected_response = {:error, "Invalid parameters"}

      assert response == expected_response
    end
  end
end
