Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B3152E265B
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 12:30:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbgLXL1d (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 06:27:33 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:27632 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727372AbgLXL1d (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 06:27:33 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 24 Dec 2020 03:26:24 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Dec 2020 03:26:22 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Dec 2020 16:56:15 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 610B42146B; Thu, 24 Dec 2020 16:56:14 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        nicolas@ndufresne.ca, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4 1/3] media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
Date:   Thu, 24 Dec 2020 16:55:33 +0530
Message-Id: <1608809135-26061-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608809135-26061-1-git-send-email-dikshita@codeaurora.org>
References: <1608809135-26061-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Adds min/max qp controls for B frame for h264.
- Adds min/max qp controls for I/P/B frames for hevc similar to h264.
- Update valid range of min/max qp for hevc to accommodate 10 bit.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 52 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               |  8 ++++
 include/uapi/linux/v4l2-controls.h                 |  9 ++++
 3 files changed, 67 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 454ecd9..90c60ad 100644
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
@@ -2628,11 +2640,11 @@ HEVC/H.265 Control IDs
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP (integer)``
     Minimum quantization parameter for HEVC.
-    Valid range: from 0 to 51.
+    Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP (integer)``
     Maximum quantization parameter for HEVC.
-    Valid range: from 0 to 51.
+    Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for HEVC.
@@ -2649,6 +2661,42 @@ HEVC/H.265 Control IDs
     Valid range: [V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP,
     V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP].
 
+``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP (integer)``
+    Minimum quantization parameter for the HEVC I frame to limit I frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP (integer)``
+    Maximum quantization parameter for the HEVC I frame to limit I frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP (integer)``
+    Minimum quantization parameter for the HEVC P frame to limit P frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP (integer)``
+    Maximum quantization parameter for the HEVC P frame to limit P frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP (integer)``
+    Minimum quantization parameter for the HEVC B frame to limit B frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
+``V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP (integer)``
+    Maximum quantization parameter for the HEVC B frame to limit B frame
+    quality to a range. Valid range: from 0 to 51 for 8 bit and from 0 to 63 for 10 bit.
+    If V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP is also set, the quantization parameter
+    should be chosen to meet both requirements.
+
 ``V4L2_CID_MPEG_VIDEO_HEVC_HIER_QP (boolean)``
     HIERARCHICAL_QP allows the host to specify the quantization parameter
     values for each temporal layer through HIERARCHICAL_QP_LAYER. This is
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 5cbe0ff..410e541 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -920,6 +920,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP:		return "H264 I-Frame Maximum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP:		return "H264 P-Frame Minimum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
+	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
 	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
@@ -969,6 +971,12 @@ const char *v4l2_ctrl_get_name(u32 id)
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
index 823b214..d0a69a8 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -585,6 +585,8 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type {
 #define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP	(V4L2_CID_CODEC_BASE+386)
 #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP	(V4L2_CID_CODEC_BASE+387)
 #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP	(V4L2_CID_CODEC_BASE+388)
+#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP	(V4L2_CID_CODEC_BASE+389)
+#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP	(V4L2_CID_CODEC_BASE+390)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP	(V4L2_CID_CODEC_BASE+400)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP	(V4L2_CID_CODEC_BASE+401)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP	(V4L2_CID_CODEC_BASE+402)
@@ -775,6 +777,13 @@ enum v4l2_mpeg_video_frame_skip_mode {
 	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT	= 2,
 };
 
+#define V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MIN_QP        (V4L2_CID_CODEC_BASE + 647)
+#define V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_MAX_QP        (V4L2_CID_CODEC_BASE + 648)
+#define V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MIN_QP        (V4L2_CID_CODEC_BASE + 649)
+#define V4L2_CID_MPEG_VIDEO_HEVC_P_FRAME_MAX_QP        (V4L2_CID_CODEC_BASE + 650)
+#define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MIN_QP        (V4L2_CID_CODEC_BASE + 651)
+#define V4L2_CID_MPEG_VIDEO_HEVC_B_FRAME_MAX_QP        (V4L2_CID_CODEC_BASE + 652)
+
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_CODEC_CX2341X_BASE				(V4L2_CTRL_CLASS_CODEC | 0x1000)
 #define V4L2_CID_MPEG_CX2341X_VIDEO_SPATIAL_FILTER_MODE		(V4L2_CID_CODEC_CX2341X_BASE+0)
-- 
2.7.4

