require "json"

class MetricRubyCritic
    def self.analyze(dir_path)
        output = %x( rubycritic -m -f json --no-browser #{dir_path} )
        output = output[(output.index('{'))..(output.rindex('}'))]
        output = JSON.parse(output)
        output['analysed_modules'].each { |analysed_module| 
            smells = analysed_module["smells"].map { |smell|
                smell["locations"].length
            }.sum
            analysed_module["smells"] = smells
        }
        result = {
            modules: output["analysed_modules"],
            total: {
                score: output["score"]
            }
        }

        ["smells", "complexity", "duplication", "methods_count", "cost"].each { |key|
            result[:total][key] = output["analysed_modules"].map { |m| m[key] }.sum
        }
        ratings = output["analysed_modules"].map { |m| m["rating"] }
        result[:total]["ratings"] = ["A", "B", "C", "D", "E", "F"].map{|k| [k, ratings.count(k)]}.to_h

        result[:per_method] = {}
        ["smells", "complexity", "duplication", "cost"].each { |key|
            result[:per_method][key] = 1.0 * result[:total][key] / result[:total]["methods_count"]
        }
        
        return result
    end
end