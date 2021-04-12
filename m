Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7148335C55B
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 13:35:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240603AbhDLLf7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 07:35:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52688 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240588AbhDLLf6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 07:35:58 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 601745A9;
        Mon, 12 Apr 2021 13:35:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618227339;
        bh=/ZQU6Rt70BzXZbadXr2VwCMMiiz5zKcF3BLSRHMscak=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LwrL0ouYfeyQXfqDXHhDoxpDzoBSzxtNf8vs7h5ebFC/bqfdqlSFN5rG8Pz9Rng/p
         3LnOFnGuTjmaOE3SiKbeCt/PDToIhS5dBxnWkIlICNYJ8n8CBKoWTOX7z4njdEVrse
         1mZehOQXMWvrowbMlu3VMIGkvuI7LfDRSEiZ3HBQ=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 26/28] media: ti-vpe: cal: init ctx->v_fmt correctly in MC mode
Date:   Mon, 12 Apr 2021 14:34:55 +0300
Message-Id: <20210412113457.328012-27-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CAL driver enumerates mbus codes in the connected subdev to create a
list of supported formats reported to userspace, and initializes
ctx->v_fmt and ctx->fmtinfo to one of those formats.

This works fine for legacy mode, but is not correct for MC mode, and the
list is not even used in MC mode.

Fix this by adding a new function, cal_ctx_v4l2_init_mc_format, which
only initializes ctx->v_fmt and ctx->fmtinfo to a default value.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti-vpe/cal-video.c | 45 ++++++++++++++++++++---
 drivers/media/platform/ti-vpe/cal.h       |  2 +-
 2 files changed, 40 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 0494cd04b9a5..95066cca128a 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -879,26 +879,59 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
 	return 0;
 }
 
+static int cal_ctx_v4l2_init_mc_format(struct cal_ctx *ctx)
+{
+	const struct cal_format_info *fmtinfo;
+	struct v4l2_pix_format *pix_fmt = &ctx->v_fmt.fmt.pix;
+
+	fmtinfo = cal_format_by_code(MEDIA_BUS_FMT_UYVY8_2X8);
+	if (!fmtinfo)
+		return -EINVAL;
+
+	pix_fmt->width = 640;
+	pix_fmt->height = 480;
+	pix_fmt->field = V4L2_FIELD_NONE;
+	pix_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	pix_fmt->ycbcr_enc = V4L2_YCBCR_ENC_601;
+	pix_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	pix_fmt->xfer_func = V4L2_XFER_FUNC_SRGB;
+	pix_fmt->pixelformat = fmtinfo->fourcc;
+
+	ctx->v_fmt.type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+
+	/* Save current format */
+	cal_calc_format_size(ctx, fmtinfo, &ctx->v_fmt);
+	ctx->fmtinfo = fmtinfo;
+
+	return 0;
+}
+
 void cal_ctx_v4l2_register(struct cal_ctx *ctx)
 {
 	struct video_device *vfd = &ctx->vdev;
 	int ret;
 
-	ret = cal_ctx_v4l2_init_formats(ctx);
-	if (ret) {
-		ctx_err(ctx, "Failed to init formats: %d\n", ret);
-		return;
-	}
-
 	if (!cal_mc_api) {
 		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
 
+		ret = cal_ctx_v4l2_init_formats(ctx);
+		if (ret) {
+			ctx_err(ctx, "Failed to init formats: %d\n", ret);
+			return;
+		}
+
 		ret = v4l2_ctrl_add_handler(hdl, ctx->phy->source->ctrl_handler,
 					    NULL, true);
 		if (ret < 0) {
 			ctx_err(ctx, "Failed to add source ctrl handler\n");
 			return;
 		}
+	} else {
+		ret = cal_ctx_v4l2_init_mc_format(ctx);
+		if (ret) {
+			ctx_err(ctx, "Failed to init format: %d\n", ret);
+			return;
+		}
 	}
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, cal_video_nr);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index ad7d26c803eb..c941d2aec79f 100644
--- a/drivers/media/platform/ti-vpe/cal.h
+++ b/drivers/media/platform/ti-vpe/cal.h
@@ -213,7 +213,7 @@ struct cal_ctx {
 	/* Used to store current pixel format */
 	struct v4l2_format	v_fmt;
 
-	/* Current subdev enumerated format */
+	/* Current subdev enumerated format (legacy) */
 	const struct cal_format_info	**active_fmt;
 	unsigned int		num_active_fmt;
 
-- 
2.25.1

