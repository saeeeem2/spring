package com.myweb.www.security;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Getter
public class AuthMember extends User{

	private static final long serialVersionUID = 1L;
	
	private MemberVO mvo;

	public AuthMember(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public AuthMember(MemberVO mvo) {
		super(mvo.getEmail(),mvo.getPwd(),mvo.getAuthList().stream().map(authVO->new SimpleGrantedAuthority(authVO.getAuth())).collect(Collectors.toList()));
		
		this.mvo=mvo;

	}

}
