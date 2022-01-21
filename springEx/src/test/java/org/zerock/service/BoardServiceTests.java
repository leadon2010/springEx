package org.zerock.service;

import static org.junit.Assert.assertNotNull;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardServiceTests {

	@Setter(onMethod_ = { @Autowired })
	private BoardService service;

	@Test
	public void testExists() {
		log.info(service);
		assertNotNull(service);
	}

	@Test
	public void testRegister() {
		BoardVO board = new BoardVO();
		board.setTitle("새로 작성하는 글");
		board.setContent("새로 작엇하는 내용");
		board.setWriter("newbie");

//		service.register(board);

		log.info("생성된 세기물의 버호: " + board.getBno());
	}

	@Test
	public void testGetList() {
		service.getList(new Criteria(2, 10)).forEach(board -> log.info(board));
	}

	@Test
	public void testGet() {
		log.info(service.get(3L));
	}

	@Test
	public void testDelete() {
		log.info("REMOVE RESULT: " + service.remove(1L));
	}

	@Test
	public void testUpdate() {
		BoardVO board = service.get(2L);
		if (board == null) {
			return;
		}
		board.setTitle("제목 수정");
		log.info("MODIFY RESULT: " + service.modify(board));
	}
}
