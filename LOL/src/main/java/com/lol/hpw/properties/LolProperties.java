package com.lol.hpw.properties;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class LolProperties {

	@Value("${LOL.endpoint}")
	public  String END_POINT;
	
	@Value("${LOL.pkey}")
	public  String PKEY;
	

	
}
