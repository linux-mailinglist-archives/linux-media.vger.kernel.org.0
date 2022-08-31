Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF78C5A7FC9
	for <lists+linux-media@lfdr.de>; Wed, 31 Aug 2022 16:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232186AbiHaOQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 31 Aug 2022 10:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231992AbiHaOPq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 31 Aug 2022 10:15:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B472120A9
        for <linux-media@vger.kernel.org>; Wed, 31 Aug 2022 07:14:56 -0700 (PDT)
Received: from deskari.lan (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9771FD02;
        Wed, 31 Aug 2022 16:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661955262;
        bh=d8zjoyQzUtm98GOCVXP3tgms+srsh7CqGif45+6cBBM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=r9tZiXEj6lmJCxjfP6eWFOz2FCPtvrUcsAK73uppkjgeRqYsrRLvZhzc44teVMn77
         ZLLUynpHeL0zKxTtAadLL07vTdMdrjXb0Lj7nxlSeVLN36Hm3MuVqss3rvpwEI2WeV
         dFCBnD8IVBJkrYUKIsv5qt5tHxZD+bSDeVx9QCgY=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 08/34] media: mc: entity: Add media_entity_pipeline() to access the media pipeline
Date:   Wed, 31 Aug 2022 17:13:31 +0300
Message-Id: <20220831141357.1396081-9-tomi.valkeinen@ideasonboard.com>
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

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Replace direct access to the pipe field in drivers with a new helper
function. This will allow easier refactoring of media pipeline handling
in the MC core behind the scenes without affecting drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c                   |  6 ++++++
 .../platform/renesas/rcar-vin/rcar-core.c      |  5 ++---
 .../media/platform/renesas/rcar-vin/rcar-dma.c |  2 +-
 drivers/media/platform/ti/omap3isp/isp.c       |  4 +---
 drivers/media/platform/ti/omap3isp/ispvideo.c  |  3 +--
 drivers/media/platform/ti/omap3isp/ispvideo.h  | 11 +++++++++--
 drivers/media/platform/xilinx/xilinx-dma.c     |  3 +--
 drivers/media/platform/xilinx/xilinx-dma.h     |  7 ++++++-
 drivers/staging/media/imx/imx-media-utils.c    |  2 +-
 drivers/staging/media/omap4iss/iss.c           |  4 +---
 drivers/staging/media/omap4iss/iss_video.c     |  3 +--
 drivers/staging/media/omap4iss/iss_video.h     | 11 +++++++++--
 include/media/media-entity.h                   | 18 ++++++++++++++++++
 13 files changed, 57 insertions(+), 22 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index c5c66befed0f..7fb97c6dc897 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -994,6 +994,12 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
 }
 EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
 
+struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
+{
+	return entity->pipe;
+}
+EXPORT_SYMBOL_GPL(media_entity_pipeline);
+
 static void media_interface_init(struct media_device *mdev,
 				 struct media_interface *intf,
 				 u32 gobj_type,
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
index 968a74234e92..2f7daa853ed8 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
@@ -786,9 +786,8 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 		return 0;
 
 	/*
-	 * Don't allow link changes if any entity in the graph is
-	 * streaming, modifying the CHSEL register fields can disrupt
-	 * running streams.
+	 * Don't allow link changes if any stream in the graph is active as
+	 * modifying the CHSEL register fields can disrupt running streams.
 	 */
 	media_device_for_each_entity(entity, &group->mdev)
 		if (media_entity_is_streaming(entity))
diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
index 8d37fbdc266a..e72bc6fa049f 100644
--- a/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
+++ b/drivers/media/platform/renesas/rcar-vin/rcar-dma.c
@@ -1281,7 +1281,7 @@ static int rvin_set_stream(struct rvin_dev *vin, int on)
 	 */
 	mdev = vin->vdev.entity.graph_obj.mdev;
 	mutex_lock(&mdev->graph_mutex);
-	pipe = sd->entity.pipe ? sd->entity.pipe : &vin->vdev.pipe;
+	pipe = media_entity_pipeline(&sd->entity) ? : &vin->vdev.pipe;
 	ret = __media_pipeline_start(&vin->vdev.entity, pipe);
 	mutex_unlock(&mdev->graph_mutex);
 	if (ret)
diff --git a/drivers/media/platform/ti/omap3isp/isp.c b/drivers/media/platform/ti/omap3isp/isp.c
index d251736eb420..84f8ed0edaba 100644
--- a/drivers/media/platform/ti/omap3isp/isp.c
+++ b/drivers/media/platform/ti/omap3isp/isp.c
@@ -937,10 +937,8 @@ static int isp_pipeline_is_last(struct media_entity *me)
 	struct isp_pipeline *pipe;
 	struct media_pad *pad;
 
-	if (!me->pipe)
-		return 0;
 	pipe = to_isp_pipeline(me);
-	if (pipe->stream_state == ISP_PIPELINE_STREAM_STOPPED)
+	if (!pipe || pipe->stream_state == ISP_PIPELINE_STREAM_STOPPED)
 		return 0;
 	pad = media_pad_remote_pad_first(&pipe->output->pad);
 	return pad->entity == me;
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.c b/drivers/media/platform/ti/omap3isp/ispvideo.c
index d7059180e80e..5746cac4e046 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.c
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.c
@@ -1093,8 +1093,7 @@ isp_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	/* Start streaming on the pipeline. No link touching an entity in the
 	 * pipeline can be activated or deactivated once streaming is started.
 	 */
-	pipe = video->video.entity.pipe
-	     ? to_isp_pipeline(&video->video.entity) : &video->pipe;
+	pipe = to_isp_pipeline(&video->video.entity) ? : &video->pipe;
 
 	ret = media_entity_enum_init(&pipe->ent_enum, &video->isp->media_dev);
 	if (ret)
diff --git a/drivers/media/platform/ti/omap3isp/ispvideo.h b/drivers/media/platform/ti/omap3isp/ispvideo.h
index a0908670c0cf..1d23df576e6b 100644
--- a/drivers/media/platform/ti/omap3isp/ispvideo.h
+++ b/drivers/media/platform/ti/omap3isp/ispvideo.h
@@ -99,8 +99,15 @@ struct isp_pipeline {
 	unsigned int external_width;
 };
 
-#define to_isp_pipeline(__e) \
-	container_of((__e)->pipe, struct isp_pipeline, pipe)
+static inline struct isp_pipeline *to_isp_pipeline(struct media_entity *entity)
+{
+	struct media_pipeline *pipe = media_entity_pipeline(entity);
+
+	if (!pipe)
+		return NULL;
+
+	return container_of(pipe, struct isp_pipeline, pipe);
+}
 
 static inline int isp_pipeline_ready(struct isp_pipeline *pipe)
 {
diff --git a/drivers/media/platform/xilinx/xilinx-dma.c b/drivers/media/platform/xilinx/xilinx-dma.c
index 2d1ef7a25c33..3a4d62be0f27 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.c
+++ b/drivers/media/platform/xilinx/xilinx-dma.c
@@ -402,8 +402,7 @@ static int xvip_dma_start_streaming(struct vb2_queue *vq, unsigned int count)
 	 * Use the pipeline object embedded in the first DMA object that starts
 	 * streaming.
 	 */
-	pipe = dma->video.entity.pipe
-	     ? to_xvip_pipeline(&dma->video.entity) : &dma->pipe;
+	pipe = to_xvip_pipeline(&dma->video.entity) ? : &dma->pipe;
 
 	ret = media_pipeline_start(&dma->video.entity, &pipe->pipe);
 	if (ret < 0)
diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
index 2378bdae57ae..3ea10f6b0bb9 100644
--- a/drivers/media/platform/xilinx/xilinx-dma.h
+++ b/drivers/media/platform/xilinx/xilinx-dma.h
@@ -47,7 +47,12 @@ struct xvip_pipeline {
 
 static inline struct xvip_pipeline *to_xvip_pipeline(struct media_entity *e)
 {
-	return container_of(e->pipe, struct xvip_pipeline, pipe);
+	struct media_pipeline *pipe = media_entity_pipeline(e);
+
+	if (!pipe)
+		return NULL;
+
+	return container_of(pipe, struct xvip_pipeline, pipe);
 }
 
 /**
diff --git a/drivers/staging/media/imx/imx-media-utils.c b/drivers/staging/media/imx/imx-media-utils.c
index 294c808b2ebe..e9a3c6d2c66f 100644
--- a/drivers/staging/media/imx/imx-media-utils.c
+++ b/drivers/staging/media/imx/imx-media-utils.c
@@ -871,7 +871,7 @@ int imx_media_pipeline_set_stream(struct imx_media_dev *imxmd,
 			__media_pipeline_stop(entity);
 	} else {
 		v4l2_subdev_call(sd, video, s_stream, 0);
-		if (entity->pipe)
+		if (media_entity_pipeline(entity))
 			__media_pipeline_stop(entity);
 	}
 
diff --git a/drivers/staging/media/omap4iss/iss.c b/drivers/staging/media/omap4iss/iss.c
index 28aacda0f5a7..fa2a36d829d3 100644
--- a/drivers/staging/media/omap4iss/iss.c
+++ b/drivers/staging/media/omap4iss/iss.c
@@ -548,10 +548,8 @@ static int iss_pipeline_is_last(struct media_entity *me)
 	struct iss_pipeline *pipe;
 	struct media_pad *pad;
 
-	if (!me->pipe)
-		return 0;
 	pipe = to_iss_pipeline(me);
-	if (pipe->stream_state == ISS_PIPELINE_STREAM_STOPPED)
+	if (!pipe || pipe->stream_state == ISS_PIPELINE_STREAM_STOPPED)
 		return 0;
 	pad = media_pad_remote_pad_first(&pipe->output->pad);
 	return pad->entity == me;
diff --git a/drivers/staging/media/omap4iss/iss_video.c b/drivers/staging/media/omap4iss/iss_video.c
index 9512cd3314f2..abadaf13c0e1 100644
--- a/drivers/staging/media/omap4iss/iss_video.c
+++ b/drivers/staging/media/omap4iss/iss_video.c
@@ -870,8 +870,7 @@ iss_video_streamon(struct file *file, void *fh, enum v4l2_buf_type type)
 	 * Start streaming on the pipeline. No link touching an entity in the
 	 * pipeline can be activated or deactivated once streaming is started.
 	 */
-	pipe = entity->pipe
-	     ? to_iss_pipeline(entity) : &video->pipe;
+	pipe = to_iss_pipeline(&video->video.entity) ? : &video->pipe;
 	pipe->external = NULL;
 	pipe->external_rate = 0;
 	pipe->external_bpp = 0;
diff --git a/drivers/staging/media/omap4iss/iss_video.h b/drivers/staging/media/omap4iss/iss_video.h
index 526281bf0051..ca2d5edb6261 100644
--- a/drivers/staging/media/omap4iss/iss_video.h
+++ b/drivers/staging/media/omap4iss/iss_video.h
@@ -90,8 +90,15 @@ struct iss_pipeline {
 	int external_bpp;
 };
 
-#define to_iss_pipeline(__e) \
-	container_of((__e)->pipe, struct iss_pipeline, pipe)
+static inline struct iss_pipeline *to_iss_pipeline(struct media_entity *entity)
+{
+	struct media_pipeline *pipe = media_entity_pipeline(entity);
+
+	if (!pipe)
+		return NULL;
+
+	return container_of(pipe, struct iss_pipeline, pipe);
+}
 
 static inline int iss_pipeline_ready(struct iss_pipeline *pipe)
 {
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index 1030e45e8ee6..aaf276f765cf 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -948,6 +948,24 @@ static inline bool media_entity_is_streaming(const struct media_entity *entity)
 	return entity->pipe;
 }
 
+/**
+ * media_entity_pipeline - Get the media pipeline an entity is part of
+ * @entity: The entity
+ *
+ * This function returns the media pipeline that an entity has been associated
+ * with when constructing the pipeline with media_pipeline_start(). The pointer
+ * remains valid until media_pipeline_stop() is called.
+ *
+ * In general, entities can be part of multiple pipelines, when carrying
+ * multiple streams (either on different pads, or on the same pad using
+ * multiplexed streams). This function is to be used only for entities that
+ * do not support multiple pipelines.
+ *
+ * Return: The media_pipeline the entity is part of, or NULL if the entity is
+ * not part of any pipeline.
+ */
+struct media_pipeline *media_entity_pipeline(struct media_entity *entity);
+
 /**
  * media_entity_get_fwnode_pad - Get pad number from fwnode
  *
-- 
2.34.1

