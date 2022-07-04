package com.vam.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.vam.mapper.BoardMapper;
import com.vam.model.BoardVO;

@Service
public class BoardServiceImpl  implements BoardService {

	//외부
	@Autowired
	private BoardMapper mapper;
	
	// 스프링이 관리하는 객체(빈) 은 싱글톤 패턴으로 관리되어 1개의 인스턴스가 유지된다.
	// Autowired를 통해서 new 생성자로 호출없이 그 객체를 사용할 수있다.
	
	
	
	//enroll 함수 안에서는 BoardMapper의 인스턴스를 사용해야하는데
	// 그 인스턴스를 enroll함수안에서 생성한느것이 아니라
	// 외부에서 생성된 것을 주입받아서 사용하고있다.
	//왜 enroll함수안에서 생성안하나
	// 높은응집도 낮은 결합도를 위해서
    @Override
    public void enroll(BoardVO board) {
        
        mapper.enroll(board);
        
    }
	
	
	
	
}
