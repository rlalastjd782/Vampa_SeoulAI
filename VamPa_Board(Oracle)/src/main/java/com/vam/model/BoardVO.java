package com.vam.model;

import java.util.Date;

import lombok.Data;
//data 의 자동완성을 이용하여 롬복생성(게터세터 등등)
@Data
public class BoardVO {
	//value Object 값을 정하고있는객체
	
    /* 게시판 번호 */
    private int bno;
    
    /* 게시판 제목 */
    private String title;
    
    /* 게시판 내용 */
    private String content;
    
    /* 게시판 작가 */
    private String writer;
    
    /* 등록 날짜 */
    private Date regdate;
    
    /* 수정 날짜 */
    private Date updateDate;
    
    
	
}
