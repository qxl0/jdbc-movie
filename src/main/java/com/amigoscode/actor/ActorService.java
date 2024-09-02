package com.amigoscode.actor;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ActorService {

    private final ActorDao actorDao;

    public ActorService(ActorDao actorDao) {
        this.actorDao = actorDao;
    }

    public List<Actor> getActors() {
        return actorDao.selectActors();
    }

    public void addActor(Actor actor) {
        int res = actorDao.insertActor(actor);
        if (res != 1) {
            throw new IllegalStateException("Failed to insert actor");
        }
    }

    public void deleteActor(Integer actorId) {
        Optional<Actor> actor = actorDao.selectActorById(actorId);
        actor.ifPresentOrElse(act -> {
            int res = actorDao.deleteActor(actorId);
            if (res != 1) {
                throw new IllegalStateException("Failed to delete actor");
            }
        }, () -> {
            throw new IllegalStateException("Actor not found");
        });
    }

    public Actor getActor(Integer actorId) {
        return actorDao.selectActorById(actorId)
                .orElseThrow(() -> new IllegalStateException("Actor not found"));
    }
}
