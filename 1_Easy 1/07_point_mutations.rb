class DNA
  attr_reader :dna1_strand, :dna2_strand

  def initialize(dna1_strand)
    @dna1_strand = dna1_strand
  end

  def same_strand?(dna2_strand)
    dna1_strand == dna2_strand
  end

  def length_to_compare(dna2_strand)
    dna1_length = dna1_strand.length
    dna2_length = dna2_strand.length
    [dna1_length, dna2_length].min
  end

  def find_number_of_differences(dna2_strand, endpoint)
    sum = 0
    counter = 0
    loop do
      break if counter == endpoint
      sum += 1 if dna1_strand[counter] != dna2_strand[counter]
      counter += 1
    end
    sum
  end

  def hamming_distance(dna2_strand)
    if same_strand?(dna2_strand)
      0
    else
      endpoint = length_to_compare(dna2_strand)
      find_number_of_differences(dna2_strand, endpoint)
    end
  end
end

dna = DNA.new("ACTG")
p dna.hamming_distance('ACBG')