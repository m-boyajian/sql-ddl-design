CREATE TABLE "referees"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL
);
ALTER TABLE
    "referees" ADD PRIMARY KEY("id");
CREATE TABLE "matches"(
    "id" SERIAL NOT NULL,
    "date" DATE NOT NULL,
    "city" TEXT NOT NULL,
    "referee_id" INTEGER NOT NULL,
    "home_team_id" INTEGER NOT NULL,
    "away_team_id" INTEGER NOT NULL,
    "season_id" INTEGER NOT NULL
);
ALTER TABLE
    "matches" ADD PRIMARY KEY("id");
CREATE TABLE "teams"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "city" TEXT NOT NULL
);
ALTER TABLE
    "teams" ADD PRIMARY KEY("id");
CREATE TABLE "players"(
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "team_id" INTEGER NOT NULL
);
ALTER TABLE
    "players" ADD PRIMARY KEY("id");
CREATE TABLE "goals"(
    "id" SERIAL NOT NULL,
    "player_id" INTEGER NOT NULL,
    "match_id" INTEGER NOT NULL
);
ALTER TABLE
    "goals" ADD PRIMARY KEY("id");
CREATE TABLE "rankings"(
    "id" SERIAL NOT NULL,
    "team_id" INTEGER NOT NULL,
    "match_id" INTEGER NOT NULL,
    "ranking" INTEGER NOT NULL
);
ALTER TABLE
    "rankings" ADD PRIMARY KEY("id");
CREATE TABLE "seasons"(
    "id" SERIAL NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE NOT NULL
);
ALTER TABLE
    "seasons" ADD PRIMARY KEY("id");
ALTER TABLE
    "players" ADD CONSTRAINT "players_team_id_foreign" FOREIGN KEY("team_id") REFERENCES "teams"("id");
ALTER TABLE
    "rankings" ADD CONSTRAINT "rankings_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "matches"("id");
ALTER TABLE
    "matches" ADD CONSTRAINT "matches_season_id_foreign" FOREIGN KEY("season_id") REFERENCES "seasons"("id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_match_id_foreign" FOREIGN KEY("match_id") REFERENCES "matches"("id");
ALTER TABLE
    "goals" ADD CONSTRAINT "goals_player_id_foreign" FOREIGN KEY("player_id") REFERENCES "players"("id");
ALTER TABLE
    "rankings" ADD CONSTRAINT "rankings_team_id_foreign" FOREIGN KEY("team_id") REFERENCES "teams"("id");
ALTER TABLE
    "matches" ADD CONSTRAINT "matches_referee_id_foreign" FOREIGN KEY("referee_id") REFERENCES "referees"("id");