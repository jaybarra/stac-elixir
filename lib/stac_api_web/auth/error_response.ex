defmodule StacApiWeb.Auth.ErrorResponse.Unauthorized do
  defexception message: "Unauthorized", plug_status: 401
end

defmodule StacApiWeb.Auth.ErrorResponse.NotFound do
  defexception message: "Not Found", plug_status: 404
end

defmodule StacApiWeb.Auth.ErrorResponse.Forbidden do
  defexception message: "Forbidden", plug_status: 403
end
