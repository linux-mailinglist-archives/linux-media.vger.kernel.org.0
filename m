Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4390D2B7696
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 07:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726677AbgKRGzc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 01:55:32 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26429 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbgKRGzb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 01:55:31 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 17 Nov 2020 22:55:30 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 17 Nov 2020 22:55:28 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 18 Nov 2020 12:25:16 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 9D0DB212C6; Wed, 18 Nov 2020 12:25:15 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        nicolas@ndufresne.ca, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3 1/3] media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
Date:   Wed, 18 Nov 2020 12:24:55 +0530
Message-Id: <1605682497-29273-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605682497-29273-1-git-send-email-dikshita@codeaurora.org>
References: <1605682497-29273-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Adds min/max qp controls for B frame for h264.
- Adds min/max qp controls for I/P/B frames for hevc similar to h264.
- Update valid range of  mim/max qp for hevc to accommodate 10 bit.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 52 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               |  8 ++++
 include/uapi/linux/v4l2-controls.h                 |  9 ++++
 3 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index aac1ea3..a9c7011 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1182,6 +1182,18 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     V4L2_CID_MPEG_VIDEO_H264_MAX_QP is also set, the quantization parameter
     should be chosen to meet both requirements.
 
+``V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP (integer)``
+    Minimum quantization parameter for the H264 B frame to limit B frame
+    quality to a range. Valid range: from 0 to 51. If
+    V4L2_CID_MPEG_VIDEO_H264_MIN_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP (integer)``
+    Maximum quantization parameter for the H264 B frame to limit B frame
+    quality to a range. Valid range: from 0 to 51. If
+    V4L2_CID_MPEG_VIDEO_H264_MAX_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
 ``V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for MPEG4. Valid range: from 1
     to 31.
@@ -3441,11 +3453,11 @@ HEVC/H.265 Control IDs
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP (integer)``
     Minimum quantization parameter for HEVC.
-    Valid range: from 0 to 51.
+    Valid range: from 0 - 51 for 8 bit and  0 - 63 for 10 bit.
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP (integer)``
     Maximum quantization parameter for HEVC.
-    Valid range: from 0 to 51.
+    Valid range: from 0 - 51 for 8 bit and 0 - 63 for 10 bit.
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for HEVC.
@@ -3462,6 +3474,42 @@ HEVC/H.265 Control IDs
     Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
     V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
 
+``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP (integer)``
+    Minimum quantization parameter for the HEVC I frame to limit I frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP (integer)``
+    Maximum quantization parameter for the HEVC I frame to limit I frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP (integer)``
+    Minimum quantization parameter for the HEVC P frame to limit P frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP (integer)``
+    Maximum quantization parameter for the HEVC P frame to limit P frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP (integer)``
+    Minimum quantization parameter for the HEVC B frame to limit B frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP (integer)``
+    Maximum quantization parameter for the HEVC B frame to limit B frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit, 0 - 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
 ``V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP (boolean)``
     HIERARCHICAL_QP allows the host to specify the quantization parameter
     values for each temporal layer through HIERARCHICAL_QP_LAYER. This is
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index e8ee29e..6e74500 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -920,6 +920,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:		return "H264 I-Frame Maximum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:		return "H264 P-Frame Minimum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_SPS:			return "H264 Sequence Parameter Set";
 	case V4L2_CID_MPEG_VIDEO_H264_PPS:			return "H264 Picture Parameter Set";
 	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
@@ -982,6 +984,12 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_QP:		return "HEVC B-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP:			return "HEVC Minimum QP Value";
 	case V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP:			return "HEVC Maximum QP Value";
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP:		return "HEVC I-Frame Minimum QP Value";
+	case V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP:		return "HEVC I-Frame Maximum QP Value";
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP:		return "HEVC P-Frame Minimum QP Value";
+	case V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP:		return "HEVC P-Frame Maximum QP Value";
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP:		return "HEVC B-Frame Minimum QP Value";
+	case V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP:		return "HEVC B-Frame Maximum QP Value";
 	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:			return "HEVC Profile";
 	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:			return "HEVC Level";
 	case V4L2_CID_MPEG_VIDEO_HEVC_TIER:			return "HEVC Tier";
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 14ce833..fea0f18 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -588,6 +588,8 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type {
 #define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+386)
 #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+387)
 #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+388)
+#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+389)
+#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+390)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP	(V4L2_CID_MPEG_BASE+400)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP	(V4L2_CID_MPEG_BASE+401)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP	(V4L2_CID_MPEG_BASE+402)
@@ -772,6 +774,13 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
 #define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_MPEG_BASE + 645)
 #define V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE		(V4L2_CID_MPEG_BASE + 646)
+#define V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+647)
+#define V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+648)
+#define V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+649)
+#define V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+650)
+#define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+651)
+#define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+652)
+
 enum v4l2_mpeg_video_frame_skip_mode {
 	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED	= 0,
 	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
-- 
2.7.4

