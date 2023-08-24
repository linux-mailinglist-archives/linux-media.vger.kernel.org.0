Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7975F786B7B
	for <lists+linux-media@lfdr.de>; Thu, 24 Aug 2023 11:22:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240480AbjHXJVv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Aug 2023 05:21:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240640AbjHXJVW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Aug 2023 05:21:22 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8112C172D
        for <linux-media@vger.kernel.org>; Thu, 24 Aug 2023 02:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692868877; x=1724404877;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aloNGFdwD7DMHGi6SKdCn1fbOKA+RIoBmf4iBPcaptU=;
  b=fMUzBIncfCA8pmZ2q9sST1RooUwRYIfYsoBik/8JU3QGpYhS1BGUH0FW
   XyGuDHcHvKfqYb9JFGWl4NFW96fqoJ6ZKgp9VpFPk4Kf47iql8iC9AvEd
   6AWxyPHC7K7VFqtca0spG4sbFjj0jRyIC001um5SEF2W3cCcBtIZ3hqGr
   3rOtq4cViQZn2Kvae2psqyQ49dhFpHf7DOqM+pa0iBaNLWr4Wito3ZyDt
   9i1/NKaRCaexvL07kfN7tH8J7dyrP1xyRgKAOyIF+qhHfJ5Qt+2CWr4+C
   ATcqLe5435NB6rZvXopUNsEzVZkPWQmGRg7n+wgQbvJ+DubeWX5AHhEDt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="438325594"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="438325594"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:21:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="910837465"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200"; 
   d="scan'208";a="910837465"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 02:21:14 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
        by kekkonen.fi.intel.com (Postfix) with ESMTP id E5B9812023C;
        Thu, 24 Aug 2023 12:14:57 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
        (envelope-from <sakari.ailus@linux.intel.com>)
        id 1qZ6Px-00GIGo-0K;
        Thu, 24 Aug 2023 12:14:17 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     linux-media@vger.kernel.org
Cc:     laurent.pinchart@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
        jacopo.mondi@ideasonboard.com, hongju.wang@intel.com
Subject: [yavta RFC 1/2] Update kernel headers
Date:   Thu, 24 Aug 2023 12:14:06 +0300
Message-Id: <20230824091407.3883461-2-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230824091407.3883461-1-sakari.ailus@linux.intel.com>
References: <20230824091407.3883461-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Update kernel headers to v6.5 media tree + metadata patches.

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 include/linux/v4l2-common.h   |   39 -
 include/linux/v4l2-controls.h | 1545 ++++++++++++++++++++++++++++++++-
 include/linux/videodev2.h     |  102 ++-
 3 files changed, 1601 insertions(+), 85 deletions(-)

diff --git a/include/linux/v4l2-common.h b/include/linux/v4l2-common.h
index 14de1731b39c..c3ca11e3e2e0 100644
--- a/include/linux/v4l2-common.h
+++ b/include/linux/v4l2-common.h
@@ -10,45 +10,6 @@
  *
  * Copyright (C) 2012 Nokia Corporation
  * Contact: Sakari Ailus <sakari.ailus@iki.fi>
- *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  Alternatively you can redistribute this file under the terms of the
- *  BSD license as stated below:
- *
- *  Redistribution and use in source and binary forms, with or without
- *  modification, are permitted provided that the following conditions
- *  are met:
- *  1. Redistributions of source code must retain the above copyright
- *     notice, this list of conditions and the following disclaimer.
- *  2. Redistributions in binary form must reproduce the above copyright
- *     notice, this list of conditions and the following disclaimer in
- *     the documentation and/or other materials provided with the
- *     distribution.
- *  3. The names of its contributors may not be used to endorse or promote
- *     products derived from this software without specific prior written
- *     permission.
- *
- *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
- *  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- *  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
- *  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
- *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- *  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
  */
 
 #ifndef __V4L2_COMMON__
diff --git a/include/linux/v4l2-controls.h b/include/linux/v4l2-controls.h
index 667e25607193..63516691cec0 100644
--- a/include/linux/v4l2-controls.h
+++ b/include/linux/v4l2-controls.h
@@ -4,44 +4,6 @@
  *
  *  Copyright (C) 1999-2012 the contributors
  *
- *  This program is free software; you can redistribute it and/or modify
- *  it under the terms of the GNU General Public License as published by
- *  the Free Software Foundation; either version 2 of the License, or
- *  (at your option) any later version.
- *
- *  This program is distributed in the hope that it will be useful,
- *  but WITHOUT ANY WARRANTY; without even the implied warranty of
- *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- *  GNU General Public License for more details.
- *
- *  Alternatively you can redistribute this file under the terms of the
- *  BSD license as stated below:
- *
- *  Redistribution and use in source and binary forms, with or without
- *  modification, are permitted provided that the following conditions
- *  are met:
- *  1. Redistributions of source code must retain the above copyright
- *     notice, this list of conditions and the following disclaimer.
- *  2. Redistributions in binary form must reproduce the above copyright
- *     notice, this list of conditions and the following disclaimer in
- *     the documentation and/or other materials provided with the
- *     distribution.
- *  3. The names of its contributors may not be used to endorse or promote
- *     products derived from this software without specific prior written
- *     permission.
- *
- *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
- *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
- *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
- *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
- *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
- *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
- *  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
- *  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
- *  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
- *  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
- *  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
  *  The contents of this header was split off from videodev2.h. All control
  *  definitions should be added to this header, which is included by
  *  videodev2.h.
@@ -128,6 +90,7 @@ enum v4l2_colorfx {
 	V4L2_COLORFX_SOLARIZATION		= 13,
 	V4L2_COLORFX_ANTIQUE			= 14,
 	V4L2_COLORFX_SET_CBCR			= 15,
+	V4L2_COLORFX_SET_RGB			= 16,
 };
 #define V4L2_CID_AUTOBRIGHTNESS			(V4L2_CID_BASE+32)
 #define V4L2_CID_BAND_STOP_FILTER		(V4L2_CID_BASE+33)
@@ -145,14 +108,17 @@ enum v4l2_colorfx {
 
 #define V4L2_CID_ALPHA_COMPONENT		(V4L2_CID_BASE+41)
 #define V4L2_CID_COLORFX_CBCR			(V4L2_CID_BASE+42)
+#define V4L2_CID_COLORFX_RGB			(V4L2_CID_BASE+43)
 
 /* last CID + 1 */
-#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+43)
+#define V4L2_CID_LASTP1                         (V4L2_CID_BASE+44)
 
 /* USER-class private control IDs */
 
-/* The base for the meye driver controls. See linux/meye.h for the list
- * of controls. We reserve 16 controls for this driver. */
+/*
+ * The base for the meye driver controls. This driver was removed, but
+ * we keep this define in case any software still uses it.
+ */
 #define V4L2_CID_USER_MEYE_BASE			(V4L2_CID_USER_BASE + 0x1000)
 
 /* The base for the bttv driver controls.
@@ -217,6 +183,24 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_ALLEGRO_BASE		(V4L2_CID_USER_BASE + 0x1170)
 
+/*
+ * The base for the isl7998x driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_ISL7998X_BASE		(V4L2_CID_USER_BASE + 0x1180)
+
+/*
+ * The base for DW100 driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_DW100_BASE		(V4L2_CID_USER_BASE + 0x1190)
+
+/*
+ * The base for Aspeed driver controls.
+ * We reserve 16 controls for this driver.
+ */
+#define V4L2_CID_USER_ASPEED_BASE		(V4L2_CID_USER_BASE + 0x11a0)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */
@@ -439,6 +423,11 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+234)
 #define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+235)
 #define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+236)
+#define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE	(V4L2_CID_CODEC_BASE+237)
+enum v4l2_mpeg_video_intra_refresh_period_type {
+	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM	= 0,
+	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC	= 1,
+};
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
@@ -811,6 +800,88 @@ enum v4l2_mpeg_video_frame_skip_mode {
 #define V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY		(V4L2_CID_CODEC_BASE + 653)
 #define V4L2_CID_MPEG_VIDEO_DEC_DISPLAY_DELAY_ENABLE	(V4L2_CID_CODEC_BASE + 654)
 
+#define V4L2_CID_MPEG_VIDEO_AV1_PROFILE (V4L2_CID_CODEC_BASE + 655)
+/**
+ * enum v4l2_mpeg_video_av1_profile - AV1 profiles
+ *
+ * @V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN: compliant decoders must be able to decode
+ * streams with seq_profile equal to 0.
+ * @V4L2_MPEG_VIDEO_AV1_PROFILE_HIGH: compliant decoders must be able to decode
+ * streams with seq_profile equal less than or equal to 1.
+ * @V4L2_MPEG_VIDEO_AV1_PROFILE_PROFESSIONAL: compliant decoders must be able to
+ * decode streams with seq_profile less than or equal to 2.
+ *
+ * Conveys the highest profile a decoder can work with.
+ */
+enum v4l2_mpeg_video_av1_profile {
+	V4L2_MPEG_VIDEO_AV1_PROFILE_MAIN = 0,
+	V4L2_MPEG_VIDEO_AV1_PROFILE_HIGH = 1,
+	V4L2_MPEG_VIDEO_AV1_PROFILE_PROFESSIONAL = 2,
+};
+
+#define V4L2_CID_MPEG_VIDEO_AV1_LEVEL (V4L2_CID_CODEC_BASE + 656)
+/**
+ * enum v4l2_mpeg_video_av1_level - AV1 levels
+ *
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_2_0: Level 2.0.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_2_1: Level 2.1.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_2_2: Level 2.2.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_2_3: Level 2.3.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_3_0: Level 3.0.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_3_1: Level 3.1.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_3_2: Level 3.2.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_3_3: Level 3.3.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_4_0: Level 4.0.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_4_1: Level 4.1.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_4_2: Level 4.2.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_4_3: Level 4.3.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_5_0: Level 5.0.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_5_1: Level 5.1.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_5_2: Level 5.2.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_5_3: Level 5.3.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_6_0: Level 6.0.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_6_1: Level 6.1.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_6_2: Level 6.2.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_6_3: Level 6.3.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_7_0: Level 7.0.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_7_1: Level 7.1.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_7_2: Level 7.2.
+ * @V4L2_MPEG_VIDEO_AV1_LEVEL_7_3: Level 7.3.
+ *
+ * Conveys the highest level a decoder can work with.
+ */
+enum v4l2_mpeg_video_av1_level {
+	V4L2_MPEG_VIDEO_AV1_LEVEL_2_0 = 0,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_2_1 = 1,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_2_2 = 2,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_2_3 = 3,
+
+	V4L2_MPEG_VIDEO_AV1_LEVEL_3_0 = 4,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_3_1 = 5,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_3_2 = 6,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_3_3 = 7,
+
+	V4L2_MPEG_VIDEO_AV1_LEVEL_4_0 = 8,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_4_1 = 9,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_4_2 = 10,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_4_3 = 11,
+
+	V4L2_MPEG_VIDEO_AV1_LEVEL_5_0 = 12,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_5_1 = 13,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_5_2 = 14,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_5_3 = 15,
+
+	V4L2_MPEG_VIDEO_AV1_LEVEL_6_0 = 16,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_6_1 = 17,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_6_2 = 18,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_6_3 = 19,
+
+	V4L2_MPEG_VIDEO_AV1_LEVEL_7_0 = 20,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_7_1 = 21,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_7_2 = 22,
+	V4L2_MPEG_VIDEO_AV1_LEVEL_7_3 = 23
+};
+
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
 #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
@@ -998,6 +1069,8 @@ enum v4l2_auto_focus_range {
 
 #define V4L2_CID_CAMERA_SENSOR_ROTATION		(V4L2_CID_CAMERA_CLASS_BASE+35)
 
+#define V4L2_CID_HDR_SENSOR_MODE		(V4L2_CID_CAMERA_CLASS_BASE+36)
+
 /* FM Modulator class control IDs */
 
 #define V4L2_CID_FM_TX_CLASS_BASE		(V4L2_CTRL_CLASS_FM_TX | 0x900)
@@ -1559,6 +1632,8 @@ struct v4l2_h264_dpb_entry {
 #define V4L2_H264_DECODE_PARAM_FLAG_IDR_PIC		0x01
 #define V4L2_H264_DECODE_PARAM_FLAG_FIELD_PIC		0x02
 #define V4L2_H264_DECODE_PARAM_FLAG_BOTTOM_FIELD	0x04
+#define V4L2_H264_DECODE_PARAM_FLAG_PFRAME		0x08
+#define V4L2_H264_DECODE_PARAM_FLAG_BFRAME		0x10
 
 #define V4L2_CID_STATELESS_H264_DECODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 7)
 /**
@@ -1713,7 +1788,7 @@ struct v4l2_vp8_segment {
  * @sharpness_level: matches sharpness_level syntax element.
  * @level: matches loop_filter_level syntax element.
  * @padding: padding field. Should be zeroed by applications.
- * @flags: see V4L2_VP8_LF_FLAG_{}.
+ * @flags: see V4L2_VP8_LF_{}.
  *
  * This structure contains loop filter related parameters.
  * See the 'mb_lf_adjustments()' part of the frame header syntax,
@@ -1980,6 +2055,469 @@ struct v4l2_ctrl_mpeg2_quantisation {
 	__u8	chroma_non_intra_quantiser_matrix[64];
 };
 
+#define V4L2_CID_STATELESS_HEVC_SPS		(V4L2_CID_CODEC_STATELESS_BASE + 400)
+#define V4L2_CID_STATELESS_HEVC_PPS		(V4L2_CID_CODEC_STATELESS_BASE + 401)
+#define V4L2_CID_STATELESS_HEVC_SLICE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 402)
+#define V4L2_CID_STATELESS_HEVC_SCALING_MATRIX	(V4L2_CID_CODEC_STATELESS_BASE + 403)
+#define V4L2_CID_STATELESS_HEVC_DECODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 404)
+#define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_STATELESS_BASE + 405)
+#define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_STATELESS_BASE + 406)
+#define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC_STATELESS_BASE + 407)
+
+enum v4l2_stateless_hevc_decode_mode {
+	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
+	V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
+};
+
+enum v4l2_stateless_hevc_start_code {
+	V4L2_STATELESS_HEVC_START_CODE_NONE,
+	V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
+};
+
+#define V4L2_HEVC_SLICE_TYPE_B	0
+#define V4L2_HEVC_SLICE_TYPE_P	1
+#define V4L2_HEVC_SLICE_TYPE_I	2
+
+#define V4L2_HEVC_SPS_FLAG_SEPARATE_COLOUR_PLANE		(1ULL << 0)
+#define V4L2_HEVC_SPS_FLAG_SCALING_LIST_ENABLED			(1ULL << 1)
+#define V4L2_HEVC_SPS_FLAG_AMP_ENABLED				(1ULL << 2)
+#define V4L2_HEVC_SPS_FLAG_SAMPLE_ADAPTIVE_OFFSET		(1ULL << 3)
+#define V4L2_HEVC_SPS_FLAG_PCM_ENABLED				(1ULL << 4)
+#define V4L2_HEVC_SPS_FLAG_PCM_LOOP_FILTER_DISABLED		(1ULL << 5)
+#define V4L2_HEVC_SPS_FLAG_LONG_TERM_REF_PICS_PRESENT		(1ULL << 6)
+#define V4L2_HEVC_SPS_FLAG_SPS_TEMPORAL_MVP_ENABLED		(1ULL << 7)
+#define V4L2_HEVC_SPS_FLAG_STRONG_INTRA_SMOOTHING_ENABLED	(1ULL << 8)
+
+/**
+ * struct v4l2_ctrl_hevc_sps - ITU-T Rec. H.265: Sequence parameter set
+ *
+ * @video_parameter_set_id: specifies the value of the
+ *			vps_video_parameter_set_id of the active VPS
+ * @seq_parameter_set_id: provides an identifier for the SPS for
+ *			  reference by other syntax elements
+ * @pic_width_in_luma_samples:	specifies the width of each decoded picture
+ *				in units of luma samples
+ * @pic_height_in_luma_samples: specifies the height of each decoded picture
+ *				in units of luma samples
+ * @bit_depth_luma_minus8: this value plus 8specifies the bit depth of the
+ *                         samples of the luma array
+ * @bit_depth_chroma_minus8: this value plus 8 specifies the bit depth of the
+ *                           samples of the chroma arrays
+ * @log2_max_pic_order_cnt_lsb_minus4: this value plus 4 specifies the value of
+ *                                     the variable MaxPicOrderCntLsb
+ * @sps_max_dec_pic_buffering_minus1: this value plus 1 specifies the maximum
+ *                                    required size of the decoded picture
+ *                                    buffer for the codec video sequence
+ * @sps_max_num_reorder_pics: indicates the maximum allowed number of pictures
+ * @sps_max_latency_increase_plus1: not equal to 0 is used to compute the
+ *				    value of SpsMaxLatencyPictures array
+ * @log2_min_luma_coding_block_size_minus3: plus 3 specifies the minimum
+ *					    luma coding block size
+ * @log2_diff_max_min_luma_coding_block_size: specifies the difference between
+ *					      the maximum and minimum luma
+ *					      coding block size
+ * @log2_min_luma_transform_block_size_minus2: plus 2 specifies the minimum luma
+ *					       transform block size
+ * @log2_diff_max_min_luma_transform_block_size: specifies the difference between
+ *						 the maximum and minimum luma
+ *						 transform block size
+ * @max_transform_hierarchy_depth_inter: specifies the maximum hierarchy
+ *					 depth for transform units of
+ *					 coding units coded in inter
+ *					 prediction mode
+ * @max_transform_hierarchy_depth_intra: specifies the maximum hierarchy
+ *					 depth for transform units of
+ *					 coding units coded in intra
+ *					 prediction mode
+ * @pcm_sample_bit_depth_luma_minus1: this value plus 1 specifies the number of
+ *                                    bits used to represent each of PCM sample
+ *                                    values of the luma component
+ * @pcm_sample_bit_depth_chroma_minus1: this value plus 1 specifies the number
+ *                                      of bits used to represent each of PCM
+ *                                      sample values of the chroma components
+ * @log2_min_pcm_luma_coding_block_size_minus3: this value plus 3 specifies the
+ *                                              minimum size of coding blocks
+ * @log2_diff_max_min_pcm_luma_coding_block_size: specifies the difference between
+ *						  the maximum and minimum size of
+ *						  coding blocks
+ * @num_short_term_ref_pic_sets: specifies the number of st_ref_pic_set()
+ *				 syntax structures included in the SPS
+ * @num_long_term_ref_pics_sps: specifies the number of candidate long-term
+ *				reference pictures that are specified in the SPS
+ * @chroma_format_idc: specifies the chroma sampling
+ * @sps_max_sub_layers_minus1: this value plus 1 specifies the maximum number
+ *                             of temporal sub-layers
+ * @reserved: padding field. Should be zeroed by applications.
+ * @flags: see V4L2_HEVC_SPS_FLAG_{}
+ */
+struct v4l2_ctrl_hevc_sps {
+	__u8	video_parameter_set_id;
+	__u8	seq_parameter_set_id;
+	__u16	pic_width_in_luma_samples;
+	__u16	pic_height_in_luma_samples;
+	__u8	bit_depth_luma_minus8;
+	__u8	bit_depth_chroma_minus8;
+	__u8	log2_max_pic_order_cnt_lsb_minus4;
+	__u8	sps_max_dec_pic_buffering_minus1;
+	__u8	sps_max_num_reorder_pics;
+	__u8	sps_max_latency_increase_plus1;
+	__u8	log2_min_luma_coding_block_size_minus3;
+	__u8	log2_diff_max_min_luma_coding_block_size;
+	__u8	log2_min_luma_transform_block_size_minus2;
+	__u8	log2_diff_max_min_luma_transform_block_size;
+	__u8	max_transform_hierarchy_depth_inter;
+	__u8	max_transform_hierarchy_depth_intra;
+	__u8	pcm_sample_bit_depth_luma_minus1;
+	__u8	pcm_sample_bit_depth_chroma_minus1;
+	__u8	log2_min_pcm_luma_coding_block_size_minus3;
+	__u8	log2_diff_max_min_pcm_luma_coding_block_size;
+	__u8	num_short_term_ref_pic_sets;
+	__u8	num_long_term_ref_pics_sps;
+	__u8	chroma_format_idc;
+	__u8	sps_max_sub_layers_minus1;
+
+	__u8	reserved[6];
+	__u64	flags;
+};
+
+#define V4L2_HEVC_PPS_FLAG_DEPENDENT_SLICE_SEGMENT_ENABLED	(1ULL << 0)
+#define V4L2_HEVC_PPS_FLAG_OUTPUT_FLAG_PRESENT			(1ULL << 1)
+#define V4L2_HEVC_PPS_FLAG_SIGN_DATA_HIDING_ENABLED		(1ULL << 2)
+#define V4L2_HEVC_PPS_FLAG_CABAC_INIT_PRESENT			(1ULL << 3)
+#define V4L2_HEVC_PPS_FLAG_CONSTRAINED_INTRA_PRED		(1ULL << 4)
+#define V4L2_HEVC_PPS_FLAG_TRANSFORM_SKIP_ENABLED		(1ULL << 5)
+#define V4L2_HEVC_PPS_FLAG_CU_QP_DELTA_ENABLED			(1ULL << 6)
+#define V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT	(1ULL << 7)
+#define V4L2_HEVC_PPS_FLAG_WEIGHTED_PRED			(1ULL << 8)
+#define V4L2_HEVC_PPS_FLAG_WEIGHTED_BIPRED			(1ULL << 9)
+#define V4L2_HEVC_PPS_FLAG_TRANSQUANT_BYPASS_ENABLED		(1ULL << 10)
+#define V4L2_HEVC_PPS_FLAG_TILES_ENABLED			(1ULL << 11)
+#define V4L2_HEVC_PPS_FLAG_ENTROPY_CODING_SYNC_ENABLED		(1ULL << 12)
+#define V4L2_HEVC_PPS_FLAG_LOOP_FILTER_ACROSS_TILES_ENABLED	(1ULL << 13)
+#define V4L2_HEVC_PPS_FLAG_PPS_LOOP_FILTER_ACROSS_SLICES_ENABLED (1ULL << 14)
+#define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_OVERRIDE_ENABLED	(1ULL << 15)
+#define V4L2_HEVC_PPS_FLAG_PPS_DISABLE_DEBLOCKING_FILTER	(1ULL << 16)
+#define V4L2_HEVC_PPS_FLAG_LISTS_MODIFICATION_PRESENT		(1ULL << 17)
+#define V4L2_HEVC_PPS_FLAG_SLICE_SEGMENT_HEADER_EXTENSION_PRESENT (1ULL << 18)
+#define V4L2_HEVC_PPS_FLAG_DEBLOCKING_FILTER_CONTROL_PRESENT	(1ULL << 19)
+#define V4L2_HEVC_PPS_FLAG_UNIFORM_SPACING			(1ULL << 20)
+
+/**
+ * struct v4l2_ctrl_hevc_pps - ITU-T Rec. H.265: Picture parameter set
+ *
+ * @pic_parameter_set_id: identifies the PPS for reference by other
+ *			  syntax elements
+ * @num_extra_slice_header_bits: specifies the number of extra slice header
+ *				 bits that are present in the slice header RBSP
+ *				 for coded pictures referring to the PPS.
+ * @num_ref_idx_l0_default_active_minus1: this value plus 1 specifies the
+ *                                        inferred value of num_ref_idx_l0_active_minus1
+ * @num_ref_idx_l1_default_active_minus1: this value plus 1 specifies the
+ *                                        inferred value of num_ref_idx_l1_active_minus1
+ * @init_qp_minus26: this value plus 26 specifies the initial value of SliceQp Y for
+ *		     each slice referring to the PPS
+ * @diff_cu_qp_delta_depth: specifies the difference between the luma coding
+ *			    tree block size and the minimum luma coding block
+ *			    size of coding units that convey cu_qp_delta_abs
+ *			    and cu_qp_delta_sign_flag
+ * @pps_cb_qp_offset: specify the offsets to the luma quantization parameter Cb
+ * @pps_cr_qp_offset: specify the offsets to the luma quantization parameter Cr
+ * @num_tile_columns_minus1: this value plus 1 specifies the number of tile columns
+ *			     partitioning the picture
+ * @num_tile_rows_minus1: this value plus 1 specifies the number of tile rows partitioning
+ *			  the picture
+ * @column_width_minus1: this value plus 1 specifies the width of the each tile column in
+ *			 units of coding tree blocks
+ * @row_height_minus1: this value plus 1 specifies the height of the each tile row in
+ *		       units of coding tree blocks
+ * @pps_beta_offset_div2: specify the default deblocking parameter offsets for
+ *			  beta divided by 2
+ * @pps_tc_offset_div2: specify the default deblocking parameter offsets for tC
+ *			divided by 2
+ * @log2_parallel_merge_level_minus2: this value plus 2 specifies the value of
+ *                                    the variable Log2ParMrgLevel
+ * @reserved: padding field. Should be zeroed by applications.
+ * @flags: see V4L2_HEVC_PPS_FLAG_{}
+ */
+struct v4l2_ctrl_hevc_pps {
+	__u8	pic_parameter_set_id;
+	__u8	num_extra_slice_header_bits;
+	__u8	num_ref_idx_l0_default_active_minus1;
+	__u8	num_ref_idx_l1_default_active_minus1;
+	__s8	init_qp_minus26;
+	__u8	diff_cu_qp_delta_depth;
+	__s8	pps_cb_qp_offset;
+	__s8	pps_cr_qp_offset;
+	__u8	num_tile_columns_minus1;
+	__u8	num_tile_rows_minus1;
+	__u8	column_width_minus1[20];
+	__u8	row_height_minus1[22];
+	__s8	pps_beta_offset_div2;
+	__s8	pps_tc_offset_div2;
+	__u8	log2_parallel_merge_level_minus2;
+	__u8	reserved;
+	__u64	flags;
+};
+
+#define V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE	0x01
+
+#define V4L2_HEVC_SEI_PIC_STRUCT_FRAME				0
+#define V4L2_HEVC_SEI_PIC_STRUCT_TOP_FIELD			1
+#define V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_FIELD			2
+#define V4L2_HEVC_SEI_PIC_STRUCT_TOP_BOTTOM			3
+#define V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_TOP			4
+#define V4L2_HEVC_SEI_PIC_STRUCT_TOP_BOTTOM_TOP			5
+#define V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_TOP_BOTTOM		6
+#define V4L2_HEVC_SEI_PIC_STRUCT_FRAME_DOUBLING			7
+#define V4L2_HEVC_SEI_PIC_STRUCT_FRAME_TRIPLING			8
+#define V4L2_HEVC_SEI_PIC_STRUCT_TOP_PAIRED_PREVIOUS_BOTTOM	9
+#define V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_PAIRED_PREVIOUS_TOP	10
+#define V4L2_HEVC_SEI_PIC_STRUCT_TOP_PAIRED_NEXT_BOTTOM		11
+#define V4L2_HEVC_SEI_PIC_STRUCT_BOTTOM_PAIRED_NEXT_TOP		12
+
+#define V4L2_HEVC_DPB_ENTRIES_NUM_MAX		16
+
+/**
+ * struct v4l2_hevc_dpb_entry - HEVC decoded picture buffer entry
+ *
+ * @timestamp: timestamp of the V4L2 capture buffer to use as reference.
+ * @flags: long term flag for the reference frame
+ * @field_pic: whether the reference is a field picture or a frame.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @pic_order_cnt_val: the picture order count of the current picture.
+ */
+struct v4l2_hevc_dpb_entry {
+	__u64	timestamp;
+	__u8	flags;
+	__u8	field_pic;
+	__u16	reserved;
+	__s32	pic_order_cnt_val;
+};
+
+/**
+ * struct v4l2_hevc_pred_weight_table - HEVC weighted prediction parameters
+ *
+ * @delta_luma_weight_l0: the difference of the weighting factor applied
+ *			  to the luma prediction value for list 0
+ * @luma_offset_l0: the additive offset applied to the luma prediction value
+ *		    for list 0
+ * @delta_chroma_weight_l0: the difference of the weighting factor applied
+ *			    to the chroma prediction values for list 0
+ * @chroma_offset_l0: the difference of the additive offset applied to
+ *		      the chroma prediction values for list 0
+ * @delta_luma_weight_l1: the difference of the weighting factor applied
+ *			  to the luma prediction value for list 1
+ * @luma_offset_l1: the additive offset applied to the luma prediction value
+ *		    for list 1
+ * @delta_chroma_weight_l1: the difference of the weighting factor applied
+ *			    to the chroma prediction values for list 1
+ * @chroma_offset_l1: the difference of the additive offset applied to
+ *		      the chroma prediction values for list 1
+ * @luma_log2_weight_denom: the base 2 logarithm of the denominator for
+ *			    all luma weighting factors
+ * @delta_chroma_log2_weight_denom: the difference of the base 2 logarithm
+ *				    of the denominator for all chroma
+ *				    weighting factors
+ */
+struct v4l2_hevc_pred_weight_table {
+	__s8	delta_luma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s8	luma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s8	delta_chroma_weight_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
+	__s8	chroma_offset_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
+
+	__s8	delta_luma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s8	luma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__s8	delta_chroma_weight_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
+	__s8	chroma_offset_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX][2];
+
+	__u8	luma_log2_weight_denom;
+	__s8	delta_chroma_log2_weight_denom;
+};
+
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_LUMA		(1ULL << 0)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_SAO_CHROMA		(1ULL << 1)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_TEMPORAL_MVP_ENABLED	(1ULL << 2)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_MVD_L1_ZERO			(1ULL << 3)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_CABAC_INIT			(1ULL << 4)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_COLLOCATED_FROM_L0		(1ULL << 5)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_USE_INTEGER_MV		(1ULL << 6)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_DEBLOCKING_FILTER_DISABLED (1ULL << 7)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_SLICE_LOOP_FILTER_ACROSS_SLICES_ENABLED (1ULL << 8)
+#define V4L2_HEVC_SLICE_PARAMS_FLAG_DEPENDENT_SLICE_SEGMENT	(1ULL << 9)
+
+/**
+ * struct v4l2_ctrl_hevc_slice_params - HEVC slice parameters
+ *
+ * This control is a dynamically sized 1-dimensional array,
+ * V4L2_CTRL_FLAG_DYNAMIC_ARRAY flag must be set when using it.
+ *
+ * @bit_size: size (in bits) of the current slice data
+ * @data_byte_offset: offset (in bytes) to the video data in the current slice data
+ * @num_entry_point_offsets: specifies the number of entry point offset syntax
+ *			     elements in the slice header.
+ * @nal_unit_type: specifies the coding type of the slice (B, P or I)
+ * @nuh_temporal_id_plus1: minus 1 specifies a temporal identifier for the NAL unit
+ * @slice_type: see V4L2_HEVC_SLICE_TYPE_{}
+ * @colour_plane_id: specifies the colour plane associated with the current slice
+ * @slice_pic_order_cnt: specifies the picture order count
+ * @num_ref_idx_l0_active_minus1: this value plus 1 specifies the maximum
+ *                                reference index for reference picture list 0
+ *                                that may be used to decode the slice
+ * @num_ref_idx_l1_active_minus1: this value plus 1 specifies the maximum
+ *                                reference index for reference picture list 1
+ *                                that may be used to decode the slice
+ * @collocated_ref_idx: specifies the reference index of the collocated picture used
+ *			for temporal motion vector prediction
+ * @five_minus_max_num_merge_cand: specifies the maximum number of merging
+ *				   motion vector prediction candidates supported in
+ *				   the slice subtracted from 5
+ * @slice_qp_delta: specifies the initial value of QpY to be used for the coding
+ *		    blocks in the slice
+ * @slice_cb_qp_offset: specifies a difference to be added to the value of pps_cb_qp_offset
+ * @slice_cr_qp_offset: specifies a difference to be added to the value of pps_cr_qp_offset
+ * @slice_act_y_qp_offset: screen content extension parameters
+ * @slice_act_cb_qp_offset: screen content extension parameters
+ * @slice_act_cr_qp_offset: screen content extension parameters
+ * @slice_beta_offset_div2: specify the deblocking parameter offsets for beta divided by 2
+ * @slice_tc_offset_div2: specify the deblocking parameter offsets for tC divided by 2
+ * @pic_struct: indicates whether a picture should be displayed as a frame or as one or
+ *		more fields
+ * @reserved0: padding field. Should be zeroed by applications.
+ * @slice_segment_addr: specifies the address of the first coding tree block in
+ *			the slice segment
+ * @ref_idx_l0: the list of L0 reference elements as indices in the DPB
+ * @ref_idx_l1: the list of L1 reference elements as indices in the DPB
+ * @short_term_ref_pic_set_size: specifies the size of short-term reference
+ *				 pictures set included in the SPS
+ * @long_term_ref_pic_set_size: specifies the size of long-term reference
+ *				pictures set include in the SPS
+ * @pred_weight_table: the prediction weight coefficients for inter-picture
+ *		       prediction
+ * @reserved1: padding field. Should be zeroed by applications.
+ * @flags: see V4L2_HEVC_SLICE_PARAMS_FLAG_{}
+ */
+struct v4l2_ctrl_hevc_slice_params {
+	__u32	bit_size;
+	__u32	data_byte_offset;
+	__u32	num_entry_point_offsets;
+
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: NAL unit header */
+	__u8	nal_unit_type;
+	__u8	nuh_temporal_id_plus1;
+
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
+	__u8	slice_type;
+	__u8	colour_plane_id;
+	__s32	slice_pic_order_cnt;
+	__u8	num_ref_idx_l0_active_minus1;
+	__u8	num_ref_idx_l1_active_minus1;
+	__u8	collocated_ref_idx;
+	__u8	five_minus_max_num_merge_cand;
+	__s8	slice_qp_delta;
+	__s8	slice_cb_qp_offset;
+	__s8	slice_cr_qp_offset;
+	__s8	slice_act_y_qp_offset;
+	__s8	slice_act_cb_qp_offset;
+	__s8	slice_act_cr_qp_offset;
+	__s8	slice_beta_offset_div2;
+	__s8	slice_tc_offset_div2;
+
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Picture timing SEI message */
+	__u8	pic_struct;
+
+	__u8	reserved0[3];
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: General slice segment header */
+	__u32	slice_segment_addr;
+	__u8	ref_idx_l0[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	ref_idx_l1[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u16	short_term_ref_pic_set_size;
+	__u16	long_term_ref_pic_set_size;
+
+	/* ISO/IEC 23008-2, ITU-T Rec. H.265: Weighted prediction parameter */
+	struct v4l2_hevc_pred_weight_table pred_weight_table;
+
+	__u8	reserved1[2];
+	__u64	flags;
+};
+
+#define V4L2_HEVC_DECODE_PARAM_FLAG_IRAP_PIC		0x1
+#define V4L2_HEVC_DECODE_PARAM_FLAG_IDR_PIC		0x2
+#define V4L2_HEVC_DECODE_PARAM_FLAG_NO_OUTPUT_OF_PRIOR  0x4
+
+/**
+ * struct v4l2_ctrl_hevc_decode_params - HEVC decode parameters
+ *
+ * @pic_order_cnt_val: picture order count
+ * @short_term_ref_pic_set_size: specifies the size of short-term reference
+ *				 pictures set included in the SPS of the first slice
+ * @long_term_ref_pic_set_size: specifies the size of long-term reference
+ *				pictures set include in the SPS of the first slice
+ * @num_active_dpb_entries: the number of entries in dpb
+ * @num_poc_st_curr_before: the number of reference pictures in the short-term
+ *			    set that come before the current frame
+ * @num_poc_st_curr_after: the number of reference pictures in the short-term
+ *			   set that come after the current frame
+ * @num_poc_lt_curr: the number of reference pictures in the long-term set
+ * @poc_st_curr_before: provides the index of the short term before references
+ *			in DPB array
+ * @poc_st_curr_after: provides the index of the short term after references
+ *		       in DPB array
+ * @poc_lt_curr: provides the index of the long term references in DPB array
+ * @num_delta_pocs_of_ref_rps_idx: same as the derived value NumDeltaPocs[RefRpsIdx],
+ *				   can be used to parse the RPS data in slice headers
+ *				   instead of skipping it with @short_term_ref_pic_set_size.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @dpb: the decoded picture buffer, for meta-data about reference frames
+ * @flags: see V4L2_HEVC_DECODE_PARAM_FLAG_{}
+ */
+struct v4l2_ctrl_hevc_decode_params {
+	__s32	pic_order_cnt_val;
+	__u16	short_term_ref_pic_set_size;
+	__u16	long_term_ref_pic_set_size;
+	__u8	num_active_dpb_entries;
+	__u8	num_poc_st_curr_before;
+	__u8	num_poc_st_curr_after;
+	__u8	num_poc_lt_curr;
+	__u8	poc_st_curr_before[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	poc_st_curr_after[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	poc_lt_curr[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u8	num_delta_pocs_of_ref_rps_idx;
+	__u8	reserved[3];
+	struct	v4l2_hevc_dpb_entry dpb[V4L2_HEVC_DPB_ENTRIES_NUM_MAX];
+	__u64	flags;
+};
+
+/**
+ * struct v4l2_ctrl_hevc_scaling_matrix - HEVC scaling lists parameters
+ *
+ * @scaling_list_4x4: scaling list is used for the scaling process for
+ *		      transform coefficients. The values on each scaling
+ *		      list are expected in raster scan order
+ * @scaling_list_8x8: scaling list is used for the scaling process for
+ *		      transform coefficients. The values on each scaling
+ *		      list are expected in raster scan order
+ * @scaling_list_16x16:	scaling list is used for the scaling process for
+ *			transform coefficients. The values on each scaling
+ *			list are expected in raster scan order
+ * @scaling_list_32x32:	scaling list is used for the scaling process for
+ *			transform coefficients. The values on each scaling
+ *			list are expected in raster scan order
+ * @scaling_list_dc_coef_16x16:	scaling list is used for the scaling process
+ *				for transform coefficients. The values on each
+ *				scaling list are expected in raster scan order.
+ * @scaling_list_dc_coef_32x32:	scaling list is used for the scaling process
+ *				for transform coefficients. The values on each
+ *				scaling list are expected in raster scan order.
+ */
+struct v4l2_ctrl_hevc_scaling_matrix {
+	__u8	scaling_list_4x4[6][16];
+	__u8	scaling_list_8x8[6][64];
+	__u8	scaling_list_16x16[6][64];
+	__u8	scaling_list_32x32[2][64];
+	__u8	scaling_list_dc_coef_16x16[6];
+	__u8	scaling_list_dc_coef_32x32[2];
+};
+
 #define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
 #define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
 
@@ -2014,6 +2552,929 @@ struct v4l2_ctrl_hdr10_mastering_display {
 	__u32 min_display_mastering_luminance;
 };
 
+/* Stateless VP9 controls */
+
+#define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
+#define	V4L2_VP9_LOOP_FILTER_FLAG_DELTA_UPDATE	0x2
+
+/**
+ * struct v4l2_vp9_loop_filter - VP9 loop filter parameters
+ *
+ * @ref_deltas: contains the adjustment needed for the filter level based on the
+ * chosen reference frame. If this syntax element is not present in the bitstream,
+ * users should pass its last value.
+ * @mode_deltas: contains the adjustment needed for the filter level based on the
+ * chosen mode.	If this syntax element is not present in the bitstream, users should
+ * pass its last value.
+ * @level: indicates the loop filter strength.
+ * @sharpness: indicates the sharpness level.
+ * @flags: combination of V4L2_VP9_LOOP_FILTER_FLAG_{} flags.
+ * @reserved: padding field. Should be zeroed by applications.
+ *
+ * This structure contains all loop filter related parameters. See sections
+ * '7.2.8 Loop filter semantics' of the VP9 specification for more details.
+ */
+struct v4l2_vp9_loop_filter {
+	__s8 ref_deltas[4];
+	__s8 mode_deltas[2];
+	__u8 level;
+	__u8 sharpness;
+	__u8 flags;
+	__u8 reserved[7];
+};
+
+/**
+ * struct v4l2_vp9_quantization - VP9 quantization parameters
+ *
+ * @base_q_idx: indicates the base frame qindex.
+ * @delta_q_y_dc: indicates the Y DC quantizer relative to base_q_idx.
+ * @delta_q_uv_dc: indicates the UV DC quantizer relative to base_q_idx.
+ * @delta_q_uv_ac: indicates the UV AC quantizer relative to base_q_idx.
+ * @reserved: padding field. Should be zeroed by applications.
+ *
+ * Encodes the quantization parameters. See section '7.2.9 Quantization params
+ * syntax' of the VP9 specification for more details.
+ */
+struct v4l2_vp9_quantization {
+	__u8 base_q_idx;
+	__s8 delta_q_y_dc;
+	__s8 delta_q_uv_dc;
+	__s8 delta_q_uv_ac;
+	__u8 reserved[4];
+};
+
+#define V4L2_VP9_SEGMENTATION_FLAG_ENABLED		0x01
+#define V4L2_VP9_SEGMENTATION_FLAG_UPDATE_MAP		0x02
+#define V4L2_VP9_SEGMENTATION_FLAG_TEMPORAL_UPDATE	0x04
+#define V4L2_VP9_SEGMENTATION_FLAG_UPDATE_DATA		0x08
+#define V4L2_VP9_SEGMENTATION_FLAG_ABS_OR_DELTA_UPDATE	0x10
+
+#define V4L2_VP9_SEG_LVL_ALT_Q				0
+#define V4L2_VP9_SEG_LVL_ALT_L				1
+#define V4L2_VP9_SEG_LVL_REF_FRAME			2
+#define V4L2_VP9_SEG_LVL_SKIP				3
+#define V4L2_VP9_SEG_LVL_MAX				4
+
+#define V4L2_VP9_SEGMENT_FEATURE_ENABLED(id)	(1 << (id))
+#define V4L2_VP9_SEGMENT_FEATURE_ENABLED_MASK	0xf
+
+/**
+ * struct v4l2_vp9_segmentation - VP9 segmentation parameters
+ *
+ * @feature_data: data attached to each feature. Data entry is only valid if
+ * the feature is enabled. The array shall be indexed with segment number as
+ * the first dimension (0..7) and one of V4L2_VP9_SEG_{} as the second dimension.
+ * @feature_enabled: bitmask defining which features are enabled in each segment.
+ * The value for each segment is a combination of V4L2_VP9_SEGMENT_FEATURE_ENABLED(id)
+ * values where id is one of V4L2_VP9_SEG_LVL_{}.
+ * @tree_probs: specifies the probability values to be used when decoding a
+ * Segment-ID. See '5.15. Segmentation map' section of the VP9 specification
+ * for more details.
+ * @pred_probs: specifies the probability values to be used when decoding a
+ * Predicted-Segment-ID. See '6.4.14. Get segment id syntax' section of :ref:`vp9`
+ * for more details.
+ * @flags: combination of V4L2_VP9_SEGMENTATION_FLAG_{} flags.
+ * @reserved: padding field. Should be zeroed by applications.
+ *
+ * Encodes the quantization parameters. See section '7.2.10 Segmentation params syntax' of
+ * the VP9 specification for more details.
+ */
+struct v4l2_vp9_segmentation {
+	__s16 feature_data[8][4];
+	__u8 feature_enabled[8];
+	__u8 tree_probs[7];
+	__u8 pred_probs[3];
+	__u8 flags;
+	__u8 reserved[5];
+};
+
+#define V4L2_VP9_FRAME_FLAG_KEY_FRAME			0x001
+#define V4L2_VP9_FRAME_FLAG_SHOW_FRAME			0x002
+#define V4L2_VP9_FRAME_FLAG_ERROR_RESILIENT		0x004
+#define V4L2_VP9_FRAME_FLAG_INTRA_ONLY			0x008
+#define V4L2_VP9_FRAME_FLAG_ALLOW_HIGH_PREC_MV		0x010
+#define V4L2_VP9_FRAME_FLAG_REFRESH_FRAME_CTX		0x020
+#define V4L2_VP9_FRAME_FLAG_PARALLEL_DEC_MODE		0x040
+#define V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING		0x080
+#define V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING		0x100
+#define V4L2_VP9_FRAME_FLAG_COLOR_RANGE_FULL_SWING	0x200
+
+#define V4L2_VP9_SIGN_BIAS_LAST				0x1
+#define V4L2_VP9_SIGN_BIAS_GOLDEN			0x2
+#define V4L2_VP9_SIGN_BIAS_ALT				0x4
+
+#define V4L2_VP9_RESET_FRAME_CTX_NONE			0
+#define V4L2_VP9_RESET_FRAME_CTX_SPEC			1
+#define V4L2_VP9_RESET_FRAME_CTX_ALL			2
+
+#define V4L2_VP9_INTERP_FILTER_EIGHTTAP			0
+#define V4L2_VP9_INTERP_FILTER_EIGHTTAP_SMOOTH		1
+#define V4L2_VP9_INTERP_FILTER_EIGHTTAP_SHARP		2
+#define V4L2_VP9_INTERP_FILTER_BILINEAR			3
+#define V4L2_VP9_INTERP_FILTER_SWITCHABLE		4
+
+#define V4L2_VP9_REFERENCE_MODE_SINGLE_REFERENCE	0
+#define V4L2_VP9_REFERENCE_MODE_COMPOUND_REFERENCE	1
+#define V4L2_VP9_REFERENCE_MODE_SELECT			2
+
+#define V4L2_VP9_PROFILE_MAX				3
+
+#define V4L2_CID_STATELESS_VP9_FRAME	(V4L2_CID_CODEC_STATELESS_BASE + 300)
+/**
+ * struct v4l2_ctrl_vp9_frame - VP9 frame decoding control
+ *
+ * @lf: loop filter parameters. See &v4l2_vp9_loop_filter for more details.
+ * @quant: quantization parameters. See &v4l2_vp9_quantization for more details.
+ * @seg: segmentation parameters. See &v4l2_vp9_segmentation for more details.
+ * @flags: combination of V4L2_VP9_FRAME_FLAG_{} flags.
+ * @compressed_header_size: compressed header size in bytes.
+ * @uncompressed_header_size: uncompressed header size in bytes.
+ * @frame_width_minus_1: add 1 to it and you'll get the frame width expressed in pixels.
+ * @frame_height_minus_1: add 1 to it and you'll get the frame height expressed in pixels.
+ * @render_width_minus_1: add 1 to it and you'll get the expected render width expressed in
+ * pixels. This is not used during the decoding process but might be used by HW scalers
+ * to prepare a frame that's ready for scanout.
+ * @render_height_minus_1: add 1 to it and you'll get the expected render height expressed in
+ * pixels. This is not used during the decoding process but might be used by HW scalers
+ * to prepare a frame that's ready for scanout.
+ * @last_frame_ts: "last" reference buffer timestamp.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer.
+ * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @golden_frame_ts: "golden" reference buffer timestamp.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer.
+ * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @alt_frame_ts: "alt" reference buffer timestamp.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer.
+ * Use v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @ref_frame_sign_bias: a bitfield specifying whether the sign bias is set for a given
+ * reference frame. Either of V4L2_VP9_SIGN_BIAS_{}.
+ * @reset_frame_context: specifies whether the frame context should be reset to default values.
+ * Either of V4L2_VP9_RESET_FRAME_CTX_{}.
+ * @frame_context_idx: frame context that should be used/updated.
+ * @profile: VP9 profile. Can be 0, 1, 2 or 3.
+ * @bit_depth: bits per components. Can be 8, 10 or 12. Note that not all profiles support
+ * 10 and/or 12 bits depths.
+ * @interpolation_filter: specifies the filter selection used for performing inter prediction.
+ * Set to one of V4L2_VP9_INTERP_FILTER_{}.
+ * @tile_cols_log2: specifies the base 2 logarithm of the width of each tile (where the width
+ * is measured in units of 8x8 blocks). Shall be less than or equal to 6.
+ * @tile_rows_log2: specifies the base 2 logarithm of the height of each tile (where the height
+ * is measured in units of 8x8 blocks).
+ * @reference_mode: specifies the type of inter prediction to be used.
+ * Set to one of V4L2_VP9_REFERENCE_MODE_{}.
+ * @reserved: padding field. Should be zeroed by applications.
+ */
+struct v4l2_ctrl_vp9_frame {
+	struct v4l2_vp9_loop_filter lf;
+	struct v4l2_vp9_quantization quant;
+	struct v4l2_vp9_segmentation seg;
+	__u32 flags;
+	__u16 compressed_header_size;
+	__u16 uncompressed_header_size;
+	__u16 frame_width_minus_1;
+	__u16 frame_height_minus_1;
+	__u16 render_width_minus_1;
+	__u16 render_height_minus_1;
+	__u64 last_frame_ts;
+	__u64 golden_frame_ts;
+	__u64 alt_frame_ts;
+	__u8 ref_frame_sign_bias;
+	__u8 reset_frame_context;
+	__u8 frame_context_idx;
+	__u8 profile;
+	__u8 bit_depth;
+	__u8 interpolation_filter;
+	__u8 tile_cols_log2;
+	__u8 tile_rows_log2;
+	__u8 reference_mode;
+	__u8 reserved[7];
+};
+
+#define V4L2_VP9_NUM_FRAME_CTX	4
+
+/**
+ * struct v4l2_vp9_mv_probs - VP9 Motion vector probability updates
+ * @joint: motion vector joint probability updates.
+ * @sign: motion vector sign probability updates.
+ * @classes: motion vector class probability updates.
+ * @class0_bit: motion vector class0 bit probability updates.
+ * @bits: motion vector bits probability updates.
+ * @class0_fr: motion vector class0 fractional bit probability updates.
+ * @fr: motion vector fractional bit probability updates.
+ * @class0_hp: motion vector class0 high precision fractional bit probability updates.
+ * @hp: motion vector high precision fractional bit probability updates.
+ *
+ * This structure contains new values of motion vector probabilities.
+ * A value of zero in an array element means there is no update of the relevant probability.
+ * See `struct v4l2_vp9_prob_updates` for details.
+ */
+struct v4l2_vp9_mv_probs {
+	__u8 joint[3];
+	__u8 sign[2];
+	__u8 classes[2][10];
+	__u8 class0_bit[2];
+	__u8 bits[2][10];
+	__u8 class0_fr[2][2][3];
+	__u8 fr[2][3];
+	__u8 class0_hp[2];
+	__u8 hp[2];
+};
+
+#define V4L2_CID_STATELESS_VP9_COMPRESSED_HDR	(V4L2_CID_CODEC_STATELESS_BASE + 301)
+
+#define V4L2_VP9_TX_MODE_ONLY_4X4			0
+#define V4L2_VP9_TX_MODE_ALLOW_8X8			1
+#define V4L2_VP9_TX_MODE_ALLOW_16X16			2
+#define V4L2_VP9_TX_MODE_ALLOW_32X32			3
+#define V4L2_VP9_TX_MODE_SELECT				4
+
+/**
+ * struct v4l2_ctrl_vp9_compressed_hdr - VP9 probability updates control
+ * @tx_mode: specifies the TX mode. Set to one of V4L2_VP9_TX_MODE_{}.
+ * @tx8: TX 8x8 probability updates.
+ * @tx16: TX 16x16 probability updates.
+ * @tx32: TX 32x32 probability updates.
+ * @coef: coefficient probability updates.
+ * @skip: skip probability updates.
+ * @inter_mode: inter mode probability updates.
+ * @interp_filter: interpolation filter probability updates.
+ * @is_inter: is inter-block probability updates.
+ * @comp_mode: compound prediction mode probability updates.
+ * @single_ref: single ref probability updates.
+ * @comp_ref: compound ref probability updates.
+ * @y_mode: Y prediction mode probability updates.
+ * @uv_mode: UV prediction mode probability updates.
+ * @partition: partition probability updates.
+ * @mv: motion vector probability updates.
+ *
+ * This structure holds the probabilities update as parsed in the compressed
+ * header (Spec 6.3). These values represent the value of probability update after
+ * being translated with inv_map_table[] (see 6.3.5). A value of zero in an array element
+ * means that there is no update of the relevant probability.
+ *
+ * This control is optional and needs to be used when dealing with the hardware which is
+ * not capable of parsing the compressed header itself. Only drivers which need it will
+ * implement it.
+ */
+struct v4l2_ctrl_vp9_compressed_hdr {
+	__u8 tx_mode;
+	__u8 tx8[2][1];
+	__u8 tx16[2][2];
+	__u8 tx32[2][3];
+	__u8 coef[4][2][2][6][6][3];
+	__u8 skip[3];
+	__u8 inter_mode[7][3];
+	__u8 interp_filter[4][2];
+	__u8 is_inter[4];
+	__u8 comp_mode[5];
+	__u8 single_ref[5][2];
+	__u8 comp_ref[5];
+	__u8 y_mode[4][9];
+	__u8 uv_mode[10][9];
+	__u8 partition[16][3];
+
+	struct v4l2_vp9_mv_probs mv;
+};
+
+/* Stateless AV1 controls */
+
+#define V4L2_AV1_TOTAL_REFS_PER_FRAME	8
+#define V4L2_AV1_CDEF_MAX		8
+#define V4L2_AV1_NUM_PLANES_MAX		3 /* 1 if monochrome, 3 otherwise */
+#define V4L2_AV1_MAX_SEGMENTS		8
+#define V4L2_AV1_MAX_OPERATING_POINTS	(1 << 5) /* 5 bits to encode */
+#define V4L2_AV1_REFS_PER_FRAME		7
+#define V4L2_AV1_MAX_NUM_Y_POINTS	(1 << 4) /* 4 bits to encode */
+#define V4L2_AV1_MAX_NUM_CB_POINTS	(1 << 4) /* 4 bits to encode */
+#define V4L2_AV1_MAX_NUM_CR_POINTS	(1 << 4) /* 4 bits to encode */
+#define V4L2_AV1_AR_COEFFS_SIZE		25 /* (2 * 3 * (3 + 1)) + 1 */
+#define V4L2_AV1_MAX_NUM_PLANES		3
+#define V4L2_AV1_MAX_TILE_COLS		64
+#define V4L2_AV1_MAX_TILE_ROWS		64
+#define V4L2_AV1_MAX_TILE_COUNT		512
+
+#define V4L2_AV1_SEQUENCE_FLAG_STILL_PICTURE		  0x00000001
+#define V4L2_AV1_SEQUENCE_FLAG_USE_128X128_SUPERBLOCK	  0x00000002
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_FILTER_INTRA	  0x00000004
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTRA_EDGE_FILTER   0x00000008
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_INTERINTRA_COMPOUND 0x00000010
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_MASKED_COMPOUND	  0x00000020
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_WARPED_MOTION	  0x00000040
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_DUAL_FILTER	  0x00000080
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_ORDER_HINT	  0x00000100
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_JNT_COMP		  0x00000200
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_REF_FRAME_MVS	  0x00000400
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_SUPERRES		  0x00000800
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_CDEF		  0x00001000
+#define V4L2_AV1_SEQUENCE_FLAG_ENABLE_RESTORATION	  0x00002000
+#define V4L2_AV1_SEQUENCE_FLAG_MONO_CHROME		  0x00004000
+#define V4L2_AV1_SEQUENCE_FLAG_COLOR_RANGE		  0x00008000
+#define V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_X		  0x00010000
+#define V4L2_AV1_SEQUENCE_FLAG_SUBSAMPLING_Y		  0x00020000
+#define V4L2_AV1_SEQUENCE_FLAG_FILM_GRAIN_PARAMS_PRESENT  0x00040000
+#define V4L2_AV1_SEQUENCE_FLAG_SEPARATE_UV_DELTA_Q	  0x00080000
+
+#define V4L2_CID_STATELESS_AV1_SEQUENCE (V4L2_CID_CODEC_STATELESS_BASE + 500)
+/**
+ * struct v4l2_ctrl_av1_sequence - AV1 Sequence
+ *
+ * Represents an AV1 Sequence OBU. See section 5.5 "Sequence header OBU syntax"
+ * for more details.
+ *
+ * @flags: See V4L2_AV1_SEQUENCE_FLAG_{}.
+ * @seq_profile: specifies the features that can be used in the coded video
+ * sequence.
+ * @order_hint_bits: specifies the number of bits used for the order_hint field
+ * at each frame.
+ * @bit_depth: the bitdepth to use for the sequence as described in section
+ * 5.5.2 "Color config syntax".
+ * @reserved: padding field. Should be zeroed by applications.
+ * @max_frame_width_minus_1: specifies the maximum frame width minus 1 for the
+ * frames represented by this sequence header.
+ * @max_frame_height_minus_1: specifies the maximum frame height minus 1 for the
+ * frames represented by this sequence header.
+ */
+struct v4l2_ctrl_av1_sequence {
+	__u32 flags;
+	__u8 seq_profile;
+	__u8 order_hint_bits;
+	__u8 bit_depth;
+	__u8 reserved;
+	__u16 max_frame_width_minus_1;
+	__u16 max_frame_height_minus_1;
+};
+
+#define V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY (V4L2_CID_CODEC_STATELESS_BASE + 501)
+/**
+ * struct v4l2_ctrl_av1_tile_group_entry - AV1 Tile Group entry
+ *
+ * Represents a single AV1 tile inside an AV1 Tile Group. Note that MiRowStart,
+ * MiRowEnd, MiColStart and MiColEnd can be retrieved from struct
+ * v4l2_av1_tile_info in struct v4l2_ctrl_av1_frame using tile_row and
+ * tile_col. See section 6.10.1 "General tile group OBU semantics" for more
+ * details.
+ *
+ * @tile_offset: offset from the OBU data, i.e. where the coded tile data
+ * actually starts.
+ * @tile_size: specifies the size in bytes of the coded tile. Equivalent to
+ * "TileSize" in the AV1 Specification.
+ * @tile_row: specifies the row of the current tile. Equivalent to "TileRow" in
+ * the AV1 Specification.
+ * @tile_col: specifies the col of the current tile. Equivalent to "TileCol" in
+ * the AV1 Specification.
+ */
+struct v4l2_ctrl_av1_tile_group_entry {
+	__u32 tile_offset;
+	__u32 tile_size;
+	__u32 tile_row;
+	__u32 tile_col;
+};
+
+/**
+ * enum v4l2_av1_warp_model - AV1 Warp Model as described in section 3
+ * "Symbols and abbreviated terms" of the AV1 Specification.
+ *
+ * @V4L2_AV1_WARP_MODEL_IDENTITY: Warp model is just an identity transform.
+ * @V4L2_AV1_WARP_MODEL_TRANSLATION: Warp model is a pure translation.
+ * @V4L2_AV1_WARP_MODEL_ROTZOOM: Warp model is a rotation + symmetric zoom +
+ * translation.
+ * @V4L2_AV1_WARP_MODEL_AFFINE: Warp model is a general affine transform.
+ */
+enum v4l2_av1_warp_model {
+	V4L2_AV1_WARP_MODEL_IDENTITY = 0,
+	V4L2_AV1_WARP_MODEL_TRANSLATION = 1,
+	V4L2_AV1_WARP_MODEL_ROTZOOM = 2,
+	V4L2_AV1_WARP_MODEL_AFFINE = 3,
+};
+
+/**
+ * enum v4l2_av1_reference_frame - AV1 reference frames
+ *
+ * @V4L2_AV1_REF_INTRA_FRAME: Intra Frame Reference
+ * @V4L2_AV1_REF_LAST_FRAME: Last Reference Frame
+ * @V4L2_AV1_REF_LAST2_FRAME: Last2 Reference Frame
+ * @V4L2_AV1_REF_LAST3_FRAME: Last3 Reference Frame
+ * @V4L2_AV1_REF_GOLDEN_FRAME: Golden Reference Frame
+ * @V4L2_AV1_REF_BWDREF_FRAME: BWD Reference Frame
+ * @V4L2_AV1_REF_ALTREF2_FRAME: Alternative2 Reference Frame
+ * @V4L2_AV1_REF_ALTREF_FRAME: Alternative Reference Frame
+ */
+enum v4l2_av1_reference_frame {
+	V4L2_AV1_REF_INTRA_FRAME = 0,
+	V4L2_AV1_REF_LAST_FRAME = 1,
+	V4L2_AV1_REF_LAST2_FRAME = 2,
+	V4L2_AV1_REF_LAST3_FRAME = 3,
+	V4L2_AV1_REF_GOLDEN_FRAME = 4,
+	V4L2_AV1_REF_BWDREF_FRAME = 5,
+	V4L2_AV1_REF_ALTREF2_FRAME = 6,
+	V4L2_AV1_REF_ALTREF_FRAME = 7,
+};
+
+#define V4L2_AV1_GLOBAL_MOTION_IS_INVALID(ref) (1 << (ref))
+
+#define V4L2_AV1_GLOBAL_MOTION_FLAG_IS_GLOBAL	   0x1
+#define V4L2_AV1_GLOBAL_MOTION_FLAG_IS_ROT_ZOOM	   0x2
+#define V4L2_AV1_GLOBAL_MOTION_FLAG_IS_TRANSLATION 0x4
+/**
+ * struct v4l2_av1_global_motion - AV1 Global Motion parameters as described in
+ * section 6.8.17 "Global motion params semantics" of the AV1 specification.
+ *
+ * @flags: A bitfield containing the flags per reference frame. See
+ * V4L2_AV1_GLOBAL_MOTION_FLAG_{}
+ * @type: The type of global motion transform used.
+ * @params: this field has the same meaning as "gm_params" in the AV1
+ * specification.
+ * @invalid: bitfield indicating whether the global motion params are invalid
+ * for a given reference frame. See section 7.11.3.6 Setup shear process and
+ * the variable "warpValid". Use V4L2_AV1_GLOBAL_MOTION_IS_INVALID(ref) to
+ * create a suitable mask.
+ * @reserved: padding field. Should be zeroed by applications.
+ */
+
+struct v4l2_av1_global_motion {
+	__u8 flags[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	enum v4l2_av1_warp_model type[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	__s32 params[V4L2_AV1_TOTAL_REFS_PER_FRAME][6];
+	__u8 invalid;
+	__u8 reserved[3];
+};
+
+/**
+ * enum v4l2_av1_frame_restoration_type - AV1 Frame Restoration Type
+ * @V4L2_AV1_FRAME_RESTORE_NONE: no filtering is applied.
+ * @V4L2_AV1_FRAME_RESTORE_WIENER: Wiener filter process is invoked.
+ * @V4L2_AV1_FRAME_RESTORE_SGRPROJ: self guided filter process is invoked.
+ * @V4L2_AV1_FRAME_RESTORE_SWITCHABLE: restoration filter is swichtable.
+ */
+enum v4l2_av1_frame_restoration_type {
+	V4L2_AV1_FRAME_RESTORE_NONE = 0,
+	V4L2_AV1_FRAME_RESTORE_WIENER = 1,
+	V4L2_AV1_FRAME_RESTORE_SGRPROJ = 2,
+	V4L2_AV1_FRAME_RESTORE_SWITCHABLE = 3,
+};
+
+#define V4L2_AV1_LOOP_RESTORATION_FLAG_USES_LR		0x1
+#define V4L2_AV1_LOOP_RESTORATION_FLAG_USES_CHROMA_LR	0x2
+
+/**
+ * struct v4l2_av1_loop_restoration - AV1 Loop Restauration as described in
+ * section 6.10.15 "Loop restoration params semantics" of the AV1 specification.
+ *
+ * @flags: See V4L2_AV1_LOOP_RESTORATION_FLAG_{}.
+ * @lr_unit_shift: specifies if the luma restoration size should be halved.
+ * @lr_uv_shift: specifies if the chroma size should be half the luma size.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @frame_restoration_type: specifies the type of restoration used for each
+ * plane. See enum v4l2_av1_frame_restoration_type.
+ * @loop_restoration_size: specifies the size of loop restoration units in units
+ * of samples in the current plane.
+ */
+struct v4l2_av1_loop_restoration {
+	__u8 flags;
+	__u8 lr_unit_shift;
+	__u8 lr_uv_shift;
+	__u8 reserved;
+	enum v4l2_av1_frame_restoration_type frame_restoration_type[V4L2_AV1_NUM_PLANES_MAX];
+	__u32 loop_restoration_size[V4L2_AV1_MAX_NUM_PLANES];
+};
+
+/**
+ * struct v4l2_av1_cdef - AV1 CDEF params semantics as described in section
+ * 6.10.14 "CDEF params semantics" of the AV1 specification
+ *
+ * @damping_minus_3: controls the amount of damping in the deringing filter.
+ * @bits: specifies the number of bits needed to specify which CDEF filter to
+ * apply.
+ * @y_pri_strength: specifies the strength of the primary filter.
+ * @y_sec_strength: specifies the strength of the secondary filter.
+ * @uv_pri_strength: specifies the strength of the primary filter.
+ * @uv_sec_strength: specifies the strength of the secondary filter.
+ */
+struct v4l2_av1_cdef {
+	__u8 damping_minus_3;
+	__u8 bits;
+	__u8 y_pri_strength[V4L2_AV1_CDEF_MAX];
+	__u8 y_sec_strength[V4L2_AV1_CDEF_MAX];
+	__u8 uv_pri_strength[V4L2_AV1_CDEF_MAX];
+	__u8 uv_sec_strength[V4L2_AV1_CDEF_MAX];
+};
+
+#define V4L2_AV1_SEGMENTATION_FLAG_ENABLED	   0x1
+#define V4L2_AV1_SEGMENTATION_FLAG_UPDATE_MAP	   0x2
+#define V4L2_AV1_SEGMENTATION_FLAG_TEMPORAL_UPDATE 0x4
+#define V4L2_AV1_SEGMENTATION_FLAG_UPDATE_DATA	   0x8
+#define V4L2_AV1_SEGMENTATION_FLAG_SEG_ID_PRE_SKIP 0x10
+
+/**
+ * enum v4l2_av1_segment_feature - AV1 segment features as described in section
+ * 3 "Symbols and abbreviated terms" of the AV1 specification.
+ *
+ * @V4L2_AV1_SEG_LVL_ALT_Q: Index for quantizer segment feature.
+ * @V4L2_AV1_SEG_LVL_ALT_LF_Y_V: Index for vertical luma loop filter segment
+ * feature.
+ * @V4L2_AV1_SEG_LVL_REF_FRAME: Index for reference frame segment feature.
+ * @V4L2_AV1_SEG_LVL_REF_SKIP: Index for skip segment feature.
+ * @V4L2_AV1_SEG_LVL_REF_GLOBALMV: Index for global mv feature.
+ * @V4L2_AV1_SEG_LVL_MAX: Number of segment features.
+ */
+enum v4l2_av1_segment_feature {
+	V4L2_AV1_SEG_LVL_ALT_Q = 0,
+	V4L2_AV1_SEG_LVL_ALT_LF_Y_V = 1,
+	V4L2_AV1_SEG_LVL_REF_FRAME = 5,
+	V4L2_AV1_SEG_LVL_REF_SKIP = 6,
+	V4L2_AV1_SEG_LVL_REF_GLOBALMV = 7,
+	V4L2_AV1_SEG_LVL_MAX = 8
+};
+
+#define V4L2_AV1_SEGMENT_FEATURE_ENABLED(id)	(1 << (id))
+
+/**
+ * struct v4l2_av1_segmentation - AV1 Segmentation params as defined in section
+ * 6.8.13 "Segmentation params semantics" of the AV1 specification.
+ *
+ * @flags: see V4L2_AV1_SEGMENTATION_FLAG_{}.
+ * @last_active_seg_id: indicates the highest numbered segment id that has some
+ * enabled feature. This is used when decoding the segment id to only decode
+ * choices corresponding to used segments.
+ * @feature_enabled: bitmask defining which features are enabled in each
+ * segment. Use V4L2_AV1_SEGMENT_FEATURE_ENABLED to build a suitable mask.
+ * @feature_data: data attached to each feature. Data entry is only valid if the
+ * feature is enabled
+ */
+struct v4l2_av1_segmentation {
+	__u8 flags;
+	__u8 last_active_seg_id;
+	__u8 feature_enabled[V4L2_AV1_MAX_SEGMENTS];
+	__s16 feature_data[V4L2_AV1_MAX_SEGMENTS][V4L2_AV1_SEG_LVL_MAX];
+};
+
+#define V4L2_AV1_LOOP_FILTER_FLAG_DELTA_ENABLED    0x1
+#define V4L2_AV1_LOOP_FILTER_FLAG_DELTA_UPDATE     0x2
+#define V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_PRESENT 0x4
+#define V4L2_AV1_LOOP_FILTER_FLAG_DELTA_LF_MULTI   0x8
+
+/**
+ * struct v4l2_av1_loop_filter - AV1 Loop filter params as defined in section
+ * 6.8.10 "Loop filter semantics" and 6.8.16 "Loop filter delta parameters
+ * semantics" of the AV1 specification.
+ *
+ * @flags: see V4L2_AV1_LOOP_FILTER_FLAG_{}
+ * @level: an array containing loop filter strength values. Different loop
+ * filter strength values from the array are used depending on the image plane
+ * being filtered, and the edge direction (vertical or horizontal) being
+ * filtered.
+ * @sharpness: indicates the sharpness level. The loop_filter_level and
+ * loop_filter_sharpness together determine when a block edge is filtered, and
+ * by how much the filtering can change the sample values. The loop filter
+ * process is described in section 7.14 of the AV1 specification.
+ * @ref_deltas: contains the adjustment needed for the filter level based on the
+ * chosen reference frame. If this syntax element is not present, it maintains
+ * its previous value.
+ * @mode_deltas: contains the adjustment needed for the filter level based on
+ * the chosen mode. If this syntax element is not present, it maintains its
+ * previous value.
+ * @delta_lf_res: specifies the left shift which should be applied to decoded
+ * loop filter delta values.
+ */
+struct v4l2_av1_loop_filter {
+	__u8 flags;
+	__u8 level[4];
+	__u8 sharpness;
+	__s8 ref_deltas[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	__s8 mode_deltas[2];
+	__u8 delta_lf_res;
+};
+
+#define V4L2_AV1_QUANTIZATION_FLAG_DIFF_UV_DELTA   0x1
+#define V4L2_AV1_QUANTIZATION_FLAG_USING_QMATRIX   0x2
+#define V4L2_AV1_QUANTIZATION_FLAG_DELTA_Q_PRESENT 0x4
+
+/**
+ * struct v4l2_av1_quantization - AV1 Quantization params as defined in section
+ * 6.8.11 "Quantization params semantics" of the AV1 specification.
+ *
+ * @flags: see V4L2_AV1_QUANTIZATION_FLAG_{}
+ * @base_q_idx: indicates the base frame qindex. This is used for Y AC
+ * coefficients and as the base value for the other quantizers.
+ * @delta_q_y_dc: indicates the Y DC quantizer relative to base_q_idx.
+ * @delta_q_u_dc: indicates the U DC quantizer relative to base_q_idx.
+ * @delta_q_u_ac: indicates the U AC quantizer relative to base_q_idx.
+ * @delta_q_v_dc: indicates the V DC quantizer relative to base_q_idx.
+ * @delta_q_v_ac: indicates the V AC quantizer relative to base_q_idx.
+ * @qm_y: specifies the level in the quantizer matrix that should be used for
+ * luma plane decoding.
+ * @qm_u: specifies the level in the quantizer matrix that should be used for
+ * chroma U plane decoding.
+ * @qm_v: specifies the level in the quantizer matrix that should be used for
+ * chroma V plane decoding.
+ * @delta_q_res: specifies the left shift which should be applied to decoded
+ * quantizer index delta values.
+ */
+struct v4l2_av1_quantization {
+	__u8 flags;
+	__u8 base_q_idx;
+	__s8 delta_q_y_dc;
+	__s8 delta_q_u_dc;
+	__s8 delta_q_u_ac;
+	__s8 delta_q_v_dc;
+	__s8 delta_q_v_ac;
+	__u8 qm_y;
+	__u8 qm_u;
+	__u8 qm_v;
+	__u8 delta_q_res;
+};
+
+#define V4L2_AV1_TILE_INFO_FLAG_UNIFORM_TILE_SPACING	0x1
+
+/**
+ * struct v4l2_av1_tile_info - AV1 Tile info as defined in section 6.8.14 "Tile
+ * info semantics" of the AV1 specification.
+ *
+ * @flags: see V4L2_AV1_TILE_INFO_FLAG_{}
+ * @context_update_tile_id: specifies which tile to use for the CDF update.
+ * @tile_rows: specifies the number of tiles down the frame.
+ * @tile_cols: specifies the number of tiles across the frame.
+ * @mi_col_starts: an array specifying the start column (in units of 4x4 luma
+ * samples) for each tile across the image.
+ * @mi_row_starts: an array specifying the start row (in units of 4x4 luma
+ * samples) for each tile down the image.
+ * @width_in_sbs_minus_1: specifies the width of a tile minus 1 in units of
+ * superblocks.
+ * @height_in_sbs_minus_1:  specifies the height of a tile minus 1 in units of
+ * superblocks.
+ * @tile_size_bytes: specifies the number of bytes needed to code each tile
+ * size.
+ * @reserved: padding field. Should be zeroed by applications.
+ */
+struct v4l2_av1_tile_info {
+	__u8 flags;
+	__u8 context_update_tile_id;
+	__u8 tile_cols;
+	__u8 tile_rows;
+	__u32 mi_col_starts[V4L2_AV1_MAX_TILE_COLS + 1];
+	__u32 mi_row_starts[V4L2_AV1_MAX_TILE_ROWS + 1];
+	__u32 width_in_sbs_minus_1[V4L2_AV1_MAX_TILE_COLS];
+	__u32 height_in_sbs_minus_1[V4L2_AV1_MAX_TILE_ROWS];
+	__u8 tile_size_bytes;
+	__u8 reserved[3];
+};
+
+/**
+ * enum v4l2_av1_frame_type - AV1 Frame Type
+ *
+ * @V4L2_AV1_KEY_FRAME: Key frame
+ * @V4L2_AV1_INTER_FRAME: Inter frame
+ * @V4L2_AV1_INTRA_ONLY_FRAME: Intra-only frame
+ * @V4L2_AV1_SWITCH_FRAME: Switch frame
+ */
+enum v4l2_av1_frame_type {
+	V4L2_AV1_KEY_FRAME = 0,
+	V4L2_AV1_INTER_FRAME = 1,
+	V4L2_AV1_INTRA_ONLY_FRAME = 2,
+	V4L2_AV1_SWITCH_FRAME = 3
+};
+
+/**
+ * enum v4l2_av1_interpolation_filter - AV1 interpolation filter types
+ *
+ * @V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP: eight tap filter
+ * @V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH: eight tap smooth filter
+ * @V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP: eight tap sharp filter
+ * @V4L2_AV1_INTERPOLATION_FILTER_BILINEAR: bilinear filter
+ * @V4L2_AV1_INTERPOLATION_FILTER_SWITCHABLE: filter selection is signaled at
+ * the block level
+ *
+ * See section 6.8.9 "Interpolation filter semantics" of the AV1 specification
+ * for more details.
+ */
+enum v4l2_av1_interpolation_filter {
+	V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP = 0,
+	V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SMOOTH = 1,
+	V4L2_AV1_INTERPOLATION_FILTER_EIGHTTAP_SHARP = 2,
+	V4L2_AV1_INTERPOLATION_FILTER_BILINEAR = 3,
+	V4L2_AV1_INTERPOLATION_FILTER_SWITCHABLE = 4,
+};
+
+/**
+ * enum v4l2_av1_tx_mode - AV1 Tx mode as described in section 6.8.21 "TX mode
+ * semantics" of the AV1 specification.
+ * @V4L2_AV1_TX_MODE_ONLY_4X4: the inverse transform will use only 4x4
+ * transforms
+ * @V4L2_AV1_TX_MODE_LARGEST: the inverse transform will use the largest
+ * transform size that fits inside the block
+ * @V4L2_AV1_TX_MODE_SELECT: the choice of transform size is specified
+ * explicitly for each block.
+ */
+enum v4l2_av1_tx_mode {
+	V4L2_AV1_TX_MODE_ONLY_4X4 = 0,
+	V4L2_AV1_TX_MODE_LARGEST = 1,
+	V4L2_AV1_TX_MODE_SELECT = 2
+};
+
+#define V4L2_AV1_FRAME_FLAG_SHOW_FRAME			 0x00000001
+#define V4L2_AV1_FRAME_FLAG_SHOWABLE_FRAME		 0x00000002
+#define V4L2_AV1_FRAME_FLAG_ERROR_RESILIENT_MODE	 0x00000004
+#define V4L2_AV1_FRAME_FLAG_DISABLE_CDF_UPDATE		 0x00000008
+#define V4L2_AV1_FRAME_FLAG_ALLOW_SCREEN_CONTENT_TOOLS	 0x00000010
+#define V4L2_AV1_FRAME_FLAG_FORCE_INTEGER_MV		 0x00000020
+#define V4L2_AV1_FRAME_FLAG_ALLOW_INTRABC		 0x00000040
+#define V4L2_AV1_FRAME_FLAG_USE_SUPERRES		 0x00000080
+#define V4L2_AV1_FRAME_FLAG_ALLOW_HIGH_PRECISION_MV	 0x00000100
+#define V4L2_AV1_FRAME_FLAG_IS_MOTION_MODE_SWITCHABLE	 0x00000200
+#define V4L2_AV1_FRAME_FLAG_USE_REF_FRAME_MVS		 0x00000400
+#define V4L2_AV1_FRAME_FLAG_DISABLE_FRAME_END_UPDATE_CDF 0x00000800
+#define V4L2_AV1_FRAME_FLAG_ALLOW_WARPED_MOTION		 0x00001000
+#define V4L2_AV1_FRAME_FLAG_REFERENCE_SELECT		 0x00002000
+#define V4L2_AV1_FRAME_FLAG_REDUCED_TX_SET		 0x00004000
+#define V4L2_AV1_FRAME_FLAG_SKIP_MODE_ALLOWED		 0x00008000
+#define V4L2_AV1_FRAME_FLAG_SKIP_MODE_PRESENT		 0x00010000
+#define V4L2_AV1_FRAME_FLAG_FRAME_SIZE_OVERRIDE		 0x00020000
+#define V4L2_AV1_FRAME_FLAG_BUFFER_REMOVAL_TIME_PRESENT	 0x00040000
+#define V4L2_AV1_FRAME_FLAG_FRAME_REFS_SHORT_SIGNALING	 0x00080000
+
+#define V4L2_CID_STATELESS_AV1_FRAME (V4L2_CID_CODEC_STATELESS_BASE + 502)
+/**
+ * struct v4l2_ctrl_av1_frame - Represents an AV1 Frame Header OBU.
+ *
+ * @tile_info: tile info
+ * @quantization: quantization params
+ * @segmentation: segmentation params
+ * @superres_denom: the denominator for the upscaling ratio.
+ * @loop_filter: loop filter params
+ * @cdef: cdef params
+ * @skip_mode_frame: specifies the frames to use for compound prediction when
+ * skip_mode is equal to 1.
+ * @primary_ref_frame: specifies which reference frame contains the CDF values
+ * and other state that should be loaded at the start of the frame.
+ * @loop_restoration: loop restoration params
+ * @global_motion: global motion params
+ * @flags: see V4L2_AV1_FRAME_FLAG_{}
+ * @frame_type: specifies the AV1 frame type
+ * @order_hint: specifies OrderHintBits least significant bits of the expected
+ * output order for this frame.
+ * @upscaled_width: the upscaled width.
+ * @interpolation_filter: specifies the filter selection used for performing
+ * inter prediction.
+ * @tx_mode: specifies how the transform size is determined.
+ * @frame_width_minus_1: add 1 to get the frame's width.
+ * @frame_height_minus_1: add 1 to get the frame's height
+ * @render_width_minus_1: add 1 to get the render width of the frame in luma
+ * samples.
+ * @render_height_minus_1: add 1 to get the render height of the frame in luma
+ * samples.
+ * @current_frame_id: specifies the frame id number for the current frame. Frame
+ * id numbers are additional information that do not affect the decoding
+ * process, but provide decoders with a way of detecting missing reference
+ * frames so that appropriate action can be taken.
+ * @buffer_removal_time: specifies the frame removal time in units of DecCT clock
+ * ticks counted from the removal time of the last random access point for
+ * operating point opNum.
+ * @reserved: padding field. Should be zeroed by applications.
+ * @order_hints: specifies the expected output order hint for each reference
+ * frame. This field corresponds to the OrderHints variable from the
+ * specification (section 5.9.2 "Uncompressed header syntax"). As such, this is
+ * only used for non-intra frames and ignored otherwise. order_hints[0] is
+ * always ignored.
+ * @reference_frame_ts: the V4L2 timestamp of the reference frame slots.
+ * @ref_frame_idx: used to index into @reference_frame_ts when decoding
+ * inter-frames. The meaning of this array is the same as in the specification.
+ * The timestamp refers to the timestamp field in struct v4l2_buffer. Use
+ * v4l2_timeval_to_ns() to convert the struct timeval to a __u64.
+ * @refresh_frame_flags: contains a bitmask that specifies which reference frame
+ * slots will be updated with the current frame after it is decoded.
+ */
+struct v4l2_ctrl_av1_frame {
+	struct v4l2_av1_tile_info tile_info;
+	struct v4l2_av1_quantization quantization;
+	__u8 superres_denom;
+	struct v4l2_av1_segmentation segmentation;
+	struct v4l2_av1_loop_filter loop_filter;
+	struct v4l2_av1_cdef cdef;
+	__u8 skip_mode_frame[2];
+	__u8 primary_ref_frame;
+	struct v4l2_av1_loop_restoration loop_restoration;
+	struct v4l2_av1_global_motion global_motion;
+	__u32 flags;
+	enum v4l2_av1_frame_type frame_type;
+	__u32 order_hint;
+	__u32 upscaled_width;
+	enum v4l2_av1_interpolation_filter interpolation_filter;
+	enum v4l2_av1_tx_mode tx_mode;
+	__u32 frame_width_minus_1;
+	__u32 frame_height_minus_1;
+	__u16 render_width_minus_1;
+	__u16 render_height_minus_1;
+
+	__u32 current_frame_id;
+	__u32 buffer_removal_time[V4L2_AV1_MAX_OPERATING_POINTS];
+	__u8 reserved[4];
+	__u32 order_hints[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	__u64 reference_frame_ts[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	__s8 ref_frame_idx[V4L2_AV1_REFS_PER_FRAME];
+	__u8 refresh_frame_flags;
+};
+
+#define V4L2_AV1_FILM_GRAIN_FLAG_APPLY_GRAIN 0x1
+#define V4L2_AV1_FILM_GRAIN_FLAG_UPDATE_GRAIN 0x2
+#define V4L2_AV1_FILM_GRAIN_FLAG_CHROMA_SCALING_FROM_LUMA 0x4
+#define V4L2_AV1_FILM_GRAIN_FLAG_OVERLAP 0x8
+#define V4L2_AV1_FILM_GRAIN_FLAG_CLIP_TO_RESTRICTED_RANGE 0x10
+
+#define V4L2_CID_STATELESS_AV1_FILM_GRAIN (V4L2_CID_CODEC_STATELESS_BASE + 505)
+/**
+ * struct v4l2_ctrl_av1_film_grain - AV1 Film Grain parameters.
+ *
+ * Film grain parameters as specified by section 6.8.20 of the AV1 Specification.
+ *
+ * @flags: see V4L2_AV1_FILM_GRAIN_{}.
+ * @cr_mult: represents a multiplier for the cr component used in derivation of
+ * the input index to the cr component scaling function.
+ * @grain_seed: specifies the starting value for the pseudo-random numbers used
+ * during film grain synthesis.
+ * @film_grain_params_ref_idx: indicates which reference frame contains the
+ * film grain parameters to be used for this frame.
+ * @num_y_points: specifies the number of points for the piece-wise linear
+ * scaling function of the luma component.
+ * @point_y_value: represents the x (luma value) coordinate for the i-th point
+ * of the piecewise linear scaling function for luma component. The values are
+ * signaled on the scale of 0..255. In case of 10 bit video, these values
+ * correspond to luma values divided by 4. In case of 12 bit video, these values
+ * correspond to luma values divided by 16.
+ * @point_y_scaling:  represents the scaling (output) value for the i-th point
+ * of the piecewise linear scaling function for luma component.
+ * @num_cb_points: specifies the number of points for the piece-wise linear
+ * scaling function of the cb component.
+ * @point_cb_value: represents the x coordinate for the i-th point of the
+ * piece-wise linear scaling function for cb component. The values are signaled
+ * on the scale of 0..255.
+ * @point_cb_scaling: represents the scaling (output) value for the i-th point
+ * of the piecewise linear scaling function for cb component.
+ * @num_cr_points: specifies represents the number of points for the piece-wise
+ * linear scaling function of the cr component.
+ * @point_cr_value:  represents the x coordinate for the i-th point of the
+ * piece-wise linear scaling function for cr component. The values are signaled
+ * on the scale of 0..255.
+ * @point_cr_scaling:  represents the scaling (output) value for the i-th point
+ * of the piecewise linear scaling function for cr component.
+ * @grain_scaling_minus_8: represents the shift – 8 applied to the values of the
+ * chroma component. The grain_scaling_minus_8 can take values of 0..3 and
+ * determines the range and quantization step of the standard deviation of film
+ * grain.
+ * @ar_coeff_lag: specifies the number of auto-regressive coefficients for luma
+ * and chroma.
+ * @ar_coeffs_y_plus_128: specifies auto-regressive coefficients used for the Y
+ * plane.
+ * @ar_coeffs_cb_plus_128: specifies auto-regressive coefficients used for the U
+ * plane.
+ * @ar_coeffs_cr_plus_128: specifies auto-regressive coefficients used for the V
+ * plane.
+ * @ar_coeff_shift_minus_6: specifies the range of the auto-regressive
+ * coefficients. Values of 0, 1, 2, and 3 correspond to the ranges for
+ * auto-regressive coefficients of [-2, 2), [-1, 1), [-0.5, 0.5) and [-0.25,
+ * 0.25) respectively.
+ * @grain_scale_shift: specifies how much the Gaussian random numbers should be
+ * scaled down during the grain synthesis process.
+ * @cb_mult: represents a multiplier for the cb component used in derivation of
+ * the input index to the cb component scaling function.
+ * @cb_luma_mult: represents a multiplier for the average luma component used in
+ * derivation of the input index to the cb component scaling function.
+ * @cr_luma_mult: represents a multiplier for the average luma component used in
+ * derivation of the input index to the cr component scaling function.
+ * @cb_offset: represents an offset used in derivation of the input index to the
+ * cb component scaling function.
+ * @cr_offset: represents an offset used in derivation of the input index to the
+ * cr component scaling function.
+ * @reserved: padding field. Should be zeroed by applications.
+ */
+struct v4l2_ctrl_av1_film_grain {
+	__u8 flags;
+	__u8 cr_mult;
+	__u16 grain_seed;
+	__u8 film_grain_params_ref_idx;
+	__u8 num_y_points;
+	__u8 point_y_value[V4L2_AV1_MAX_NUM_Y_POINTS];
+	__u8 point_y_scaling[V4L2_AV1_MAX_NUM_Y_POINTS];
+	__u8 num_cb_points;
+	__u8 point_cb_value[V4L2_AV1_MAX_NUM_CB_POINTS];
+	__u8 point_cb_scaling[V4L2_AV1_MAX_NUM_CB_POINTS];
+	__u8 num_cr_points;
+	__u8 point_cr_value[V4L2_AV1_MAX_NUM_CR_POINTS];
+	__u8 point_cr_scaling[V4L2_AV1_MAX_NUM_CR_POINTS];
+	__u8 grain_scaling_minus_8;
+	__u8 ar_coeff_lag;
+	__u8 ar_coeffs_y_plus_128[V4L2_AV1_AR_COEFFS_SIZE];
+	__u8 ar_coeffs_cb_plus_128[V4L2_AV1_AR_COEFFS_SIZE];
+	__u8 ar_coeffs_cr_plus_128[V4L2_AV1_AR_COEFFS_SIZE];
+	__u8 ar_coeff_shift_minus_6;
+	__u8 grain_scale_shift;
+	__u8 cb_mult;
+	__u8 cb_luma_mult;
+	__u8 cr_luma_mult;
+	__u16 cb_offset;
+	__u16 cr_offset;
+	__u8 reserved[4];
+};
+
 /* MPEG-compression definitions kept for backwards compatibility */
 #define V4L2_CTRL_CLASS_MPEG            V4L2_CTRL_CLASS_CODEC
 #define V4L2_CID_MPEG_CLASS             V4L2_CID_CODEC_CLASS
diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
index 8b61d7751cc6..00e56d855a4e 100644
--- a/include/linux/videodev2.h
+++ b/include/linux/videodev2.h
@@ -243,6 +243,7 @@ enum v4l2_colorspace {
 
 	/* DCI-P3 colorspace, used by cinema projectors */
 	V4L2_COLORSPACE_DCI_P3        = 12,
+
 };
 
 /*
@@ -474,7 +475,6 @@ struct v4l2_capability {
 #define V4L2_CAP_META_CAPTURE		0x00800000  /* Is a metadata capture device */
 
 #define V4L2_CAP_READWRITE              0x01000000  /* read/write systemcalls */
-#define V4L2_CAP_ASYNCIO                0x02000000  /* async I/O */
 #define V4L2_CAP_STREAMING              0x04000000  /* streaming I/O ioctls */
 #define V4L2_CAP_META_OUTPUT		0x08000000  /* Is a metadata output device */
 
@@ -549,6 +549,13 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_RGBX32  v4l2_fourcc('X', 'B', '2', '4') /* 32  RGBX-8-8-8-8  */
 #define V4L2_PIX_FMT_ARGB32  v4l2_fourcc('B', 'A', '2', '4') /* 32  ARGB-8-8-8-8  */
 #define V4L2_PIX_FMT_XRGB32  v4l2_fourcc('B', 'X', '2', '4') /* 32  XRGB-8-8-8-8  */
+#define V4L2_PIX_FMT_RGBX1010102 v4l2_fourcc('R', 'X', '3', '0') /* 32  RGBX-10-10-10-2 */
+#define V4L2_PIX_FMT_RGBA1010102 v4l2_fourcc('R', 'A', '3', '0') /* 32  RGBA-10-10-10-2 */
+#define V4L2_PIX_FMT_ARGB2101010 v4l2_fourcc('A', 'R', '3', '0') /* 32  ARGB-2-10-10-10 */
+
+/* RGB formats (6 or 8 bytes per pixel) */
+#define V4L2_PIX_FMT_BGR48_12    v4l2_fourcc('B', '3', '1', '2') /* 48  BGR 12-bit per component */
+#define V4L2_PIX_FMT_ABGR64_12   v4l2_fourcc('B', '4', '1', '2') /* 64  BGRA 12-bit per component */
 
 /* Grey formats */
 #define V4L2_PIX_FMT_GREY    v4l2_fourcc('G', 'R', 'E', 'Y') /*  8  Greyscale     */
@@ -556,6 +563,7 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Y6      v4l2_fourcc('Y', '0', '6', ' ') /*  6  Greyscale     */
 #define V4L2_PIX_FMT_Y10     v4l2_fourcc('Y', '1', '0', ' ') /* 10  Greyscale     */
 #define V4L2_PIX_FMT_Y12     v4l2_fourcc('Y', '1', '2', ' ') /* 12  Greyscale     */
+#define V4L2_PIX_FMT_Y012    v4l2_fourcc('Y', '0', '1', '2') /* 12  Greyscale     */
 #define V4L2_PIX_FMT_Y14     v4l2_fourcc('Y', '1', '4', ' ') /* 14  Greyscale     */
 #define V4L2_PIX_FMT_Y16     v4l2_fourcc('Y', '1', '6', ' ') /* 16  Greyscale     */
 #define V4L2_PIX_FMT_Y16_BE  v4l2_fourcc_be('Y', '1', '6', ' ') /* 16  Greyscale BE  */
@@ -563,6 +571,7 @@ struct v4l2_pix_format {
 /* Grey bit-packed formats */
 #define V4L2_PIX_FMT_Y10BPACK    v4l2_fourcc('Y', '1', '0', 'B') /* 10  Greyscale bit-packed */
 #define V4L2_PIX_FMT_Y10P    v4l2_fourcc('Y', '1', '0', 'P') /* 10  Greyscale, MIPI RAW10 packed */
+#define V4L2_PIX_FMT_IPU3_Y10		v4l2_fourcc('i', 'p', '3', 'y') /* IPU3 packed 10-bit greyscale */
 
 /* Palette formats */
 #define V4L2_PIX_FMT_PAL8    v4l2_fourcc('P', 'A', 'L', '8') /*  8  8-bit palette */
@@ -586,7 +595,18 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_XYUV32  v4l2_fourcc('X', 'Y', 'U', 'V') /* 32  XYUV-8-8-8-8  */
 #define V4L2_PIX_FMT_VUYA32  v4l2_fourcc('V', 'U', 'Y', 'A') /* 32  VUYA-8-8-8-8  */
 #define V4L2_PIX_FMT_VUYX32  v4l2_fourcc('V', 'U', 'Y', 'X') /* 32  VUYX-8-8-8-8  */
+#define V4L2_PIX_FMT_YUVA32  v4l2_fourcc('Y', 'U', 'V', 'A') /* 32  YUVA-8-8-8-8  */
+#define V4L2_PIX_FMT_YUVX32  v4l2_fourcc('Y', 'U', 'V', 'X') /* 32  YUVX-8-8-8-8  */
 #define V4L2_PIX_FMT_M420    v4l2_fourcc('M', '4', '2', '0') /* 12  YUV 4:2:0 2 lines y, 1 line uv interleaved */
+#define V4L2_PIX_FMT_YUV48_12    v4l2_fourcc('Y', '3', '1', '2') /* 48  YUV 4:4:4 12-bit per component */
+
+/*
+ * YCbCr packed format. For each Y2xx format, xx bits of valid data occupy the MSBs
+ * of the 16 bit components, and 16-xx bits of zero padding occupy the LSBs.
+ */
+#define V4L2_PIX_FMT_Y210    v4l2_fourcc('Y', '2', '1', '0') /* 32  YUYV 4:2:2 */
+#define V4L2_PIX_FMT_Y212    v4l2_fourcc('Y', '2', '1', '2') /* 32  YUYV 4:2:2 */
+#define V4L2_PIX_FMT_Y216    v4l2_fourcc('Y', '2', '1', '6') /* 32  YUYV 4:2:2 */
 
 /* two planes -- one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12    v4l2_fourcc('N', 'V', '1', '2') /* 12  Y/CbCr 4:2:0  */
@@ -595,12 +615,15 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV61    v4l2_fourcc('N', 'V', '6', '1') /* 16  Y/CrCb 4:2:2  */
 #define V4L2_PIX_FMT_NV24    v4l2_fourcc('N', 'V', '2', '4') /* 24  Y/CbCr 4:4:4  */
 #define V4L2_PIX_FMT_NV42    v4l2_fourcc('N', 'V', '4', '2') /* 24  Y/CrCb 4:4:4  */
+#define V4L2_PIX_FMT_P010    v4l2_fourcc('P', '0', '1', '0') /* 24  Y/CbCr 4:2:0 10-bit per component */
+#define V4L2_PIX_FMT_P012    v4l2_fourcc('P', '0', '1', '2') /* 24  Y/CbCr 4:2:0 12-bit per component */
 
 /* two non contiguous planes - one Y, one Cr + Cb interleaved  */
 #define V4L2_PIX_FMT_NV12M   v4l2_fourcc('N', 'M', '1', '2') /* 12  Y/CbCr 4:2:0  */
 #define V4L2_PIX_FMT_NV21M   v4l2_fourcc('N', 'M', '2', '1') /* 21  Y/CrCb 4:2:0  */
 #define V4L2_PIX_FMT_NV16M   v4l2_fourcc('N', 'M', '1', '6') /* 16  Y/CbCr 4:2:2  */
 #define V4L2_PIX_FMT_NV61M   v4l2_fourcc('N', 'M', '6', '1') /* 16  Y/CrCb 4:2:2  */
+#define V4L2_PIX_FMT_P012M   v4l2_fourcc('P', 'M', '1', '2') /* 24  Y/CbCr 4:2:0 12-bit per component */
 
 /* three planes - Y Cb, Cr */
 #define V4L2_PIX_FMT_YUV410  v4l2_fourcc('Y', 'U', 'V', '9') /*  9  YUV 4:1:0     */
@@ -622,10 +645,16 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_NV12_4L4 v4l2_fourcc('V', 'T', '1', '2')   /* 12  Y/CbCr 4:2:0  4x4 tiles */
 #define V4L2_PIX_FMT_NV12_16L16 v4l2_fourcc('H', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
 #define V4L2_PIX_FMT_NV12_32L32 v4l2_fourcc('S', 'T', '1', '2') /* 12  Y/CbCr 4:2:0 32x32 tiles */
+#define V4L2_PIX_FMT_NV15_4L4 v4l2_fourcc('V', 'T', '1', '5') /* 15 Y/CbCr 4:2:0 10-bit 4x4 tiles */
+#define V4L2_PIX_FMT_P010_4L4 v4l2_fourcc('T', '0', '1', '0') /* 12  Y/CbCr 4:2:0 10-bit 4x4 macroblocks */
+#define V4L2_PIX_FMT_NV12_8L128       v4l2_fourcc('A', 'T', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
+#define V4L2_PIX_FMT_NV12_10BE_8L128  v4l2_fourcc_be('A', 'X', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
 
 /* Tiled YUV formats, non contiguous planes */
 #define V4L2_PIX_FMT_NV12MT  v4l2_fourcc('T', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 64x32 tiles */
 #define V4L2_PIX_FMT_NV12MT_16X16 v4l2_fourcc('V', 'M', '1', '2') /* 12  Y/CbCr 4:2:0 16x16 tiles */
+#define V4L2_PIX_FMT_NV12M_8L128      v4l2_fourcc('N', 'A', '1', '2') /* Y/CbCr 4:2:0 8x128 tiles */
+#define V4L2_PIX_FMT_NV12M_10BE_8L128 v4l2_fourcc_be('N', 'T', '1', '2') /* Y/CbCr 4:2:0 10-bit 8x128 tiles */
 
 /* Bayer formats - see http://www.siliconimaging.com/RGB%20Bayer.htm */
 #define V4L2_PIX_FMT_SBGGR8  v4l2_fourcc('B', 'A', '8', '1') /*  8  BGBG.. GRGR.. */
@@ -697,10 +726,16 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_VP8      v4l2_fourcc('V', 'P', '8', '0') /* VP8 */
 #define V4L2_PIX_FMT_VP8_FRAME v4l2_fourcc('V', 'P', '8', 'F') /* VP8 parsed frame */
 #define V4L2_PIX_FMT_VP9      v4l2_fourcc('V', 'P', '9', '0') /* VP9 */
+#define V4L2_PIX_FMT_VP9_FRAME v4l2_fourcc('V', 'P', '9', 'F') /* VP9 parsed frame */
 #define V4L2_PIX_FMT_HEVC     v4l2_fourcc('H', 'E', 'V', 'C') /* HEVC aka H.265 */
 #define V4L2_PIX_FMT_FWHT     v4l2_fourcc('F', 'W', 'H', 'T') /* Fast Walsh Hadamard Transform (vicodec) */
 #define V4L2_PIX_FMT_FWHT_STATELESS     v4l2_fourcc('S', 'F', 'W', 'H') /* Stateless FWHT (vicodec) */
 #define V4L2_PIX_FMT_H264_SLICE v4l2_fourcc('S', '2', '6', '4') /* H264 parsed slices */
+#define V4L2_PIX_FMT_HEVC_SLICE v4l2_fourcc('S', '2', '6', '5') /* HEVC parsed slices */
+#define V4L2_PIX_FMT_AV1_FRAME v4l2_fourcc('A', 'V', '1', 'F') /* AV1 parsed frame */
+#define V4L2_PIX_FMT_SPK      v4l2_fourcc('S', 'P', 'K', '0') /* Sorenson Spark */
+#define V4L2_PIX_FMT_RV30     v4l2_fourcc('R', 'V', '3', '0') /* RealVideo 8 */
+#define V4L2_PIX_FMT_RV40     v4l2_fourcc('R', 'V', '4', '0') /* RealVideo 9 & 10 */
 
 /*  Vendor-specific formats   */
 #define V4L2_PIX_FMT_CPIA1    v4l2_fourcc('C', 'P', 'I', 'A') /* cpia1 YUV */
@@ -734,11 +769,16 @@ struct v4l2_pix_format {
 #define V4L2_PIX_FMT_Z16      v4l2_fourcc('Z', '1', '6', ' ') /* Depth data 16-bit */
 #define V4L2_PIX_FMT_MT21C    v4l2_fourcc('M', 'T', '2', '1') /* Mediatek compressed block mode  */
 #define V4L2_PIX_FMT_MM21     v4l2_fourcc('M', 'M', '2', '1') /* Mediatek 8-bit block mode, two non-contiguous planes */
+#define V4L2_PIX_FMT_MT2110T  v4l2_fourcc('M', 'T', '2', 'T') /* Mediatek 10-bit block tile mode */
+#define V4L2_PIX_FMT_MT2110R  v4l2_fourcc('M', 'T', '2', 'R') /* Mediatek 10-bit block raster mode */
 #define V4L2_PIX_FMT_INZI     v4l2_fourcc('I', 'N', 'Z', 'I') /* Intel Planar Greyscale 10-bit and Depth 16-bit */
 #define V4L2_PIX_FMT_CNF4     v4l2_fourcc('C', 'N', 'F', '4') /* Intel 4-bit packed depth confidence information */
 #define V4L2_PIX_FMT_HI240    v4l2_fourcc('H', 'I', '2', '4') /* BTTV 8-bit dithered RGB */
+#define V4L2_PIX_FMT_QC08C    v4l2_fourcc('Q', '0', '8', 'C') /* Qualcomm 8-bit compressed */
+#define V4L2_PIX_FMT_QC10C    v4l2_fourcc('Q', '1', '0', 'C') /* Qualcomm 10-bit compressed */
+#define V4L2_PIX_FMT_AJPG     v4l2_fourcc('A', 'J', 'P', 'G') /* Aspeed JPEG */
 
-/* 10bit raw bayer packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
+/* 10bit raw packed, 32 bytes for every 25 pixels, last LSB 6 bits unused */
 #define V4L2_PIX_FMT_IPU3_SBGGR10	v4l2_fourcc('i', 'p', '3', 'b') /* IPU3 packed 10-bit BGGR bayer */
 #define V4L2_PIX_FMT_IPU3_SGBRG10	v4l2_fourcc('i', 'p', '3', 'g') /* IPU3 packed 10-bit GBRG bayer */
 #define V4L2_PIX_FMT_IPU3_SGRBG10	v4l2_fourcc('i', 'p', '3', 'G') /* IPU3 packed 10-bit GRBG bayer */
@@ -771,6 +811,15 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_PARAMS	v4l2_fourcc('R', 'K', '1', 'P') /* Rockchip ISP1 3A Parameters */
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 
+#define V4L2_META_FMT_GENERIC_8		v4l2_fourcc('M', 'E', 'T', '8') /* Generic 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_10	v4l2_fourcc('M', 'C', '1', 'A') /* 10-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_12	v4l2_fourcc('M', 'C', '1', 'C') /* 12-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_14	v4l2_fourcc('M', 'C', '1', 'E') /* 14-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_16	v4l2_fourcc('M', 'C', '1', 'G') /* 16-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_20	v4l2_fourcc('M', 'C', '1', 'K') /* 20-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_24	v4l2_fourcc('M', 'C', '1', 'O') /* 24-bit CSI-2 packed 8-bit metadata */
+#define V4L2_META_FMT_GENERIC_CSI2_2_24	v4l2_fourcc('M', 'C', '2', 'O') /* 2 bytes of 8-bit metadata, 24-bit CSI-2 packed */
+
 /* priv field value to indicates that subsequent fields are valid. */
 #define V4L2_PIX_FMT_PRIV_MAGIC		0xfeedcafe
 
@@ -801,6 +850,7 @@ struct v4l2_fmtdesc {
 #define V4L2_FMT_FLAG_CSC_YCBCR_ENC		0x0080
 #define V4L2_FMT_FLAG_CSC_HSV_ENC		V4L2_FMT_FLAG_CSC_YCBCR_ENC
 #define V4L2_FMT_FLAG_CSC_QUANTIZATION		0x0100
+#define V4L2_FMT_FLAG_META_LINE_BASED		0x0200
 
 	/* Frame Size and frame rate enumeration */
 /*
@@ -1540,7 +1590,8 @@ struct v4l2_bt_timings {
 	((bt)->width + V4L2_DV_BT_BLANKING_WIDTH(bt))
 #define V4L2_DV_BT_BLANKING_HEIGHT(bt) \
 	((bt)->vfrontporch + (bt)->vsync + (bt)->vbackporch + \
-	 (bt)->il_vfrontporch + (bt)->il_vsync + (bt)->il_vbackporch)
+	 ((bt)->interlaced ? \
+	  ((bt)->il_vfrontporch + (bt)->il_vsync + (bt)->il_vbackporch) : 0))
 #define V4L2_DV_BT_FRAME_HEIGHT(bt) \
 	((bt)->height + V4L2_DV_BT_BLANKING_HEIGHT(bt))
 
@@ -1631,7 +1682,7 @@ struct v4l2_input {
 	__u8	     name[32];		/*  Label */
 	__u32	     type;		/*  Type of input */
 	__u32	     audioset;		/*  Associated audios (bitfield) */
-	__u32        tuner;             /*  enum v4l2_tuner_type */
+	__u32        tuner;             /*  Tuner index */
 	v4l2_std_id  std;
 	__u32	     status;
 	__u32	     capabilities;
@@ -1718,6 +1769,8 @@ struct v4l2_ext_control {
 		__u8 *p_u8;
 		__u16 *p_u16;
 		__u32 *p_u32;
+		__s32 *p_s32;
+		__s64 *p_s64;
 		struct v4l2_area *p_area;
 		struct v4l2_ctrl_h264_sps *p_h264_sps;
 		struct v4l2_ctrl_h264_pps *p_h264_pps;
@@ -1730,6 +1783,17 @@ struct v4l2_ext_control {
 		struct v4l2_ctrl_mpeg2_sequence *p_mpeg2_sequence;
 		struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
 		struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quantisation;
+		struct v4l2_ctrl_vp9_compressed_hdr *p_vp9_compressed_hdr_probs;
+		struct v4l2_ctrl_vp9_frame *p_vp9_frame;
+		struct v4l2_ctrl_hevc_sps *p_hevc_sps;
+		struct v4l2_ctrl_hevc_pps *p_hevc_pps;
+		struct v4l2_ctrl_hevc_slice_params *p_hevc_slice_params;
+		struct v4l2_ctrl_hevc_scaling_matrix *p_hevc_scaling_matrix;
+		struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
+		struct v4l2_ctrl_av1_sequence *p_av1_sequence;
+		struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
+		struct v4l2_ctrl_av1_frame *p_av1_frame;
+		struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
 		void *ptr;
 	};
 } __attribute__ ((packed));
@@ -1790,6 +1854,20 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_MPEG2_QUANTISATION   = 0x0250,
 	V4L2_CTRL_TYPE_MPEG2_SEQUENCE       = 0x0251,
 	V4L2_CTRL_TYPE_MPEG2_PICTURE        = 0x0252,
+
+	V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR	= 0x0260,
+	V4L2_CTRL_TYPE_VP9_FRAME		= 0x0261,
+
+	V4L2_CTRL_TYPE_HEVC_SPS			= 0x0270,
+	V4L2_CTRL_TYPE_HEVC_PPS			= 0x0271,
+	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	= 0x0272,
+	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	= 0x0273,
+	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	= 0x0274,
+
+	V4L2_CTRL_TYPE_AV1_SEQUENCE	    = 0x280,
+	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
+	V4L2_CTRL_TYPE_AV1_FRAME	    = 0x282,
+	V4L2_CTRL_TYPE_AV1_FILM_GRAIN	    = 0x283,
 };
 
 /*  Used in the VIDIOC_QUERYCTRL ioctl for querying controls */
@@ -1845,6 +1923,7 @@ struct v4l2_querymenu {
 #define V4L2_CTRL_FLAG_HAS_PAYLOAD	0x0100
 #define V4L2_CTRL_FLAG_EXECUTE_ON_WRITE	0x0200
 #define V4L2_CTRL_FLAG_MODIFY_LAYOUT	0x0400
+#define V4L2_CTRL_FLAG_DYNAMIC_ARRAY	0x0800
 
 /*  Query flags, to be ORed with the control ID */
 #define V4L2_CTRL_FLAG_NEXT_CTRL	0x80000000
@@ -2286,10 +2365,19 @@ struct v4l2_sdr_format {
  * struct v4l2_meta_format - metadata format definition
  * @dataformat:		little endian four character code (fourcc)
  * @buffersize:		maximum size in bytes required for data
+ * @width:		number of samples of data per line (valid for line based
+ *			formats only, see format documentation)
+ * @height:		number of lines of data per buffer (valid for line based
+ *			formats only)
+ * @bytesperline:	offset between the beginnings of two adjacent lines in
+ *			bytes (valid for line based formats only)
  */
 struct v4l2_meta_format {
 	__u32				dataformat;
 	__u32				buffersize;
+	__u32				width;
+	__u32				height;
+	__u32				bytesperline;
 } __attribute__ ((packed));
 
 /**
@@ -2352,6 +2440,7 @@ struct v4l2_event_vsync {
 #define V4L2_EVENT_CTRL_CH_VALUE		(1 << 0)
 #define V4L2_EVENT_CTRL_CH_FLAGS		(1 << 1)
 #define V4L2_EVENT_CTRL_CH_RANGE		(1 << 2)
+#define V4L2_EVENT_CTRL_CH_DIMENSIONS		(1 << 3)
 
 struct v4l2_event_ctrl {
 	__u32 changes;
@@ -2594,5 +2683,10 @@ struct v4l2_create_buffers {
 /* Deprecated definitions kept for backwards compatibility */
 #define V4L2_PIX_FMT_HM12 V4L2_PIX_FMT_NV12_16L16
 #define V4L2_PIX_FMT_SUNXI_TILED_NV12 V4L2_PIX_FMT_NV12_32L32
+/*
+ * This capability was never implemented, anyone using this cap should drop it
+ * from their code.
+ */
+#define V4L2_CAP_ASYNCIO 0x02000000
 
 #endif /* __LINUX_VIDEODEV2_H */
-- 
2.39.2

