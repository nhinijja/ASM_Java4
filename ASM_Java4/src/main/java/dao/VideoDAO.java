package dao;

import java.util.List;

import entity.Video;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import utils.XJPA;

public class VideoDAO implements DAOInterface<Video, String> {
	EntityManager em = XJPA.getEntityManager();

	@Override
	protected void finalize() throws Throwable {
		em.close();
	}

	@Override
	public List<Video> findAll() {
	    if (!em.isOpen()) {
	        em = XJPA.getEntityManager();  // Tạo lại EntityManager nếu nó đã bị đóng
	    }
	    String jpql = "SELECT o FROM Video o";
	    TypedQuery<Video> query = em.createQuery(jpql, Video.class);
	    List<Video> videos = query.getResultList();

	    for (Video video : videos) {
	        String videoId = extractVideoId(video.getPoster());
	        video.setPoster(videoId); // Ghi đè lại `poster` chỉ chứa ID video
	    }

	    return videos;
	}

	@Override
	public Video findById(String id) {
	    if (!em.isOpen()) {
	        em = XJPA.getEntityManager();  // Nếu EntityManager đã đóng, tạo lại
	    }
	    return em.find(Video.class, id);
	}

	@Override
	public void create(Video t) {
		try {
			em.getTransaction().begin();
			em.persist(t);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}

	@Override
	public boolean deleteById(String id) {
		Video entity = em.find(Video.class, id);
		try {
			em.getTransaction().begin();
			em.remove(entity);
			em.getTransaction().commit();
			return true;
		} catch (Exception e) {
			em.getTransaction().rollback();
			return false;
		}
	}

	@Override
	public void update(Video t) {
		try {
			em.getTransaction().begin();
			em.merge(t);
			em.getTransaction().commit();
		} catch (Exception e) {
			em.getTransaction().rollback();
		}
	}
	public String extractVideoId(String url) {
	    if (url.contains("v=")) {
	        return url.split("v=")[1].split("&")[0]; // Lấy ID và loại bỏ các tham số khác
	    } else {
	        return url; // Nếu đã là Video ID
	    }
	}


	public List<Video> findByTitleKeyword(String keyword) {
		String jpql = "SELECT v FROM Video v WHERE v.title LIKE :keyword";
		TypedQuery<Video> query = em.createQuery(jpql, Video.class);
		query.setParameter("keyword", "%" + keyword + "%");
		return query.getResultList();
	}
	
	
}
