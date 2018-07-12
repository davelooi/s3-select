module Storage
  module S3
    class Put
      def self.put(file, filename)
        s3 = Aws::S3::Client.new(region: ENV.fetch('AWS_REGION'))

        params = {
          bucket: ENV['BUCKET_NAME'],
          key: filename,
          body: file,
          content_type: 'application/octet-stream',
        }
        s3.put_object(params)
      end
    end
  end
end
