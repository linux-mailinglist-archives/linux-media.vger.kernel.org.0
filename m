Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F06C22B061
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 15:21:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbgGWNV1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 09:21:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729061AbgGWNVY (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 09:21:24 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D00AC0619DC
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2020 06:21:24 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 8A1C0298A24
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v3 08/10] media: staging: rkisp1: rsz: Add support to more YUV encoded mbus codes on src pad
Date:   Thu, 23 Jul 2020 15:20:12 +0200
Message-Id: <20200723132014.4597-9-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support to more YUV encoded media bus formats on the resizer's
source pad. The patch defines an array rkisp1_rsz_yuv_formats[]
with the list of supported YUV media bus formats and their {hv}div
values. The {hv}div are used in the function 'rkisp1_rsz_config'
instead of the macros RKISP1_MBUS_FMT_(HV)DIV, and instead of
checking the capture format.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 66 ++++++++++++++-----
 1 file changed, 48 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 4e87c6f3f732..8f68a7be659f 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -16,8 +16,35 @@
 #define RKISP1_DEF_FMT MEDIA_BUS_FMT_YUYV8_2X8
 #define RKISP1_DEF_PIXEL_ENC V4L2_PIXEL_ENC_YUV
 
-#define RKISP1_MBUS_FMT_HDIV 2
-#define RKISP1_MBUS_FMT_VDIV 1
+struct rkisp1_rsz_yuv_mbus_info {
+	u32 mbus_code;
+	u32 hdiv;
+	u32 vdiv;
+};
+
+static const struct rkisp1_rsz_yuv_mbus_info rkisp1_rsz_yuv_src_formats[] = {
+	{
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8, /* YUV422 */
+		.hdiv		= 2,
+		.vdiv		= 1,
+	},
+	{
+		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1_5X8, /* YUV420 */
+		.hdiv		= 2,
+		.vdiv		= 2,
+	},
+};
+
+static const struct rkisp1_rsz_yuv_mbus_info *rkisp1_rsz_yuv_mbus_info(u32 mbus_code)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(rkisp1_rsz_yuv_src_formats); i++)
+		if (rkisp1_rsz_yuv_src_formats[i].mbus_code == mbus_code)
+			return &rkisp1_rsz_yuv_src_formats[i];
+
+	return NULL;
+}
 
 enum rkisp1_shadow_regs_when {
 	RKISP1_SHADOW_REGS_SYNC,
@@ -361,16 +388,19 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
 static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 			      enum rkisp1_shadow_regs_when when)
 {
-	u8 hdiv = RKISP1_MBUS_FMT_HDIV, vdiv = RKISP1_MBUS_FMT_VDIV;
+	const struct rkisp1_rsz_yuv_mbus_info *sink_yuv_info, *src_yuv_info;
 	struct v4l2_rect sink_y, sink_c, src_y, src_c;
-	struct v4l2_mbus_framefmt *src_fmt;
+	struct v4l2_mbus_framefmt *src_fmt, *sink_fmt;
 	struct v4l2_rect *sink_crop;
-	struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
 
 	sink_crop = rkisp1_rsz_get_pad_crop(rsz, NULL, RKISP1_RSZ_PAD_SINK,
 					    V4L2_SUBDEV_FORMAT_ACTIVE);
 	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, NULL, RKISP1_RSZ_PAD_SRC,
 					 V4L2_SUBDEV_FORMAT_ACTIVE);
+	src_yuv_info = rkisp1_rsz_yuv_mbus_info(src_fmt->code);
+	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, NULL, RKISP1_RSZ_PAD_SINK,
+					  V4L2_SUBDEV_FORMAT_ACTIVE);
+	sink_yuv_info = rkisp1_rsz_yuv_mbus_info(sink_fmt->code);
 
 	/*
 	 * The resizer only works on yuv formats,
@@ -386,25 +416,17 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	src_y.width = src_fmt->width;
 	src_y.height = src_fmt->height;
 
-	sink_c.width = sink_y.width / RKISP1_MBUS_FMT_HDIV;
-	sink_c.height = sink_y.height / RKISP1_MBUS_FMT_VDIV;
+	sink_c.width = sink_y.width / sink_yuv_info->hdiv;
+	sink_c.height = sink_y.height / sink_yuv_info->vdiv;
 
 	/*
 	 * The resizer is used not only to change the dimensions of the frame
 	 * but also to change the scale for YUV formats,
 	 * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
-	 * streams should be set according to the pixel format in the capture.
-	 * The resizer always gets the input as YUV422. If the capture format
-	 * is RGB then the memory input should be YUV422 so we don't change the
-	 * default hdiv, vdiv in that case.
+	 * streams should be set according to the media bus format in the src pad.
 	 */
-	if (v4l2_is_format_yuv(cap->pix.info)) {
-		hdiv = cap->pix.info->hdiv;
-		vdiv = cap->pix.info->vdiv;
-	}
-
-	src_c.width = src_y.width / hdiv;
-	src_c.height = src_y.height / vdiv;
+	src_c.width = src_y.width / src_yuv_info->hdiv;
+	src_c.height = src_y.height / src_yuv_info->vdiv;
 
 	if (sink_c.width == src_c.width && sink_c.height == src_c.height) {
 		rkisp1_rsz_disable(rsz, when);
@@ -499,6 +521,14 @@ static void rkisp1_rsz_set_src_fmt(struct rkisp1_resizer *rsz,
 	struct v4l2_mbus_framefmt *src_fmt;
 
 	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
+	if (rsz->pixel_enc == V4L2_PIXEL_ENC_YUV) {
+		const struct rkisp1_rsz_yuv_mbus_info *fmt =
+			rkisp1_rsz_yuv_mbus_info(format->code);
+
+		if (fmt)
+			src_fmt->code = format->code;
+	}
+
 	src_fmt->width = clamp_t(u32, format->width,
 				 rsz->config->min_rsz_width,
 				 rsz->config->max_rsz_width);
-- 
2.17.1

