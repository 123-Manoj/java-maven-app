package com.example;

public class App {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("🚀 We are now able to run our App...!!");

        // Keep application running forever
        while (true) {
            System.out.println("✅ App is alive...");
            Thread.sleep(10000); // sleep for 10 seconds
        }
    }
}
