defmodule PKCS5 do
  defmodule BadPaddingError do
    defexception [:message]
  end

  defdelegate pad(bin), to: :pkcs5

  def unpad(bin) do
    :pkcs5.unpad(bin)
  rescue
    _err in ErlangError ->
      raise BadPaddingError, message: bin
  end
end
