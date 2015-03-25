package edu.wctc.ejb;

import edu.wctc.entity.Hotel;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 *
 * @author John Miller
 */
@Stateless
public class HotelFacade extends AbstractFacade<Hotel> {
    @PersistenceContext(unitName = "hotelPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public HotelFacade() {
        super(Hotel.class);
    }
    
}
