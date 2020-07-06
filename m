Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87FA0215EAC
	for <lists+linux-media@lfdr.de>; Mon,  6 Jul 2020 20:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729955AbgGFSi3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Jul 2020 14:38:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:45198 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729949AbgGFSi1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Jul 2020 14:38:27 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C0DA2178;
        Mon,  6 Jul 2020 20:38:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1594060684;
        bh=zuseyK/xDw0PDKxHcfEC7ti7jr9pBoKUdqkNRHUUZMo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nLYz/BZdW+oG9Z+Gj3Z4uP5Jlb3J1hhUm6ewB93qwXD3r2gNXGkNC/VXJLOTEAUIO
         V3kXnsX12ISEqheitAWhksSVcYjYXl6pZobxLFX1QUfOZDn/rfqeAIdb0/MHPMtZq0
         DfbiQfKondx8OV3y2qMSKLokh+xblzqs+SnT6Jek=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Benoit Parrot <bparrot@ti.com>
Subject: [PATCH v2 060/108] media: ti-vpe: cal: Move all sensor-related init to .bound() notifier
Date:   Mon,  6 Jul 2020 21:36:21 +0300
Message-Id: <20200706183709.12238-61-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
References: <20200706183709.12238-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The initialization of the context based on the connected sensor is split
between the async notifier .bound() and .complete() operations. Move it
all to a separate function and call it from .bound() operation to
prepare for the move of the notifiers from the contexts to the cal_dev.
Only V4L2 registration is kept in the .complete() operation.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Benoit Parrot <bparrot@ti.com>
---
 drivers/media/platform/ti-vpe/cal.c | 132 ++++++++++++++--------------
 1 file changed, 68 insertions(+), 64 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
index e91788519bb4..b5eb6a640d70 100644
--- a/drivers/media/platform/ti-vpe/cal.c
+++ b/drivers/media/platform/ti-vpe/cal.c
@@ -1986,6 +1986,72 @@ static void cal_ctx_v4l2_unregister(struct cal_ctx *ctx)
 	video_unregister_device(&ctx->vdev);
 }
 
+static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
+{
+	struct v4l2_subdev_mbus_code_enum mbus_code;
+	struct v4l2_mbus_framefmt mbus_fmt;
+	const struct cal_fmt *fmt;
+	unsigned int i, j, k;
+	int ret = 0;
+
+	/* Enumerate sub device formats and enable all matching local formats */
+	ctx->num_active_fmt = 0;
+	for (j = 0, i = 0; ret != -EINVAL; ++j) {
+
+		memset(&mbus_code, 0, sizeof(mbus_code));
+		mbus_code.index = j;
+		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+		ret = v4l2_subdev_call(ctx->phy->sensor, pad, enum_mbus_code,
+				       NULL, &mbus_code);
+		if (ret)
+			continue;
+
+		ctx_dbg(2, ctx,
+			"subdev %s: code: %04x idx: %u\n",
+			ctx->phy->sensor->name, mbus_code.code, j);
+
+		for (k = 0; k < ARRAY_SIZE(cal_formats); k++) {
+			const struct cal_fmt *fmt = &cal_formats[k];
+
+			if (mbus_code.code == fmt->code) {
+				ctx->active_fmt[i] = fmt;
+				ctx_dbg(2, ctx,
+					"matched fourcc: %s: code: %04x idx: %u\n",
+					fourcc_to_str(fmt->fourcc),
+					fmt->code, i);
+				ctx->num_active_fmt = ++i;
+			}
+		}
+	}
+
+	if (i == 0) {
+		ctx_err(ctx, "No suitable format reported by subdev %s\n",
+			ctx->phy->sensor->name);
+		return -EINVAL;
+	}
+
+	ret = __subdev_get_format(ctx, &mbus_fmt);
+	if (ret)
+		return ret;
+
+	fmt = find_format_by_code(ctx, mbus_fmt.code);
+	if (!fmt) {
+		ctx_dbg(3, ctx, "mbus code format (0x%08x) not found.\n",
+			mbus_fmt.code);
+		return -EINVAL;
+	}
+
+	/* Save current subdev format */
+	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
+	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	ctx->v_fmt.fmt.pix.pixelformat  = fmt->fourcc;
+	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
+	ctx->fmt = fmt;
+	ctx->m_fmt = mbus_fmt;
+
+	return 0;
+}
+
 static int cal_ctx_v4l2_init(struct cal_ctx *ctx)
 {
 	struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
@@ -2054,9 +2120,6 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 			   struct v4l2_async_subdev *asd)
 {
 	struct cal_ctx *ctx = notifier_to_ctx(notifier);
-	struct v4l2_subdev_mbus_code_enum mbus_code;
-	unsigned int i, j, k;
-	int ret = 0;
 
 	if (ctx->phy->sensor) {
 		ctx_info(ctx, "Rejecting subdev %s (Already set!!)",
@@ -2067,73 +2130,14 @@ static int cal_async_bound(struct v4l2_async_notifier *notifier,
 	ctx->phy->sensor = subdev;
 	ctx_dbg(1, ctx, "Using sensor %s for capture\n", subdev->name);
 
-	/* Enumerate sub device formats and enable all matching local formats */
-	ctx->num_active_fmt = 0;
-	for (j = 0, i = 0; ret != -EINVAL; ++j) {
-
-		memset(&mbus_code, 0, sizeof(mbus_code));
-		mbus_code.index = j;
-		mbus_code.which = V4L2_SUBDEV_FORMAT_ACTIVE;
-		ret = v4l2_subdev_call(subdev, pad, enum_mbus_code,
-				       NULL, &mbus_code);
-		if (ret)
-			continue;
-
-		ctx_dbg(2, ctx,
-			"subdev %s: code: %04x idx: %u\n",
-			subdev->name, mbus_code.code, j);
-
-		for (k = 0; k < ARRAY_SIZE(cal_formats); k++) {
-			const struct cal_fmt *fmt = &cal_formats[k];
-
-			if (mbus_code.code == fmt->code) {
-				ctx->active_fmt[i] = fmt;
-				ctx_dbg(2, ctx,
-					"matched fourcc: %s: code: %04x idx: %u\n",
-					fourcc_to_str(fmt->fourcc),
-					fmt->code, i);
-				ctx->num_active_fmt = ++i;
-			}
-		}
-	}
-
-	if (i == 0) {
-		ctx_err(ctx, "No suitable format reported by subdev %s\n",
-			subdev->name);
-		return -EINVAL;
-	}
-
-	cal_ctx_v4l2_register(ctx);
-
-	return 0;
+	return cal_ctx_v4l2_init_formats(ctx);
 }
 
 static int cal_async_complete(struct v4l2_async_notifier *notifier)
 {
 	struct cal_ctx *ctx = notifier_to_ctx(notifier);
-	const struct cal_fmt *fmt;
-	struct v4l2_mbus_framefmt mbus_fmt;
-	int ret;
-
-	ret = __subdev_get_format(ctx, &mbus_fmt);
-	if (ret)
-		return ret;
-
-	fmt = find_format_by_code(ctx, mbus_fmt.code);
-	if (!fmt) {
-		ctx_dbg(3, ctx, "mbus code format (0x%08x) not found.\n",
-			mbus_fmt.code);
-		return -EINVAL;
-	}
-
-	/* Save current subdev format */
-	v4l2_fill_pix_format(&ctx->v_fmt.fmt.pix, &mbus_fmt);
-	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
-	ctx->v_fmt.fmt.pix.pixelformat  = fmt->fourcc;
-	cal_calc_format_size(ctx, fmt, &ctx->v_fmt);
-	ctx->fmt = fmt;
-	ctx->m_fmt = mbus_fmt;
 
+	cal_ctx_v4l2_register(ctx);
 	return 0;
 }
 
-- 
Regards,

Laurent Pinchart

