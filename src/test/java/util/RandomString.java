package util;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class RandomString {

    public static String generateRandomAlphaNumeric(int length) {
        List<String> list = new ArrayList<>();
        for(int i=0;i<10;i++)
            list.add(String.valueOf(i));
        char[] alphabets = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i'};
        for(char a : alphabets) {
            list.add(String.valueOf(a).toLowerCase());
            list.add(String.valueOf(a).toUpperCase());
        }
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for(int i=0; i<length; i++) {
            sb.append(list.get(random.nextInt(list.size())));
        }
        return sb.toString();
    }

    public static String generateRandomNumbers(int length) {
        List<String> list = new ArrayList<>();
        for(int i=0;i<10;i++)
            list.add(String.valueOf(i));
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for(int i=0; i<length; i++) {
            sb.append(list.get(random.nextInt(list.size())));
        }
        return sb.toString();
    }

    public static String generateAlphabet(int length) {
        List<String> list = new ArrayList<>();
        char[] alphabets = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k',
        'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
        for(char a : alphabets) {
            list.add(String.valueOf(a).toLowerCase());
            list.add(String.valueOf(a).toUpperCase());
        }
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for(int i=0; i<length; i++) {
            sb.append(list.get(random.nextInt(list.size())));
        }
        return sb.toString();
    }

}
