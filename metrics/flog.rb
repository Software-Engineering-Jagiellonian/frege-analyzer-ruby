
class MetricFlog
    def self.analyze(dirpath)
        output = %x( bundle exec flog -a -c -s #{dirpath} )

        output = output.split("\n").map { |line|
            value, key = line.split(":")
            [key.strip, value.strip.to_f]
        }.to_h

        return {
            total: output["flog total"],
            average_per_method: output["flog/method average"]
        }
    end
end