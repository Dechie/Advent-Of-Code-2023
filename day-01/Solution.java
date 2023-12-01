import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;
import java.util.PrimitiveIterator;

class Solution {
   
  int decipherLine(String input) {
    PrimitiveIterator.OfInt iterator = input.chars().iterator();
    
    List<Character> chars = new ArrayList<>(); 

    while(iterator.hasNext()) {
      char c = (char) iterator.nextInt();
      if (Character.isDigit(c)) {
        chars.add(c); 
        
      }
    } 
    List<Character> firstLast = new ArrayList<>();
    firstLast.add(chars.get(0));
    firstLast.add(chars.get(chars.size()-1));
    
    int num = 0;
    for (char c : firstLast) {
        num *= 10; 
        num += c - '0'; 
    }

    return num;

  }

  int summation(ArrayList<String> lines) {
    int summa = 0;
    for (String line : lines) {
      summa += decipherLine(line); 
    }

    return summa;
  }

  ArrayList<String> readLiner(String filePath) {
    ArrayList<String> lines = new ArrayList<String>();
    try(BufferedReader br = new BufferedReader(new FileReader(filePath))) {
      String line; 
      
      while ((line = br.readLine()) != null) {
        lines.add(line);
      }
      
    } catch (Exception e) {
      //TODO: handle exception
      return null;
    }
    return lines;
    
  } 

  void performSummation(String filePath) {
    ArrayList<String> lines = readLiner(filePath); 
    
    int summa = summation(lines);

    System.out.print(summa);
    
  }

  public static void main(String[] args) {
    String filePath = args[0];  

    Solution soln = new Solution();
    soln.performSummation(filePath);

    
  }
}
