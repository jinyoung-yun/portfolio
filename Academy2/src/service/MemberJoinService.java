package service;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.MemberDAO;
import dto.MemberDTO;

public class MemberJoinService {

	public int memberJoin(MemberDTO member) {
		MemberDAO dao = MemberDAO.getInstance();
		
		Connection con = getConnection();
		
		dao.setConnection(con);
		
		int joinResult = dao.memberJoin(member);
		
		if(joinResult > 0) {
			commit(con);
			joinResult = 1;
		}else {
			rollback(con);
			joinResult = 0;
		}
		close(con);
		return joinResult;
	}

	public int nextNum() {
		MemberDAO dao = MemberDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		int nextResult = dao.nextUserNum();
		return nextResult;
	}

	
	
}
