Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE3B2E2651
	for <lists+linux-media@lfdr.de>; Thu, 24 Dec 2020 12:27:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727865AbgLXL1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 24 Dec 2020 06:27:02 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:27632 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727114AbgLXL1C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 24 Dec 2020 06:27:02 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 24 Dec 2020 03:26:22 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 24 Dec 2020 03:26:20 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 24 Dec 2020 16:56:17 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 03B7D2146B; Thu, 24 Dec 2020 16:56:15 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        nicolas@ndufresne.ca, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4 2/3] media: v4l2-ctrl: Add layer wise bitrate controls for h264
Date:   Thu, 24 Dec 2020 16:55:34 +0530
Message-Id: <1608809135-26061-3-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608809135-26061-1-git-send-email-dikshita@codeaurora.org>
References: <1608809135-26061-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds bitrate control for all coding layers for h264
same as hevc.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst      | 20 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                 |  7 +++++++
 include/uapi/linux/v4l2-controls.h                   |  7 +++++++
 3 files changed, 34 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 90c60ad..400774c 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1513,6 +1513,26 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - Bit 16:32
       - Layer number
 
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR (integer)``
+    Indicates bit rate (bps) for hierarchical coding layer 0 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR (integer)``
+    Indicates bit rate (bps) for hierarchical coding layer 1 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR (integer)``
+    Indicates bit rate (bps) for hierarchical coding layer 2 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR (integer)``
+    Indicates bit rate (bps) for hierarchical coding layer 3 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR (integer)``
+    Indicates bit rate (bps) for hierarchical coding layer 4 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR (integer)``
+    Indicates bit rate (bps) for hierarchical coding layer 5 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR (integer)``
+    Indicates bit rate (bps) for hierarchical coding layer 6 for H264 encoder.
 
 .. _v4l2-mpeg-mpeg2:
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 410e541..16ab54f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -922,6 +922,13 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:	return "H264 Hierarchical Lay 0 Bitrate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:	return "H264 Hierarchical Lay 1 Bitrate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:	return "H264 Hierarchical Lay 2 Bitrate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:	return "H264 Hierarchical Lay 3 Bitrate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:	return "H264 Hierarchical Lay 4 Bitrate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:	return "H264 Hierarchical Lay 5 Bitrate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR:	return "H264 Hierarchical Lay 6 Bitrate";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL:			return "MPEG2 Level";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_PROFILE:			return "MPEG2 Profile";
 	case V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP:		return "MPEG4 I-Frame QP Value";
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d0a69a8..af8dda2 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -587,6 +587,13 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type {
 #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP	(V4L2_CID_CODEC_BASE+388)
 #define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP	(V4L2_CID_CODEC_BASE+389)
 #define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP	(V4L2_CID_CODEC_BASE+390)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR	(V4L2_CID_CODEC_BASE+391)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR	(V4L2_CID_CODEC_BASE+392)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR	(V4L2_CID_CODEC_BASE+393)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR	(V4L2_CID_CODEC_BASE+394)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR	(V4L2_CID_CODEC_BASE+395)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR	(V4L2_CID_CODEC_BASE+396)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR	(V4L2_CID_CODEC_BASE+397)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP	(V4L2_CID_CODEC_BASE+400)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP	(V4L2_CID_CODEC_BASE+401)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP	(V4L2_CID_CODEC_BASE+402)
-- 
2.7.4

