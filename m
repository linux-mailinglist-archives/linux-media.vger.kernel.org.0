Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B94CB5A7FD2
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbiHaOQT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232109AbiHaOPw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40C0813E27
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:15:05 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3BC961026;
        Wed, 31 Aug 2022 16:14:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955265;
        bh=bGBQvX8kkMzI9eUBkQW8/Mg0DKoqA8C5d8TYAAnu8qA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jS73bV+6NSSm7SoCtyjltHX39tStrZYsyX/UOnqRkZOgW6GVZivflaak5B15iQPC7
         2xtj+/3SmOKwFnY0IikBOxfURbzyOAMIjcCqWj2BNLe6ONK/PCIes0PxtO6Qh8uKBg
         39KdsM6rG00Zirm4HiBf4jZcYu/tkZFRpQ2837v4=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v14 12/34] media: mc: entity: add alloc variant of pipeline_start
Date:   Wed, 31 Aug 2022 17:13:35 +0300
Message-Id: <20220831141357.1396081-13-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new variant of media_pipeline_start(), media_pipeline_alloc_start().

media_pipeline_alloc_start() can be used by drivers that do not need to
extend the media_pipeline. The function will either use the pipeline
already associated with the entity, if such exists, or allocate a new
pipeline.

When media_pipeline_stop() is called and the pipeline's use count drops
to zero, the pipeline is automatically freed.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c       | 38 ++++++++++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-dev.c | 11 +++++++++
 include/media/media-entity.h       | 15 ++++++++++++
 include/media/v4l2-dev.h           | 14 +++++++++++
 4 files changed, 78 insertions(+)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index 7fb97c6dc897..ad153a426a36 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -530,6 +530,8 @@ void __media_pipeline_stop(struct media_entity *entity)
 
 	media_graph_walk_cleanup(graph);
 
+	if (pipe->allocated)
+		kfree(pipe);
 }
 EXPORT_SYMBOL_GPL(__media_pipeline_stop);
 
@@ -543,6 +545,42 @@ void media_pipeline_stop(struct media_entity *entity)
 }
 EXPORT_SYMBOL_GPL(media_pipeline_stop);
 
+__must_check int media_pipeline_alloc_start(struct media_entity *entity)
+{
+	struct media_device *mdev = entity->graph_obj.mdev;
+	struct media_pipeline *new_pipe = NULL;
+	struct media_pipeline *pipe;
+	int ret;
+
+	mutex_lock(&mdev->graph_mutex);
+
+	/*
+	 * Is the entity already part of a pipeline? If not, we need to allocate
+	 * a pipe.
+	 */
+	pipe = media_entity_pipeline(entity);
+	if (!pipe) {
+		new_pipe = kzalloc(sizeof(*new_pipe), GFP_KERNEL);
+		if (!new_pipe) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		pipe = new_pipe;
+		pipe->allocated = true;
+	}
+
+	ret = __media_pipeline_start(entity, pipe);
+	if (ret)
+		kfree(new_pipe);
+
+out:
+	mutex_unlock(&mdev->graph_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(media_pipeline_alloc_start);
+
 /* -----------------------------------------------------------------------------
  * Links management
  */
diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 7f933ff89fd4..945bb867a4c1 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1143,6 +1143,17 @@ void __video_device_pipeline_stop(struct video_device *vdev)
 }
 EXPORT_SYMBOL_GPL(__video_device_pipeline_stop);
 
+__must_check int video_device_pipeline_alloc_start(struct video_device *vdev)
+{
+	struct media_entity *entity = &vdev->entity;
+
+	if (entity->num_pads != 1)
+		return -ENODEV;
+
+	return media_pipeline_alloc_start(entity);
+}
+EXPORT_SYMBOL_GPL(video_device_pipeline_alloc_start);
+
 struct media_pipeline *video_device_pipeline(struct video_device *vdev)
 {
 	struct media_entity *entity = &vdev->entity;
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index aaf276f765cf..a77933afaa48 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -100,10 +100,12 @@ struct media_graph {
 /**
  * struct media_pipeline - Media pipeline related information
  *
+ * @allocated:		Media pipeline allocated and freed by the framework
  * @start_count:	Media pipeline start - stop count
  * @graph:		Media graph walk during pipeline start / stop
  */
 struct media_pipeline {
+	bool allocated;
 	int start_count;
 	struct media_graph graph;
 };
@@ -1092,6 +1094,19 @@ void media_pipeline_stop(struct media_entity *entity);
  */
 void __media_pipeline_stop(struct media_entity *entity);
 
+/**
+ * media_pipeline_alloc_start - Mark a pipeline as streaming
+ * @entity: Starting entity
+ *
+ * media_pipeline_alloc_start() is similar to media_pipeline_start() but instead
+ * of working on a given pipeline the function will use an existing pipeline if
+ * the entity is already part of a pipeline, or allocate a new pipeline.
+ *
+ * Calls to media_pipeline_alloc_start() must be matched with
+ * media_pipeline_stop().
+ */
+__must_check int media_pipeline_alloc_start(struct media_entity *entity);
+
 /**
  * media_devnode_create() - creates and initializes a device node interface
  *
diff --git a/include/media/v4l2-dev.h b/include/media/v4l2-dev.h
index 494685872254..643da0740ab0 100644
--- a/include/media/v4l2-dev.h
+++ b/include/media/v4l2-dev.h
@@ -607,6 +607,20 @@ void video_device_pipeline_stop(struct video_device *vdev);
  */
 void __video_device_pipeline_stop(struct video_device *vdev);
 
+/**
+ * video_device_pipeline_alloc_start - Mark a pipeline as streaming
+ * @vdev: Starting video device
+ *
+ * video_device_pipeline_alloc_start() is similar to video_device_pipeline_start()
+ * but instead of working on a given pipeline the function will use an
+ * existing pipeline if the video device is already part of a pipeline, or
+ * allocate a new pipeline.
+ *
+ * Calls to video_device_pipeline_alloc_start() must be matched with
+ * video_device_pipeline_stop().
+ */
+__must_check int video_device_pipeline_alloc_start(struct video_device *vdev);
+
 /**
  * video_device_pipeline - Get the media pipeline a video device is part of
  * @vdev: The video device
-- 
2.34.1

