Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 388151F3F4D
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 17:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730759AbgFIP3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jun 2020 11:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730250AbgFIP3L (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jun 2020 11:29:11 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D253C05BD1E
        for <linux-media@vger.kernel.org>; Tue,  9 Jun 2020 08:29:11 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 4E8FE2A3B23
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v2 4/4] media: staging: rkisp1: rename the field 'direction' in 'rkisp1_isp_mbus_info' to 'isp_pads_flags'
Date:   Tue,  9 Jun 2020 17:28:25 +0200
Message-Id: <20200609152825.24772-5-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200609152825.24772-1-dafna.hirschfeld@collabora.com>
References: <20200609152825.24772-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The field 'direction' in 'struct rkisp1_isp_mbus_info' holds
the flags of the supported pads of the mbus code. Therefore
the name 'isp_pads_flags' is better.
The patch also rename a local variable 'dir' that holds such flag
to 'pad'.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-common.h  |  2 +-
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 46 +++++++++----------
 drivers/staging/media/rkisp1/rkisp1-resizer.c |  2 +-
 3 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index a6cd9fc13b3d..1dda6d53adea 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -283,7 +283,7 @@ struct rkisp1_isp_mbus_info {
 	u32 yuv_seq;
 	u8 bus_width;
 	enum rkisp1_fmt_raw_pat_type bayer_pat;
-	unsigned int direction;
+	unsigned int isp_pads_flags;
 };
 
 static inline void
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index b63f193a3ac2..c9ba7c2d820e 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -58,119 +58,119 @@ static const struct rkisp1_isp_mbus_info rkisp1_isp_formats[] = {
 	{
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_2X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
-		.direction	= RKISP1_ISP_SD_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 10,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 10,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 10,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW10,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 10,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 12,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 12,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 12,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG12_1X12,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW12,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 12,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SRGGB8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_RGGB,
 		.bus_width	= 8,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SBGGR8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_BGGR,
 		.bus_width	= 8,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGBRG8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_GBRG,
 		.bus_width	= 8,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_SGRBG8_1X8,
 		.pixel_enc	= V4L2_PIXEL_ENC_BAYER,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_RAW8,
 		.bayer_pat	= RKISP1_RAW_GRBG,
 		.bus_width	= 8,
-		.direction	= RKISP1_ISP_SD_SINK_SRC,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK_SRC,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_YUYV8_1X16,
 		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCBYCR,
 		.bus_width	= 16,
-		.direction	= RKISP1_ISP_SD_SINK,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_YVYU8_1X16,
 		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_YCRYCB,
 		.bus_width	= 16,
-		.direction	= RKISP1_ISP_SD_SINK,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_UYVY8_1X16,
 		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CBYCRY,
 		.bus_width	= 16,
-		.direction	= RKISP1_ISP_SD_SINK,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK,
 	}, {
 		.mbus_code	= MEDIA_BUS_FMT_VYUY8_1X16,
 		.pixel_enc	= V4L2_PIXEL_ENC_YUV,
 		.mipi_dt	= RKISP1_CIF_CSI2_DT_YUV422_8b,
 		.yuv_seq	= RKISP1_CIF_ISP_ACQ_PROP_CRYCBY,
 		.bus_width	= 16,
-		.direction	= RKISP1_ISP_SD_SINK,
+		.isp_pads_flags	= RKISP1_ISP_SD_SINK,
 	},
 };
 
@@ -566,13 +566,13 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
 				     struct v4l2_subdev_pad_config *cfg,
 				     struct v4l2_subdev_mbus_code_enum *code)
 {
-	unsigned int i, dir;
+	unsigned int i, pad;
 	int pos = 0;
 
 	if (code->pad == RKISP1_ISP_PAD_SINK_VIDEO) {
-		dir = RKISP1_ISP_SD_SINK;
+		pad = RKISP1_ISP_SD_SINK;
 	} else if (code->pad == RKISP1_ISP_PAD_SOURCE_VIDEO) {
-		dir = RKISP1_ISP_SD_SRC;
+		pad = RKISP1_ISP_SD_SRC;
 	} else {
 		if (code->index > 0)
 			return -EINVAL;
@@ -586,7 +586,7 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
 	for (i = 0; i < ARRAY_SIZE(rkisp1_isp_formats); i++) {
 		const struct rkisp1_isp_mbus_info *fmt = &rkisp1_isp_formats[i];
 
-		if (fmt->direction & dir)
+		if (fmt->isp_pads_flags & pad)
 			pos++;
 
 		if (code->index == pos - 1) {
@@ -657,7 +657,7 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 
 	src_fmt->code = format->code;
 	mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
-	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
+	if (!mbus_info || !(mbus_info->isp_pads_flags & RKISP1_ISP_SD_SRC)) {
 		src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
 		mbus_info = rkisp1_isp_mbus_info_get(src_fmt->code);
 	}
@@ -741,7 +741,7 @@ static void rkisp1_isp_set_sink_fmt(struct rkisp1_isp *isp,
 					  which);
 	sink_fmt->code = format->code;
 	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
-	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SINK)) {
+	if (!mbus_info || !(mbus_info->isp_pads_flags & RKISP1_ISP_SD_SINK)) {
 		sink_fmt->code = RKISP1_DEF_SINK_PAD_FMT;
 		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
 	}
diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
index 137298b77341..bb06887648a1 100644
--- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
+++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
@@ -542,7 +542,7 @@ static void rkisp1_rsz_set_sink_fmt(struct rkisp1_resizer *rsz,
 					    which);
 	sink_fmt->code = format->code;
 	mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
-	if (!mbus_info || !(mbus_info->direction & RKISP1_ISP_SD_SRC)) {
+	if (!mbus_info || !(mbus_info->isp_pads_flags & RKISP1_ISP_SD_SRC)) {
 		sink_fmt->code = RKISP1_DEF_FMT;
 		mbus_info = rkisp1_isp_mbus_info_get(sink_fmt->code);
 	}
-- 
2.17.1

