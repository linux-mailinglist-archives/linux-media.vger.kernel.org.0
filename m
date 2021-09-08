Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456BF403A49
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243317AbhIHNF3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:05:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345371AbhIHNFK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:05:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140A0C061757
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:04:01 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF9-0005CN-Di; Wed, 08 Sep 2021 15:03:59 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF8-0004Tq-Mk; Wed, 08 Sep 2021 15:03:58 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-00DpIz-Ke; Wed, 08 Sep 2021 15:03:55 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 7/7] media: allegro: write vui parameters for HEVC
Date:   Wed,  8 Sep 2021 15:03:55 +0200
Message-Id: <20210908130355.3295403-8-m.tretter@pengutronix.de>
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

The vui parameters are optional. However, the vui data allows to specify
the color space of the encoded video. Write the vui parameters to make
sure that decoders are able to pick up the correct color space.

Also implement the necessary lookup functions to convert the values from
the V4L2 controls to the values specified in the hevc standard.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 47 ++++++++++
 drivers/media/platform/allegro-dvt/nal-hevc.h | 90 +++++++++++++++++--
 2 files changed, 131 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 74c1a48d711a..a19d7cda43e1 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1681,7 +1681,10 @@ static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 	struct allegro_dev *dev = channel->dev;
 	struct nal_hevc_sps *sps;
 	struct nal_hevc_profile_tier_level *ptl;
+	struct nal_hevc_vui_parameters *vui;
+	struct nal_hevc_hrd_parameters *hrd;
 	ssize_t size;
+	unsigned int cpb_size;
 	unsigned int num_ref_frames = channel->num_ref_idx_l0;
 	s32 profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_profile);
 	s32 level = v4l2_ctrl_g_ctrl(channel->mpeg_video_hevc_level);
@@ -1734,6 +1737,50 @@ static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 	sps->sps_temporal_mvp_enabled_flag = channel->temporal_mvp_enable;
 	sps->strong_intra_smoothing_enabled_flag = channel->max_cu_size > 4;
 
+	sps->vui_parameters_present_flag = 1;
+	vui = &sps->vui;
+
+	vui->video_signal_type_present_flag = 1;
+	vui->video_format = 5; /* unspecified */
+	vui->video_full_range_flag = nal_hevc_full_range(channel->quantization);
+	vui->colour_description_present_flag = 1;
+	vui->colour_primaries = nal_hevc_color_primaries(channel->colorspace);
+	vui->transfer_characteristics = nal_hevc_transfer_characteristics(channel->colorspace,
+									  channel->xfer_func);
+	vui->matrix_coeffs = nal_hevc_matrix_coeffs(channel->colorspace, channel->ycbcr_enc);
+
+	vui->chroma_loc_info_present_flag = 1;
+	vui->chroma_sample_loc_type_top_field = 0;
+	vui->chroma_sample_loc_type_bottom_field = 0;
+
+	vui->vui_timing_info_present_flag = 1;
+	vui->vui_num_units_in_tick = channel->framerate.denominator;
+	vui->vui_time_scale = channel->framerate.numerator;
+
+	vui->bitstream_restriction_flag = 1;
+	vui->motion_vectors_over_pic_boundaries_flag = 1;
+	vui->restricted_ref_pic_lists_flag = 1;
+	vui->log2_max_mv_length_horizontal = 15;
+	vui->log2_max_mv_length_vertical = 15;
+
+	vui->vui_hrd_parameters_present_flag = 1;
+	hrd = &vui->nal_hrd_parameters;
+	hrd->vcl_hrd_parameters_present_flag = 1;
+
+	hrd->initial_cpb_removal_delay_length_minus1 = 31;
+	hrd->au_cpb_removal_delay_length_minus1 = 30;
+	hrd->dpb_output_delay_length_minus1 = 30;
+
+	hrd->bit_rate_scale = ffs(channel->bitrate_peak) - 6;
+	hrd->vcl_hrd[0].bit_rate_value_minus1[0] =
+		(channel->bitrate_peak >> (6 + hrd->bit_rate_scale)) - 1;
+
+	cpb_size = v4l2_ctrl_g_ctrl(channel->mpeg_video_cpb_size) * 1000;
+	hrd->cpb_size_scale = ffs(cpb_size) - 4;
+	hrd->vcl_hrd[0].cpb_size_value_minus1[0] = (cpb_size >> (4 + hrd->cpb_size_scale)) - 1;
+
+	hrd->vcl_hrd[0].cbr_flag[0] = !v4l2_ctrl_g_ctrl(channel->mpeg_video_frame_rc_enable);
+
 	size = nal_hevc_write_sps(&dev->plat_dev->dev, dest, n, sps);
 
 	kfree(sps);
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
index e67d94bd5341..eb46f12aae80 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.h
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
@@ -12,6 +12,7 @@
 #include <linux/kernel.h>
 #include <linux/types.h>
 #include <linux/v4l2-controls.h>
+#include <linux/videodev2.h>
 
 struct nal_hevc_profile_tier_level {
 	unsigned int general_profile_space;
@@ -413,12 +414,89 @@ static inline int nal_hevc_level(enum v4l2_mpeg_video_hevc_level level)
 	}
 }
 
-int nal_range_from_v4l2(enum v4l2_quantization quantization);
-int nal_color_primaries_from_v4l2(enum v4l2_colorspace colorspace);
-int nal_transfer_characteristics_from_v4l2(enum v4l2_colorspace colorspace,
-					   enum v4l2_xfer_func xfer_func);
-int nal_matrix_coeffs_from_v4l2(enum v4l2_colorspace colorspace,
-				enum v4l2_ycbcr_encoding ycbcr_encoding);
+static inline int nal_hevc_full_range(enum v4l2_quantization quantization)
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
+static inline int nal_hevc_color_primaries(enum v4l2_colorspace colorspace)
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
+static inline int nal_hevc_transfer_characteristics(enum v4l2_colorspace colorspace,
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
+static inline int nal_hevc_matrix_coeffs(enum v4l2_colorspace colorspace,
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
 
 ssize_t nal_hevc_write_vps(const struct device *dev,
 			   void *dest, size_t n, struct nal_hevc_vps *vps);
-- 
2.30.2

