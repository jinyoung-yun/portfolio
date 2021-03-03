package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dto.MemberDTO;
import service.MemberViewService;

@WebServlet("/MemberModifyController")
public class MemberModifyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberModifyController() {
        super();
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println("memberModifyController Session userId : " + userId);
		
		MemberViewService memberviewsvc = new MemberViewService();
		MemberDTO memberInfo = memberviewsvc.memberView(userId);
		
		request.setAttribute("memberInfo", memberInfo);
			RequestDispatcher dispatcher = 
		request.getRequestDispatcher("memberModify.jsp");
		
		dispatcher.forward(request,response);
    	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request, response);
	}

}
