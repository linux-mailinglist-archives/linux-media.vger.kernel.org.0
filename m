Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F00FC24A59E
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgHSSG1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726962AbgHSSFX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:05:23 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 851B3C061342
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:23 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id j13so1476602pjd.4
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=SodYVYOpelxlR/PUUgvyS/pSUCifZhOvHlkRHcqoLvU=;
        b=pTORjCFYTNHr6FJHpZFyhc7uKJQ9kxOEGXZ9jwLzM6DfpMu/Nf5UVQtBxfGdk5O/7P
         D3cnLRy9pXc/1iw3r9eApD81U6HkfzHu5s9StgxSriZvVgZ35VHOm910PlxGAP9puNUK
         wekAy52kocggf8/HsOO9LR6BOQYFGKZ34v1oZ7LSnRXlg9zaJTy8EISZ4Ws6w8SheO/Q
         t6ORKGcICcfWfGqNKZPnHqAu1BWwC5vXqNqU26yOVkOSbN84MS3Db78ISCqLM6KV79RA
         wMX+IjZWJ8nYjFQiyyT10lUkc5EVfCRH5unRULSawT7xk+uKDdm9MHMHjOJzOQJO7e5s
         FokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=SodYVYOpelxlR/PUUgvyS/pSUCifZhOvHlkRHcqoLvU=;
        b=HtBz87UQIYqXzXKi7TL2iEUKkxftqoVBlQbhbT/igOcQz8+nwKm/v4fdTbyldnKz9C
         PbMNHdeyteqvCZErcdewJMwWi4HhuQVGsPmpmG3IDvHJ+Og1Q8XQ4x94xsQm8UcAZ/MS
         9BLrlIzOEwpSkPtUlKRBX77wSQY+RcnyBS2edg4jwoRibrf2Q7NV11sq0hEeRA4lUWnD
         8Mofk8YZAehriD64+vgcMs6ApBCP6AzxlLoq+FOeZm7ihyqsNMV8OHNJLjf2sADlfK/H
         etTTayWp0n0rw7RLH0D8tL0VhlTkbY0AS61A20yahNCapHmcnMnz5dH3yfXRlmXHdWOI
         ZBXQ==
X-Gm-Message-State: AOAM531f7muJS1MsDiZ8sNTo0+m9wtS3NqR2oeslHxs1xmkiZaCL9kZH
        oAKAAIbBcIDS0IgY3ShY9ykGzA==
X-Google-Smtp-Source: ABdhPJy/usO0485ydU9ioIdrovWFV6oMfoabDkun3OhLArWczw0Ai9DvYBq+a94XaEYasHoJoHq2SA==
X-Received: by 2002:a17:902:db83:: with SMTP id m3mr202906pld.68.1597860322843;
        Wed, 19 Aug 2020 11:05:22 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id f18sm29264531pfj.35.2020.08.19.11.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:05:22 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 5/9] media: vimc: Separate closing of stream and thread
Date:   Wed, 19 Aug 2020 23:34:38 +0530
Message-Id: <20200819180442.11630-6-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make separate functions for stopping streaming of entities in path of a
particular stream and stopping thread. This is needed to ensure that
thread doesn't stop when one device stops streaming in case of multiple
streams.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 .../media/test-drivers/vimc/vimc-streamer.c   | 82 ++++++++++++-------
 1 file changed, 52 insertions(+), 30 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index cc40ecabe95a..6b5ea1537952 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -13,29 +13,59 @@
 #include "vimc-streamer.h"
 
 /**
- * vimc_streamer_pipeline_terminate - Disable stream in all ved in stream
+ * vimc_streamer_pipeline_terminate - Terminate the thread
  *
- * @stream: the pointer to the stream structure with the pipeline to be
- *	    disabled.
+ * @stream: the pointer to the stream structure
  *
- * Calls s_stream to disable the stream in each entity of the pipeline
+ * Erases values of stream struct and terminates the thread
  *
  */
 static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
 {
 	struct vimc_ent_device *ved;
-	struct v4l2_subdev *sd;
 
 	while (stream->pipe_size) {
 		stream->pipe_size--;
 		ved = stream->ved_pipeline[stream->pipe_size];
 		stream->ved_pipeline[stream->pipe_size] = NULL;
+	}
 
-		if (!is_media_entity_v4l2_subdev(ved->ent))
-			continue;
+	kthread_stop(stream->kthread);
+	stream->kthread = NULL;
+}
 
-		sd = media_entity_to_v4l2_subdev(ved->ent);
-		v4l2_subdev_call(sd, video, s_stream, 0);
+/**
+ * vimc_streamer_stream_terminate - Disable stream in all ved in stream
+ *
+ * @ved: pointer to the ved for which stream needs to be disabled
+ *
+ * Calls s_stream to disable the stream in each entity of the stream
+ *
+ */
+static void vimc_streamer_stream_terminate(struct vimc_ent_device *ved)
+{
+	struct media_entity *entity = ved->ent;
+	struct video_device *vdev;
+	struct v4l2_subdev *sd;
+
+	while (entity) {
+		if (is_media_entity_v4l2_subdev(ved->ent)) {
+			sd = media_entity_to_v4l2_subdev(ved->ent);
+			v4l2_subdev_call(sd, video, s_stream, 0);
+		}
+		entity = vimc_get_source_entity(ved->ent);
+		if (!entity)
+			break;
+
+		if (is_media_entity_v4l2_subdev(entity)) {
+			sd = media_entity_to_v4l2_subdev(entity);
+			ved = v4l2_get_subdevdata(sd);
+		} else {
+			vdev = container_of(entity,
+					    struct video_device,
+					    entity);
+			ved = video_get_drvdata(vdev);
+		}
 	}
 }
 
@@ -43,25 +73,25 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
  * vimc_streamer_stream_start - Starts streaming for all entities
  * in a stream
  *
- * @ved:    the pointer to the vimc entity initializing the stream
+ * @cved:    the pointer to the vimc entity initializing the stream
  *
  * Walks through the entity graph to call vimc_streamer_s_stream()
  * to enable stream in all entities in path of a stream.
  *
  * Return: 0 if success, error code otherwise.
  */
-static int vimc_streamer_stream_start(struct vimc_stream *stream,
-				      struct vimc_ent_device *ved)
+static int vimc_streamer_stream_start(struct vimc_ent_device *cved)
 {
 	struct media_entity *entity;
 	struct video_device *vdev;
 	struct v4l2_subdev *sd;
+	struct vimc_ent_device *ved = cved;
 	int stream_size = 0;
 	int ret = 0;
 
 	while (stream_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
 		if (!ved) {
-			vimc_streamer_pipeline_terminate(stream);
+			vimc_streamer_stream_terminate(cved);
 			return -EINVAL;
 		}
 
@@ -71,7 +101,7 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
 			if (ret && ret != -ENOIOCTLCMD) {
 				dev_err(ved->dev, "subdev_call error %s\n",
 					ved->ent->name);
-				vimc_streamer_pipeline_terminate(stream);
+				vimc_streamer_stream_terminate(cved);
 				return ret;
 			}
 		}
@@ -84,7 +114,7 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
 				dev_err(ved->dev,
 					"first entity in the pipe '%s' is not a source\n",
 					ved->ent->name);
-				vimc_streamer_pipeline_terminate(stream);
+				vimc_streamer_stream_terminate(cved);
 				pr_info ("first entry not source");
 				return -EPIPE;
 			}
@@ -104,7 +134,7 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
 		stream_size++;
 	}
 
-	vimc_streamer_pipeline_terminate(stream);
+	vimc_streamer_stream_terminate(cved);
 	return -EINVAL;
 }
 
@@ -120,13 +150,14 @@ static int vimc_streamer_stream_start(struct vimc_stream *stream,
  * Return: 0 if success, error code otherwise.
  */
 static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
-				       struct vimc_ent_device *ved)
+				       struct vimc_ent_device *cved)
 {
 	struct media_entity *entity;
 	struct media_device *mdev;
 	struct media_graph graph;
 	struct video_device *vdev;
 	struct v4l2_subdev *sd;
+	struct vimc_ent_device *ved = cved;
 	int ret;
 
 	entity = ved->ent;
@@ -170,6 +201,7 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 		}
 	}
 
+	vimc_streamer_stream_terminate(cved);
 	vimc_streamer_pipeline_terminate(stream);
 	return -EINVAL;
 }
@@ -246,7 +278,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 		if (stream->kthread)
 			return 0;
 
-		ret = vimc_streamer_stream_start(stream, ved);
+		ret = vimc_streamer_stream_start(ved);
 		if (ret)
 			return ret;
 
@@ -260,6 +292,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 		if (IS_ERR(stream->kthread)) {
 			ret = PTR_ERR(stream->kthread);
 			dev_err(ved->dev, "kthread_run failed with %d\n", ret);
+			vimc_streamer_stream_terminate(ved);
 			vimc_streamer_pipeline_terminate(stream);
 			stream->kthread = NULL;
 			return ret;
@@ -269,18 +302,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 		if (!stream->kthread)
 			return 0;
 
-		ret = kthread_stop(stream->kthread);
-		/*
-		 * kthread_stop returns -EINTR in cases when streamon was
-		 * immediately followed by streamoff, and the thread didn't had
-		 * a chance to run. Ignore errors to stop the stream in the
-		 * pipeline.
-		 */
-		if (ret)
-			dev_dbg(ved->dev, "kthread_stop returned '%d'\n", ret);
-
-		stream->kthread = NULL;
-
+		vimc_streamer_stream_terminate(ved);
 		vimc_streamer_pipeline_terminate(stream);
 	}
 
-- 
2.17.1

