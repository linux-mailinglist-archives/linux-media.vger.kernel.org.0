Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D72A272426
	for <lists+linux-media@lfdr.de>; Mon, 21 Sep 2020 14:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726496AbgIUMsc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Sep 2020 08:48:32 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:23750 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgIUMsb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Sep 2020 08:48:31 -0400
X-Greylist: delayed 365 seconds by postgrey-1.27 at vger.kernel.org; Mon, 21 Sep 2020 08:48:31 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=qti.qualcomm.com; i=@qti.qualcomm.com; q=dns/txt;
  s=qcdkim; t=1600692511; x=1632228511;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=7wpnt4EiG5JeGIBbPA/ZoMiqoGcCHgT3avwu2rq+i+A=;
  b=EWqaUCaQvWGHkaPOOATsKoTmk/PqROdTVgjwp4Tcj3sMdexljBbzn42B
   gzwIAF6QWmr863GRc1ucoUD6NVXHgeZs63vXrVISSe00B/7TD8oiiqZrG
   9DfakvaTx86+Cte2KvnSthftroNLdq7ZGbX0/E7OXAGrZXJuvtCWNM4LF
   U=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 21 Sep 2020 05:42:25 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 21 Sep 2020 05:42:23 -0700
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 21 Sep 2020 18:12:12 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id A90D64DEF; Mon, 21 Sep 2020 18:12:11 +0530 (IST)
From:   Dikshita Agarwal <dikshita@qti.qualcomm.com>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, majja@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH 2/2] media: v4l2-ctrl: Add layer wise bitrate controls for h264
Date:   Mon, 21 Sep 2020 18:11:53 +0530
Message-Id: <1600692113-32279-3-git-send-email-dikshita@qti.qualcomm.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1600692113-32279-1-git-send-email-dikshita@qti.qualcomm.com>
References: <1600692113-32279-1-git-send-email-dikshita@qti.qualcomm.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

Adds bitrate control for all coding layers for h264
same as hevc.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst      | 20 ++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                 |  7 +++++++
 include/uapi/linux/v4l2-controls.h                   |  8 ++++++++
 3 files changed, 35 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 26f8220..690b066 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1513,6 +1513,26 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type -
     * - Bit 16:32
       - Layer number
 
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR (integer)``
+    Indicates bit rate for hierarchical coding layer 0 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR (integer)``
+    Indicates bit rate for hierarchical coding layer 1 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR (integer)``
+    Indicates bit rate for hierarchical coding layer 2 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR (integer)``
+    Indicates bit rate for hierarchical coding layer 3 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR (integer)``
+    Indicates bit rate for hierarchical coding layer 4 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR (integer)``
+    Indicates bit rate for hierarchical coding layer 5 for H264 encoder.
+
+``V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR (integer)``
+    Indicates bit rate for hierarchical coding layer 6 for H264 encoder.
 
 .. _v4l2-mpeg-h264:
 
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index abef73e..9296294 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -922,6 +922,13 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP:		return "H264 P-Frame Maximum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP:		return "H264 B-Frame Minimum QP Value";
 	case V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP:		return "H264 B-Frame Maximum QP Value";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:	return "H264 Hierarchical Lay 0 BitRate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:	return "H264 Hierarchical Lay 1 BitRate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:	return "H264 Hierarchical Lay 2 BitRate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:	return "H264 Hierarchical Lay 3 BitRate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:	return "H264 Hierarchical Lay 4 BitRate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:	return "H264 Hierarchical Lay 5 BitRate";
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR:	return "H264 Hierarchical Lay 6 BitRate";
 	case V4L2_CID_MPEG_VIDEO_H264_SPS:			return "H264 Sequence Parameter Set";
 	case V4L2_CID_MPEG_VIDEO_H264_PPS:			return "H264 Picture Parameter Set";
 	case V4L2_CID_MPEG_VIDEO_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 7ba05fe..b869b54 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -580,12 +580,20 @@ enum v4l2_mpeg_video_h264_hierarchical_coding_type {
 #define V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+388)
 #define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MIN_QP	(V4L2_CID_MPEG_BASE+389)
 #define V4L2_CID_MPEG_VIDEO_H264_B_FRAME_MAX_QP	(V4L2_CID_MPEG_BASE+390)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR	(V4L2_CID_MPEG_BASE + 391)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR	(V4L2_CID_MPEG_BASE + 392)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR	(V4L2_CID_MPEG_BASE + 393)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR	(V4L2_CID_MPEG_BASE + 394)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR	(V4L2_CID_MPEG_BASE + 395)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR	(V4L2_CID_MPEG_BASE + 396)
+#define V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 397)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_I_FRAME_QP	(V4L2_CID_MPEG_BASE+400)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_P_FRAME_QP	(V4L2_CID_MPEG_BASE+401)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_B_FRAME_QP	(V4L2_CID_MPEG_BASE+402)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_MIN_QP	(V4L2_CID_MPEG_BASE+403)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_MAX_QP	(V4L2_CID_MPEG_BASE+404)
 #define V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL		(V4L2_CID_MPEG_BASE+405)
+
 enum v4l2_mpeg_video_mpeg4_level {
 	V4L2_MPEG_VIDEO_MPEG4_LEVEL_0	= 0,
 	V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B	= 1,
-- 
1.9.1

