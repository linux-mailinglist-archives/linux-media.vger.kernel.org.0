Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28E3469F4F3
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 13:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231650AbjBVM4z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 07:56:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229834AbjBVM4y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 07:56:54 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FE3360BD
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 04:56:53 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA3FD9DE;
        Wed, 22 Feb 2023 13:56:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677070611;
        bh=pMyZQh1zn1ZTYIRQsNuOdFTBbgGUqSKTKSwU97FcMEA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hmWNCrgVfxQzQycUD5r4jP4bb2y3HXa4fSEHVwddUcynCVKzO2N/Spj3NAXda2d1W
         e2qt6zQWHhUBBNDuopEzIeBPJRCy3Q4uWXPjNKWvOmeIPs40WojN8mnfD9AX+3t2GX
         BfCwYR2m3nm8AX0YXel0Mq9tdSikMnIw3kd+520E=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Jai Luthra <j-luthra@ti.com>,
        Vaishnav Achath <vaishnav.a@ti.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v1 1/3] media: ti: cal: Add support for 1X16 mbus formats
Date:   Wed, 22 Feb 2023 14:56:28 +0200
Message-Id: <20230222125630.421020-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
References: <20230222125630.421020-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

For legacy reasons the CAL driver uses 2X8 mbus formats for the CSI-2
link (e.g. MEDIA_BUS_FMT_YUYV8_2X8). 1X16 formats are more correct and
used by many drivers, so add 1X16 support to CAL.

We keep the 2X8 formats for backward compatibility.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/platform/ti/cal/cal-video.c | 16 ++++++++++++++-
 drivers/media/platform/ti/cal/cal.c       | 25 +++++++++++++++++++++++
 drivers/media/platform/ti/cal/cal.h       |  1 +
 3 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/platform/ti/cal/cal-video.c
index 4eade409d5d3..87db8761d94d 100644
--- a/drivers/media/platform/ti/cal/cal-video.c
+++ b/drivers/media/platform/ti/cal/cal-video.c
@@ -446,6 +446,15 @@ static int cal_mc_enum_fmt_vid_cap(struct file *file, void  *priv,
 		if (f->mbus_code && cal_formats[i].code != f->mbus_code)
 			continue;
 
+		/*
+		 * Skip legacy formats so that we don't return duplicate fourccs,
+		 * except in the case that the user explicitly asked for an
+		 * mbus_code which matches this legacy format.
+		 */
+		if (cal_formats[i].legacy &&
+		    (!f->mbus_code || cal_formats[i].code != f->mbus_code))
+			continue;
+
 		if (idx == f->index) {
 			f->pixelformat = cal_formats[i].fourcc;
 			f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
@@ -683,6 +692,7 @@ static void cal_release_buffers(struct cal_ctx *ctx,
 
 static int cal_video_check_format(struct cal_ctx *ctx)
 {
+	const struct cal_format_info *rx_fmtinfo;
 	const struct v4l2_mbus_framefmt *format;
 	struct media_pad *remote_pad;
 
@@ -692,7 +702,11 @@ static int cal_video_check_format(struct cal_ctx *ctx)
 
 	format = &ctx->phy->formats[remote_pad->index];
 
-	if (ctx->fmtinfo->code != format->code ||
+	rx_fmtinfo = cal_format_by_code(format->code);
+	if (!rx_fmtinfo)
+		return -EINVAL;
+
+	if (ctx->fmtinfo->fourcc != rx_fmtinfo->fourcc ||
 	    ctx->v_fmt.fmt.pix.height != format->height ||
 	    ctx->v_fmt.fmt.pix.width != format->width ||
 	    ctx->v_fmt.fmt.pix.field != format->field)
diff --git a/drivers/media/platform/ti/cal/cal.c b/drivers/media/platform/ti/cal/cal.c
index 1236215ec70e..053bf1030af0 100644
--- a/drivers/media/platform/ti/cal/cal.c
+++ b/drivers/media/platform/ti/cal/cal.c
@@ -59,22 +59,47 @@ MODULE_PARM_DESC(mc_api, "activates the MC API");
  */
 
 const struct cal_format_info cal_formats[] = {
+	/*
+	 * 2X8 entries are legacy codes. All new drivers should use 1X16 modes.
+	 * The 2X8 modes must be before 1X16 in this list so that the driver
+	 * behavior for non-MC mode doesn't change.
+	 */
 	{
 		.fourcc		= V4L2_PIX_FMT_YUYV,
 		.code		= MEDIA_BUS_FMT_YUYV8_2X8,
 		.bpp		= 16,
+		.legacy		= true,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_UYVY,
 		.code		= MEDIA_BUS_FMT_UYVY8_2X8,
 		.bpp		= 16,
+		.legacy		= true,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_YVYU,
 		.code		= MEDIA_BUS_FMT_YVYU8_2X8,
 		.bpp		= 16,
+		.legacy		= true,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_VYUY,
 		.code		= MEDIA_BUS_FMT_VYUY8_2X8,
 		.bpp		= 16,
+		.legacy		= true,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_YUYV,
+		.code		= MEDIA_BUS_FMT_YUYV8_1X16,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_UYVY,
+		.code		= MEDIA_BUS_FMT_UYVY8_1X16,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_YVYU,
+		.code		= MEDIA_BUS_FMT_YVYU8_1X16,
+		.bpp		= 16,
+	}, {
+		.fourcc		= V4L2_PIX_FMT_VYUY,
+		.code		= MEDIA_BUS_FMT_VYUY8_1X16,
+		.bpp		= 16,
 	}, {
 		.fourcc		= V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
 		.code		= MEDIA_BUS_FMT_RGB565_2X8_LE,
diff --git a/drivers/media/platform/ti/cal/cal.h b/drivers/media/platform/ti/cal/cal.h
index de73d6d21b6f..44ecae8a273a 100644
--- a/drivers/media/platform/ti/cal/cal.h
+++ b/drivers/media/platform/ti/cal/cal.h
@@ -89,6 +89,7 @@ struct cal_format_info {
 	/* Bits per pixel */
 	u8	bpp;
 	bool	meta;
+	bool	legacy;
 };
 
 /* buffer for one video frame */
-- 
2.34.1

