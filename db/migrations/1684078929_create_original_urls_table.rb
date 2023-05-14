Sequel.migration do
  change do
    create_table(:original_urls) do
      primary_key :id
      String :url, :null => false
    end
  end
end
