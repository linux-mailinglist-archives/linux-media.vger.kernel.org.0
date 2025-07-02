Return-Path: <linux-media+bounces-36607-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A80AF5C85
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 17:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 906F94855C1
	for <lists+linux-media@lfdr.de>; Wed,  2 Jul 2025 15:15:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C028230B98D;
	Wed,  2 Jul 2025 15:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pzw+e1Xz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC992853F9
	for <linux-media@vger.kernel.org>; Wed,  2 Jul 2025 15:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751469329; cv=none; b=Tlk3PIQv+PwtSgOZuTgDfh275xc7QV8riqRwMIWK5iKPnkg7+8QRklMnL2RsVnV903naDhd/SFw1FEEtbz/02BHx35EsQpOZW1hBqAXuNAp1AWkvD6kmGTDQfEa2Ua3sMdwgKKnu9PZDXEWDhTdHf0krjr3qoKkCd4EXa/HjoTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751469329; c=relaxed/simple;
	bh=syoS+t0FqvDmTfTZbbijeIntzIF7d1BaJJW14/LsRYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2BHnwuxg/nKRQbiijSQY3sBNarGUkVrx+7tddoKV6FD5p9QG4c6j1t67l9grpFfUZu4q0L7U5hTPfhMHNFjqa+oL4YavQdaDOs5Ad+yxfzpwIIivwrr14au32ONNWdkeaJUlqGQAOUMX5rKGhCnAv9L5tjIQSmTvsGN9h4fbwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pzw+e1Xz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53FF51D4C;
	Wed,  2 Jul 2025 17:14:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751469299;
	bh=syoS+t0FqvDmTfTZbbijeIntzIF7d1BaJJW14/LsRYw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pzw+e1XzkI24HFlZYrbTrkSlhSv+o6vwxQ0W11eQ03U6xvuypq0dQPltAYR3NlPqF
	 AlFBFwGh0ppIO/qzJT6l7IaXNumWBzZmicrsMzlCOS098brw4uGurYunfy5wnQ5yp8
	 JNAVQ6tvmMDIpMuTMTdW/R8wZBKAbq0nhyunXyDI=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Wed, 02 Jul 2025 16:15:03 +0100
Subject: [PATCH 2/4] media: mc: entity: Embed entity iterator in pipeline
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pipelines-v1-2-34525973e773@ideasonboard.com>
References: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
In-Reply-To: <20250702-pipelines-v1-0-34525973e773@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8445;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=syoS+t0FqvDmTfTZbbijeIntzIF7d1BaJJW14/LsRYw=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBoZU0IJUizTSJsspxzNbDMR4cyvEHH6/zgc4gwB
 jjSg22aq+CJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaGVNCAAKCRDISVd6bEV1
 MoUUD/9aj3tLAO1JxYm2SQpwrzE0G0Iubg6VtySrZXXAQQee1rXmUYNRQkLKd9b8MThm6ohTnLd
 QHzw08nT24hzEn8tQuzHRzOYP4RbERGl1zxdMX5d2gobrfxp04JdDGmHddW9GBy+LO8iuHPUG0e
 hqJuJ9ShdUcau484IaqC+NkyBS1Yz4NClXr1pLaLgdy4Xvez7sTXwwRkpXw/YZCY4jGx18qRTTD
 broB9tH1Pe3ze+gC4vDw5S0QfIdRgFbSz/3p+TM1n3x1ApcustoZQn9dE6HQp1UjchYlGlcvQTI
 5f48JCvxsCgdooyPmGrFYgth0KoZt2kp5x+vnyIwX05pRe6XkjueFmagexllcfQ8wbwM7oO26H3
 kjiOskRqah6e7RBMIp62qWbl0j2dy4/28QTAPeNgBp3f7oO0MEMF3gcg0vN/d7SlY4ZUcg7RLJZ
 OMlz+dlj/2HNpM3nHJO2iGqshS+C/Nf2xL/7+GZOgh6winNz8FGn88pgtkfXDDMBAl/gLEnn2IT
 0/Z34jt13uGoL9XD18BBuz9n7Tmgb00xL3xYdLInr54ueujyIrXdgh1Bo6Zwu6FzSsJuc8fBtw5
 p7DkZjE2uEQLiZdh2GTgr11v6H/u6kIRMp6LcNdB0AamlXaTxVQi/JmFxLgLquX+DVuOdnZV35h
 upKOuH41g1AJ9pA==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6

Embed a struct media_pipeline_entity_iter into struct media_pipeline.
Init the iterator in _media_pipeline_start() and clean it up during
media_pipeline_cleanup(). Update call-sites for the related functions
to not require a pointer to a struct media_pipeline_entity_iter.

With this change the following functions no longer need to be
exported; make them static.

media_pipeline_entity_iter_init()
media_pipeline_entity_iter_cleanup()

Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c                  | 24 ++++++----
 drivers/media/platform/ti/omap3isp/ispvideo.c |  9 +---
 include/media/media-entity.h                  | 64 +++++++--------------------
 3 files changed, 33 insertions(+), 64 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index eef2fd4b73a11eba143243c964852cd494422204..30d15a180ad4525e9438083216ac328a4b76653a 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -704,24 +704,22 @@ static int media_pipeline_explore_next_link(struct media_pipeline *pipe,
 	return 0;
 }
 
-int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
-				    struct media_pipeline_entity_iter *iter)
+static int media_pipeline_entity_iter_init(struct media_pipeline *pipe)
 {
-	return media_entity_enum_init(&iter->ent_enum, pipe->mdev);
+	return media_entity_enum_init(&pipe->entity_iter.ent_enum, pipe->mdev);
 }
-EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_init);
 
-void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter)
+static void media_pipeline_entity_iter_cleanup(struct media_pipeline *pipe)
 {
-	media_entity_enum_cleanup(&iter->ent_enum);
+	media_entity_enum_cleanup(&pipe->entity_iter.ent_enum);
 }
-EXPORT_SYMBOL_GPL(media_pipeline_entity_iter_cleanup);
 
 struct media_entity *
 __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
-				  struct media_pipeline_entity_iter *iter,
 				  struct media_entity *entity)
 {
+	struct media_pipeline_entity_iter *iter = &pipe->entity_iter;
+
 	if (!entity)
 		iter->cursor = pipe->pads.next;
 
@@ -733,7 +731,7 @@ __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
 		entity = ppad->pad->entity;
 		iter->cursor = iter->cursor->next;
 
-		if (!media_entity_enum_test_and_set(&iter->ent_enum, entity))
+		if (!media_entity_enum_test(&iter->ent_enum, entity))
 			return entity;
 	}
 
@@ -743,6 +741,8 @@ EXPORT_SYMBOL_GPL(__media_pipeline_entity_iter_next);
 
 static void media_pipeline_cleanup(struct media_pipeline *pipe)
 {
+	media_pipeline_entity_iter_cleanup(pipe);
+
 	while (!list_empty(&pipe->pads)) {
 		struct media_pipeline_pad *ppad;
 
@@ -928,6 +928,12 @@ __must_check int __media_pipeline_start(struct media_pad *origin,
 		pad->pipe = pipe;
 	}
 
+	ret = media_pipeline_entity_iter_init(pipe);
+	if (ret) {
+		dev_err(mdev->dev, "Failed to init pipeline iterator\n");
+		goto error;
+	}
+
 	pipe->start_count++;
 
 	return 0;
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index 78e30298c7ad155c70a2a369daa8c232b97e55b7..54ff16d4a2ef1cb6436de98487851caa6e380d7d 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -221,16 +221,11 @@ isp_video_remote_subdev(struct isp_video *video, u32 *pad)
 static int isp_video_get_graph_data(struct isp_video *video,
 				    struct isp_pipeline *pipe)
 {
-	struct media_pipeline_entity_iter iter;
 	struct media_entity *entity;
 	struct isp_video *far_end = NULL;
 	int ret;
 
-	ret = media_pipeline_entity_iter_init(&pipe->pipe, &iter);
-	if (ret)
-		return ret;
-
-	media_pipeline_for_each_entity(&pipe->pipe, &iter, entity) {
+	media_pipeline_for_each_entity(&pipe->pipe, entity) {
 		struct isp_video *__video;
 
 		media_entity_enum_set(&pipe->ent_enum, entity);
@@ -249,8 +244,6 @@ static int isp_video_get_graph_data(struct isp_video *video,
 			far_end = __video;
 	}
 
-	media_pipeline_entity_iter_cleanup(&iter);
-
 	if (video->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) {
 		pipe->input = far_end;
 		pipe->output = video;
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 64cf590b11343f68a456c5870ca2f32917c122f9..0f3bad2b9c319b1792bd62fff336bf09c1a42c1b 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -97,6 +97,17 @@ struct media_graph {
 	int top;
 };
 
+/**
+ * struct media_pipeline_entity_iter - Iterator for media_pipeline_for_each_entity
+ *
+ * @ent_enum: The entity enumeration tracker
+ * @cursor: The current element
+ */
+struct media_pipeline_entity_iter {
+	struct media_entity_enum ent_enum;
+	struct list_head *cursor;
+};
+
 /**
  * struct media_pipeline - Media pipeline related information
  *
@@ -104,12 +115,14 @@ struct media_graph {
  * @mdev:		The media device the pipeline is part of
  * @pads:		List of media_pipeline_pad
  * @start_count:	Media pipeline start - stop count
+ * @entity_iter:	Iterator for media_pipeline_for_each_entity()
  */
 struct media_pipeline {
 	bool allocated;
 	struct media_device *mdev;
 	struct list_head pads;
 	int start_count;
+	struct media_pipeline_entity_iter entity_iter;
 };
 
 /**
@@ -139,17 +152,6 @@ struct media_pipeline_pad_iter {
 	struct list_head *cursor;
 };
 
-/**
- * struct media_pipeline_entity_iter - Iterator for media_pipeline_for_each_entity
- *
- * @ent_enum: The entity enumeration tracker
- * @cursor: The current element
- */
-struct media_pipeline_entity_iter {
-	struct media_entity_enum ent_enum;
-	struct list_head *cursor;
-};
-
 /**
  * struct media_link - A link object part of a media graph.
  *
@@ -1211,55 +1213,23 @@ __media_pipeline_pad_iter_next(struct media_pipeline *pipe,
 	     pad != NULL;						\
 	     pad = __media_pipeline_pad_iter_next((pipe), iter, pad))
 
-/**
- * media_pipeline_entity_iter_init - Initialize a pipeline entity iterator
- * @pipe: The pipeline
- * @iter: The iterator
- *
- * This function must be called to initialize the iterator before using it in a
- * media_pipeline_for_each_entity() loop. The iterator must be destroyed by a
- * call to media_pipeline_entity_iter_cleanup after the loop (including in code
- * paths that break from the loop).
- *
- * The same iterator can be used in multiple consecutive loops without being
- * destroyed and reinitialized.
- *
- * Return: 0 on success or a negative error code otherwise.
- */
-int media_pipeline_entity_iter_init(struct media_pipeline *pipe,
-				    struct media_pipeline_entity_iter *iter);
-
-/**
- * media_pipeline_entity_iter_cleanup - Destroy a pipeline entity iterator
- * @iter: The iterator
- *
- * This function must be called to destroy iterators initialized with
- * media_pipeline_entity_iter_init().
- */
-void media_pipeline_entity_iter_cleanup(struct media_pipeline_entity_iter *iter);
-
 struct media_entity *
 __media_pipeline_entity_iter_next(struct media_pipeline *pipe,
-				  struct media_pipeline_entity_iter *iter,
 				  struct media_entity *entity);
 
 /**
  * media_pipeline_for_each_entity - Iterate on all entities in a media pipeline
  * @pipe: The pipeline
- * @iter: The iterator (struct media_pipeline_entity_iter)
  * @entity: The iterator entity
  *
  * Iterate on all entities in a media pipeline. This is only valid after the
  * pipeline has been built with media_pipeline_start() and before it gets
- * destroyed with media_pipeline_stop(). The iterator must be initialized with
- * media_pipeline_entity_iter_init() before iteration, and destroyed with
- * media_pipeline_entity_iter_cleanup() after (including in code paths that
- * break from the loop).
+ * destroyed with media_pipeline_stop().
  */
-#define media_pipeline_for_each_entity(pipe, iter, entity)			\
-	for (entity = __media_pipeline_entity_iter_next((pipe), iter, NULL);	\
+#define media_pipeline_for_each_entity(pipe, entity)			\
+	for (entity = __media_pipeline_entity_iter_next((pipe), NULL);	\
 	     entity != NULL;							\
-	     entity = __media_pipeline_entity_iter_next((pipe), iter, entity))
+	     entity = __media_pipeline_entity_iter_next((pipe), entity))
 
 /**
  * media_pipeline_alloc_start - Mark a pipeline as streaming

-- 
2.34.1


