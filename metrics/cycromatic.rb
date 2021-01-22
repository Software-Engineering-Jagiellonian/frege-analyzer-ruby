class MetricCycromatic
    def self.analyze(dir_path)
        output = %x( cycromatic #{dir_path} )
        values = []
        per_file = {}
        values = output.split("\n").map { |line| 
            path, method, complexity = line.split("\t")
            complexity = complexity.to_i

            per_file[path] = 0 unless per_file.include? path
            per_file[path] += complexity

            complexity
        }

        return {
            total: values.sum,
            average: values.sum / values.count,
            maximum: values.max,
            average_per_file: values.sum / per_file.length,
            maximum_per_file: per_file.values.max
        }
    end
end