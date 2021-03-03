package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import service.MemberModifyProcessService;

@WebServlet("/MemberModifyProcessController")
public class MemberModifyProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberModifyProcessController() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		MemberDTO MemberModify = new MemberDTO();

		String userId = (String) session.getAttribute("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userAddr = request.getParameter("userAddr");
		String userEmail = request.getParameter("userEmail");
		
		MemberModify.setUserId(userId);
		MemberModify.setUserPw(userPw);
		MemberModify.setUserName(userName);
		MemberModify.setUserPhone(userPhone);
		MemberModify.setUserAddr(userAddr);
		MemberModify.setUserEmail(userEmail);
		
		System.out.println("MemberProcessController Intance / userAddr : "+userAddr);
		MemberModifyProcessService memProcesssvc = new MemberModifyProcessService();
		
		int result = memProcesssvc.memberModify(MemberModify);
		System.out.println("MemberProcessController Result = "+ result + "result 1이상 나와야해");
		if(result > 0) {
			response.sendRedirect("index.jsp");
			System.out.println("마지막 성공");
		}else {
			out.println("<script>");
			out.println("alert('수정 failure')");
			out.println("location.href='MemberModifyController'");
			out.println("</script>");
			System.out.println("마지막 실패");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(request, response);
	}

}
