Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAB53215EA6
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729943AbgGFSiY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:24 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729922AbgGFSiW (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:22 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7EC152175;
        Mon,  6 Jul 2020 20:38:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060681;
        bh=NB7cqJPMDGgHRLr3X5vnKcCYIdX2xk6kWAmKnQdRijI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NjBLFs/9Faq6UjBI9uFsrfMdQGDjpSJV2gZDJi8LUSfzVvcNnyCRePhKpxM5ArNjv
         JrLeuxdL9UrkKuFcT4Ha1nfbeCYGpTlfVYHEjiIIawA8ElhMwR1Xns/J5d7CrYJ8P0
         sJpqoFBUIccafbpPEeFtaoFHO/B6EyrGXGvKXpso=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 054/108] media: ti-vpe: cal: Split video device initialization and registration
Date:   Mon,  6 Jul 2020 21:36:15 +0300
Message-Id: <20200706183709.12238-55-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There's no need to delay most of the video device initialization until
the sensor subdevs are bound. Split the initialization and registration,
and perform the initialization when creating the context.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 70 +++++++++++++++++------------
 1 file changed, 42 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e747d8eb96aa..447ba33c4337 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1856,7 +1856,7 @@ static const struct vb2_ops cal_video_qops = {
 };
 
 /* ------------------------------------------------------------------
- *	Initialization and module stuff
+ *	V4L2 Initialization and Registration
  * ------------------------------------------------------------------
  */
 
@@ -1870,11 +1870,36 @@ static const struct video_device cal_videodev = {
 			  V4L2_CAP_READWRITE,
 };
 
-static int cal_complete_ctx(struct cal_ctx *ctx)
+static int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 {
 	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
-	struct video_device *vfd;
-	struct vb2_queue *q;
+	struct video_device *vfd = &ctx->vdev;
+	int ret;
+
+	ret = v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler, NULL,
+				    true);
+	if (ret < 0) {
+		ctx_err(ctx, "Failed to add sensor ctrl handler\n");
+		return ret;
+	}
+
+	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr);
+	if (ret < 0) {
+		ctx_err(ctx, "Failed to register video device\n");
+		return ret;
+	}
+
+	ctx_info(ctx, "V4L2 device registered as %s\n",
+		 video_device_node_name(vfd));
+
+	return 0;
+}
+
+static int cal_ctx_v4l2_init(struct cal_ctx *ctx)
+{
+	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
+	struct video_device *vfd = &ctx->vdev;
+	struct vb2_queue *q = &ctx->vb_vidq;
 	int ret;
 
 	/* initialize locks */
@@ -1882,7 +1907,6 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 	mutex_init(&ctx->mutex);
 
 	/* initialize queue */
-	q = &ctx->vb_vidq;
 	q->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
 	q->io_modes = VB2_MMAP | VB2_DMABUF | VB2_READ;
 	q->drv_priv = ctx;
@@ -1901,18 +1925,15 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 	/* init video dma queues */
 	INIT_LIST_HEAD(&ctx->vidq.active);
 
-	vfd = &ctx->vdev;
 	*vfd = cal_videodev;
 	vfd->v4l2_dev = &ctx->cal->v4l2_dev;
 	vfd->queue = q;
 
 	/* Initialize the control handler. */
-	v4l2_ctrl_handler_init(hdl, 11);
-	v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler, NULL, true);
-	if (hdl->error) {
+	ret = v4l2_ctrl_handler_init(hdl, 11);
+	if (ret < 0) {
 		ctx_err(ctx, "Failed to init ctrl handler\n");
-		ret = hdl->error;
-		goto error;
+		return ret;
 	}
 
 	vfd->ctrl_handler = hdl;
@@ -1924,20 +1945,14 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 	vfd->lock = &ctx->mutex;
 	video_set_drvdata(vfd, ctx);
 
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr);
-	if (ret < 0)
-		goto error;
-
-	ctx_info(ctx, "V4L2 device registered as %s\n",
-		 video_device_node_name(vfd));
-
 	return 0;
-
-error:
-	v4l2_ctrl_handler_free(hdl);
-	return ret;
 }
 
+/* ------------------------------------------------------------------
+ *	Initialization and module stuff
+ * ------------------------------------------------------------------
+ */
+
 static int cal_async_bound(struct v4l2_async_notifier *notifier,
 			   struct v4l2_subdev *subdev,
 			   struct v4l2_async_subdev *asd)
@@ -1992,7 +2007,7 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 		return -EINVAL;
 	}
 
-	cal_complete_ctx(ctx);
+	cal_ctx_v4l2_register(ctx);
 
 	return 0;
 }
@@ -2123,16 +2138,15 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	if (!ctx)
 		return NULL;
 
-	/* save the cal_dev * for future ref */
 	ctx->cal = cal;
-
-	/* Make sure Camera Core H/W register area is available */
 	ctx->phy = cal->phy[inst];
-
-	/* Store the instance id */
 	ctx->index = inst;
 	ctx->cport = inst;
 
+	ret = cal_ctx_v4l2_init(ctx);
+	if (ret)
+		return NULL;
+
 	ret = of_cal_create_instance(ctx, inst);
 	if (ret)
 		return NULL;
-- 
Regards,

Laurent Pinchart

