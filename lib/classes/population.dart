import 'dart:math';
import 'string_dna.dart';

class Population
{
  List<StringDNA> population;
  int generation;

  Population(int popNum, double mutationRate, String target, String alphabet)
  {
    if(popNum % 2 > 0) return;

    population = new List<StringDNA>();
    for (int i = 0; i < popNum; i++)
    {
      population.add(new StringDNA(alphabet, target, target.length));
    }

    generation = 0;

    while(generation < 100000)
    {
      printPopInfos();

      sortMembersByErrorRate();
      reproduce();
      runMutations(mutationRate);

      generation++;
    }

  }

  void sortMembersByErrorRate()
  {
    population.sort((a, b) => a.calcErrorRate().compareTo(b.calcErrorRate()));
  }

  void reproduce()
  {
    for (var i = 0; i < population.length / 2; i++)
    {
      population[i + (population.length / 2).floor()] = population[i];
    }
  }

  void runMutations(double mutRate)
  {
    for (int i = 0; i < population.length; i++)
    {
      if(new Random().nextDouble() * 100 < mutRate) population[i].mutate();
    }
  }

  void printPopInfos()
  {
    double bestErrorRate = 100.0;
    double medianErrorRate = 0.0;

    for (int i = 0; i < population.length; i++)
    {
      if(population[i].calcErrorRate() < bestErrorRate) bestErrorRate = population[i].calcErrorRate();
      medianErrorRate += population[i].calcErrorRate();
    }

    medianErrorRate /= population.length;

    print("Generation: $generation\nBest error rate: $bestErrorRate\nMedian error rate: $medianErrorRate");
  }
}