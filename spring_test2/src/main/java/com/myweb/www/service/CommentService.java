package com.myweb.www.service;

import java.util.List;

import com.myweb.www.domain.CommentVO;
import com.myweb.www.domain.PagingVO;
import com.myweb.www.handler.PagingHandler;

public interface CommentService {

	int post(CommentVO cvo);

	/* List<CommentVO> getList(long bno, PagingVO pgvo); */
	
	PagingHandler getList(long bno,PagingVO pgvo);

	int modify(CommentVO cvo);

	int delete(long cno);

}
