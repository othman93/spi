package fr.univbrest.dosi.spi.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import fr.univbrest.dosi.spi.bean.Authentification;
import fr.univbrest.dosi.spi.exception.SPIException;
import fr.univbrest.dosi.spi.service.AuthentificationService;
import fr.univbrest.dosi.spi.service.EtudiantService;

/**
 * Authentification Controller
 * @author Youssef
 */
@RestController
public class UserController {
	
	@Autowired
	AuthentificationService authentificationService;

	@Autowired
	EtudiantService etudiantService;
	/**
	 * vérifie si l'utilisateur existe pour s'authentifier sinon l'authentification est refusée 
	 * @param request
	 * @param user
	 */
	@RequestMapping(value = "/auth", method = RequestMethod.POST, headers = "Accept=application/json")
	public void authentifier(final HttpServletRequest request, @RequestBody final Authentification authentification) {
		String login = authentification.getLoginConnection();
		final Authentification auth = authentificationService.logIn(login, authentification.getMotPasse());
		if(auth !=null){
			if( !(auth.getRole().equalsIgnoreCase("ETU"))){
		auth.setMotPasse(null);
			request.getSession().setAttribute("user", auth);
			}
			else if(((auth.getNoEtudiant().getPromotion().getPromotionPK().getAnneeUniversitaire()).equals("2014-2015"))){
				auth.setMotPasse(null);
				request.getSession().setAttribute("user", auth);
			}
			else{
				request.getSession().removeAttribute("user");
				throw new SPIException("l'étudiant n'appartient pas à une promotion de l'année courante");
			}
		} else {
			request.getSession().removeAttribute("user");
			throw new SPIException("impossible de s'authentifier");
		}
	}

	/**
	 * @param request
	 * @param response
	 * @return 
	 * Retourne l'utilisateur connecté
	 */
	@RequestMapping(value = "/user")
	public Authentification users(final HttpServletRequest request, final HttpServletResponse response) {
		final Authentification auth = (Authentification) request.getSession().getAttribute("user");
		return auth;
	}
	
	/**
	 * @param request
	 * Pour se déconnecter, on supprime l'objet user de la session ouverte
	 */
	@RequestMapping(value = "/deconnexion", method = RequestMethod.GET)
	public void authentifier(final HttpServletRequest request) {
		request.getSession().removeAttribute("user");
	}
}