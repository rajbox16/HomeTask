----------------Table categories----------------------

-- Table: public.categories


-- DROP TABLE public.categories;

CREATE TABLE public.categories
(
category_id integer ,
category_id_lvl_0 integer ,
category_id_lvl_1 integer ,
category_id_lvl_2 integer ,
category_title_lvl_0 text,
category_title_lvl_1 text,
category_title_lvl_2 text,
PRIMARY KEY (category_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.categories
    OWNER to postgres;


----------------Table GB_videos_temp----------------------

-- Table: public.GB_videos_temp


-- DROP TABLE public.GB_videos_temp;

CREATE TABLE public.GB_videos_temp
(
rowid integer ,
video_id text,
trending_date text,
title text,
channel_title text,
publish_time text,
views integer ,
likes integer ,
dislikes integer ,
comment_count integer ,
thumbnail_link text,
comments_disabled text,
ratings_disabled text,
video_error_or_removed text,
description text,
country text,
tags text,
category_id integer

)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.GB_videos_temp
    OWNER to postgres;
	
----------------Table GB_videos----------------------

-- Table: public.GB_videos


-- DROP TABLE public.GB_videos;

CREATE TABLE public.GB_videos
(
rowid integer ,
video_id text,
trending_date date,
title text,
channel_title text,
publish_time timestamp,
views integer ,
likes integer ,
dislikes integer ,
comment_count integer ,
thumbnail_link text,
comments_disabled text,
ratings_disabled text,
video_error_or_removed text,
description text,
country text,
tags text,
category_id integer ,

PRIMARY KEY (category_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.GB_videos
    OWNER to postgres;