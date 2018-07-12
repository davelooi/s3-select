# AWS select-object-content demo

Demo on how to use AWS s3 select object content feature

## CLI

`aws s3api select-object-content --bucket looi-test-csv-select --key "new.csv" --expression-type SQL --input-serialization '{"CSV":{"FileHeaderInfo":"USE"}}' --output-serialization '{"CSV":{}}' --expression "SELECT * FROM S3Object WHERE name = 'Selina Doyle'" tmp/outfile && cat tmp/outfile`

```csv
Selina Doyle,1,selina.doyle.1@example.com,"Mar 01, 1974","Aug 31, 1978",,en,Demo_1_36,Demo_2_42
```

## Ruby

```
require 'storage/s3/select'

Storage::S3::Select.select("SELECT * FROM S3Object WHERE name = 'Selina Doyle'", 'new.csv') # => #<struct Aws::S3::Types::SelectObjectContentOutput ...>
```
