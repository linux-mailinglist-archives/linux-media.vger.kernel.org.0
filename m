Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5859C1AC78F
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2020 16:56:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406753AbgDPO4i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Apr 2020 10:56:38 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:41028 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394840AbgDPO4Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Apr 2020 10:56:16 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 48E5D2A220A
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        laurent.pinchart@ideasonboard.com,
        linux-rockchip@lists.infradead.org, sakari.ailus@linux.intel.com
Subject: [RFC v3 2/2] media: staging: rkisp1: allow quantization conversion from userspace for isp source pad
Date:   Thu, 16 Apr 2020 16:56:05 +0200
Message-Id: <20200416145605.12399-2-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200416145605.12399-1-dafna.hirschfeld@collabora.com>
References: <20200416145605.12399-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The isp entity has a hardware support to force full range quantization
for YUV formats. Use the new API to indicate userspace that
quantization conversion is supported by adding the flag
V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION during media code enumeration.
Then uppon s_fmt on the video source pad, we assign the
quantization from userspace for YUV formats.
Also in the capture and resizer entities we retrieve the colorspace
from the isp entity.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 28 ++++++-------
 drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 39 +++++++++++++++++--
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 13 +++++++
 4 files changed, 65 insertions(+), 17 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index fbf62399fe3d..aca0f93bc772 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -1066,14 +1066,13 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
 			   const struct v4l2_format_info **fmt_info)
 {
 	const struct rkisp1_capture_config *config = cap->config;
-	struct rkisp1_capture *other_cap =
-			&cap->rkisp1->capture_devs[cap->id ^ 1];
 	const struct rkisp1_capture_fmt_cfg *fmt;
 	const struct v4l2_format_info *info;
 	const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
 					    RKISP1_RSZ_SP_SRC_MAX_WIDTH };
 	const unsigned int max_heights[] = { RKISP1_RSZ_MP_SRC_MAX_HEIGHT,
 					     RKISP1_RSZ_SP_SRC_MAX_HEIGHT};
+	struct v4l2_subdev_format isp_sd_fmt;
 
 	fmt = rkisp1_find_fmt_cfg(cap, pixm->pixelformat);
 	if (!fmt) {
@@ -1081,24 +1080,27 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
 		pixm->pixelformat = fmt->fourcc;
 	}
 
+	rkisp1_get_isp_src_fmt(cap->rkisp1, &isp_sd_fmt);
+	pixm->field = isp_sd_fmt.format.field;
+	pixm->colorspace = isp_sd_fmt.format.colorspace;
+	pixm->ycbcr_enc = isp_sd_fmt.format.ycbcr_enc;
+	pixm->xfer_func = isp_sd_fmt.format.xfer_func;
+
+	/*
+	 * isp has a feature to set full range quantization for yuv formats.
+	 * so we need to get the format from the isp.
+	 */
+	pixm->quantization = isp_sd_fmt.format.quantization;
+	if (!v4l2_is_format_yuv(cap->pix.info))
+		pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
 	pixm->width = clamp_t(u32, pixm->width,
 			      RKISP1_RSZ_SRC_MIN_WIDTH, max_widths[cap->id]);
 	pixm->height = clamp_t(u32, pixm->height,
 			       RKISP1_RSZ_SRC_MIN_HEIGHT, max_heights[cap->id]);
 
-	pixm->field = V4L2_FIELD_NONE;
-	pixm->colorspace = V4L2_COLORSPACE_DEFAULT;
-	pixm->ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
-
 	info = rkisp1_fill_pixfmt(pixm, cap->id);
 
-	/* can not change quantization when stream-on */
-	if (other_cap->is_streaming)
-		pixm->quantization = other_cap->pix.fmt.quantization;
-	/* output full range by default, take effect in params */
-	else if (!pixm->quantization ||
-		 pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
-		pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 
 	if (fmt_cfg)
 		*fmt_cfg = fmt;
diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 2d7b7e078636..7a5576fa14c9 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -300,6 +300,8 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
 			struct v4l2_device *v4l2_dev);
 void rkisp1_isp_unregister(struct rkisp1_device *rkisp1);
 
+int rkisp1_get_isp_src_fmt(struct rkisp1_device *rkisp1,
+			   struct v4l2_subdev_format *sd_fmt);
 const struct rkisp1_isp_mbus_info *rkisp1_isp_mbus_info_get(u32 mbus_code);
 
 irqreturn_t rkisp1_isp_isr(struct rkisp1_device *rkisp1);
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index dee8e96f3900..6fdf5ed0b6b1 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -613,6 +613,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
 
 		if (code->index == pos - 1) {
 			code->code = fmt->mbus_code;
+			if (fmt->pixel_enc == V4L2_PIXEL_ENC_YUV &&
+			    dir == RKISP1_DIR_SRC)
+				code->flags =
+					V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
 			return 0;
 		}
 	}
@@ -639,12 +643,21 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 	sink_crop->height = RKISP1_DEFAULT_HEIGHT;
 	sink_crop->left = 0;
 	sink_crop->top = 0;
+	sink_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	sink_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(sink_fmt->colorspace);
+	sink_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+
 
 	src_fmt = v4l2_subdev_get_try_format(sd, cfg,
 					     RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_fmt = *sink_fmt;
 	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
-	src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);
+	src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
+	src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+
 
 	src_crop = v4l2_subdev_get_try_crop(sd, cfg,
 					    RKISP1_ISP_PAD_SOURCE_VIDEO);
@@ -687,10 +700,17 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 		isp->src_fmt = mbus_info;
 	src_fmt->width  = src_crop->width;
 	src_fmt->height = src_crop->height;
-	src_fmt->quantization = format->quantization;
-	/* full range by default */
-	if (!src_fmt->quantization)
+
+	src_fmt->colorspace = V4L2_COLORSPACE_SRGB;
+	src_fmt->ycbcr_enc = V4L2_MAP_YCBCR_ENC_DEFAULT(src_fmt->colorspace);
+	src_fmt->xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(src_fmt->colorspace);
+
+	if (mbus_info->pixel_enc == V4L2_PIXEL_ENC_BAYER)
 		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	else if (format->quantization == V4L2_QUANTIZATION_DEFAULT)
+		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	else
+		src_fmt->quantization = format->quantization;
 
 	*format = *src_fmt;
 }
@@ -1068,6 +1088,17 @@ int rkisp1_isp_register(struct rkisp1_device *rkisp1,
 	return ret;
 }
 
+int rkisp1_get_isp_src_fmt(struct rkisp1_device *rkisp1,
+			   struct v4l2_subdev_format *sd_fmt)
+{
+	struct rkisp1_isp *isp = &rkisp1->isp;
+
+	sd_fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	sd_fmt->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
+
+	return v4l2_subdev_call(&isp->sd, pad, get_fmt, NULL, sd_fmt);
+}
+
 void rkisp1_isp_unregister(struct rkisp1_device *rkisp1)
 {
 	struct v4l2_subdev *sd = &rkisp1->isp.sd;
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 7b6b7ddd4169..8705b133de68 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -525,6 +525,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 	const struct rkisp1_isp_mbus_info *mbus_info;
 	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
 	struct v4l2_rect *sink_crop;
+	struct v4l2_subdev_format isp_sd_fmt;
 
 	sink_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SINK, which);
 	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, cfg, RKISP1_RSZ_PAD_SRC, which);
@@ -539,8 +540,20 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
 		rsz->pixel_enc = mbus_info->pixel_enc;
 
+	rkisp1_get_isp_src_fmt(rsz->rkisp1, &isp_sd_fmt);
+
+	sink_fmt->field = isp_sd_fmt.format.field;
+	sink_fmt->colorspace = isp_sd_fmt.format.colorspace;
+	sink_fmt->ycbcr_enc = isp_sd_fmt.format.ycbcr_enc;
+	sink_fmt->xfer_func = isp_sd_fmt.format.xfer_func;
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

