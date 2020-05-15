Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 206781D5080
	for <lists+linux-media@lfdr.de>; Fri, 15 May 2020 16:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726185AbgEOOaF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 15 May 2020 10:30:05 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:44504 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgEOOaE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 15 May 2020 10:30:04 -0400
Received: from localhost.localdomain (p200300cb871f5b0000f307f9e92f920a.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:f3:7f9:e92f:920a])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id C1B902A345E;
        Fri, 15 May 2020 15:30:01 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, laurent.pinchart@ideasonboard.com
Subject: [PATCH v2 2/4] media: staging: rkisp1: rsz: use hdiv, vdiv of yuv422 instead of macros
Date:   Fri, 15 May 2020 16:29:50 +0200
Message-Id: <20200515142952.20163-3-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The resize block of rkisp1 always get the input as yuv422.
Instead of defining the default hdiv, vdiv as macros, the
code is more clear if it takes the (hv)div from the YUV422P
info. This makes it clear where those values come from.
The patch also adds documentation to explain that.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 25 +++++++++----------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index d049374413dc..04a29af8cc92 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -16,9 +16,6 @@
 #define RKISP1_DEF_FMT MEDIA_BUS_FMT_YUYV8_2X8
 #define RKISP1_DEF_PIXEL_ENC V4L2_PIXEL_ENC_YUV
 
-#define RKISP1_MBUS_FMT_HDIV 2
-#define RKISP1_MBUS_FMT_VDIV 1
-
 enum rkisp1_shadow_regs_when {
 	RKISP1_SHADOW_REGS_SYNC,
 	RKISP1_SHADOW_REGS_ASYNC,
@@ -361,11 +358,12 @@ static void rkisp1_rsz_config_regs(struct rkisp1_resizer *rsz,
 static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 			      enum rkisp1_shadow_regs_when when)
 {
-	u8 hdiv = RKISP1_MBUS_FMT_HDIV, vdiv = RKISP1_MBUS_FMT_VDIV;
 	struct v4l2_rect sink_y, sink_c, src_y, src_c;
 	struct v4l2_mbus_framefmt *src_fmt;
 	struct v4l2_rect *sink_crop;
 	struct rkisp1_capture *cap = &rsz->rkisp1->capture_devs[rsz->id];
+	const struct v4l2_format_info *yuv422_info =
+		v4l2_format_info(V4L2_PIX_FMT_YUV422P);
 
 	sink_crop = rkisp1_rsz_get_pad_crop(rsz, NULL, RKISP1_RSZ_PAD_SINK,
 					    V4L2_SUBDEV_FORMAT_ACTIVE);
@@ -386,8 +384,9 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	src_y.width = src_fmt->width;
 	src_y.height = src_fmt->height;
 
-	sink_c.width = sink_y.width / RKISP1_MBUS_FMT_HDIV;
-	sink_c.height = sink_y.height / RKISP1_MBUS_FMT_VDIV;
+	/* The input format of the resizer is always yuv422 */
+	sink_c.width = sink_y.width / yuv422_info->hdiv;
+	sink_c.height = sink_y.height / yuv422_info->vdiv;
 
 	/*
 	 * The resizer is used not only to change the dimensions of the frame
@@ -395,17 +394,17 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	 * (4:2:2 -> 4:2:0 for example). So the width/height of the CbCr
 	 * streams should be set according to the pixel format in the capture.
 	 * The resizer always gets the input as YUV422. If the capture format
-	 * is RGB then the memory input should be YUV422 so we don't change the
-	 * default hdiv, vdiv in that case.
+	 * is RGB then the memory input (the resizer output) should be YUV422
+	 * so we use the hdiv, vdiv of the YUV422 info in this case.
 	 */
 	if (v4l2_is_format_yuv(cap->pix.info)) {
-		hdiv = cap->pix.info->hdiv;
-		vdiv = cap->pix.info->vdiv;
+		src_c.width = cap->pix.info->hdiv;
+		src_c.height = cap->pix.info->vdiv;
+	} else {
+		src_c.width = src_y.width / yuv422_info->hdiv;
+		src_c.height = src_y.height / yuv422_info->vdiv;
 	}
 
-	src_c.width = src_y.width / hdiv;
-	src_c.height = src_y.height / vdiv;
-
 	if (sink_c.width == src_c.width && sink_c.height == src_c.height) {
 		rkisp1_rsz_disable(rsz, when);
 		return;
-- 
2.17.1

