Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 120BE213E4B
	for <lists+linux-media@lfdr.de>; Fri,  3 Jul 2020 19:10:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726966AbgGCRKc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Jul 2020 13:10:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726718AbgGCRKb (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Jul 2020 13:10:31 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BB89C061794
        for <linux-media@vger.kernel.org>; Fri,  3 Jul 2020 10:10:31 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id A77682A65C0
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v5 3/7] media: vivid: Add support to the CSC API
Date:   Fri,  3 Jul 2020 19:10:15 +0200
Message-Id: <20200703171019.19270-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
References: <20200703171019.19270-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The CSC API (Colorspace conversion) allows userspace to try
to configure the ycbcr/hsv_enc function and the quantization
for capture devices. This patch adds support to the CSC API
in vivid.
Using the CSC API, userspace is allowed to do the following:

- Set the ycbcr_enc function for YUV formats.
- Set the hsv_enc function for HSV formats
- Set the quantization for YUV and RGB formats.
- Set the xfer_func.
- Set the colorspace.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 .../media/test-drivers/vivid/vivid-vid-cap.c  | 74 +++++++++++++++++--
 .../test-drivers/vivid/vivid-vid-common.c     | 24 ++++++
 2 files changed, 92 insertions(+), 6 deletions(-)

diff --git a/drivers/media/test-drivers/vivid/vivid-vid-cap.c b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
index e94beef008c8..8916def70ffe 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-cap.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-cap.c
@@ -549,6 +549,45 @@ int vivid_g_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
+static bool vivid_is_colorspace_valid(__u32 colorspace)
+{
+	if (colorspace > V4L2_COLORSPACE_DEFAULT &&
+	    colorspace <= V4L2_COLORSPACE_DCI_P3)
+		return true;
+	return false;
+}
+
+static bool vivid_is_hsv_enc_valid(__u8 hsv_enc)
+{
+	if (hsv_enc == V4L2_HSV_ENC_180 || hsv_enc == V4L2_HSV_ENC_256)
+		return true;
+	return false;
+}
+
+static bool vivid_is_ycbcr_enc_valid(__u8 ycbcr_enc)
+{
+	/* V4L2_YCBCR_ENC_SMPTE240M is the last ycbcr_enc enum */
+	if (ycbcr_enc && ycbcr_enc <= V4L2_YCBCR_ENC_SMPTE240M)
+		return true;
+	return false;
+}
+
+static bool vivid_is_quant_valid(__u8 quantization)
+{
+	if (quantization == V4L2_QUANTIZATION_FULL_RANGE ||
+	    quantization == V4L2_QUANTIZATION_LIM_RANGE)
+		return true;
+	return false;
+}
+
+static bool vivid_is_xfer_func_valid(__u32 xfer_func)
+{
+	if (xfer_func > V4L2_XFER_FUNC_DEFAULT &&
+	    xfer_func <= V4L2_XFER_FUNC_SMPTE2084)
+		return true;
+	return false;
+}
+
 int vivid_try_fmt_vid_cap(struct file *file, void *priv,
 			struct v4l2_format *f)
 {
@@ -560,6 +599,7 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
 	unsigned factor = 1;
 	unsigned w, h;
 	unsigned p;
+	bool user_set_csc = !!(mp->flags & V4L2_PIX_FMT_FLAG_SET_CSC);
 
 	fmt = vivid_get_format(dev, mp->pixelformat);
 	if (!fmt) {
@@ -633,13 +673,26 @@ int vivid_try_fmt_vid_cap(struct file *file, void *priv,
 			(fmt->bit_depth[p] / fmt->vdownsampling[p])) /
 			(fmt->bit_depth[0] / fmt->vdownsampling[0]);
 
-	mp->colorspace = vivid_colorspace_cap(dev);
-	if (fmt->color_enc == TGP_COLOR_ENC_HSV)
-		mp->hsv_enc = vivid_hsv_enc_cap(dev);
-	else
+	if (!user_set_csc || !vivid_is_colorspace_valid(mp->colorspace))
+		mp->colorspace = vivid_colorspace_cap(dev);
+	if (fmt->color_enc == TGP_COLOR_ENC_HSV) {
+		if (!user_set_csc || !vivid_is_hsv_enc_valid(mp->hsv_enc))
+			mp->hsv_enc = vivid_hsv_enc_cap(dev);
+	} else if (fmt->color_enc == TGP_COLOR_ENC_YCBCR) {
+		if (!user_set_csc || !vivid_is_ycbcr_enc_valid(mp->ycbcr_enc))
+			mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
+	} else {
 		mp->ycbcr_enc = vivid_ycbcr_enc_cap(dev);
-	mp->xfer_func = vivid_xfer_func_cap(dev);
-	mp->quantization = vivid_quantization_cap(dev);
+	}
+	if (!user_set_csc || !vivid_is_xfer_func_valid(mp->xfer_func))
+		mp->xfer_func = vivid_xfer_func_cap(dev);
+	if (fmt->color_enc == TGP_COLOR_ENC_YCBCR ||
+	    fmt->color_enc == TGP_COLOR_ENC_RGB) {
+		if (!user_set_csc || !vivid_is_quant_valid(mp->quantization))
+			mp->quantization = vivid_quantization_cap(dev);
+	} else {
+		mp->quantization = vivid_quantization_cap(dev);
+	}
 	memset(mp->reserved, 0, sizeof(mp->reserved));
 	return 0;
 }
@@ -769,6 +822,15 @@ int vivid_s_fmt_vid_cap(struct file *file, void *priv,
 	if (vivid_is_sdtv_cap(dev))
 		dev->tv_field_cap = mp->field;
 	tpg_update_mv_step(&dev->tpg);
+	dev->tpg.colorspace = mp->colorspace;
+	dev->tpg.quantization = mp->quantization;
+	if (dev->fmt_cap->color_enc == TGP_COLOR_ENC_YCBCR)
+		dev->tpg.ycbcr_enc = mp->ycbcr_enc;
+	else
+		dev->tpg.hsv_enc = mp->hsv_enc;
+	dev->tpg.quantization = mp->quantization;
+	dev->tpg.xfer_func = mp->xfer_func;
+
 	return 0;
 }
 
diff --git a/drivers/media/test-drivers/vivid/vivid-vid-common.c b/drivers/media/test-drivers/vivid/vivid-vid-common.c
index 76b0be670ebb..5cab9b2a74bd 100644
--- a/drivers/media/test-drivers/vivid/vivid-vid-common.c
+++ b/drivers/media/test-drivers/vivid/vivid-vid-common.c
@@ -920,6 +920,30 @@ int vivid_enum_fmt_vid(struct file *file, void  *priv,
 	fmt = &vivid_formats[f->index];
 
 	f->pixelformat = fmt->fourcc;
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
+	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+		return 0;
+	/*
+	 * For capture devices, we support the CSC API.
+	 * We allow userspace to:
+	 * 1. set the ycbcr_enc on yuv format
+	 * 2. set the hsv_enc on hsv format
+	 * 3. set the quantization on yuv and rgb formats
+	 * 4. set the colorspace
+	 * 5. set the xfer_func
+	 */
+	if (fmt->color_enc == TGP_COLOR_ENC_YCBCR) {
+		f->flags |= V4L2_FMT_FLAG_CSC_YCBCR_ENC;
+		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION;
+	} else if (fmt->color_enc == TGP_COLOR_ENC_HSV) {
+		f->flags |= V4L2_FMT_FLAG_CSC_HSV_ENC;
+	} else if (fmt->color_enc == TGP_COLOR_ENC_RGB) {
+		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION;
+	}
+	f->flags |= V4L2_FMT_FLAG_CSC_COLORSPACE;
+	f->flags |= V4L2_FMT_FLAG_CSC_XFER_FUNC;
+
 	return 0;
 }
 
-- 
2.17.1

