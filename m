Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 571D7365877
	for <lists+linux-media@lfdr.de>; Tue, 20 Apr 2021 14:06:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbhDTMGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 20 Apr 2021 08:06:03 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57980 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232226AbhDTMGC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 20 Apr 2021 08:06:02 -0400
Received: from deskari.lan (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CEA90470;
        Tue, 20 Apr 2021 14:05:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618920329;
        bh=PJ/M8UvjvY0ANZEpowkY+eliUPe4lbelmTs5KI/CN+A=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mv+3kIc5EWKE+I6g8inh/2Il2Dy2I4nBYZXHYktd8xuL63UzS6bFi3SGlrAF6X01T
         2SIS2lL4lM9fXNd0CuV0zZqYKa+ZETLUpl8Y+ClUJ9lO/yBvKdYHitEzabfswm3oEo
         u0iMHAyWJbszaNh3J/02BBszIyRpfDaqSomMrgyM=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     Benoit Parrot <bparrot@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v2 26/35] media: ti-vpe: cal: init ctx->v_fmt correctly in MC mode
Date:   Tue, 20 Apr 2021 15:04:24 +0300
Message-Id: <20210420120433.902394-27-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
References: <20210420120433.902394-1-tomi.valkeinen@ideasonboard.com>
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
 drivers/media/platform/ti-vpe/cal-video.c | 43 ++++++++++++++++++++---
 drivers/media/platform/ti-vpe/cal.h       |  2 +-
 2 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
index 6f1e8d257b5c..2c4b55124c2d 100644
--- a/drivers/media/platform/ti-vpe/cal-video.c
+++ b/drivers/media/platform/ti-vpe/cal-video.c
@@ -879,24 +879,59 @@ static int cal_ctx_v4l2_init_formats(struct cal_ctx *ctx)
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
 int cal_ctx_v4l2_register(struct cal_ctx *ctx)
 {
 	struct video_device *vfd = &ctx->vdev;
 	int ret;
 
-	ret = cal_ctx_v4l2_init_formats(ctx);
-	if (ret)
-		return ret;
-
 	if (!cal_mc_api) {
 		struct v4l2_ctrl_handler *hdl = &ctx->ctrl_handler;
 
+		ret = cal_ctx_v4l2_init_formats(ctx);
+		if (ret) {
+			ctx_err(ctx, "Failed to init formats: %d\n", ret);
+			return ret;
+		}
+
 		ret = v4l2_ctrl_add_handler(hdl, ctx->phy->source->ctrl_handler,
 					    NULL, true);
 		if (ret < 0) {
 			ctx_err(ctx, "Failed to add source ctrl handler\n");
 			return ret;
 		}
+	} else {
+		ret = cal_ctx_v4l2_init_mc_format(ctx);
+		if (ret) {
+			ctx_err(ctx, "Failed to init format: %d\n", ret);
+			return ret;
+		}
 	}
 
 	ret = video_register_device(vfd, VFL_TYPE_VIDEO, cal_video_nr);
diff --git a/drivers/media/platform/ti-vpe/cal.h b/drivers/media/platform/ti-vpe/cal.h
index def0c9a3657d..ee42c9c48fa1 100644
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

