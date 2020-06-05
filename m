Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA891EFEC6
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 19:27:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727966AbgFER1A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 13:27:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727895AbgFER04 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 13:26:56 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B99C08C5C2
        for <linux-media@vger.kernel.org>; Fri,  5 Jun 2020 10:26:55 -0700 (PDT)
Received: from localhost.localdomain (p200300cb871f5b0030b619f331cc239b.dip0.t-ipconnect.de [IPv6:2003:cb:871f:5b00:30b6:19f3:31cc:239b])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: dafna)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 0813A2A507D;
        Fri,  5 Jun 2020 18:26:54 +0100 (BST)
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org, skhan@linuxfoundation.org,
        p.zabel@pengutronix.de
Subject: [RFC v4 5/8] media: staging: rkisp1: allow quantization conversion from userspace for isp source pad
Date:   Fri,  5 Jun 2020 19:26:22 +0200
Message-Id: <20200605172625.19777-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
References: <20200605172625.19777-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The isp entity has a hardware support to force full range quantization
for YUV formats. Use the CSC API to allow userspace to set the
quantization for YUV formats on the isp, resizer and capture entities.

- The flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION is set on
YUV formats during enumeration of the resizer and isp formats.
- The flag V4L2_FMT_FLAG_CSC_QUANTIZATION is set on the YUV formats
during enumeration of the capture formats.
- The full quantization is set on YUV formats if userspace ask it
on the entities using the flag V4L2_MBUS_FRAMEFMT_SET_CSC
for subdevices and the flag V4L2_PIX_FMT_FLAG_SET_CSC on for
the capture entity.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 23 ++++++++++++-------
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 22 ++++++++++++++----
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 22 ++++++++++++++++++
 3 files changed, 55 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index f69235f82c45..66856d5eb576 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -1085,8 +1085,6 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
 			   const struct v4l2_format_info **fmt_info)
 {
 	const struct rkisp1_capture_config *config = cap->config;
-	struct rkisp1_capture *other_cap =
-			&cap->rkisp1->capture_devs[cap->id ^ 1];
 	const struct rkisp1_capture_fmt_cfg *fmt;
 	const struct v4l2_format_info *info;
 	const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
@@ -1108,16 +1106,21 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
 	pixm->field = V4L2_FIELD_NONE;
 	pixm->colorspace = V4L2_COLORSPACE_DEFAULT;
 	pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	pixm->xfer_func = V4L2_XFER_FUNC_DEFAULT;
 
 	info = rkisp1_fill_pixfmt(pixm, cap->id);
 
-	/* can not change quantization when stream-on */
-	if (other_cap->is_streaming)
-		pixm->quantization = other_cap->pix.fmt.quantization;
-	/* output full range by default, take effect in params */
-	else if (!pixm->quantization ||
-		 pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
+	/*
+	 * isp has a feature to select between limited and full range for YUV
+	 * formats.
+	 * So we should also support it in the capture using the CSC API
+	 */
+	if (pixm->flags & V4L2_PIX_FMT_FLAG_SET_CSC &&
+	    pixm->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
+	    v4l2_is_format_yuv(info))
 		pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	else
+		pixm->quantization = V4L2_QUANTIZATION_DEFAULT;
 
 	if (fmt_cfg)
 		*fmt_cfg = fmt;
@@ -1152,12 +1155,16 @@ static int rkisp1_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
 {
 	struct rkisp1_capture *cap = video_drvdata(file);
 	const struct rkisp1_capture_fmt_cfg *fmt = NULL;
+	const struct v4l2_format_info *info;
 
 	if (f->index >= cap->config->fmt_size)
 		return -EINVAL;
 
 	fmt = &cap->config->fmts[f->index];
 	f->pixelformat = fmt->fourcc;
+	info = v4l2_format_info(f->pixelformat);
+	if (v4l2_is_format_yuv(info))
+		f->flags = V4L2_FMT_FLAG_CSC_QUANTIZATION;
 
 	return 0;
 }
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index e66e87d6ea8b..28e0a3c594aa 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -591,6 +591,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
 
 		if (code->index == pos - 1) {
 			code->code = fmt->mbus_code;
+			if (fmt->pixel_enc == V4L2_PIXEL_ENC_YUV &&
+			    dir == RKISP1_DIR_SRC)
+				code->flags =
+					V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
 			return 0;
 		}
 	}
@@ -622,7 +626,6 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 					     RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_fmt = *sink_fmt;
 	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
-	src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 
 	src_crop = v4l2_subdev_get_try_crop(sd, cfg,
 					    RKISP1_ISP_PAD_SOURCE_VIDEO);
@@ -665,10 +668,21 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 		isp->src_fmt = mbus_info;
 	src_fmt->width  = src_crop->width;
 	src_fmt->height = src_crop->height;
-	src_fmt->quantization = format->quantization;
-	/* full range by default */
-	if (!src_fmt->quantization)
+
+	src_fmt->colorspace = V4L2_COLORSPACE_DEFAULT;
+	src_fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	src_fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	/*
+	 * The CSC API is used to allow userspace to force full
+	 * quantization on YUV formats.
+	 */
+	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
+	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
+	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
 		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	else
+		src_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
 
 	*format = *src_fmt;
 }
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index fa28f4bd65c0..237cce9183f7 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -549,8 +549,30 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		rsz->pixel_enc = mbus_info->pixel_enc;
 
+	sink_fmt->colorspace = V4L2_COLORSPACE_DEFAULT;
+	sink_fmt->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+	sink_fmt->xfer_func = V4L2_XFER_FUNC_DEFAULT;
+
+	/*
+	 * isp has a feature to select between limited and full range for
+	 * YUV formats.
+	 * so we should support it in the resizer using the CSC API
+	 */
+
+	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
+	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
+	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
+		sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	else
+		sink_fmt->quantization = V4L2_QUANTIZATION_DEFAULT;
+
 	/* Propagete to source pad */
 	src_fmt->code = sink_fmt->code;
+	src_fmt->field = sink_fmt->field;
+	src_fmt->colorspace = sink_fmt->colorspace;
+	src_fmt->ycbcr_enc = sink_fmt->ycbcr_enc;
+	src_fmt->xfer_func = sink_fmt->xfer_func;
+	src_fmt->quantization = sink_fmt->quantization;
 
 	sink_fmt->width = clamp_t(u32, format->width,
 				  rsz->config->min_rsz_width,
-- 
2.17.1

