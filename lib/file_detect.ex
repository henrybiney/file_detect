defmodule FileDetect do


  @java_versions %{0x36 => "Java SE 10", 0x35 => "Java SE 9",
		   0x34 => "Java SE 8",  0x33 => "Java SE 7",
		   0x32 => "Java SE 6",  0x31 => "Java SE 5",
		   0x30 => "JDK 1.4"  ,  0x2F => "JDK 1.3",
		   0x2E => "JDK 1.2"  ,  0x2D => "JDK 1.1"}
  
  def detect(file) do
    
	with {:ok , contents}    <- File.read(file),
	     {:ok , after_magic} <- detect_java_magic(contents),
	     {:ok , minor_major} <- detect_minor_major(after_magic)
	do 
	     minor_major
	end

   end

  defp detect_java_magic(contents) do
    
     <<0xCA,0xFE,0xBA,0xBE, more :: binary>> = contents
    {:ok, more}
    
  end

   defp detect_minor_major(after_magic) do
     <<minor_version::size(16), major_version::size(16), extra::binary>> =  after_magic
     
     {:ok , [major: @java_versions[major_version], minor: minor_version] }
   end
   
end
