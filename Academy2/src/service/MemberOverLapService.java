package service;

import static db.JdbcUtil.*;

import java.sql.Connection;

import dao.MemberDAO;

public class MemberOverLapService {

	public int registerCheck(String userId) {

		MemberDAO dao = MemberDAO.getInstance();
		Connection con = getConnection();
		dao.setConnection(con);

		int result = dao.idCheck(userId);
		System.out.println(result);
		close(con);
		return result;
	}

}
