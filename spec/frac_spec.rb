require 'fraccion'

describe Fraccion do
  before :each do
    @p1 = Fraccion.new(7, 8)
    @p2 = Fraccion.new(25, 45)
    @p3 = Fraccion.new(-230, 340)
    @p4 = Fraccion.new(23, -34)
  end
  
  describe "Constructor e inspectores" do
    it "Debe existir un numerador" do
      @p1.should respond_to(:num)
    end
    it "Debe existir un denominador" do
      @p1.should respond_to(:denom)
    end
    it "Debe estar en su forma reducida" do
      @p2.num.should eq(5)
      @p2.denom.should eq(9)
    end
    it "Se debe invocar a num() para obtener el numerador" do
      @p3.num.should eq(-23)
      @p4.num.should eq(-23)
    end
    it "Se debe invocar a denom() para obtener el denominador" do
      @p3.denom.should eq(34)
      @p4.denom.should eq(34)
    end
  end

  describe "Impresion por pantalla" do
    it "Se debe mostar por la consola la fraccion de la forma: a/b, donde a es el numerador y b el denominador" do
      @p1.should respond_to(:to_s)
      @p1.to_s.should eq("7/8")
      @p2.to_s.should eq("5/9")
    end

    it "Se debe mostar por la consola la fraccion en formato flotante" do
      @p1.should respond_to(:to_f)
      @p1.to_f.should be_within(0.0001).of(0.875)
      @p2.to_f.should be_within(0.006).of(0.55)
    end
  end

  describe "Operadores" do
    it "Se debe comparar si dos fracciones son iguales con ==" do
      @p3.should == @p4
    end

    it "Se debe calcular el valor absoluto de una fraccion con el metodo abs" do
      @p1.should respond_to(:abs)
      @p3.abs.should == Fraccion.new(23, 34)
    end

    it "Se debe calcular el reciproco de una fraccion con el metodo reciprocal" do
      @p1.should respond_to(:reciprocal)
      @p1.reciprocal.should == Fraccion.new(8, 7);
      @p2.reciprocal.should == Fraccion.new(45, 25);
      @p4.reciprocal.should == Fraccion.new(-34, 23);
      @p4.reciprocal.should == Fraccion.new(34, -23);
    end

    it "Se debe calcular el opuesto de una fraccion con -" do
      (-@p1).should == Fraccion.new(-7, 8)
      (-@p1).should == Fraccion.new(7, -8)
      (-@p3).should == Fraccion.new(230, 340)
      (-@p3).should == Fraccion.new(23, 34)
    end

    it "Se debe sumar dos fracciones con + y dar el resultado de forma reducida" do
      (@p1 + @p2).should == Fraccion.new(103, 72)
      (@p1 + @p3).should == Fraccion.new(54, 272)
      (@p1 + @p3).to_s.should eq("27/136")
    end

    it "Se debe restar dos fracciones con - y dar el resultado de forma reducida" do
      (@p1 - @p2).should == Fraccion.new(23, 72)
      (@p1 - @p3).should == Fraccion.new(422, 272)
      (@p1 - @p3).to_s.should eq ("211/136")
    end

    it "Se debe multiplicar dos fracciones con * y dar el resultado de forma reducida" do
      (@p1 * @p2).should == Fraccion.new(35, 72)
      (@p1 * @p3).should == Fraccion.new(-1610, 2720)
      (@p1 * @p3).to_s.should eq ("-161/272")
    end

    it "Se debe dividir dos fracciones con / y dar el resultado de forma reducida" do
      (@p1 / @p2).should == Fraccion.new(63, 40)
      (@p1 / @p3).should == Fraccion.new(2380, -1840)
      (@p1 / @p3).to_s.should eq ("-119/92")
    end

    it "Se debe calcular el resto dos fracciones con % y dar el resultado de forma reducida" do
      (@p1 % @p2).should == Fraccion.new(115, 200)
      (@p1 % @p3).should == Fraccion.new(-540, 1840)
      (@p1 % @p3).to_s.should eq ("-27/92")
    end

    it "Se debe de poder comprobar si una fracion es menor que otra" do
      @p3.should be < @p1
      @p1.should_not be < @p2
    end

    it "Se debe de poder comprobar si una fracion es mayor que otra" do
      @p1.should be > @p2
      @p3.should_not be > @p1
    end

    it "Se debe de poder comprobar si una fracion es menor o igual que otra" do
      @p3.should be <= @p1
      @p3.should be <= @p4
    end

    it "Se debe de poder comprobar si una fracion es mayor o igual que otra" do
      @p1.should be >= @p2
      @p3.should be >= @p4
    end
  end

  describe "Coercion" do
    it "Se debe poder operar entre fracciones y enteros" do
      (2 + @p1).should == Fraccion.new(23, 8)
      (@p1 + 3).should == Fraccion.new(31, 8)

      (2 - @p1).should == Fraccion.new(9, 8)
      (@p1 - 3).should == Fraccion.new(-17, 8)

      (2 * @p1).should == Fraccion.new(7, 4)
      (-2 * @p1).should == Fraccion.new(-7, 4)
      (@p1 * 3).should == Fraccion.new(21, 8)
      (@p1 * -3).should == Fraccion.new(-21, 8)

      (2 / @p1).should == Fraccion.new(16, 7)
      (-2 / @p1).should == Fraccion.new(-16, 7)
      (@p1 / 3).should == Fraccion.new(7, 24)
      (@p1 / -3).should == Fraccion.new(-7, 24)

      (1 == Fraccion.new(7, 7)).should be_true
      (Fraccion.new(-4, -2) == 2).should be_true
      (1 != Fraccion.new(7, 7)).should be_false
      (Fraccion.new(-4, -2) != 2).should be_false
      @p1.should be < 1
      @p1.should be <= 1
      1.should be > @p1
      1.should be >= @p1
      @p1.should_not be < -1
      @p1.should_not be <= -1
      -1.should_not be > @p1
      -1.should_not be >= @p1
    end
  end
end
