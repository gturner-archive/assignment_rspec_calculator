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
      it "returns an integer if the result is a whole number" do
        expect(calc.divide(6,2)).to eq(3)
      end
      it "raises argument if dividing by zero"
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
