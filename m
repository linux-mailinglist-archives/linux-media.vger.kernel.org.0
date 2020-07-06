Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78770215EA3
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729938AbgGFSiV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45202 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729933AbgGFSiT (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:19 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A418FE37;
        Mon,  6 Jul 2020 20:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060680;
        bh=IslZ7xvGB5FdcEqnZ7WmumQtcNGIoB2ah3VCqFZxMnw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tmwBgeyxllG9dJ2JuXJlzGPgIux1QxtWRR/HZLIdTwlW4i+mSMDAsc87KSFWX9Zjd
         vV+e9bGe5EdVo5Je6EBzP/9V3xTHpSseIEjddomZAipqYwsDwPcsD4oeo/aKBK1c22
         nDeiyA012zyKZEU5ZVyDDkIG7IUnZMhldRrviieg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 052/108] media: ti-vpe: cal: Decouple control handler from v4l2_device
Date:   Mon,  6 Jul 2020 21:36:13 +0300
Message-Id: <20200706183709.12238-53-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for decoupling the v4l2_device from the cal_ctx, don't set
the control handler in the v4l2_device and expect the video node to use
it automatically, but set the video node control handler directly. This
requires adding the sensor subdev controls to the control handler
manually, as that operation was performed on the v4l2_device by
v4l2_device_register_subdev().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 34 ++++++++++++++++-------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 8de4d7b96a22..fe96edebd9c2 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1871,6 +1871,7 @@ static const struct video_device cal_videodev = {
 
 static int cal_complete_ctx(struct cal_ctx *ctx)
 {
+	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
 	struct video_device *vfd;
 	struct vb2_queue *q;
 	int ret;
@@ -1904,6 +1905,17 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 	vfd->v4l2_dev = &ctx->v4l2_dev;
 	vfd->queue = q;
 
+	/* Initialize the control handler. */
+	v4l2_ctrl_handler_init(hdl, 11);
+	v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler, NULL, true);
+	if (hdl->error) {
+		ctx_err(ctx, "Failed to init ctrl handler\n");
+		ret = hdl->error;
+		goto error;
+	}
+
+	vfd->ctrl_handler = hdl;
+
 	/*
 	 * Provide a mutex to v4l2 core. It will be used to protect
 	 * all fops and v4l2 ioctls.
@@ -1913,12 +1925,16 @@ static int cal_complete_ctx(struct cal_ctx *ctx)
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr);
 	if (ret < 0)
-		return ret;
+		goto error;
 
 	ctx_info(ctx, "V4L2 device registered as %s\n",
 		 video_device_node_name(vfd));
 
 	return 0;
+
+error:
+	v4l2_ctrl_handler_free(hdl);
+	return ret;
 }
 
 static int cal_async_bound(struct v4l2_async_notifier *notifier,
@@ -2100,7 +2116,6 @@ static int of_cal_create_instance(struct cal_ctx *ctx, int inst)
 static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 {
 	struct cal_ctx *ctx;
-	struct v4l2_ctrl_handler *hdl;
 	int ret;
 
 	ctx = devm_kzalloc(&cal->pdev->dev, sizeof(*ctx), GFP_KERNEL);
@@ -2114,15 +2129,7 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 		 "%s-%03d", CAL_MODULE_NAME, inst);
 	ret = v4l2_device_register(&cal->pdev->dev, &ctx->v4l2_dev);
 	if (ret)
-		goto err_exit;
-
-	hdl = &ctx->ctrl_handler;
-	ret = v4l2_ctrl_handler_init(hdl, 11);
-	if (ret) {
-		ctx_err(ctx, "Failed to init ctrl handler\n");
-		goto unreg_dev;
-	}
-	ctx->v4l2_dev.ctrl_handler = hdl;
+		return NULL;
 
 	/* Make sure Camera Core H/W register area is available */
 	ctx->phy = cal->phy[inst];
@@ -2134,15 +2141,12 @@ static struct cal_ctx *cal_ctx_create(struct cal_dev *cal, int inst)
 	ret = of_cal_create_instance(ctx, inst);
 	if (ret) {
 		ret = -EINVAL;
-		goto free_hdl;
+		goto unreg_dev;
 	}
 	return ctx;
 
-free_hdl:
-	v4l2_ctrl_handler_free(hdl);
 unreg_dev:
 	v4l2_device_unregister(&ctx->v4l2_dev);
-err_exit:
 	return NULL;
 }
 
-- 
Regards,

Laurent Pinchart

