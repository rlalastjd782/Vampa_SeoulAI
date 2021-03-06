package com.vam.model;

import lombok.AccessLevel;
import lombok.Data;
import lombok.Setter;


@Data
public class Criteria {

    /* 현재 페이지 */
    private int pageNum;
    
    /* 한 페이지 당 보여질 게시물 갯수 */
    private int amount;
    
    /*검색키워드*/
    private String keyword;
    
    /* 검색 타입 배열 */
    
    private String[] typeArr;
    
    /* 검색 타입 */
    @Setter(AccessLevel.PROTECTED)
    private String type;
    
    public void setType(String type) {
    	this.type = type;
    	this.typeArr = type.split("");
    }
   
    
   
    
    /* 기본 생성자 -> 기봅 세팅 : pageNum = 1, amount = 10 */
    public Criteria() {
        this(1,10);// 이클래스로 만들어진 인스턴스
        			//this() : 클래스 이름에 괄호를 열고 닫고있으니 생성자
        			// 생성자인데 인자가 2개 있으니까 밑의 생성자
        			// 아무인자를 전달하지 않은 기본 생성자로 객체를 만들경우, 1페이지 ,한페이지당 10개로 보이게 만든다.
    }
    
    /* 생성자 => 원하는 pageNum, 원하는 amount */
    public Criteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
    }
	
	
}
