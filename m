Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A1F02591B2
	for <lists+linux-media@lfdr.de>; Tue,  1 Sep 2020 16:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbgIAOyS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 1 Sep 2020 10:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726657AbgIAL06 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 1 Sep 2020 07:26:58 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DBE3C061260
        for <linux-media@vger.kernel.org>; Tue,  1 Sep 2020 04:17:25 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id BD7E02991FD
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v4 05/10] media: staging: rkisp1: add capability V4L2_CAP_IO_MC to capture devices
Date:   Tue,  1 Sep 2020 13:16:07 +0200
Message-Id: <20200901111612.10552-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
References: <20200901111612.10552-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The capture devices supports YUV, RGB, and Bayer formats.
Adding V4L2_CAP_IO_MC capability will reflect userspace
what format should be set on the resizer in order to stream
each of the video formats.

The patch adds a 'mbus' field to the struct
'rkisp1_capture_fmt_cfg' which maps the video format
to the needed mbus format.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 65 +++++++++++++++++--
 1 file changed, 59 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 22da94a9baf1..d23c9adc8201 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -49,12 +49,14 @@ enum rkisp1_plane {
  * @uv_swap: if cb cr swaped, for yuv
  * @write_format: defines how YCbCr self picture data is written to memory
  * @output_format: defines sp output format
+ * @mbus: the mbus code on the src resizer pad that matches the pixel format
  */
 struct rkisp1_capture_fmt_cfg {
 	u32 fourcc;
 	u8 uv_swap;
 	u32 write_format;
 	u32 output_format;
+	u32 mbus;
 };
 
 struct rkisp1_capture_ops {
@@ -88,92 +90,116 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
 		.fourcc = V4L2_PIX_FMT_YUYV,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV422P,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV16,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV61,
 		.uv_swap = 1,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YVU422M,
 		.uv_swap = 1,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
 	/* yuv420 */
 	{
 		.fourcc = V4L2_PIX_FMT_NV21,
 		.uv_swap = 1,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV21M,
 		.uv_swap = 1,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV12M,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_SPLA,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV420,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YVU420,
 		.uv_swap = 1,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	},
 	/* yuv400 */
 	{
 		.fourcc = V4L2_PIX_FMT_GREY,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
 	/* raw */
 	{
 		.fourcc = V4L2_PIX_FMT_SRGGB8,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+		.mbus = MEDIA_BUS_FMT_SRGGB8_1X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG8,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+		.mbus = MEDIA_BUS_FMT_SGRBG8_1X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG8,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+		.mbus = MEDIA_BUS_FMT_SGBRG8_1X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SBGGR8,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
+		.mbus = MEDIA_BUS_FMT_SBGGR8_1X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SRGGB10,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+		.mbus = MEDIA_BUS_FMT_SRGGB10_1X10,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG10,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+		.mbus = MEDIA_BUS_FMT_SGRBG10_1X10,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG10,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+		.mbus = MEDIA_BUS_FMT_SGBRG10_1X10,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SBGGR10,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+		.mbus = MEDIA_BUS_FMT_SBGGR10_1X10,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SRGGB12,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+		.mbus = MEDIA_BUS_FMT_SRGGB12_1X12,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGRBG12,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+		.mbus = MEDIA_BUS_FMT_SGRBG12_1X12,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SGBRG12,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+		.mbus = MEDIA_BUS_FMT_SGBRG12_1X12,
 	}, {
 		.fourcc = V4L2_PIX_FMT_SBGGR12,
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_RAW12,
+		.mbus = MEDIA_BUS_FMT_SBGGR12_1X12,
 	},
 };
 
@@ -184,26 +210,31 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV422P,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV16,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV61,
 		.uv_swap = 1,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YVU422M,
 		.uv_swap = 1,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
 	/* yuv420 */
 	{
@@ -211,31 +242,37 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
 		.uv_swap = 1,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV12,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV21M,
 		.uv_swap = 1,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_NV12M,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_SPLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YUV420,
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_YVU420,
 		.uv_swap = 1,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
+		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	},
 	/* yuv400 */
 	{
@@ -243,16 +280,19 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
 		.uv_swap = 0,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
 	/* rgb */
 	{
 		.fourcc = V4L2_PIX_FMT_XBGR32,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	}, {
 		.fourcc = V4L2_PIX_FMT_RGB565,
 		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
 };
 
@@ -1106,14 +1146,27 @@ static int rkisp1_enum_fmt_vid_cap_mplane(struct file *file, void *priv,
 {
 	struct rkisp1_capture *cap = video_drvdata(file);
 	const struct rkisp1_capture_fmt_cfg *fmt = NULL;
+	unsigned int i, n = 0;
 
-	if (f->index >= cap->config->fmt_size)
-		return -EINVAL;
+	if (!f->mbus_code) {
+		if (f->index >= cap->config->fmt_size)
+			return -EINVAL;
 
-	fmt = &cap->config->fmts[f->index];
-	f->pixelformat = fmt->fourcc;
+		fmt = &cap->config->fmts[f->index];
+		f->pixelformat = fmt->fourcc;
+		return 0;
+	}
 
-	return 0;
+	for (i = 0; i < cap->config->fmt_size; i++) {
+		if (cap->config->fmts[i].mbus != f->mbus_code)
+			continue;
+
+		if (n++ == f->index) {
+			f->pixelformat = cap->config->fmts[i].fourcc;
+			return 0;
+		}
+	}
+	return -EINVAL;
 }
 
 static int rkisp1_s_fmt_vid_cap_mplane(struct file *file,
@@ -1261,7 +1314,7 @@ static int rkisp1_register_capture(struct rkisp1_capture *cap)
 	vdev->v4l2_dev = v4l2_dev;
 	vdev->lock = &node->vlock;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE_MPLANE |
-			    V4L2_CAP_STREAMING;
+			    V4L2_CAP_STREAMING | V4L2_CAP_IO_MC;
 	vdev->entity.ops = &rkisp1_media_ops;
 	video_set_drvdata(vdev, cap);
 	vdev->vfl_dir = VFL_DIR_RX;
-- 
2.17.1

