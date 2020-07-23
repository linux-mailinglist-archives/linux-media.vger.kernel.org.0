Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DBB1C22B05E
	for <lists+linux-media@lfdr.de>; Thu, 23 Jul 2020 15:21:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729130AbgGWNVY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Jul 2020 09:21:24 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:48528 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729094AbgGWNVX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Jul 2020 09:21:23 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id 4CD3F298A1E
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com
Cc:     dafna.hirschfeld@collabora.com, helen.koike@collabora.com,
        ezequiel@collabora.com, hverkuil@xs4all.nl, kernel@collabora.com,
        dafna3@gmail.com, sakari.ailus@linux.intel.com, mchehab@kernel.org,
        tfiga@chromium.org
Subject: [PATCH v3 06/10] media: staging: rkisp1: add a helper function to enumerate supported mbus formats on capture
Date:   Thu, 23 Jul 2020 15:20:10 +0200
Message-Id: <20200723132014.4597-7-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
References: <20200723132014.4597-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add a function 'rkisp1_cap_enum_mbus_codes' that receive
a pointer to 'v4l2_subdev_mbus_code_enum' and returns the
next supported mbus format of the capture. The function
assumes that pixel formats with identical 'mbus' are grouped
together in the hardcoded arrays, therefore the order of the
entries in the array 'rkisp1_sp_fmts' are adjusted.
This function is a helper for the media bus enumeration of
the source pad of the resizer entity.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
---
 drivers/staging/media/rkisp1/rkisp1-capture.c | 77 ++++++++++++-------
 drivers/staging/media/rkisp1/rkisp1-common.h  |  8 ++
 2 files changed, 58 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index 5dd91b5f82a4..4dabd07a3da9 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -112,6 +112,13 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
 		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
+	/* yuv400 */
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
+	},
 	/* yuv420 */
 	{
 		.fourcc = V4L2_PIX_FMT_NV21,
@@ -144,13 +151,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_mp_fmts[] = {
 		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUV_PLA_OR_RAW8,
 		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	},
-	/* yuv400 */
-	{
-		.fourcc = V4L2_PIX_FMT_GREY,
-		.uv_swap = 0,
-		.write_format = RKISP1_MI_CTRL_MP_WRITE_YUVINT,
-		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
-	},
 	/* raw */
 	{
 		.fourcc = V4L2_PIX_FMT_SRGGB8,
@@ -236,6 +236,26 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV422,
 		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
 	},
+	/* yuv400 */
+	{
+		.fourcc = V4L2_PIX_FMT_GREY,
+		.uv_swap = 0,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
+	},
+	/* rgb */
+	{
+		.fourcc = V4L2_PIX_FMT_XBGR32,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
+	}, {
+		.fourcc = V4L2_PIX_FMT_RGB565,
+		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
+		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
+		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
+	},
 	/* yuv420 */
 	{
 		.fourcc = V4L2_PIX_FMT_NV21,
@@ -274,26 +294,6 @@ static const struct rkisp1_capture_fmt_cfg rkisp1_sp_fmts[] = {
 		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV420,
 		.mbus = MEDIA_BUS_FMT_YUYV8_1_5X8,
 	},
-	/* yuv400 */
-	{
-		.fourcc = V4L2_PIX_FMT_GREY,
-		.uv_swap = 0,
-		.write_format = RKISP1_MI_CTRL_SP_WRITE_INT,
-		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_YUV400,
-		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
-	},
-	/* rgb */
-	{
-		.fourcc = V4L2_PIX_FMT_XBGR32,
-		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
-		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB888,
-		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
-	}, {
-		.fourcc = V4L2_PIX_FMT_RGB565,
-		.write_format = RKISP1_MI_CTRL_SP_WRITE_PLA,
-		.output_format = RKISP1_MI_CTRL_SP_OUTPUT_RGB565,
-		.mbus = MEDIA_BUS_FMT_YUYV8_2X8,
-	},
 };
 
 static const struct rkisp1_capture_config rkisp1_capture_config_mp = {
@@ -334,6 +334,29 @@ rkisp1_vdev_to_node(struct video_device *vdev)
 	return container_of(vdev, struct rkisp1_vdev_node, vdev);
 }
 
+int rkisp1_cap_enum_mbus_codes(struct rkisp1_capture *cap,
+			       struct v4l2_subdev_mbus_code_enum *code)
+{
+	const struct rkisp1_capture_fmt_cfg *fmts = cap->config->fmts;
+	u32 curr_mbus = fmts[0].mbus;
+	int i, n = 0;
+
+	if (code->index == 0) {
+		code->code = fmts[0].mbus;
+		return 0;
+	}
+
+	for (i = 1; i < cap->config->fmt_size; i++)
+		if (fmts[i].mbus != curr_mbus) {
+			curr_mbus = fmts[i].mbus;
+			if (++n == code->index) {
+				code->code = curr_mbus;
+				return 0;
+			}
+		}
+	return -EINVAL;
+}
+
 /* ----------------------------------------------------------------------------
  * Stream operations for self-picture path (sp) and main-picture path (mp)
  */
diff --git a/drivers/staging/media/rkisp1/rkisp1-common.h b/drivers/staging/media/rkisp1/rkisp1-common.h
index 3dc51d703f73..73e1963cc47a 100644
--- a/drivers/staging/media/rkisp1/rkisp1-common.h
+++ b/drivers/staging/media/rkisp1/rkisp1-common.h
@@ -297,6 +297,14 @@ static inline u32 rkisp1_read(struct rkisp1_device *rkisp1, unsigned int addr)
 	return readl(rkisp1->base_addr + addr);
 }
 
+/*
+ * rkisp1_cap_enum_mbus_codes - A helper function that return the i'th supported mbus code
+ *				of the capture entity. This is used to enumerate the supported
+ *				mbus codes on the source pad of the resizer.
+ */
+int rkisp1_cap_enum_mbus_codes(struct rkisp1_capture *cap,
+			       struct v4l2_subdev_mbus_code_enum *code);
+
 void rkisp1_sd_adjust_crop_rect(struct v4l2_rect *crop,
 				const struct v4l2_rect *bounds);
 
-- 
2.17.1

