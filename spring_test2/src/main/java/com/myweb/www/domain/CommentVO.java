package com.myweb.www.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@ToString
@Setter
@Getter
public class CommentVO {
	
	private long cno;
	private long bno;
	private String writer;
	private String content;
	private String regAt;
	private String modAt;

}
