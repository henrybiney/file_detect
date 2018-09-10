defmodule FileDetectTest do
  use ExUnit.Case

  doctest FileDetect

  test "java version should be 8" do
    file = Path.expand("./test/files/")
    assert FileDetect.detect("#{file}/Debug_J8.class") == [major: "Java SE 8", minor: 0]
    
  end

  test "java version should be 9" do
    file = Path.expand("./test/files/")
    assert FileDetect.detect("#{file}/Debug_J9.class") == [major: "Java SE 9", minor: 0]
    
  end

   test "java version should be 10" do
    file = Path.expand("./test/files/")
    assert FileDetect.detect("#{file}/Debug_J10.class") == [major: "Java SE 10", minor: 0]
    
  end
  
end
