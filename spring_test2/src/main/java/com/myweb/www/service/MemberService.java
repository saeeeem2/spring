package com.myweb.www.service;

import java.util.List;

import com.myweb.www.security.MemberVO;

public interface MemberService {

	int insertMember(MemberVO mvo);

	boolean updateLastLogin(String authEmail);

	MemberVO detail(String email);

	List<MemberVO> getList();

	void modify(MemberVO mvo);

	void modifyPwd(MemberVO mvo);

	int remove(String email);

}
