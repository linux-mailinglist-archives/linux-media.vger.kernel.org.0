Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C14E96522CC
	for <lists+linux-media@lfdr.de>; Tue, 20 Dec 2022 15:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234090AbiLTOhP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Dec 2022 09:37:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234089AbiLTOhI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Dec 2022 09:37:08 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF636BB4
        for <linux-media@vger.kernel.org>; Tue, 20 Dec 2022 06:36:58 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0755886;
        Tue, 20 Dec 2022 15:36:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1671547012;
        bh=gWpjx1PzNfWrMuBSryKJatFh2V6ZhBNjf1kERFSwlNQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=h7PGcfe/G17zxUPSHTCLszt9QVOEE1rzWi6Mve6rc/2AwBuyb3IiAn972uFBhdiHF
         HJlwnOPkPg/zDYUkzA5V/J0RjS4k/Tzyfhef1Ok+rMSoYhsNGKKd7cTwOk4QGrBDv5
         hE8IIYPu+j9uX0/ftI/edxWsityKZMXg8EtzBIZs=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 4/5] media: ti: omap4iss: Use media_pipeline_for_each_entity()
Date:   Tue, 20 Dec 2022 16:36:38 +0200
Message-Id: <20221220143639.764-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20221220143639.764-1-laurent.pinchart@ideasonboard.com>
References: <20221220143639.764-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace usage of the deprecated media graph walk API with the new
media_pipeline_for_each_entity() and media_pipeline_for_each_pad()
macros.

Even though the entity iterator may seem a better match when build the
entity bitmap in iss_video_stream(), it would not be more efficient as
it would still iterate internally over all pads. As the entity iterator
requires explicit iterator initialization and cleanup calls, the code
would be more complex.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
Changes since v1:

- Initialize and cleanup the iterator
- Use pad iterator in iss_video_streamon()
---
 drivers/staging/media/omap4iss/iss_video.c | 62 ++++++++--------------
 1 file changed, 23 insertions(+), 39 deletions(-)

diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index 0ad70faa9ba0..6b5022808618 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -201,39 +201,34 @@ iss_video_remote_subdev(struct iss_video *video, u32 *pad)
 
 /* Return a pointer to the ISS video instance at the far end of the pipeline. */
 static struct iss_video *
-iss_video_far_end(struct iss_video *video)
+iss_video_far_end(struct iss_video *video, struct iss_pipeline *pipe)
 {
-	struct media_graph graph;
-	struct media_entity *entity = &video->video.entity;
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_pipeline_entity_iter iter;
+	struct media_entity *entity;
 	struct iss_video *far_end = NULL;
+	int ret;
 
-	mutex_lock(&mdev->graph_mutex);
+	ret = media_pipeline_entity_iter_init(&pipe->pipe, &iter);
+	if (ret)
+		return ret;
 
-	if (media_graph_walk_init(&graph, mdev)) {
-		mutex_unlock(&mdev->graph_mutex);
-		return NULL;
-	}
+	media_pipeline_for_each_entity(&pipe->pipe, &iter, entity) {
+		struct iss_video *other;
 
-	media_graph_walk_start(&graph, entity);
-
-	while ((entity = media_graph_walk_next(&graph))) {
 		if (entity == &video->video.entity)
 			continue;
 
 		if (!is_media_entity_v4l2_video_device(entity))
 			continue;
 
-		far_end = to_iss_video(media_entity_to_video_device(entity));
-		if (far_end->type != video->type)
+		other = to_iss_video(media_entity_to_video_device(entity));
+		if (other->type != video->type) {
+			far_end = other;
 			break;
-
-		far_end = NULL;
+		}
 	}
 
-	mutex_unlock(&mdev->graph_mutex);
-
-	media_graph_walk_cleanup(&graph);
+	media_pipeline_entity_iter_cleanup(&iter);
 
 	return far_end;
 }
@@ -850,12 +845,12 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 {
 	struct iss_video_fh *vfh = to_iss_video_fh(fh);
 	struct iss_video *video = video_drvdata(file);
-	struct media_graph graph;
-	struct media_entity *entity = &video->video.entity;
-	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_device *mdev = video->video.entity.graph_obj.mdev;
+	struct media_pipeline_pad_iter iter;
 	enum iss_pipeline_state state;
 	struct iss_pipeline *pipe;
 	struct iss_video *far_end;
+	struct media_pad *pad;
 	unsigned long flags;
 	int ret;
 
@@ -873,13 +868,9 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	pipe->external_rate = 0;
 	pipe->external_bpp = 0;
 
-	ret = media_entity_enum_init(&pipe->ent_enum, entity->graph_obj.mdev);
+	ret = media_entity_enum_init(&pipe->ent_enum, mdev);
 	if (ret)
-		goto err_graph_walk_init;
-
-	ret = media_graph_walk_init(&graph, entity->graph_obj.mdev);
-	if (ret)
-		goto err_graph_walk_init;
+		goto err_entity_enum_init;
 
 	if (video->iss->pdata->set_constraints)
 		video->iss->pdata->set_constraints(video->iss, true);
@@ -888,11 +879,8 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	if (ret < 0)
 		goto err_media_pipeline_start;
 
-	mutex_lock(&mdev->graph_mutex);
-	media_graph_walk_start(&graph, entity);
-	while ((entity = media_graph_walk_next(&graph)))
-		media_entity_enum_set(&pipe->ent_enum, entity);
-	mutex_unlock(&mdev->graph_mutex);
+	media_pipeline_for_each_pad(&pipe->pipe, &iter, pad)
+		media_entity_enum_set(&pipe->ent_enum, pad->entity);
 
 	/*
 	 * Verify that the currently configured format matches the output of
@@ -909,7 +897,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	 * Find the ISS video node connected at the far end of the pipeline and
 	 * update the pipeline.
 	 */
-	far_end = iss_video_far_end(video);
+	far_end = iss_video_far_end(video, pipe);
 
 	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		state = ISS_PIPELINE_STREAM_OUTPUT | ISS_PIPELINE_IDLE_OUTPUT;
@@ -966,8 +954,6 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 		spin_unlock_irqrestore(&video->qlock, flags);
 	}
 
-	media_graph_walk_cleanup(&graph);
-
 	mutex_unlock(&video->stream_lock);
 
 	return 0;
@@ -981,9 +967,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 		video->iss->pdata->set_constraints(video->iss, false);
 	video->queue = NULL;
 
-	media_graph_walk_cleanup(&graph);
-
-err_graph_walk_init:
+err_entity_enum_init:
 	media_entity_enum_cleanup(&pipe->ent_enum);
 
 	mutex_unlock(&video->stream_lock);
-- 
Regards,

Laurent Pinchart

