Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6968424A59F
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:06:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgHSSGa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:06:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726946AbgHSSFR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:05:17 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DE26C061757
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:17 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id 2so1462204pjx.5
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=Myk1HtWNfMPMH6mEsQn60wKu3fbOFzXiNMNij+F/fos=;
        b=BEFAAR8MyoIxxx+igVHbbPaDJnsuviiG++309FQfr/cS43lp+JqFtnDa+7fDIohDbq
         w+T/a135DyuxywUD1oltM3KnNAV5z77uRsrpCagXQHy7//9nmOFnm/NziWqcmCdX2u4d
         x7sDD0GCrBENSmRxoiNj0JiFhbJc7Mp/t9dT94k+Vo9JQX5WeCDh2Psz8/fTMXdrjBEb
         2jnod+/vh743GzLDstutDeiEIDFhKhIXEebwzc5vZteiKuiYckfhlkSa60J5oA4r27o+
         LHkyzNYqXfd0tD5bOnAIbVyS2Xsbqv4epqrZAdtuHTbvLz6bIMok11bOkskvOVnfKEeE
         QAMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=Myk1HtWNfMPMH6mEsQn60wKu3fbOFzXiNMNij+F/fos=;
        b=EBL+ihMnveH7CEOSHUaj/TxcHYfFLLx+5zYG50JbO4vwx1xl6+lFa94YAdiMWwN0PJ
         4JqjVufGwDsDB/nKfAyQOPsvJUUbqKK8wst3ObjY2ngC+VI53ZhQdaFMq85hUG792TdN
         MZPf0nv+6lDsceG5R64gngF7q/luwQ3wknIkehgCZCLg2OvZJCbcfut/vLuJytD/BmOo
         MmUuV2/Azi+fxLcICNfz950/xLue5Z5gesbhxlHZqrizx4jHzCOMv3tx5QfMfxbsaFd4
         9KvWCX6UKIahDYPSxhqd5SWeJ2OKAxaGMnsj5LSOXqsNJhUjvAXNBVbUhLYKwxpjQMd/
         OC2A==
X-Gm-Message-State: AOAM530AsA2Qti4olFVnyEUEiqoK+gs+HEYVgHgLeCETjmu2U5YVFU64
        0GQ6lazAmpyNx8HrU4Llj/BRyw==
X-Google-Smtp-Source: ABdhPJyCF6pSzhOSPzo3kzgKW1dmCArD3GflbjqS+gar3ADhQpRU4N4E7ONKEES3VzeqFSvr3z5nXw==
X-Received: by 2002:a17:902:bc8a:: with SMTP id bb10mr19731292plb.74.1597860316960;
        Wed, 19 Aug 2020 11:05:16 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id z25sm29482106pfn.159.2020.08.19.11.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:05:15 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 4/9] media: vimc: Separate starting stream from pipeline initialisation
Date:   Wed, 19 Aug 2020 23:34:37 +0530
Message-Id: <20200819180442.11630-5-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Separate the process of initialising pipeline array from starting
streaming for all entities in path of a stream. This is needed because
multiple streams can stream, but only one pipeline object is needed.

Process frames only for those entities in a pipeline which are
streaming. This is known through their use counts.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 .../media/test-drivers/vimc/vimc-streamer.c   | 95 ++++++++++++++++---
 1 file changed, 83 insertions(+), 12 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index c1644d69686d..cc40ecabe95a 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -40,33 +40,30 @@ static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
 }
 
 /**
- * vimc_streamer_pipeline_init - Initializes the stream structure
+ * vimc_streamer_stream_start - Starts streaming for all entities
+ * in a stream
  *
- * @stream: the pointer to the stream structure to be initialized
  * @ved:    the pointer to the vimc entity initializing the stream
  *
- * Initializes the stream structure. Walks through the entity graph to
- * construct the pipeline used later on the streamer thread.
- * Calls vimc_streamer_s_stream() to enable stream in all entities of
- * the pipeline.
+ * Walks through the entity graph to call vimc_streamer_s_stream()
+ * to enable stream in all entities in path of a stream.
  *
  * Return: 0 if success, error code otherwise.
  */
-static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
-				       struct vimc_ent_device *ved)
+static int vimc_streamer_stream_start(struct vimc_stream *stream,
+				      struct vimc_ent_device *ved)
 {
 	struct media_entity *entity;
 	struct video_device *vdev;
 	struct v4l2_subdev *sd;
+	int stream_size = 0;
 	int ret = 0;
 
-	stream->pipe_size = 0;
-	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
+	while (stream_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
 		if (!ved) {
 			vimc_streamer_pipeline_terminate(stream);
 			return -EINVAL;
 		}
-		stream->ved_pipeline[stream->pipe_size++] = ved;
 
 		if (is_media_entity_v4l2_subdev(ved->ent)) {
 			sd = media_entity_to_v4l2_subdev(ved->ent);
@@ -104,6 +101,73 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 					    entity);
 			ved = video_get_drvdata(vdev);
 		}
+		stream_size++;
+	}
+
+	vimc_streamer_pipeline_terminate(stream);
+	return -EINVAL;
+}
+
+/**
+ * vimc_streamer_pipeline_init - Initialises pipeline and pipe size
+ *
+ * @stream: the pointer to the stream structure
+ * @ved:    the pointer to the vimc entity initializing the stream pipeline
+ *
+ * Walks through the entity graph to initialise ved_pipeline and updates
+ * pipe_size too.
+ *
+ * Return: 0 if success, error code otherwise.
+ */
+static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
+				       struct vimc_ent_device *ved)
+{
+	struct media_entity *entity;
+	struct media_device *mdev;
+	struct media_graph graph;
+	struct video_device *vdev;
+	struct v4l2_subdev *sd;
+	int ret;
+
+	entity = ved->ent;
+	mdev = entity->graph_obj.mdev;
+
+	ret = media_graph_walk_init(&graph, mdev);
+	if (ret)
+		return ret;
+
+	media_graph_walk_start(&graph, entity);
+
+	/*
+	 * Start pipeline array initialisation from RAW Capture only to get
+	 * entities in the correct order of their frame processing.
+	 */
+	if (!strncmp(entity->name, "RGB", 3)) {
+		entity = media_graph_walk_next(&graph);
+		mdev = entity->graph_obj.mdev;
+		media_graph_walk_cleanup(&graph);
+
+		ret = media_graph_walk_init(&graph, mdev);
+		if (ret)
+			return ret;
+		media_graph_walk_start(&graph, entity);
+	}
+
+	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
+		if (is_media_entity_v4l2_subdev(entity)) {
+			sd = media_entity_to_v4l2_subdev(entity);
+			ved = v4l2_get_subdevdata(sd);
+		} else {
+			vdev = container_of(entity, struct video_device, entity);
+			ved = video_get_drvdata(vdev);
+		}
+		stream->ved_pipeline[stream->pipe_size++] = ved;
+		entity = media_graph_walk_next(&graph);
+
+		if (!strcmp(entity->name, stream->ved_pipeline[0]->ent->name)) {
+			media_graph_walk_cleanup(&graph);
+			return 0;
+		}
 	}
 
 	vimc_streamer_pipeline_terminate(stream);
@@ -138,8 +202,11 @@ static int vimc_streamer_thread(void *data)
 
 		for (i = stream->pipe_size - 1; i >= 0; i--) {
 			ved = stream->ved_pipeline[i];
-			ret = ved->process_frame(ved);
 
+			if (atomic_read(&ved->use_count) == 0)
+				continue;
+
+			ret = ved->process_frame(ved);
 			if (ret)
 				break;
 		}
@@ -179,6 +246,10 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 		if (stream->kthread)
 			return 0;
 
+		ret = vimc_streamer_stream_start(stream, ved);
+		if (ret)
+			return ret;
+
 		ret = vimc_streamer_pipeline_init(stream, ved);
 		if (ret)
 			return ret;
-- 
2.17.1

