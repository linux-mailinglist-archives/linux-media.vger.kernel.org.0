Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BF081F8BB1
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 02:01:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728214AbgFOABf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Jun 2020 20:01:35 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33330 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbgFOABd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Jun 2020 20:01:33 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B0E0C2140;
        Mon, 15 Jun 2020 02:00:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592179243;
        bh=SgZEcYs5zQ4aQbw3vtc9SOE+CBd4d9r2os9QsjVnGUA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MJKrtTWK1jtPlhbJK6vb4EcaXP8bSYosyhYbiI/a+E2Co6Hkx496b4F5TKuQiPK8z
         t1SvJJnORmBMoQZWcuUYl6GQNI3blryp0FRXoNr0jHWZPwm7nepKDWT9UjB2yMnK/k
         2W3WPYs6gtX7E4AxBNmPdvsOhh5ShmmSz1DSicgg=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v1 073/107] media: ti-vpe: cal: Init formats in cal_ctx_v4l2_register()
Date:   Mon, 15 Jun 2020 02:59:10 +0300
Message-Id: <20200614235944.17716-74-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
References: <20200614235944.17716-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

To prepare for splitting the V4L2 API support to a separate file, call
cal_ctx_v4l2_init_formats() from cal_ctx_v4l2_register().

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal.c | 83 ++++++++++++++---------------
 1 file changed, 39 insertions(+), 44 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index 9d338f3ee452..d81195006026 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1938,39 +1938,6 @@ static const struct video_device cal_videodev = {
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
@@ -2037,6 +2004,43 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
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
@@ -2137,19 +2141,10 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
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

