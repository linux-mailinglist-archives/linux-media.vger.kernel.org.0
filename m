Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28CC8254F11
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 21:46:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgH0Tqc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 15:46:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726887AbgH0Tq3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 15:46:29 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB58C06121B
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 12:46:29 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: dafna)
        with ESMTPSA id EF93D29A984
From:   Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, dafna.hirschfeld@collabora.com,
        helen.koike@collabora.com, ezequiel@collabora.com,
        hverkuil@xs4all.nl, kernel@collabora.com, dafna3@gmail.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org, tfiga@chromium.org
Subject: [PATCH v7 5/6] media: staging: rkisp1: allow quantization setting by userspace on the isp source pad
Date:   Thu, 27 Aug 2020 21:46:11 +0200
Message-Id: <20200827194612.13502-6-dafna.hirschfeld@collabora.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827194612.13502-1-dafna.hirschfeld@collabora.com>
References: <20200827194612.13502-1-dafna.hirschfeld@collabora.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The isp entity has hardware support to force full range quantization
for YUV formats. Use the subdev CSC API to allow userspace to set the
quantization for YUV formats on the isp entity.

- The flag V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION is set for
YUV formats during enumeration of the isp formats on the source pad.
- The full quantization is set on YUV formats if userspace asks it
on the isp entity using the flag V4L2_MBUS_FRAMEFMT_SET_CSC.

On the capture and the resizer, the quantization is read-only
and always set to the default quantization.

Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Helen Koike <helen.koike@collabora.com>
Reviewed-by: Tomasz Figa <tfiga@chromium.org>
---
 drivers/staging/media/rkisp1/TODO             |  2 +-
 drivers/staging/media/rkisp1/rkisp1-capture.c | 10 ----------
 drivers/staging/media/rkisp1/rkisp1-isp.c     | 20 +++++++++++++++----
 3 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/media/rkisp1/TODO b/drivers/staging/media/rkisp1/TODO
index bdb1b8f73556..bdd1da43cb5e 100644
--- a/drivers/staging/media/rkisp1/TODO
+++ b/drivers/staging/media/rkisp1/TODO
@@ -1,7 +1,7 @@
 * Fix pad format size for statistics and parameters entities.
 * Fix checkpatch errors.
 * Review and comment every lock
-* Handle quantization
+* Add uapi docs. Remember to add documentation of how quantization is handled.
 * Document rkisp1-common.h
 * streaming paths (mainpath and selfpath) check if the other path is streaming
 in several places of the code, review this, specially that it doesn't seem it
diff --git a/drivers/staging/media/rkisp1/rkisp1-capture.c b/drivers/staging/media/rkisp1/rkisp1-capture.c
index c05280950ea0..f355b2977009 100644
--- a/drivers/staging/media/rkisp1/rkisp1-capture.c
+++ b/drivers/staging/media/rkisp1/rkisp1-capture.c
@@ -1069,8 +1069,6 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
 			   const struct v4l2_format_info **fmt_info)
 {
 	const struct rkisp1_capture_config *config = cap->config;
-	struct rkisp1_capture *other_cap =
-			&cap->rkisp1->capture_devs[cap->id ^ 1];
 	const struct rkisp1_capture_fmt_cfg *fmt;
 	const struct v4l2_format_info *info;
 	const unsigned int max_widths[] = { RKISP1_RSZ_MP_SRC_MAX_WIDTH,
@@ -1095,14 +1093,6 @@ static void rkisp1_try_fmt(const struct rkisp1_capture *cap,
 
 	info = rkisp1_fill_pixfmt(pixm, cap->id);
 
-	/* can not change quantization when stream-on */
-	if (other_cap->is_streaming)
-		pixm->quantization = other_cap->pix.fmt.quantization;
-	/* output full range by default, take effect in params */
-	else if (!pixm->quantization ||
-		 pixm->quantization > V4L2_QUANTIZATION_LIM_RANGE)
-		pixm->quantization = V4L2_QUANTIZATION_FULL_RANGE;
-
 	if (fmt_cfg)
 		*fmt_cfg = fmt;
 	if (fmt_info)
diff --git a/drivers/staging/media/rkisp1/rkisp1-isp.c b/drivers/staging/media/rkisp1/rkisp1-isp.c
index 6ec1e9816e9f..1063f4505aaf 100644
--- a/drivers/staging/media/rkisp1/rkisp1-isp.c
+++ b/drivers/staging/media/rkisp1/rkisp1-isp.c
@@ -589,6 +589,10 @@ static int rkisp1_isp_enum_mbus_code(struct v4l2_subdev *sd,
 
 		if (code->index == pos - 1) {
 			code->code = fmt->mbus_code;
+			if (fmt->pixel_enc == V4L2_PIXEL_ENC_YUV &&
+			    dir == RKISP1_ISP_SD_SRC)
+				code->flags =
+					V4L2_SUBDEV_MBUS_CODE_CSC_QUANTIZATION;
 			return 0;
 		}
 	}
@@ -620,7 +624,6 @@ static int rkisp1_isp_init_config(struct v4l2_subdev *sd,
 					     RKISP1_ISP_PAD_SOURCE_VIDEO);
 	*src_fmt = *sink_fmt;
 	src_fmt->code = RKISP1_DEF_SRC_PAD_FMT;
-	src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 
 	src_crop = v4l2_subdev_get_try_crop(sd, cfg,
 					    RKISP1_ISP_PAD_SOURCE_VIDEO);
@@ -663,9 +666,18 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
 		isp->src_fmt = mbus_info;
 	src_fmt->width  = src_crop->width;
 	src_fmt->height = src_crop->height;
-	src_fmt->quantization = format->quantization;
-	/* full range by default */
-	if (!src_fmt->quantization)
+
+	/*
+	 * The CSC API is used to allow userspace to force full
+	 * quantization on YUV formats.
+	 */
+	if (format->flags & V4L2_MBUS_FRAMEFMT_SET_CSC &&
+	    format->quantization == V4L2_QUANTIZATION_FULL_RANGE &&
+	    mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
+		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
+	else if (mbus_info->pixel_enc == V4L2_PIXEL_ENC_YUV)
+		src_fmt->quantization = V4L2_QUANTIZATION_LIM_RANGE;
+	else
 		src_fmt->quantization = V4L2_QUANTIZATION_FULL_RANGE;
 
 	*format = *src_fmt;
-- 
2.17.1

