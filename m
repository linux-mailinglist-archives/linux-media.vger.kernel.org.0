Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4A18B827A
	for <lists+linux-media@lfdr.de>; Thu, 19 Sep 2019 22:32:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404550AbfISUcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 19 Sep 2019 16:32:22 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44534 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387854AbfISUcW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 19 Sep 2019 16:32:22 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8658328E5C9
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, laurent.pinchart@ideasonboard.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        andre.almeida@collabora.com, skhan@linuxfoundation.org,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com
Subject: [PATCH 1/5] media: vimc: upon streaming, check that the pipeline starts with a source entity
Date:   Thu, 19 Sep 2019 23:32:04 +0300
Message-Id: <20190919203208.12515-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
References: <20190919203208.12515-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Userspace can disable links and create pipelines that
do not start with a source entity. Trying to stream
from such a pipeline should fail with -EPIPE
currently this is not handled and cause kernel crash.

Reproducing the crash:
media-ctl -d0 -l "5:1->21:0[0]" -v
v4l2-ctl -z platform:vimc -d "RGB/YUV Capture" -v width=1920,height=1440
v4l2-ctl --stream-mmap --stream-count=100 -d /dev/video2

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/media/platform/vimc/vimc-streamer.c | 39 +++++++++++++++------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/vimc/vimc-streamer.c b/drivers/media/platform/vimc/vimc-streamer.c
index faa2879c25df..d0a9f8a0f26a 100644
--- a/drivers/media/platform/vimc/vimc-streamer.c
+++ b/drivers/media/platform/vimc/vimc-streamer.c
@@ -12,6 +12,19 @@
 
 #include "vimc-streamer.h"
 
+/**
+ * Check if the entity has only source pads
+ */
+static bool vimc_is_source(struct media_entity *ent)
+{
+	int i;
+
+	for (i = 0; i < ent->num_pads; i++)
+		if (ent->pads[i].flags & MEDIA_PAD_FL_SINK)
+			return false;
+	return true;
+}
+
 /**
  * vimc_get_source_entity - get the entity connected with the first sink pad
  *
@@ -82,14 +95,12 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 	struct media_entity *entity;
 	struct video_device *vdev;
 	struct v4l2_subdev *sd;
-	int ret = 0;
+	int ret = -EINVAL;
 
 	stream->pipe_size = 0;
 	while (stream->pipe_size < VIMC_STREAMER_PIPELINE_MAX_SIZE) {
-		if (!ved) {
-			vimc_streamer_pipeline_terminate(stream);
-			return -EINVAL;
-		}
+		if (!ved)
+			break;
 		stream->ved_pipeline[stream->pipe_size++] = ved;
 
 		if (is_media_entity_v4l2_subdev(ved->ent)) {
@@ -98,15 +109,22 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 			if (ret && ret != -ENOIOCTLCMD) {
 				pr_err("subdev_call error %s\n",
 				       ved->ent->name);
-				vimc_streamer_pipeline_terminate(stream);
-				return ret;
+				break;
 			}
 		}
 
 		entity = vimc_get_source_entity(ved->ent);
-		/* Check if the end of the pipeline was reached*/
-		if (!entity)
+		/* Check if the end of the pipeline was reached */
+		if (!entity) {
+			/* the first entity of the pipe should be source only */
+			if (!vimc_is_source(ved->ent)) {
+				pr_err("first entity in the pipe '%s' is not a source\n",
+				       ved->ent->name);
+				ret = -EPIPE;
+				break;
+			}
 			return 0;
+		}
 
 		/* Get the next device in the pipeline */
 		if (is_media_entity_v4l2_subdev(entity)) {
@@ -119,9 +137,8 @@ static int vimc_streamer_pipeline_init(struct vimc_stream *stream,
 			ved = video_get_drvdata(vdev);
 		}
 	}
-
 	vimc_streamer_pipeline_terminate(stream);
-	return -EINVAL;
+	return ret;
 }
 
 /**
-- 
2.20.1

