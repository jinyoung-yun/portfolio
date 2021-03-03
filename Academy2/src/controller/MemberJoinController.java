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
import service.MemberJoinService;

@WebServlet("/MemberJoinController")
public class MemberJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MemberJoinController() {
        super();
    }
	protected void doProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		request.setCharacterEncoding("utf8");
		response.setCharacterEncoding("utf8");
		MemberJoinService memberjoinsvc = new MemberJoinService();
		int userNum =  memberjoinsvc.nextNum();
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		String userName = request.getParameter("userName");
		String userPhone = request.getParameter("userPhone");
		String userGender = request.getParameter("userGender");
		String userAddr = request.getParameter("userAddr");
		String userEmail = request.getParameter("userEmail1")+"@"+request.getParameter("userEmail2");
		MemberDTO member = new MemberDTO();
		member.setUserNum(userNum);
		member.setUserId(userId);
		member.setUserPw(userPw);
		member.setUserName(userName);
		member.setUserPhone(userPhone);
		member.setUserGender(userGender);
		member.setUserAddr(userAddr);
		member.setUserEmail(userEmail);
		
		
		PrintWriter out = response.getWriter();

		int joinResult = memberjoinsvc.memberJoin(member);
				
		
		System.out.println("JOIN CONTROLLER RESULT(F/0 : T/1) : "+joinResult);
		System.out.println("INSERT INTO MEMBERS VALUES("+userNum+","+userId+","+userName+","+userPhone+","+
		userGender+","+userAddr+","+userEmail+")");
		if (joinResult == 1) {
			request.getSession().setAttribute("messageType", "성공 메시지");
			request.getSession().setAttribute("messageContent", "회원가입에 성공하였습니다.");
			response.sendRedirect("LoginForm.jsp");
		}else if(joinResult != 1) {
			if(userId == null || userId.equals("") || userPw == null || userPw.equals("") 
					|| userName == null || userName.equals("") || userPhone == null 
					|| userPhone.equals("")){
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "필수 항목을 입력하세요"
										+ "(아이디 , 비밀번호 , 이름 , 전화번호)" );
			response.sendRedirect("JoinForm.jsp");
							
								return;
							}
			response.sendRedirect("JoinForm.jsp");
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doProcess(request, response);
	}

}
