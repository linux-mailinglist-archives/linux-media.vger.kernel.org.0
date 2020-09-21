Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2817B27242A
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 14:48:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726786AbgIUMsj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 08:48:39 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:23750 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgIUMsd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 08:48:33 -0400
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 08:48:31 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qcdkim; t=1600692512; x=1632228512;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=H9U5LihZQQ5X2pUvTUzlP6iegj0NRnKumE7ZnWnAnKg=;
  b=wjCZKURVSzvbGd6h/w2hqrJkMKa7GMorQPTLi3iuivhT0ro3YgjRYMFM
   G8rOL2bXrGKMJXf15+83yI8Ag46kqFxSd316aDU+pdA/KeKiX2v6PunfJ
   BAGBTA8ZM+p5549B6TfKrXGumJsl59xqF0dtkzW94BmYe2kGNMSXb5l8l
   k=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 21 Sep 2020 05:42:27 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Sep 2020 05:42:25 -0700
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 21 Sep 2020 18:12:10 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 2BB004DEF; Mon, 21 Sep 2020 18:12:09 +0530 (IST)
From:   Dikshita Agarwal <dikshita@qti.qualcomm.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, majja@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH 1/2] media: v4l2-ctrl: Add frame-specific min/max qp controls for hevc
Date:   Mon, 21 Sep 2020 18:11:52 +0530
Message-Id: <1600692113-32279-2-git-send-email-dikshita@qti.qualcomm.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600692113-32279-1-git-send-email-dikshita@qti.qualcomm.com>
References: <1600692113-32279-1-git-send-email-dikshita@qti.qualcomm.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

- Adds min/max qp controls for B frame for h264.
- Adds min/max qp controls for I/P/B frames for hevc similar to h264.
- Update valid range of mim/max qp for hevc to accommodate 10 bit.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 54 +++++++++++++++++++++-
 drivers/media/v4l2-core/v4l2-ctrls.c               |  8 ++++
 include/uapi/linux/v4l2-controls.h                 |  9 ++++
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ce728c75..26f8220 100644
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
@@ -3441,11 +3453,13 @@ HEVC/H.265 Control IDs
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_MIN_QP (integer)``
     Minimum quantization parameter for HEVC.
-    Valid range: from 0 to 51.
+    Valid range: from 0 - 51 for 8 bit and
+    0 - 63 for 10 bit.
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_MAX_QP (integer)``
     Maximum quantization parameter for HEVC.
-    Valid range: from 0 to 51.
+    Valid range: from 0 - 51 for 8 bit and
+    0 - 63 for 10 bit
 
 ``V4L2_CID_MPEG_VIDEO_HEVC_I_FRAME_QP (integer)``
     Quantization parameter for an I frame for HEVC.
@@ -3462,6 +3476,42 @@ HEVC/H.265 Control IDs
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
index bd7f330..abef73e 100644
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
@@ -978,6 +980,12 @@ const char *v4l2_ctrl_get_name(u32 id)
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
index a184c49..7ba05fe 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -578,6 +578,8 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type {
 #define V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+386)
 #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+387)
 #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+388)
+#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+389)
+#define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+390)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP	(V4L2_CID_MPEG_BASE+400)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP	(V4L2_CID_MPEG_BASE+401)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP	(V4L2_CID_MPEG_BASE+402)
@@ -762,6 +764,13 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
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
1.9.1

