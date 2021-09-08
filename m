Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C2B1403A46
	for <lists+linux-media@lfdr.de>; Wed,  8 Sep 2021 15:04:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346134AbhIHNFR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Sep 2021 09:05:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239213AbhIHNFH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Sep 2021 09:05:07 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C84FC06179A
        for <linux-media@vger.kernel.org>; Wed,  8 Sep 2021 06:03:57 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF6-00053w-5S; Wed, 08 Sep 2021 15:03:56 +0200
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-0004TB-KC; Wed, 08 Sep 2021 15:03:55 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
        (envelope-from <mtr@pengutronix.de>)
        id 1mNxF5-00DpIe-JX; Wed, 08 Sep 2021 15:03:55 +0200
From:   Michael Tretter <m.tretter@pengutronix.de>
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     kernel@pengutronix.de, m.tretter@pengutronix.de
Subject: [PATCH 4/7] media: allegro: extract nal value lookup functions to header
Date:   Wed,  8 Sep 2021 15:03:52 +0200
Message-Id: <20210908130355.3295403-5-m.tretter@pengutronix.de>
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

The lookup of the h.264 or hevc values for the respective V4L2 controls
is done by the driver that uses the sps/pps generator and not in the
generator. Therefore, it is more intuitive to define these functions
directly in the header and not in the module.

Extract the functions to the headers as static inline functions.

Also simplify the function name and add kernel-doc for the hevc
functions.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 .../media/platform/allegro-dvt/allegro-core.c | 16 +--
 drivers/media/platform/allegro-dvt/nal-h264.c | 74 --------------
 drivers/media/platform/allegro-dvt/nal-h264.h | 77 ++++++++++++++-
 drivers/media/platform/allegro-dvt/nal-hevc.c | 70 -------------
 drivers/media/platform/allegro-dvt/nal-hevc.h | 99 ++++++++++++++++++-
 5 files changed, 178 insertions(+), 158 deletions(-)

diff --git a/drivers/media/platform/allegro-dvt/allegro-core.c b/drivers/media/platform/allegro-dvt/allegro-core.c
index 9cd903bab0ca..f0c6673f5af1 100644
--- a/drivers/media/platform/allegro-dvt/allegro-core.c
+++ b/drivers/media/platform/allegro-dvt/allegro-core.c
@@ -1507,14 +1507,14 @@ static ssize_t allegro_h264_write_sps(struct allegro_channel *channel,
 	profile = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_profile);
 	level = v4l2_ctrl_g_ctrl(channel->mpeg_video_h264_level);
 
-	sps->profile_idc = nal_h264_profile_from_v4l2(profile);
+	sps->profile_idc = nal_h264_profile(profile);
 	sps->constraint_set0_flag = 0;
 	sps->constraint_set1_flag = 1;
 	sps->constraint_set2_flag = 0;
 	sps->constraint_set3_flag = 0;
 	sps->constraint_set4_flag = 0;
 	sps->constraint_set5_flag = 0;
-	sps->level_idc = nal_h264_level_from_v4l2(level);
+	sps->level_idc = nal_h264_level(level);
 	sps->seq_parameter_set_id = 0;
 	sps->log2_max_frame_num_minus4 = LOG2_MAX_FRAME_NUM - 4;
 	sps->pic_order_cnt_type = 0;
@@ -1653,12 +1653,12 @@ static ssize_t allegro_hevc_write_vps(struct allegro_channel *channel,
 	vps->temporal_id_nesting_flag = 1;
 
 	ptl = &vps->profile_tier_level;
-	ptl->general_profile_idc = nal_hevc_profile_from_v4l2(profile);
+	ptl->general_profile_idc = nal_hevc_profile(profile);
 	ptl->general_profile_compatibility_flag[ptl->general_profile_idc] = 1;
-	ptl->general_tier_flag = nal_hevc_tier_from_v4l2(tier);
+	ptl->general_tier_flag = nal_hevc_tier(tier);
 	ptl->general_progressive_source_flag = 1;
 	ptl->general_frame_only_constraint_flag = 1;
-	ptl->general_level_idc = nal_hevc_level_from_v4l2(level);
+	ptl->general_level_idc = nal_hevc_level(level);
 
 	vps->sub_layer_ordering_info_present_flag = 0;
 	vps->max_dec_pic_buffering_minus1[0] = num_ref_frames;
@@ -1690,12 +1690,12 @@ static ssize_t allegro_hevc_write_sps(struct allegro_channel *channel,
 	sps->temporal_id_nesting_flag = 1;
 
 	ptl = &sps->profile_tier_level;
-	ptl->general_profile_idc = nal_hevc_profile_from_v4l2(profile);
+	ptl->general_profile_idc = nal_hevc_profile(profile);
 	ptl->general_profile_compatibility_flag[ptl->general_profile_idc] = 1;
-	ptl->general_tier_flag = nal_hevc_tier_from_v4l2(tier);
+	ptl->general_tier_flag = nal_hevc_tier(tier);
 	ptl->general_progressive_source_flag = 1;
 	ptl->general_frame_only_constraint_flag = 1;
-	ptl->general_level_idc = nal_hevc_level_from_v4l2(level);
+	ptl->general_level_idc = nal_hevc_level(level);
 
 	sps->seq_parameter_set_id = 0;
 	sps->chroma_format_idc = 1; /* Only 4:2:0 sampling supported */
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.c b/drivers/media/platform/allegro-dvt/nal-h264.c
index 0ab2fcbee1b9..32663766340f 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.c
+++ b/drivers/media/platform/allegro-dvt/nal-h264.c
@@ -34,80 +34,6 @@ enum nal_unit_type {
 	FILLER_DATA = 12,
 };
 
-/**
- * nal_h264_profile_from_v4l2() - Get profile_idc for v4l2 h264 profile
- * @profile: the profile as &enum v4l2_mpeg_video_h264_profile
- *
- * Convert the &enum v4l2_mpeg_video_h264_profile to profile_idc as specified
- * in Rec. ITU-T H.264 (04/2017) A.2.
- *
- * Return: the profile_idc for the passed level
- */
-int nal_h264_profile_from_v4l2(enum v4l2_mpeg_video_h264_profile profile)
-{
-	switch (profile) {
-	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
-		return 66;
-	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
-		return 77;
-	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
-		return 88;
-	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
-		return 100;
-	default:
-		return -EINVAL;
-	}
-}
-
-/**
- * nal_h264_level_from_v4l2() - Get level_idc for v4l2 h264 level
- * @level: the level as &enum v4l2_mpeg_video_h264_level
- *
- * Convert the &enum v4l2_mpeg_video_h264_level to level_idc as specified in
- * Rec. ITU-T H.264 (04/2017) A.3.2.
- *
- * Return: the level_idc for the passed level
- */
-int nal_h264_level_from_v4l2(enum v4l2_mpeg_video_h264_level level)
-{
-	switch (level) {
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
-		return 10;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
-		return 9;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
-		return 11;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
-		return 12;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
-		return 13;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
-		return 20;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
-		return 21;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
-		return 22;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
-		return 30;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
-		return 31;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
-		return 32;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
-		return 40;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
-		return 41;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
-		return 42;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
-		return 50;
-	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
-		return 51;
-	default:
-		return -EINVAL;
-	}
-}
-
 static void nal_h264_write_start_code_prefix(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
diff --git a/drivers/media/platform/allegro-dvt/nal-h264.h b/drivers/media/platform/allegro-dvt/nal-h264.h
index a19634fe8c0b..e03505593ec2 100644
--- a/drivers/media/platform/allegro-dvt/nal-h264.h
+++ b/drivers/media/platform/allegro-dvt/nal-h264.h
@@ -8,8 +8,10 @@
 #ifndef __NAL_H264_H__
 #define __NAL_H264_H__
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
+#include <linux/v4l2-controls.h>
 
 /*
  * struct nal_h264_hrd_parameters - HRD parameters
@@ -187,8 +189,79 @@ struct nal_h264_pps {
 	};
 };
 
-int nal_h264_profile_from_v4l2(enum v4l2_mpeg_video_h264_profile profile);
-int nal_h264_level_from_v4l2(enum v4l2_mpeg_video_h264_level level);
+/**
+ * nal_h264_profile() - Get profile_idc for v4l2 h264 profile
+ * @profile: the profile as &enum v4l2_mpeg_video_h264_profile
+ *
+ * Convert the &enum v4l2_mpeg_video_h264_profile to profile_idc as specified
+ * in Rec. ITU-T H.264 (04/2017) A.2.
+ *
+ * Return: the profile_idc for the passed level
+ */
+static inline int nal_h264_profile(enum v4l2_mpeg_video_h264_profile profile)
+{
+	switch (profile) {
+	case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
+		return 66;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
+		return 77;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_EXTENDED:
+		return 88;
+	case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
+		return 100;
+	default:
+		return -EINVAL;
+	}
+}
+
+/**
+ * nal_h264_level() - Get level_idc for v4l2 h264 level
+ * @level: the level as &enum v4l2_mpeg_video_h264_level
+ *
+ * Convert the &enum v4l2_mpeg_video_h264_level to level_idc as specified in
+ * Rec. ITU-T H.264 (04/2017) A.3.2.
+ *
+ * Return: the level_idc for the passed level
+ */
+static inline int nal_h264_level(enum v4l2_mpeg_video_h264_level level)
+{
+	switch (level) {
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
+		return 10;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
+		return 9;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
+		return 11;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
+		return 12;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
+		return 13;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
+		return 20;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
+		return 21;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
+		return 22;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
+		return 30;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
+		return 31;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
+		return 32;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
+		return 40;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
+		return 41;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
+		return 42;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
+		return 50;
+	case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
+		return 51;
+	default:
+		return -EINVAL;
+	}
+}
 
 ssize_t nal_h264_write_sps(const struct device *dev,
 			   void *dest, size_t n, struct nal_h264_sps *sps);
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.c b/drivers/media/platform/allegro-dvt/nal-hevc.c
index 15a352e45831..0999a2bdc812 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.c
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.c
@@ -35,76 +35,6 @@ enum nal_unit_type {
 	FD_NUT = 38,
 };
 
-int nal_hevc_profile_from_v4l2(enum v4l2_mpeg_video_hevc_profile profile)
-{
-	switch (profile) {
-	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
-		return 1;
-	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10:
-		return 2;
-	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
-		return 3;
-	default:
-		return -EINVAL;
-	}
-}
-EXPORT_SYMBOL_GPL(nal_hevc_profile_from_v4l2);
-
-int nal_hevc_tier_from_v4l2(enum v4l2_mpeg_video_hevc_tier tier)
-{
-	switch (tier) {
-	case V4L2_MPEG_VIDEO_HEVC_TIER_MAIN:
-		return 0;
-	case V4L2_MPEG_VIDEO_HEVC_TIER_HIGH:
-		return 1;
-	default:
-		return -EINVAL;
-	}
-}
-EXPORT_SYMBOL_GPL(nal_hevc_tier_from_v4l2);
-
-int nal_hevc_level_from_v4l2(enum v4l2_mpeg_video_hevc_level level)
-{
-	/*
-	 * T-Rec-H.265 p. 280: general_level_idc and sub_layer_level_idc[ i ]
-	 * shall be set equal to a value of 30 times the level number
-	 * specified in Table A.6.
-	 */
-	int factor = 30 / 10;
-
-	switch (level) {
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
-		return factor * 10;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
-		return factor * 20;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
-		return factor * 21;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
-		return factor * 30;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
-		return factor * 31;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
-		return factor * 40;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
-		return factor * 41;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
-		return factor * 50;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
-		return factor * 51;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2:
-		return factor * 52;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6:
-		return factor * 60;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1:
-		return factor * 61;
-	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2:
-		return factor * 62;
-	default:
-		return -EINVAL;
-	}
-}
-EXPORT_SYMBOL_GPL(nal_hevc_level_from_v4l2);
-
 static void nal_hevc_write_start_code_prefix(struct rbsp *rbsp)
 {
 	u8 *p = rbsp->data + DIV_ROUND_UP(rbsp->pos, 8);
diff --git a/drivers/media/platform/allegro-dvt/nal-hevc.h b/drivers/media/platform/allegro-dvt/nal-hevc.h
index c09bbe5446aa..e67d94bd5341 100644
--- a/drivers/media/platform/allegro-dvt/nal-hevc.h
+++ b/drivers/media/platform/allegro-dvt/nal-hevc.h
@@ -8,9 +8,10 @@
 #ifndef __NAL_HEVC_H__
 #define __NAL_HEVC_H__
 
+#include <linux/errno.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <media/v4l2-ctrls.h>
+#include <linux/v4l2-controls.h>
 
 struct nal_hevc_profile_tier_level {
 	unsigned int general_profile_space;
@@ -318,9 +319,99 @@ struct nal_hevc_pps {
 	};
 };
 
-int nal_hevc_profile_from_v4l2(enum v4l2_mpeg_video_hevc_profile profile);
-int nal_hevc_tier_from_v4l2(enum v4l2_mpeg_video_hevc_tier tier);
-int nal_hevc_level_from_v4l2(enum v4l2_mpeg_video_hevc_level level);
+/**
+ * nal_hevc_profile() - Get profile_idc for v4l2 hevc profile
+ * @profile: the profile as &enum v4l2_mpeg_video_hevc_profile
+ *
+ * Convert the &enum v4l2_mpeg_video_hevc_profile to profile_idc as specified
+ * in Rec. ITU-T H.265 (02/2018) A.3.
+ *
+ * Return: the profile_idc for the passed level
+ */
+static inline int nal_hevc_profile(enum v4l2_mpeg_video_hevc_profile profile)
+{
+	switch (profile) {
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
+		return 1;
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10:
+		return 2;
+	case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
+		return 3;
+	default:
+		return -EINVAL;
+	}
+}
+
+/**
+ * nal_hevc_tier() - Get tier_flag for v4l2 hevc tier
+ * @tier: the tier as &enum v4l2_mpeg_video_hevc_tier
+ *
+ * Convert the &enum v4l2_mpeg_video_hevc_tier to tier_flag as specified
+ * in Rec. ITU-T H.265 (02/2018) A.4.1.
+ *
+ * Return: the tier_flag for the passed tier
+ */
+static inline int nal_hevc_tier(enum v4l2_mpeg_video_hevc_tier tier)
+{
+	switch (tier) {
+	case V4L2_MPEG_VIDEO_HEVC_TIER_MAIN:
+		return 0;
+	case V4L2_MPEG_VIDEO_HEVC_TIER_HIGH:
+		return 1;
+	default:
+		return -EINVAL;
+	}
+}
+
+/**
+ * nal_hevc_level() - Get level_idc for v4l2 hevc level
+ * @level: the level as &enum v4l2_mpeg_video_hevc_level
+ *
+ * Convert the &enum v4l2_mpeg_video_hevc_level to level_idc as specified in
+ * Rec. ITU-T H.265 (02/2018) A.4.1.
+ *
+ * Return: the level_idc for the passed level
+ */
+static inline int nal_hevc_level(enum v4l2_mpeg_video_hevc_level level)
+{
+	/*
+	 * T-Rec-H.265 p. 280: general_level_idc and sub_layer_level_idc[ i ]
+	 * shall be set equal to a value of 30 times the level number
+	 * specified in Table A.6.
+	 */
+	int factor = 30 / 10;
+
+	switch (level) {
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
+		return factor * 10;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
+		return factor * 20;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
+		return factor * 21;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
+		return factor * 30;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
+		return factor * 31;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
+		return factor * 40;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
+		return factor * 41;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
+		return factor * 50;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
+		return factor * 51;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2:
+		return factor * 52;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6:
+		return factor * 60;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1:
+		return factor * 61;
+	case V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2:
+		return factor * 62;
+	default:
+		return -EINVAL;
+	}
+}
 
 int nal_range_from_v4l2(enum v4l2_quantization quantization);
 int nal_color_primaries_from_v4l2(enum v4l2_colorspace colorspace);
-- 
2.30.2

