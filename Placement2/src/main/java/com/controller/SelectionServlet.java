package com.controller;

import com.dao.SelectionDAO;
import com.google.gson.Gson;
import com.model.Selection;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/saveSelection")
public class SelectionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private SelectionDAO selectionDao = new SelectionDAO();

    public SelectionServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String town = request.getParameter("town");
        List<String> stores = null;
        List<String> ranks = null;
        List<String> products = null;

        try {
            stores = selectionDao.getStoresByTown(town);
            ranks = selectionDao.getRanks();
            products = selectionDao.getProducts();
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.setContentType("application/json");
        PrintWriter out = response.getWriter();

        out.println("{");
        out.println("\"stores\": " + new Gson().toJson(stores) + ",");
        out.println("\"ranks\": " + new Gson().toJson(ranks) + ",");
        out.println("\"products\": " + new Gson().toJson(products));
        out.println("}");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String town = request.getParameter("town");
        String store = request.getParameter("store");
        String rank = request.getParameter("rank");
        String product = request.getParameter("product");
        String facings = request.getParameter("facings");

        Selection selection = new Selection(town, store, rank, product, facings);

        try {
            selectionDao.saveSelection(selection);
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect("selection.jsp"); // Redirect to the selection page after saving
    }
}
