Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC49E24A599
	for <lists+linux-media@lfdr.de>; Wed, 19 Aug 2020 20:06:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727033AbgHSSGA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 Aug 2020 14:06:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbgHSSFe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 Aug 2020 14:05:34 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5442AC061757
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:34 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id d22so12078885pfn.5
        for <linux-media@vger.kernel.org>; Wed, 19 Aug 2020 11:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=es-iitr-ac-in.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=8XgVLwUgTD8/U0v8SNRxtxRcYTbKexUokfLjtNYtAU8=;
        b=A5kqoElaAA/N2CUv0n2oki5dj1mSXiwNtEUgxibghuDJime1icMKoM80k41PgW9KZE
         yysb6ML4hMU9ddJfC6zoYjL9rVO1OBEIE32klDC++oKCQmqWhfMDRq3BuBsMFiVpNHqd
         lA0cIV0I7FDYDYS+WELzVv4TSdEFFdXLoKOdgl4wIZQXHUM50pnPqfGLsXcBEb4x9wCB
         cfFadem/MPCeax+ABbsilwpDd8PthlqMnj+gAB8b54dSikHpPTC2Zv+27G/lHmeBxfTp
         DjmtkcVIs8de3U4JHE70FAhrWk6R/bUxMgIhXpWu/b4gSOyqiWjZJ9Z7oFX8tGPdgpjm
         kztQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=8XgVLwUgTD8/U0v8SNRxtxRcYTbKexUokfLjtNYtAU8=;
        b=FkYVhLgBFw8tlKlXst01q8AXMvogN9a4o3+j4xB3yO9j0cDCYIaDrSD5ysoVdx/Ct3
         2gPV1rXfy/O1pvV0LAF2lTMbd4DZE3GpqGKawWXkHf4T4pbu8JdPRqpw+ZoULCLGfdzu
         5a/yrwcAKx9P9kuQAglYgZ5OEXLdO0jtJvjRFGfsJ3CUUciHQidxPbPHeNYJIJP4rkIp
         Jk0N/obXlFrTCdvewm458GhxQyAyFN3UKoqYDeivwAVMC6OO5/iY+EYZ8f5puK1I7kGd
         TY8eQpoaw+AeKAc1gsuR+BmtaQdtgW7RWO6UFb/0U0mwFMIDhWvAYtEaAan0Na2qOi4+
         XpIg==
X-Gm-Message-State: AOAM530eS1vZjhTYCWkJeASVKh6Jx23fxyAQUHrfWBIdt23ocP5N7tHR
        Pg4WL30EOaUGDrmtHlcXWDmLMQ==
X-Google-Smtp-Source: ABdhPJxJTvbZSSTkAXqY1VgDueP9cacg5w3JD9QPcJ2pKwNQkCJ18KWjcLNkPoQYa/V+4jA3uJmYdg==
X-Received: by 2002:a63:705b:: with SMTP id a27mr15324783pgn.405.1597860333821;
        Wed, 19 Aug 2020 11:05:33 -0700 (PDT)
Received: from kaaira-HP-Pavilion-Notebook ([103.113.213.179])
        by smtp.gmail.com with ESMTPSA id p9sm24941711pge.39.2020.08.19.11.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 11:05:33 -0700 (PDT)
From:   Kaaira Gupta <kgupta@es.iitr.ac.in>
To:     Helen Koike <helen.koike@collabora.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kaaira Gupta <kgupta@es.iitr.ac.in>
Subject: [PATCH v3 7/9] media: vimc: Dynamically allocate stream struct
Date:   Wed, 19 Aug 2020 23:34:40 +0530
Message-Id: <20200819180442.11630-8-kgupta@es.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
References: <20200819180442.11630-1-kgupta@es.iitr.ac.in>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Multiple streams will share same stream struct if we want them to run on
same thread. So remove it from vimc_cap struct so that it doesn't get
destroyed when one of the capture does, and allocate it memory
dynamically. Use kref with it as it will be used by multiple captures.

Signed-off-by: Kaaira Gupta <kgupta@es.iitr.ac.in>
---
 drivers/media/test-drivers/vimc/vimc-capture.c  | 15 +++++++++++----
 drivers/media/test-drivers/vimc/vimc-streamer.c | 17 ++++++-----------
 drivers/media/test-drivers/vimc/vimc-streamer.h |  2 ++
 3 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/media/test-drivers/vimc/vimc-capture.c b/drivers/media/test-drivers/vimc/vimc-capture.c
index 93418cb5a139..73e5bdd17c57 100644
--- a/drivers/media/test-drivers/vimc/vimc-capture.c
+++ b/drivers/media/test-drivers/vimc/vimc-capture.c
@@ -28,7 +28,6 @@ struct vimc_cap_device {
 	spinlock_t qlock;
 	struct mutex lock;
 	u32 sequence;
-	struct vimc_stream stream;
 	struct media_pad pad;
 };
 
@@ -241,19 +240,25 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 {
 	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
 	struct media_entity *entity = &vcap->vdev.entity;
+	struct media_pipeline *pipe = NULL;
+	struct vimc_stream *stream;
 	int ret;
 
 	atomic_inc(&vcap->ved.use_count);
 	vcap->sequence = 0;
 
+	stream = kzalloc(sizeof(*stream), GFP_ATOMIC);
+	kref_init(&stream->refcount);
+	pipe = &stream->pipe;
+
 	/* Start the media pipeline */
-	ret = media_pipeline_start(entity, &vcap->stream.pipe);
+	ret = media_pipeline_start(entity, pipe);
 	if (ret) {
 		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
 		return ret;
 	}
 
-	ret = vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 1);
+	ret = vimc_streamer_s_stream(stream, &vcap->ved, 1);
 	if (ret) {
 		media_pipeline_stop(entity);
 		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
@@ -270,9 +275,11 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 static void vimc_cap_stop_streaming(struct vb2_queue *vq)
 {
 	struct vimc_cap_device *vcap = vb2_get_drv_priv(vq);
+	struct media_pipeline *pipe = vcap->ved.ent->pipe;
+	struct vimc_stream *stream = container_of(pipe, struct vimc_stream, pipe);
 
 	atomic_dec(&vcap->ved.use_count);
-	vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 0);
+	vimc_streamer_s_stream(stream, &vcap->ved, 0);
 
 	/* Stop the media pipeline */
 	media_pipeline_stop(&vcap->vdev.entity);
diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.c b/drivers/media/test-drivers/vimc/vimc-streamer.c
index f5c9e2f3bbcb..fade37bee26d 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.c
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.c
@@ -20,18 +20,13 @@
  * Erases values of stream struct and terminates the thread
  *
  */
-static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
+static void vimc_streamer_pipeline_terminate(struct kref *ref)
 {
-	struct vimc_ent_device *ved;
-
-	while (stream->pipe_size) {
-		stream->pipe_size--;
-		ved = stream->ved_pipeline[stream->pipe_size];
-		stream->ved_pipeline[stream->pipe_size] = NULL;
-	}
+	struct vimc_stream *stream = container_of(ref, struct vimc_stream, refcount);
 
 	kthread_stop(stream->kthread);
 	stream->kthread = NULL;
+	kfree(stream);
 }
 
 /**
@@ -202,7 +197,7 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 	}
 
 	vimc_streamer_stream_terminate(cved);
-	vimc_streamer_pipeline_terminate(stream);
+	kref_put(&stream->refcount, vimc_streamer_pipeline_terminate);
 	return -EINVAL;
 }
 
@@ -298,7 +293,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 			ret = PTR_ERR(stream->kthread);
 			dev_err(ved->dev, "kthread_run failed with %d\n", ret);
 			vimc_streamer_stream_terminate(ved);
-			vimc_streamer_pipeline_terminate(stream);
+			kref_put(&stream->refcount, vimc_streamer_pipeline_terminate);
 		}
 
 	} else {
@@ -306,7 +301,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 			goto out;
 
 		vimc_streamer_stream_terminate(ved);
-		vimc_streamer_pipeline_terminate(stream);
+		kref_put(&stream->refcount, vimc_streamer_pipeline_terminate);
 	}
 out:
 	mutex_unlock(&vimc_streamer_lock);
diff --git a/drivers/media/test-drivers/vimc/vimc-streamer.h b/drivers/media/test-drivers/vimc/vimc-streamer.h
index 3bb6731b8d4d..533c88675362 100644
--- a/drivers/media/test-drivers/vimc/vimc-streamer.h
+++ b/drivers/media/test-drivers/vimc/vimc-streamer.h
@@ -18,6 +18,7 @@
 /**
  * struct vimc_stream - struct that represents a stream in the pipeline
  *
+ * @refcount:		kref object associated with stream struct
  * @pipe:		the media pipeline object associated with this stream
  * @ved_pipeline:	array containing all the entities participating in the
  * 			stream. The order is from a video device (usually a
@@ -32,6 +33,7 @@
  * process frames for the stream.
  */
 struct vimc_stream {
+	struct kref refcount;
 	struct media_pipeline pipe;
 	struct vimc_ent_device *ved_pipeline[VIMC_STREAMER_PIPELINE_MAX_SIZE];
 	unsigned int pipe_size;
-- 
2.17.1

