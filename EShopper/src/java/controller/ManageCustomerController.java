/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Vector;
import model.User;

/**
 *
 * @author Van Minh Tuan
 */
public class ManageCustomerController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Vector<User> customers = (new UserDAO()).getAllCustomer();
        String service = req.getParameter("service");

        if (service == null) {
            service = "listAllCustomers";
        }

        if (service.equals("listAllCustomers")) {
            req.setAttribute("manageCustomer", "Yes");
            req.setAttribute("allCustomers", customers);
            req.getRequestDispatcher("admin.index.jsp").forward(req, resp);
        }

        if (service.equals("ban")) {
            int id = Integer.parseInt(req.getParameter("id"));
            (new UserDAO()).banAnUser(id);

            customers = (new UserDAO()).getAllCustomer();
            req.setAttribute("manageCustomer", "Yes");
            req.setAttribute("allCustomers", customers);
            req.getRequestDispatcher("admin.index.jsp").forward(req, resp);
        }
    }

}
