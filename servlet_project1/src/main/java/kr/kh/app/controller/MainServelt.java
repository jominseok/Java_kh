package kr.kh.app.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class MainServelt extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	public MainServelt() {
		
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// jsp파일에서 받은 데이터 값을 받는 방법 예제
		String data = request.getParameter("data");
		System.out.println("전송받은 데이터 : " + data);
		String id = request.getParameter("id");
		System.out.println("전송받은 ID : " + id);
		//화면으로 나이를 전송
		int age = 30;
		request.setAttribute("age", age);//서버에서 화면으로 age을 전송
		request.getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
	}

	
}
