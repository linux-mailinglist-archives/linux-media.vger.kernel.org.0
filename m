Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 644DF215EBB
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgGFSil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729984AbgGFSij (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:39 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 683EF1972;
        Mon,  6 Jul 2020 20:38:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060695;
        bh=MYiczpMXVLENjAxg8khZNGF4GI/n6Xp3NayMxcRCo+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TTFF7NBWCqTu8eGeHvW8jRBQbOGXmKRqcCXPBAoreneLLLnbX3wwFFNnq9aJkttT5
         348Uu2RzPauVal6cYXX9YvWdqB6Z0VrQLhrIniQ04ETtkDy8bPYl6zgZOC/Z6QDfAb
         65EzWIdBL2PPv/wxQqRreBUKEN2Z0BbNuIPw3ERo=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 073/108] media: ti-vpe: cal: Register a media device
Date:   Mon,  6 Jul 2020 21:36:34 +0300
Message-Id: <20200706183709.12238-74-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Enable the media controller API by registering a media device and
initializing the media entities corresponding to the video devices. The
context initialization is slightly refactored as a result. The media
graph will be built in a subsequent change.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 71 ++++++++++++++++++++---------
 1 file changed, 49 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 42b948e784d2..236fe826b635 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -22,6 +22,7 @@
 #include <linux/slab.h>
 #include <linux/videodev2.h>
 
+#include <media/media-device.h>
 #include <media/v4l2-async.h>
 #include <media/v4l2-common.h>
 #include <media/v4l2-ctrls.h>
@@ -282,6 +283,7 @@ struct cal_dev {
 	struct device		*dev;
 
 	const struct cal_data	*data;
+	u32			revision;
 
 	/* Control Module handle */
 	struct regmap		*syscon_camerrx;
@@ -292,6 +294,7 @@ struct cal_dev {
 
 	struct cal_ctx		*ctx[CAL_NUM_CONTEXT];
 
+	struct media_device	mdev;
 	struct v4l2_device	v4l2_dev;
 	struct v4l2_async_notifier notifier;
 };
@@ -302,6 +305,7 @@ struct cal_dev {
 struct cal_ctx {
 	struct v4l2_ctrl_handler ctrl_handler;
 	struct video_device	vdev;
+	struct media_pad	pad;
 
 	struct cal_dev		*cal;
 	struct cal_camerarx	*phy;
@@ -2050,11 +2054,11 @@ static int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 	struct vb2_queue *q = &ctx->vb_vidq;
 	int ret;
 
-	/* initialize locks */
+	INIT_LIST_HEAD(&ctx->vidq.active);
 	spin_lock_init(&ctx->slock);
 	mutex_init(&ctx->mutex);
 
-	/* initialize queue */
+	/* Initialize the vb2 queue. */
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
 	q->drv_priv = ctx;
@@ -2070,35 +2074,39 @@ static int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 	if (ret)
 		return ret;
 
-	/* init video dma queues */
-	INIT_LIST_HEAD(&ctx->vidq.active);
-
+	/* Initialize the video device and media entity. */
 	*vfd = cal_videodev;
 	vfd->v4l2_dev = &ctx->cal->v4l2_dev;
 	vfd->queue = q;
+	snprintf(vfd->name, sizeof(vfd->name), "CAL output %u", ctx->index);
+	vfd->lock = &ctx->mutex;
+	video_set_drvdata(vfd, ctx);
+
+	ctx->pad.flags = MEDIA_PAD_FL_SINK;
+	ret = media_entity_pads_init(&vfd->entity, 1, &ctx->pad);
+	if (ret < 0)
+		return ret;
 
 	/* Initialize the control handler. */
 	ret = v4l2_ctrl_handler_init(hdl, 11);
 	if (ret < 0) {
 		ctx_err(ctx, "Failed to init ctrl handler\n");
-		return ret;
+		goto error;
 	}
 
 	vfd->ctrl_handler = hdl;
 
-	/*
-	 * Provide a mutex to v4l2 core. It will be used to protect
-	 * all fops and v4l2 ioctls.
-	 */
-	vfd->lock = &ctx->mutex;
-	video_set_drvdata(vfd, ctx);
-
 	return 0;
+
+error:
+	media_entity_cleanup(&vfd->entity);
+	return ret;
 }
 
 static void cal_ctx_v4l2_cleanup(struct cal_ctx *ctx)
 {
 	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	media_entity_cleanup(&ctx->vdev.entity);
 }
 
 /* ------------------------------------------------------------------
@@ -2225,13 +2233,21 @@ static int cal_media_register(struct cal_dev *cal)
 {
 	int ret;
 
+	ret = media_device_register(&cal->mdev);
+	if (ret) {
+		cal_err(cal, "Failed to register media device\n");
+		return ret;
+	}
+
 	/*
 	 * Register the async notifier. This may trigger registration of the
 	 * V4L2 video devices if all subdevs are ready.
 	 */
 	ret = cal_async_notifier_register(cal);
-	if (ret)
+	if (ret) {
+		media_device_unregister(&cal->mdev);
 		return ret;
+	}
 
 	return 0;
 }
@@ -2251,6 +2267,7 @@ static void cal_media_unregister(struct cal_dev *cal)
 	}
 
 	cal_async_notifier_unregister(cal);
+	media_device_unregister(&cal->mdev);
 }
 
 /*
@@ -2259,12 +2276,21 @@ static void cal_media_unregister(struct cal_dev *cal)
  */
 static int cal_media_init(struct cal_dev *cal)
 {
+	struct media_device *mdev = &cal->mdev;
 	int ret;
 
+	mdev->dev = cal->dev;
+	mdev->hw_revision = cal->revision;
+	strscpy(mdev->model, "CAL", sizeof(mdev->model));
+	snprintf(mdev->bus_info, sizeof(mdev->bus_info), "platform:%s",
+		 dev_name(mdev->dev));
+	media_device_init(mdev);
+
 	/*
 	 * Initialize the V4L2 device (despite the function name, this performs
 	 * initialization, not registration).
 	 */
+	cal->v4l2_dev.mdev = mdev;
 	ret = v4l2_device_register(cal->dev, &cal->v4l2_dev);
 	if (ret) {
 		cal_err(cal, "Failed to register V4L2 device\n");
@@ -2291,6 +2317,8 @@ static void cal_media_cleanup(struct cal_dev *cal)
 	}
 
 	v4l2_device_unregister(&cal->v4l2_dev);
+	media_device_cleanup(&cal->mdev);
+
 	vb2_dma_contig_clear_max_seg_size(cal->dev);
 }
 
@@ -2347,23 +2375,22 @@ MODULE_DEVICE_TABLE(of, cal_of_match);
 
 static void cal_get_hwinfo(struct cal_dev *cal)
 {
-	u32 revision;
 	u32 hwinfo;
 
-	revision = reg_read(cal, CAL_HL_REVISION);
-	switch (FIELD_GET(CAL_HL_REVISION_SCHEME_MASK, revision)) {
+	cal->revision = reg_read(cal, CAL_HL_REVISION);
+	switch (FIELD_GET(CAL_HL_REVISION_SCHEME_MASK, cal->revision)) {
 	case CAL_HL_REVISION_SCHEME_H08:
 		cal_dbg(3, cal, "CAL HW revision %lu.%lu.%lu (0x%08x)\n",
-			FIELD_GET(CAL_HL_REVISION_MAJOR_MASK, revision),
-			FIELD_GET(CAL_HL_REVISION_MINOR_MASK, revision),
-			FIELD_GET(CAL_HL_REVISION_RTL_MASK, revision),
-			revision);
+			FIELD_GET(CAL_HL_REVISION_MAJOR_MASK, cal->revision),
+			FIELD_GET(CAL_HL_REVISION_MINOR_MASK, cal->revision),
+			FIELD_GET(CAL_HL_REVISION_RTL_MASK, cal->revision),
+			cal->revision);
 		break;
 
 	case CAL_HL_REVISION_SCHEME_LEGACY:
 	default:
 		cal_info(cal, "Unexpected CAL HW revision 0x%08x\n",
-			 revision);
+			 cal->revision);
 		break;
 	}
 
-- 
Regards,

Laurent Pinchart

