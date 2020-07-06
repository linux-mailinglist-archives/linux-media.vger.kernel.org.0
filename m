Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EE25215EB9
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729989AbgGFSil (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729980AbgGFSik (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:40 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEC7C2181;
        Mon,  6 Jul 2020 20:38:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060696;
        bh=ZTAl8tF7JmIwov2wFcayGZ+AeSS3fOcnhVWhKuQBHhc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=phzqoCf1CFVLm2LQjNv9aRblxhmpgOzBEre0QU6cODkyvg6iJVEjKq6Jk2sMKi7xQ
         OnB1G5Kj8pe6ycIOBXk3mcLjlWvcx5wKyZY/f+fr+TF5yZrsGx1GQvZr8FA1CJrj+r
         4lvW4Ln/8pdfmPKCWTt5EfL+yXWSV0YrKiWb2I7w=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 074/108] media: ti-vpe: cal: Init formats in cal_ctx_v4l2_register()
Date:   Mon,  6 Jul 2020 21:36:35 +0300
Message-Id: <20200706183709.12238-75-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for splitting the V4L2 API support to a separate file, call
cal_ctx_v4l2_init_formats() from cal_ctx_v4l2_register().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 83 ++++++++++++++---------------
 1 file changed, 39 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 236fe826b635..26747e6da358 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1948,39 +1948,6 @@ static const struct video_device cal_videodev = {
 			  V4L2_CAP_READWRITE,
 };
 
-static int cal_ctx_v4l2_register(struct cal_ctx *ctx)
-{
-	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
-	struct video_device *vfd = &ctx->vdev;
-	int ret;
-
-	ret = v4l2_ctrl_add_handler(hdl, ctx->phy->sensor->ctrl_handler, NULL,
-				    true);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to add sensor ctrl handler\n");
-		return ret;
-	}
-
-	ret = video_register_device(vfd, VFL_TYPE_VIDEO, video_nr);
-	if (ret < 0) {
-		ctx_err(ctx, "Failed to register video device\n");
-		return ret;
-	}
-
-	ctx_info(ctx, "V4L2 device registered as %s\n",
-		 video_device_node_name(vfd));
-
-	return 0;
-}
-
-static void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
-{
-	ctx_dbg(1, ctx, "unregistering %s\n",
-		video_device_node_name(&ctx->vdev));
-
-	video_unregister_device(&ctx->vdev);
-}
-
 static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 {
 	struct v4l2_subdev_mbus_code_enum mbus_code;
@@ -2047,6 +2014,43 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	return 0;
 }
 
+static int cal_ctx_v4l2_register(struct cal_ctx *ctx)
+{
+	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
+	struct video_device *vfd = &ctx->vdev;
+	int ret;
+
+	ret = cal_ctx_v4l2_init_formats(ctx);
+	if (ret)
+		return ret;
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
+static void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
+{
+	ctx_dbg(1, ctx, "unregistering %s\n",
+		video_device_node_name(&ctx->vdev));
+
+	video_unregister_device(&ctx->vdev);
+}
+
 static int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 {
 	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
@@ -2147,19 +2151,10 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
 {
 	struct cal_dev *cal = container_of(notifier, struct cal_dev, notifier);
 	unsigned int i;
-	int ret;
 
 	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
-		struct cal_ctx *ctx = cal->ctx[i];
-
-		if (!ctx)
-			continue;
-
-		ret = cal_ctx_v4l2_init_formats(ctx);
-		if (ret)
-			continue;
-
-		cal_ctx_v4l2_register(ctx);
+		if (cal->ctx[i])
+			cal_ctx_v4l2_register(cal->ctx[i]);
 	}
 
 	return 0;
-- 
Regards,

Laurent Pinchart

