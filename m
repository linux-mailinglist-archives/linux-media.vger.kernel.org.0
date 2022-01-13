Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAECF48DA52
	for <lists+linux-media@lfdr.de>; Thu, 13 Jan 2022 16:01:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235910AbiAMPBA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Jan 2022 10:01:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:42096 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234021AbiAMPBA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Jan 2022 10:01:00 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 51723A1B;
        Thu, 13 Jan 2022 16:00:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1642086058;
        bh=KjvT+MAEol07EXKHMKPunVawSIKnzYLj6XO8aA/7EjU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Iodjq7kyrVvDVuQcqnnk5bkOlxy0aizhCZrMIUmRrm1k8okP87IowXfqOOhvFvgQ5
         3KImywV1EsBB1CEiIG6RQ4tpxl/ht1k9sqWyBOEoIIBkjZvH2NGLIFtBlGm3FDEGdh
         e60gGHR5sLc1D5VlzNDJ7F4JgjqNmlfZECEKH0mQ=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Sakari Ailus <sakari.ailus@iki.fi>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH 1/2] media: media-entity: Add media_pad_is_streaming() helper function
Date:   Thu, 13 Jan 2022 17:00:41 +0200
Message-Id: <20220113150042.15630-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220113150042.15630-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220113150042.15630-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Add a function to test if a pad is part of a pipeline currently
streaming, and use it through drivers to replace direct access to the
stream_count field. This will help reworking pipeline start/stop without
disturbing drivers.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/mc/mc-entity.c                  |  3 ++-
 drivers/media/platform/exynos4-is/common.c    |  5 ++++-
 drivers/media/platform/exynos4-is/fimc-isp.c  |  2 +-
 drivers/media/platform/exynos4-is/fimc-lite.c |  6 +++---
 drivers/media/platform/rcar-vin/rcar-core.c   |  2 +-
 include/media/media-entity.h                  | 12 ++++++++++++
 6 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
index b411f9796191..f83e043f0f3b 100644
--- a/drivers/media/mc/mc-entity.c
+++ b/drivers/media/mc/mc-entity.c
@@ -834,7 +834,8 @@ int __media_entity_setup_link(struct media_link *link, u32 flags)
 	sink = link->sink->entity;
 
 	if (!(link->flags & MEDIA_LNK_FL_DYNAMIC) &&
-	    (source->stream_count || sink->stream_count))
+	    (media_entity_is_streaming(source) ||
+	     media_entity_is_streaming(sink)))
 		return -EBUSY;
 
 	mdev = source->graph_obj.mdev;
diff --git a/drivers/media/platform/exynos4-is/common.c b/drivers/media/platform/exynos4-is/common.c
index 944b224eb621..023f624d29d5 100644
--- a/drivers/media/platform/exynos4-is/common.c
+++ b/drivers/media/platform/exynos4-is/common.c
@@ -10,7 +10,10 @@
 #include <media/drv-intf/exynos-fimc.h>
 #include "common.h"
 
-/* Called with the media graph mutex held or entity->stream_count > 0. */
+/*
+ * Called with the media graph mutex held or media_entity_is_streaming(entity)
+ * true.
+ */
 struct v4l2_subdev *fimc_find_remote_sensor(struct media_entity *entity)
 {
 	struct media_pad *pad = &entity->pads[0];
diff --git a/drivers/media/platform/exynos4-is/fimc-isp.c b/drivers/media/platform/exynos4-is/fimc-isp.c
index 855235bea46d..b85986e50f46 100644
--- a/drivers/media/platform/exynos4-is/fimc-isp.c
+++ b/drivers/media/platform/exynos4-is/fimc-isp.c
@@ -226,7 +226,7 @@ static int fimc_isp_subdev_set_fmt(struct v4l2_subdev *sd,
 			}
 		}
 	} else {
-		if (sd->entity.stream_count == 0) {
+		if (!media_entity_is_streaming(&sd->entity)) {
 			if (fmt->pad == FIMC_ISP_SD_PAD_SINK) {
 				struct v4l2_subdev_format format = *fmt;
 
diff --git a/drivers/media/platform/exynos4-is/fimc-lite.c b/drivers/media/platform/exynos4-is/fimc-lite.c
index aaa3af0493ce..386ee3948ac6 100644
--- a/drivers/media/platform/exynos4-is/fimc-lite.c
+++ b/drivers/media/platform/exynos4-is/fimc-lite.c
@@ -1073,7 +1073,7 @@ static int fimc_lite_subdev_set_fmt(struct v4l2_subdev *sd,
 	mutex_lock(&fimc->lock);
 
 	if ((atomic_read(&fimc->out_path) == FIMC_IO_ISP &&
-	    sd->entity.stream_count > 0) ||
+	    media_entity_is_streaming(&sd->entity)) ||
 	    (atomic_read(&fimc->out_path) == FIMC_IO_DMA &&
 	    vb2_is_busy(&fimc->vb_queue))) {
 		mutex_unlock(&fimc->lock);
@@ -1197,8 +1197,8 @@ static int fimc_lite_subdev_s_stream(struct v4l2_subdev *sd, int on)
 	 * Find sensor subdev linked to FIMC-LITE directly or through
 	 * MIPI-CSIS. This is required for configuration where FIMC-LITE
 	 * is used as a subdev only and feeds data internally to FIMC-IS.
-	 * The pipeline links are protected through entity.stream_count
-	 * so there is no need to take the media graph mutex here.
+	 * The pipeline links are protected through entity.pipe so there is no
+	 * need to take the media graph mutex here.
 	 */
 	fimc->sensor = fimc_find_remote_sensor(&sd->entity);
 
diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
index 0186ae235113..5117a7a3b5ec 100644
--- a/drivers/media/platform/rcar-vin/rcar-core.c
+++ b/drivers/media/platform/rcar-vin/rcar-core.c
@@ -816,7 +816,7 @@ static int rvin_csi2_link_notify(struct media_link *link, u32 flags,
 	 * running streams.
 	 */
 	media_device_for_each_entity(entity, &group->mdev)
-		if (entity->stream_count)
+		if (media_entity_is_streaming(entity))
 			return -EBUSY;
 
 	mutex_lock(&group->lock);
diff --git a/include/media/media-entity.h b/include/media/media-entity.h
index fea489f03d57..8546f13c42a9 100644
--- a/include/media/media-entity.h
+++ b/include/media/media-entity.h
@@ -858,6 +858,18 @@ struct media_link *media_entity_find_link(struct media_pad *source,
  */
 struct media_pad *media_entity_remote_pad(const struct media_pad *pad);
 
+/**
+ * media_entity_is_streaming - Test if an entity is part of a streaming pipeline
+ * @entity: The entity
+ *
+ * Return: True if the entity is part of a pipeline started with the
+ * media_pipeline_start() function, false otherwise.
+ */
+static inline bool media_entity_is_streaming(const struct media_entity *entity)
+{
+	return entity->stream_count > 0;
+}
+
 /**
  * media_entity_get_fwnode_pad - Get pad number from fwnode
  *
-- 
Regards,

Laurent Pinchart

