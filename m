Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6DB0819FD8E
	for <lists+linux-media@lfdr.de>; Mon,  6 Apr 2020 20:52:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbgDFSwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Apr 2020 14:52:43 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:57736 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726269AbgDFSwm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Apr 2020 14:52:42 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id E6A58296B38
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: [PATCH v3 3/3] media: staging: rkisp1: change fields names from fmt_type to pixel_enc
Date:   Mon,  6 Apr 2020 20:52:35 +0200
Message-Id: <20200406185235.21238-4-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200406185235.21238-1-dafna.hirschfeld@collabora.com>
References: <20200406185235.21238-1-dafna.hirschfeld@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The fields 'fmt_type' in the structs
'rkisp1_rsz_config', 'rkisp1_isp_mbus_info' are of type
'v4l2_pixel_encoding' so it is nicer to change their name to
'pixel_enc'. Also change the define 'RKISP1_DEF_FMT_TYPE' to
'RKISP1_DEF_PIXEL_ENC'

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c |  2 +-
 drivers/staging/media/rkisp1/rkisp1-common.h  |  4 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 42 +++++++++----------
 drivers/staging/media/rkisp1/rkisp1-resizer.c | 12 +++---
 4 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 0bef5faf068e..fbf62399fe3d 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -1218,7 +1218,7 @@ static int rkisp1_capture_link_validate(struct media_link *link)
 		return -EPIPE;
 	}
 
-	if (cap->pix.info->pixel_enc != isp->src_fmt->fmt_type) {
+	if (cap->pix.info->pixel_enc != isp->src_fmt->pixel_enc) {
 		dev_err(cap->rkisp1->dev,
 			"format type mismatch in link '%s:%d->%s:%d'\n",
 			link->source->entity->name, link->source->index,
diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index c8625747c279..2d7b7e078636 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -218,7 +218,7 @@ struct rkisp1_resizer {
 	struct media_pad pads[RKISP1_ISP_PAD_MAX];
 	struct v4l2_subdev_pad_config pad_cfg[RKISP1_ISP_PAD_MAX];
 	const struct rkisp1_rsz_config *config;
-	enum v4l2_pixel_encoding fmt_type;
+	enum v4l2_pixel_encoding pixel_enc;
 	struct mutex ops_lock;
 };
 
@@ -271,7 +271,7 @@ struct rkisp1_device {
  */
 struct rkisp1_isp_mbus_info {
 	u32 mbus_code;
-	enum v4l2_pixel_encoding fmt_type;
+	enum v4l2_pixel_encoding pixel_enc;
 	u32 mipi_dt;
 	u32 yuv_seq;
 	u8 bus_width;
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 98a74603327a..dee8e96f3900 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -61,116 +61,116 @@
 static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
 	{
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
-		.fmt_type	= V4L2_PIXEL_ENC_YUV,
+		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
 		.direction	= RKISP1_DIR_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 10,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 10,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 10,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 10,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 12,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 12,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 12,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 12,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 8,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 8,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 8,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
-		.fmt_type	= V4L2_PIXEL_ENC_BAYER,
+		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 8,
 		.direction	= RKISP1_DIR_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
-		.fmt_type	= V4L2_PIXEL_ENC_YUV,
+		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCBYCR,
 		.bus_width	= 16,
 		.direction	= RKISP1_DIR_SINK,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
-		.fmt_type	= V4L2_PIXEL_ENC_YUV,
+		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCRYCB,
 		.bus_width	= 16,
 		.direction	= RKISP1_DIR_SINK,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
-		.fmt_type	= V4L2_PIXEL_ENC_YUV,
+		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CBYCRY,
 		.bus_width	= 16,
 		.direction	= RKISP1_DIR_SINK,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
-		.fmt_type	= V4L2_PIXEL_ENC_YUV,
+		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CRYCBY,
 		.bus_width	= 16,
@@ -288,9 +288,9 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 					    RKISP1_ISP_PAD_SINK_VIDEO,
 					    V4L2_SUBDEV_FORMAT_ACTIVE);
 
-	if (sink_fmt->fmt_type == V4L2_PIXEL_ENC_BAYER) {
+	if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		acq_mult = 1;
-		if (src_fmt->fmt_type == V4L2_PIXEL_ENC_BAYER) {
+		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 			if (sensor->mbus.type == V4L2_MBUS_BT656)
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_RAW_PICT_ITU656;
 			else
@@ -304,7 +304,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 			else
 				isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_BAYER_ITU601;
 		}
-	} else if (sink_fmt->fmt_type == V4L2_PIXEL_ENC_YUV) {
+	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
 		acq_mult = 2;
 		if (sensor->mbus.type == V4L2_MBUS_CSI2_DPHY) {
 			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
@@ -357,7 +357,7 @@ static int rkisp1_config_isp(struct rkisp1_device *rkisp1)
 		    RKISP1_CIF_ISP_PIC_SIZE_ERROR | RKISP1_CIF_ISP_FRAME_IN;
 	rkisp1_write(rkisp1, irq_mask, RKISP1_CIF_ISP_IMSC);
 
-	if (src_fmt->fmt_type == V4L2_PIXEL_ENC_BAYER) {
+	if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		rkisp1_params_disable(&rkisp1->params);
 	} else {
 		struct v4l2_mbus_framefmt *src_frm;
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index eaf28d421676..7b6b7ddd4169 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -14,7 +14,7 @@
 #define RKISP1_RSZ_MP_DEV_NAME	RKISP1_DRIVER_NAME "_resizer_mainpath"
 
 #define RKISP1_DEF_FMT MEDIA_BUS_FMT_YUYV8_2X8
-#define RKISP1_DEF_FMT_TYPE V4L2_PIXEL_ENC_YUV
+#define RKISP1_DEF_PIXEL_ENC V4L2_PIXEL_ENC_YUV
 
 #define RKISP1_MBUS_FMT_HDIV 2
 #define RKISP1_MBUS_FMT_VDIV 1
@@ -371,7 +371,7 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	src_fmt = rkisp1_rsz_get_pad_fmt(rsz, NULL, RKISP1_RSZ_PAD_SRC,
 					 V4L2_SUBDEV_FORMAT_ACTIVE);
 
-	if (rsz->fmt_type == V4L2_PIXEL_ENC_BAYER) {
+	if (rsz->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		rkisp1_rsz_disable(rsz, when);
 		return;
 	}
@@ -384,7 +384,7 @@ static void rkisp1_rsz_config(struct rkisp1_resizer *rsz,
 	sink_c.width = sink_y.width / RKISP1_MBUS_FMT_HDIV;
 	sink_c.height = sink_y.height / RKISP1_MBUS_FMT_VDIV;
 
-	if (rsz->fmt_type == V4L2_PIXEL_ENC_YUV) {
+	if (rsz->pixel_enc == V4L2_PIXEL_ENC_YUV) {
 		struct rkisp1_capture *cap =
 			&rsz->rkisp1->capture_devs[rsz->id];
 		const struct v4l2_format_info *pixfmt_info =
@@ -498,7 +498,7 @@ static void rkisp1_rsz_set_sink_crop(struct rkisp1_resizer *rsz,
 	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
 
 	if (rsz->id == RKISP1_MAINPATH &&
-	    mbus_info->fmt_type == V4L2_PIXEL_ENC_BAYER) {
+	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_BAYER) {
 		sink_crop->left = 0;
 		sink_crop->top = 0;
 		sink_crop->width = sink_fmt->width;
@@ -537,7 +537,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
 	}
 	if (which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		rsz->fmt_type = mbus_info->fmt_type;
+		rsz->pixel_enc = mbus_info->pixel_enc;
 
 	/* Propagete to source pad */
 	src_fmt->code = sink_fmt->code;
@@ -722,7 +722,7 @@ static int rkisp1_rsz_register(struct rkisp1_resizer *rsz)
 	pads[RKISP1_RSZ_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE |
 					 MEDIA_PAD_FL_MUST_CONNECT;
 
-	rsz->fmt_type = RKISP1_DEF_FMT_TYPE;
+	rsz->pixel_enc = RKISP1_DEF_PIXEL_ENC;
 
 	mutex_init(&rsz->ops_lock);
 	ret = media_entity_pads_init(&sd->entity, 2, pads);
-- 
2.20.1

