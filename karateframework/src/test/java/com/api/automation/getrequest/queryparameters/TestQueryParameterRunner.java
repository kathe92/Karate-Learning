package com.api.automation.getrequest.queryparameters;

import com.intuit.karate.junit5.Karate;
import com.intuit.karate.junit5.Karate.Test;

public class TestQueryParameterRunner {
	
	@Test
	public Karate runTest() {
		return Karate.run("queryParameter").relativeTo(getClass());
	}
	
//	@Test
//	public Karate runTestUsingClassPath() {
//		return Karate.run("classpath:/com/api/automation/getrequest/getRequest.feature");
//	}
}
