module Storage
  module S3
    class Select
      def self.select(expression, filename)
        s3 = Aws::S3::Client.new(region: ENV.fetch('AWS_REGION'))

        params = {
          bucket: ENV['BUCKET_NAME'],
          key: filename,
          expression_type: 'SQL',
          expression: expression,
          input_serialization: {
            csv: { file_header_info: 'USE' }
          },
          output_serialization: {
            csv: {}
          }
        }

        s3.select_object_content(params) do |stream|
          stream.on_event do |event|
            case event.event_type
            when :records
              puts event.payload.read
            else
              # handle other event types
              # :stats / :end / :cont
            end
          end
        end
      end
    end
  end
end
