Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E84819E060
	for <lists+linux-media@lfdr.de>; Fri,  3 Apr 2020 23:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728482AbgDCVdr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Apr 2020 17:33:47 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:60640 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbgDCVdr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Apr 2020 17:33:47 -0400
Received: from floko.floko.floko (unknown [IPv6:2804:431:e7cc:11ff:4f80:3de:e2b2:5c1d])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: koike)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 66D34298779;
        Fri,  3 Apr 2020 22:33:40 +0100 (BST)
From:   Helen Koike <helen.koike@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     kernel@collabora.com, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, hans.verkuil@cisco.com,
        skhan@linuxfoundation.org, niklas.soderlund@ragnatech.se,
        mchehab@kernel.org, Helen Koike <helen.koike@collabora.com>
Subject: [PATCH v2 3/3] media: vimc: use v4l2_pipeline_stream_{enable,disable} helpers
Date:   Fri,  3 Apr 2020 18:33:12 -0300
Message-Id: <20200403213312.1863876-4-helen.koike@collabora.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200403213312.1863876-1-helen.koike@collabora.com>
References: <20200403213312.1863876-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Use v4l2_pipeline_stream_{enable,disable} to call .s_stream() subdevice
callbacks through the pipeline.

Tested streaming works with:

media-ctl -d /dev/media0 -V '"Sensor A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d /dev/media0 -V '"Debayer A":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d /dev/media0 -V '"Sensor B":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d /dev/media0 -V '"Debayer B":0[fmt:SBGGR8_1X8/640x480]'
media-ctl -d /dev/media0 -V '"Scaler":0[fmt:RGB888_1X24/640x480]'
media-ctl -d /dev/media0 -V '"Scaler":0[crop:(100,50)/400x150]'
media-ctl -d /dev/media0 -V '"Scaler":1[fmt:RGB888_1X24/1920x1440]'
v4l2-ctl -d /dev/video2 -v width=1200,height=450
v4l2-ctl -d /dev/video0 -v pixelformat=BA81
v4l2-ctl -d /dev/video1 -v pixelformat=BA81
v4l2-ctl --stream-mmap --stream-count=10 -d /dev/video2 --stream-to=/tmp/test.raw

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

Changes in v2:
- rebase on top of new helpers prototypes

 drivers/media/platform/vimc/vimc-capture.c  | 28 +++++++-----
 drivers/media/platform/vimc/vimc-streamer.c | 49 +++------------------
 2 files changed, 23 insertions(+), 54 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-capture.c b/drivers/media/platform/vimc/vimc-capture.c
index 23e740c1c5c00..2206bfdec1c32 100644
--- a/drivers/media/platform/vimc/vimc-capture.c
+++ b/drivers/media/platform/vimc/vimc-capture.c
@@ -233,21 +233,27 @@ static int vimc_cap_start_streaming(struct vb2_queue *vq, unsigned int count)
 
 	vcap->sequence = 0;
 
-	/* Start the media pipeline */
 	ret = media_pipeline_start(entity, &vcap->stream.pipe);
-	if (ret) {
-		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
-		return ret;
-	}
+	if (ret)
+		goto err_return_all_buffers;
+
+	ret = v4l2_pipeline_stream_enable(&vcap->vdev);
+	if (ret)
+		goto err_stop_media_pipe;
 
 	ret = vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 1);
-	if (ret) {
-		media_pipeline_stop(entity);
-		vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
-		return ret;
-	}
+	if (ret)
+		goto err_stop_stream;
 
 	return 0;
+
+err_stop_stream:
+	v4l2_pipeline_stream_disable(&vcap->vdev);
+err_stop_media_pipe:
+	media_pipeline_stop(entity);
+err_return_all_buffers:
+	vimc_cap_return_all_buffers(vcap, VB2_BUF_STATE_QUEUED);
+	return ret;
 }
 
 /*
@@ -260,6 +266,8 @@ static void vimc_cap_stop_streaming(struct vb2_queue *vq)
 
 	vimc_streamer_s_stream(&vcap->stream, &vcap->ved, 0);
 
+	v4l2_pipeline_stream_disable(&vcap->vdev);
+
 	/* Stop the media pipeline */
 	media_pipeline_stop(&vcap->vdev.entity);
 
diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index 65feb3c596db5..c0085f4695c2f 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -36,33 +36,6 @@ static struct media_entity *vimc_get_source_entity(struct media_entity *ent)
 	return NULL;
 }
 
-/**
- * vimc_streamer_pipeline_terminate - Disable stream in all ved in stream
- *
- * @stream: the pointer to the stream structure with the pipeline to be
- *	    disabled.
- *
- * Calls s_stream to disable the stream in each entity of the pipeline
- *
- */
-static void vimc_streamer_pipeline_terminate(struct vimc_stream *stream)
-{
-	struct vimc_ent_device *ved;
-	struct v4l2_subdev *sd;
-
-	while (stream->pipe_size) {
-		stream->pipe_size--;
-		ved = stream->ved_pipeline[stream->pipe_size];
-		stream->ved_pipeline[stream->pipe_size] = NULL;
-
-		if (!is_media_entity_v4l2_subdev(ved->ent))
-			continue;
-
-		sd = media_entity_to_v4l2_subdev(ved->ent);
-		v4l2_subdev_call(sd, video, s_stream, 0);
-	}
-}
-
 /**
  * vimc_streamer_pipeline_init - Initializes the stream structure
  *
@@ -82,27 +55,15 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 	struct media_entity *entity;
 	struct video_device *vdev;
 	struct v4l2_subdev *sd;
-	int ret = 0;
 
 	stream->pipe_size = 0;
 	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
 		if (!ved) {
-			vimc_streamer_pipeline_terminate(stream);
+			stream->pipe_size = 0;
 			return -EINVAL;
 		}
 		stream->ved_pipeline[stream->pipe_size++] = ved;
 
-		if (is_media_entity_v4l2_subdev(ved->ent)) {
-			sd = media_entity_to_v4l2_subdev(ved->ent);
-			ret = v4l2_subdev_call(sd, video, s_stream, 1);
-			if (ret && ret != -ENOIOCTLCMD) {
-				dev_err(ved->dev, "subdev_call error %s\n",
-					ved->ent->name);
-				vimc_streamer_pipeline_terminate(stream);
-				return ret;
-			}
-		}
-
 		entity = vimc_get_source_entity(ved->ent);
 		/* Check if the end of the pipeline was reached */
 		if (!entity) {
@@ -111,7 +72,7 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 				dev_err(ved->dev,
 					"first entity in the pipe '%s' is not a source\n",
 					ved->ent->name);
-				vimc_streamer_pipeline_terminate(stream);
+				stream->pipe_size = 0;
 				return -EPIPE;
 			}
 			return 0;
@@ -129,7 +90,7 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 		}
 	}
 
-	vimc_streamer_pipeline_terminate(stream);
+	stream->pipe_size = 0;
 	return -EINVAL;
 }
 
@@ -210,7 +171,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 		if (IS_ERR(stream->kthread)) {
 			ret = PTR_ERR(stream->kthread);
 			dev_err(ved->dev, "kthread_run failed with %d\n", ret);
-			vimc_streamer_pipeline_terminate(stream);
+			stream->pipe_size = 0;
 			stream->kthread = NULL;
 			return ret;
 		}
@@ -231,7 +192,7 @@ int vimc_streamer_s_stream(struct vimc_stream *stream,
 
 		stream->kthread = NULL;
 
-		vimc_streamer_pipeline_terminate(stream);
+		stream->pipe_size = 0;
 	}
 
 	return 0;
-- 
2.26.0

