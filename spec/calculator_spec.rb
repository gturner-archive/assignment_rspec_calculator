require "calculator"
require "spec_helper"


describe Calculator do

  let(:calc){Calculator.new}
  let(:calc_str){Calculator.new("string")}

  describe "#initialize" do

    it "Initializes correctly" do
      expect(calc).to be_a(Calculator)
    end

    it "initialize with stringify parameter" do
      expect(calc_str).to be_a(Calculator)
    end
  end

  describe "Math methods" do
    describe "#add" do
      it "adds positive numbers" do
        expect(calc.add(1,2)).to eq(3)
      end
      it "adds negative numbers" do
        expect(calc.add(-1,-2)).to eq(-3)
      end
    end
    describe "#subtract" do
      it "subtracts positive numbers" do
        expect(calc.subtract(5,2)).to eq(3)
      end
      it "subtracts negative numbers" do
        expect(calc.subtract(-1,-2)).to eq(1)
      end
    end
    describe "#multiply" do
      it "multiplies positive numbers" do
        expect(calc.multiply(5,2)).to eq(10)
      end
      it "multiplies negative numbers" do
        expect(calc.multiply(-1,-2)).to eq(2)
      end
    end
    describe "#divide" do
      it "divides negative numbers" do
        expect(calc.divide(-1,-2)).to eq(0.5)
      end
      it "returns a float if the result is a decimal" do
        expect(calc.divide(3,2)).to eq(1.5)
      end
      it "divides two positive numbers" do
        expect(calc.divide(6,2)).to eq(3)
      end
      it "returns an integer if the result is a whole number" do
        expect(calc.divide(6,2)).to be_a(Fixnum)
      end
      it "raises argument if dividing by zero" do
        expect{calc.divide(2,0)}.to raise_error(ArgumentError)
      end
    end

    describe "#pow" do
      it "raises a number to the correct power" do
        expect(calc.pow(2,2)).to eq(4)
      end
      it "returns a float" do
        expect(calc.pow(2,2)).to be_a(Float)
      end
      it "correctly raises a number to a negative power" do
        expect(calc.pow(2,-2)).to eq(0.25)
      end
      it "correctly handles 0" do
        expect(calc.pow(0, 0)).to eq(1)
      end
    end

    describe "#sqrt" do
      it "raises an argument if number is less than 0" do
        expect{calc.sqrt(-1)}.to raise_error(ArgumentError)
      end
      it "gets the sqrt of a number" do
        expect(calc.sqrt(4)).to eq(2)
      end
      it "returns integer if number is whole" do
        expect(calc.sqrt(4)).to be_a(Fixnum)
      end
      it "output should be rounded to two places" do
        expect(calc.sqrt(2)).to eq(1.41)
      end
    end
  end

  describe "#memory" do
    it "returns nil on new Calc object" do
      expect(calc.memory).to be_nil
    end
    it "resets to nil after 1 call" do
      calc.memory = 8
      calc.memory
      expect(calc.memory).to be_nil
    end
  end

  describe "#memory=" do
    it "returns memory value when setting memory" do
      calc.memory = 8
      expect(calc.memory).to eq(8)
    end
  end


  describe "#output" do
    it "outputs string when stringify is true" do
      expect(calc_str.output(3)).to be_a(String)
    end
    it "outputs int when stringify is false" do
      expect(calc.output(3)).to be_a(Fixnum)
    end
  end
end
