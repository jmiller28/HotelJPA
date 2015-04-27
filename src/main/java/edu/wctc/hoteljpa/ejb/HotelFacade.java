package edu.wctc.hoteljpa.ejb;

import edu.wctc.hoteljpa.entity.Hotel;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 *
 * @author John Miller
 */
@Stateless
public class HotelFacade extends AbstractFacade<Hotel> {
    private static final Logger LOG = LoggerFactory.getLogger(HotelFacade.class);
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
