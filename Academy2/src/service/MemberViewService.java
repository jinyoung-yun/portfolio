package service;

import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.MemberDAO;
import dto.MemberDTO;

public class MemberViewService {

	public MemberDTO memberView(String userId) {
		MemberDAO dao = MemberDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);
		MemberDTO memberDTO = dao.memberView(userId);
		close(con);
		
		
		return memberDTO;
	}

}
