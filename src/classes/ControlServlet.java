package classes;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "ControlServlet", urlPatterns = "/jsp/result.forward")
public class ControlServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        HttpSession session = req.getSession();
        ActionBean actionBean = (ActionBean)session.getAttribute("actionBean");
        if(actionBean != null) {
            int result = actionBean.getFirstNumber() + actionBean.getSecondNumber();
            actionBean.setResult(result);
            session.setAttribute("actionBean", actionBean);
            System.out.println(actionBean);
        } else{
            resp.getWriter().println("Странно, объект тютю");
        }
        System.out.println("Переход на результат");
        getServletContext().getRequestDispatcher("/jsp/result.jsp").forward(req, resp);
    }
}
