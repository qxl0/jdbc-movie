package com.amigoscode.movie;

public class MoviePlay {
    public long id;
    public long actorId;

    public MoviePlay(long id, long actorId) {
        this.id = id;
        this.actorId = actorId;
    }

    public long getMovieId() {
        return id;
    }

    public void setMovieId(long id) {
        this.id = id;
    }

    public long getActorId() {
        return actorId;
    }

    public void setActorId(long actorId) {
        this.actorId = actorId;
    }
}
