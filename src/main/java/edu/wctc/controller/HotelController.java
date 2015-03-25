package edu.wctc.controller;

import edu.wctc.ejb.HotelFacade;
import edu.wctc.entity.Hotel;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author John Miller
 */

public class HotelController extends HttpServlet {

    private final static String DESTINATION = "index.jsp";
    private final static String VIEW_HOTEL = "viewHotel";
    private final static String EDIT_FORM = "editForm";
    private final static String EDIT_HOTEL = "editHotel";
    private final static String ADD_FORM = "addForm";
    private final static String ADD_HOTEL = "addHotel";
    private final static String CANCEL = "cancel";
    private final static String DELETE_HOTEL = "deleteHotel";

    @Inject
    private HotelFacade service;
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {

        response.setContentType("text/html;charset=UTF-8");

//        ServletContext ctx = request.getServletContext();
//        String driverClassName = ctx.getInitParameter("driverClassName");
//        String url = ctx.getInitParameter("url");
//        String username = ctx.getInitParameter("username");
//        String password = ctx.getInitParameter("password");
//        String hotelDao = ctx.getInitParameter("hotelDao");
//        String hotelDb = ctx.getInitParameter("hotelDb");

//        HotelFacade hf = null;
//        hf = new HotelService(driverClassName, url, username, password, 
//                hotelDao, hotelDb);
        
        Hotel hotel = new Hotel();
        
        List<Hotel> hotels = null;
        String addForm = null;
        String editForm = null;
        String viewForm = null;
        String cancel = null;
        String selectedValue = null;
        String selectedAction = "viewHotel";
        if (request.getParameter("action") != null) {
            selectedAction = request.getParameter("action");
        }
        try {
            switch (selectedAction) {
                case VIEW_HOTEL:
                    viewForm = "not null";
                    request.setAttribute("viewForm", viewForm);
                    break;
                case EDIT_FORM:
                    editForm = "not null";
                    selectedValue = request.getParameter("value");
                    hotel = service.find(Long.parseLong(selectedValue));
                    
                    request.setAttribute("hotelId", hotel.getHotelId());
                    request.setAttribute("hotelName", hotel.getHotelName());
                    request.setAttribute("streetAddress", hotel.getStreetAddress());
                    request.setAttribute("city", hotel.getCity());
                    request.setAttribute("state", hotel.getState());
                    request.setAttribute("postalCode", hotel.getPostalCode());
                    request.setAttribute("notes", hotel.getNotes());
                    request.setAttribute("editForm", editForm);
                    break;
                case EDIT_HOTEL:
                    
                    hotel = service.find(Long.parseLong(request.getParameter("hotelId")));
                    hotel.setHotelName(request.getParameter("hotelName"));
                    hotel.setStreetAddress(request.getParameter("streetAddress"));
                    hotel.setCity(request.getParameter("city"));
                    hotel.setState(request.getParameter("state"));
                    hotel.setPostalCode(request.getParameter("postalCode"));
                    hotel.setNotes(request.getParameter("notes"));
                    service.edit(hotel);
                    request.setAttribute("editForm", cancel);
                    viewForm = "not null";
                    request.setAttribute("viewForm", viewForm);
                    break;
                case ADD_FORM:
                    addForm = "not null";
                    request.setAttribute("addForm", addForm);
                    break;
                case ADD_HOTEL:
//                    hotel = new Hotel(request.getParameter("hotelName"),
//                            request.getParameter("streetAddress"),
//                            request.getParameter("city"),
//                            request.getParameter("state"),
//                            request.getParameter("postalCode"),
//                            request.getParameter("notes"));
//                    hs.addNewHotel(hotel);
                    request.setAttribute("addForm", cancel);
                    viewForm = "not null";
                    request.setAttribute("viewForm", viewForm);
                    break;
                case CANCEL:
                    request.setAttribute("addForm", cancel);
                    request.setAttribute("editForm", cancel);
                    viewForm = "not null";
                    request.setAttribute("viewForm", viewForm);
                    break;
                case DELETE_HOTEL:
//                    selectedValue = request.getParameter("value");
//                    hotel.setHotelId(Long.parseLong(selectedValue));
//                    hs.deleteHotel(hotel);
                    viewForm = "not null";
                    request.setAttribute("viewForm", viewForm);
                    break;
            }

            hotels = service.findAll();
            request.setAttribute("hotels", hotels);
            RequestDispatcher view = request.getRequestDispatcher(response.encodeURL(DESTINATION));
            view.forward(request, response);
        } catch (Exception e) {
            throw e;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(HotelController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(HotelController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
