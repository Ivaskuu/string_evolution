import 'dart:math';

class StringDNA
{
  List<String> dna;

  String alphabet;
  String target;

  StringDNA(String alphabet, String target, int length)
  {
    this.dna = new List<String>();
    this.alphabet = alphabet;
    this.target = target;
    
    for (int i = 0; i < length; i++)
    {
      dna.add(_getRandomChar());
    }
  }

  StringDNA.fromParents(StringDNA p1, StringDNA p2)
  {

  }

  void mutate()
  {
    int mutationType = new Random().nextInt(100 + 1);

    if(mutationType < 50) // Mutate a gene
    {
      dna[new Random().nextInt(dna.length)] = _getRandomChar();
    }
    else if(mutationType < 80) // Mutate a random number of genes (from 0 to genesNum)
    {
      int genesNum = new Random().nextInt(dna.length);
      for (var i = 0; i < genesNum; i++)
      {
        dna[i] = _getRandomChar();
      }
    }
    else if(mutationType < 95) // Swap the order of the genes
    {
      dna = dna.reversed.toList();
    }
    else if(mutationType < 95) // Change all the genes
    {
      for (int i = 0; i < dna.length; i++)
      {
        dna[i] = _getRandomChar();
      }
    }
  }

  String _getRandomChar()
  {
    return alphabet[new Random().nextInt(alphabet.length)];
  }

  double calcErrorRate()
  {
    double errors = 0.0;

    for (int i = 0; i < target.length; i++)
    {
      if(dna[i] != target[i]) errors++;
    }

    return (errors / target.length) * 100;
  }
}