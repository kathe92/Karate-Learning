package com.api.automation;

public class ReadySystemProperty {
	public static void main(String[] args) {
		System.out.println("Location " + System.getProperty("location", "com/api/automation"));
		System.out.println("Tags " + System.getProperty("tags", "@Regression"));
		
	}

}
