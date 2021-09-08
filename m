Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6121403A47
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347055AbhIHNFS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:05:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238393AbhIHNFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:05:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E48A2C0613C1
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:58 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF7-00055A-5A; Wed, 08 Sep 2021 15:03:57 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF6-0004Tf-LC; Wed, 08 Sep 2021 15:03:56 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-00DpIj-Js; Wed, 08 Sep 2021 15:03:55 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 5/7] media: allegro: write correct colorspace into SPS
Date:   Wed,  8 Sep 2021 15:03:53 +0200
Message-Id: <20210908130355.3295403-6-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210908130355.3295403-1-m.tretter@pengutronix.de>
References: <20210908130355.3295403-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently, the driver always writes PAL as video format into the SPS of
the encoded stream.

Set the video format to the default value 5 (unspecified) and use the
color description that is already configured on the channel as color
space. This fixes the color space definition in the coded data to
reflect the configured color space of the video data that is encoded.

Add lookup functions to convert the color primaries, transfer function
and matrix coefficients from the V4L2 control values to the values
specified in the h.264 standard.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c |  14 +-
 drivers/media/platform/allegro-dvt/nal-h264.h | 123 ++++++++++++++++++
 2 files changed, 132 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index f0c6673f5af1..74c1a48d711a 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1539,13 +1539,17 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	sps->vui_parameters_present_flag = 1;
 	sps->vui.aspect_ratio_info_present_flag = 0;
 	sps->vui.overscan_info_present_flag = 0;
+
 	sps->vui.video_signal_type_present_flag = 1;
-	sps->vui.video_format = 1;
-	sps->vui.video_full_range_flag = 0;
+	sps->vui.video_format = 5; /* unspecified */
+	sps->vui.video_full_range_flag = nal_h264_full_range(channel->quantization);
 	sps->vui.colour_description_present_flag = 1;
-	sps->vui.colour_primaries = 5;
-	sps->vui.transfer_characteristics = 5;
-	sps->vui.matrix_coefficients = 5;
+	sps->vui.colour_primaries = nal_h264_color_primaries(channel->colorspace);
+	sps->vui.transfer_characteristics =
+		nal_h264_transfer_characteristics(channel->colorspace, channel->xfer_func);
+	sps->vui.matrix_coefficients =
+		nal_h264_matrix_coeffs(channel->colorspace, channel->ycbcr_enc);
+
 	sps->vui.chroma_loc_info_present_flag = 1;
 	sps->vui.chroma_sample_loc_type_top_field = 0;
 	sps->vui.chroma_sample_loc_type_bottom_field = 0;
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/nal-h264.h
index e03505593ec2..34db07cda652 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.h
+++ b/drivers/media/platform/allegro-dvt/nal-h264.h
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/v4l2-controls.h>
+#include <linux/videodev2.h>
 
 /*
  * struct nal_h264_hrd_parameters - HRD parameters
@@ -263,6 +264,128 @@ static inline int nal_h264_level(enum v4l2_mpeg_video_h264_level level)
 	}
 }
 
+/**
+ * nal_h264_full_range() - Get video_full_range_flag for v4l2 quantization
+ * @quantization: the quantization type as &enum v4l2_quantization
+ *
+ * Convert the &enum v4l2_quantization to video_full_range_flag as specified in
+ * Rec. ITU-T H.264 (04/2017) E.2.1.
+ *
+ * Return: the video_full_range_flag value for the passed quantization
+ */
+static inline int nal_h264_full_range(enum v4l2_quantization quantization)
+{
+	switch (quantization) {
+	case V4L2_QUANTIZATION_FULL_RANGE:
+		return 1;
+	case V4L2_QUANTIZATION_LIM_RANGE:
+		return 0;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+/**
+ * nal_h264_color_primaries() - Get color_primaries for v4l2 colorspace
+ * @colorspace: the color space as &enum v4l2_colorspace
+ *
+ * Convert the &enum v4l2_colorspace to color_primaries as specified in
+ * Rec. ITU-T H.264 (04/2017) E.2.1.
+ *
+ * Return: the color_primaries value for the passed colorspace
+ */
+static inline int nal_h264_color_primaries(enum v4l2_colorspace colorspace)
+{
+	switch (colorspace) {
+	case V4L2_COLORSPACE_SMPTE170M:
+		return 6;
+	case V4L2_COLORSPACE_SMPTE240M:
+		return 7;
+	case V4L2_COLORSPACE_REC709:
+		return 1;
+	case V4L2_COLORSPACE_470_SYSTEM_M:
+		return 4;
+	case V4L2_COLORSPACE_JPEG:
+	case V4L2_COLORSPACE_SRGB:
+	case V4L2_COLORSPACE_470_SYSTEM_BG:
+		return 5;
+	case V4L2_COLORSPACE_BT2020:
+		return 9;
+	case V4L2_COLORSPACE_DEFAULT:
+	case V4L2_COLORSPACE_OPRGB:
+	case V4L2_COLORSPACE_RAW:
+	case V4L2_COLORSPACE_DCI_P3:
+	default:
+		return 2;
+	}
+}
+
+/**
+ * nal_h264_transfer_characteristics() - Get transfer_characteristics for v4l2 xfer_func
+ * @colorspace: the color space as &enum v4l2_colorspace
+ * @xfer_func: the transfer function as &enum v4l2_xfer_func
+ *
+ * Convert the &enum v4l2_xfer_func to transfer_characteristics as specified in
+ * Rec. ITU-T H.264 (04/2017) E.2.1.
+ *
+ * Return: the transfer_characteristics value for the passed transfer function
+ */
+static inline int nal_h264_transfer_characteristics(enum v4l2_colorspace colorspace,
+						    enum v4l2_xfer_func xfer_func)
+{
+	if (xfer_func == V4L2_XFER_FUNC_DEFAULT)
+		xfer_func = V4L2_MAP_XFER_FUNC_DEFAULT(colorspace);
+
+	switch (xfer_func) {
+	case V4L2_XFER_FUNC_709:
+		return 6;
+	case V4L2_XFER_FUNC_SMPTE2084:
+		return 16;
+	case V4L2_XFER_FUNC_SRGB:
+	case V4L2_XFER_FUNC_OPRGB:
+	case V4L2_XFER_FUNC_NONE:
+	case V4L2_XFER_FUNC_DCI_P3:
+	case V4L2_XFER_FUNC_SMPTE240M:
+	default:
+		return 2;
+	}
+}
+
+/**
+ * nal_h264_matrix_coeffs() - Get matrix_coefficients for v4l2 v4l2_ycbcr_encoding
+ * @colorspace: the color space as &enum v4l2_colorspace
+ * @ycbcr_encoding: the ycbcr encoding as &enum v4l2_ycbcr_encoding
+ *
+ * Convert the &enum v4l2_ycbcr_encoding to matrix_coefficients as specified in
+ * Rec. ITU-T H.264 (04/2017) E.2.1.
+ *
+ * Return: the matrix_coefficients value for the passed encoding
+ */
+static inline int nal_h264_matrix_coeffs(enum v4l2_colorspace colorspace,
+					 enum v4l2_ycbcr_encoding ycbcr_encoding)
+{
+	if (ycbcr_encoding == V4L2_YCBCR_ENC_DEFAULT)
+		ycbcr_encoding = V4L2_MAP_YCBCR_ENC_DEFAULT(colorspace);
+
+	switch (ycbcr_encoding) {
+	case V4L2_YCBCR_ENC_601:
+	case V4L2_YCBCR_ENC_XV601:
+		return 5;
+	case V4L2_YCBCR_ENC_709:
+	case V4L2_YCBCR_ENC_XV709:
+		return 1;
+	case V4L2_YCBCR_ENC_BT2020:
+		return 9;
+	case V4L2_YCBCR_ENC_BT2020_CONST_LUM:
+		return 10;
+	case V4L2_YCBCR_ENC_SMPTE240M:
+	default:
+		return 2;
+	}
+}
+
 ssize_t nal_h264_write_sps(const struct device *dev,
 			   void *dest, size_t n, struct nal_h264_sps *sps);
 ssize_t nal_h264_read_sps(const struct device *dev,
-- 
2.30.2

