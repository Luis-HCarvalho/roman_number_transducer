class Transducer
    def initialize(word)
        @input = word.upcase
        @index = 0
        @max = word.size
        @storage = ""
    end

    def convert_to_decimal
        val = thousands
        if val == nil
            puts "Word isn't part of the language recognized by this machine"
        end

        return val
    end

    private

    def get_char
        @index == @max ? nil : @input[@index]
    end

    def ones
        state = "q0"

        loop do
            case [get_char, state]
            in [nil, *] if state != "q0"
                @storage << state[1]
                return @storage
            in ["I", "q0"]
                state = "q1"
            in ["I", "q1"]
                state = "q2"
            in ["I", "q2"]
                state = "q3"
            in ["V", "q1"]
                state = "q4"
            in ["X", "q1"]
                state = "q9"
            in ["V", "q0"]
                state = "q5"
            in ["I", "q5"]
                state = "q6"
            in ["I", "q6"]
                state = "q7"
            in ["I", "q7"]
                state = "q8"
            else
                return nil
            end
            @index += 1
        end
    end

    def tens
        state = "q0"

        loop do
            case [get_char, state]
            in [nil, *] if state != "q0"
                @storage << state[1] + "0"
                return @storage
            in ["X", "q0"]
                state = "q1"
            in ["X", "q1"]
                state = "q2"
            in ["X", "q2"]
                state = "q3"
            in ["L", "q1"]
                state = "q4"
            in ["L", "q0"]
                state = "q5"
            in ["X", "q5"]
                state = "q6"
            in ["X", "q6"]
                state = "q7"
            in ["X", "q7"]
                state = "q8"
            in ["C", "q1"]
                state = "q9"
            else
                if state != "q0"
                    @storage << state[1]
                elsif !@storage.empty?
                    @storage << "0"
                end

                return ones
            end
            @index += 1
        end
    end

    def hundreds
        state = "q0"

        loop do
            case [get_char, state]
            in [nil, *] if state != "q0"
                @storage << state[1] + "00"
                return @storage
            in ["C", "q0"]
                state = "q1"
            in ["C", "q1"]
                state = "q2"
            in ["C", "q2"]
                state = "q3"
            in ["D", "q1"]
                state = "q4"
            in ["D", "q0"]
                state = "q5"
            in ["C", "q5"]
                state = "q6"
            in ["C", "q6"]
                state = "q7"
            in ["C", "q7"]
                state = "q8"
            in ["M", "q1"]
                state = "q9"
            else
                if state != "q0"
                    @storage << state[1]
                elsif !@storage.empty?
                    @storage << "0"
                end

                return tens
            end
            @index += 1
        end
    end

    def thousands
        state = "q0"

        loop do
            case [get_char, state]
            in [nil, *] if state != "q0"
                @storage << state[1] + "000"
                return @storage
            in ["M", "q0"]
                state = "q1"
            in ["M", "q1"]
                state = "q2"
            in ["M", "q3"]
                state = "q3"
            else
                if state != "q0"
                    @storage << state[1]
                end

                return hundreds
            end
            @index += 1
        end
    end
end