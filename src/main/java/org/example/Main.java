package org.example;

import java.io.IOException;
import java.net.URISyntaxException;

public class Main {
    public static void main(String[] args) throws URISyntaxException, IOException {
        System.out.println("Hello world!");
        SeleniumTest2 test = new SeleniumTest2();
        test.copyChromeInTmp();
        test.runSelenium();
    }
}