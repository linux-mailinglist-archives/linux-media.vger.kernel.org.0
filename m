Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D8642E903B
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 06:43:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727786AbhADFmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 00:42:55 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26488 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbhADFmy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 00:42:54 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 03 Jan 2021 21:42:14 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jan 2021 21:42:12 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 04 Jan 2021 11:11:58 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id ECE5E214AD; Mon,  4 Jan 2021 11:11:57 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4 1/2] media: v4l2-ctrl: Add base layer priority id control.
Date:   Mon,  4 Jan 2021 11:11:53 +0530
Message-Id: <1609738914-22769-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609738914-22769-1-git-send-email-dikshita@codeaurora.org>
References: <1609738914-22769-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

This control indicates the priority id to be applied
to base layer.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 9 +++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                      | 1 +
 include/uapi/linux/v4l2-controls.h                        | 1 +
 3 files changed, 11 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 1675bcf..24df818 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3655,3 +3655,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
        This provides a bitmask which consists of bits [0, LTR_COUNT-1].
        This is applicable to H264 and HEVC encoder and can be applied using
        Request Api.
+
+``V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID (integer)``
+    Specifies a priority identifier for the NAL unit, which will be applied to
+    the base layer. By default this value is set to 0 for the base layer,
+    and the next layer will have the priority ID assigned as 1, 2, 3 and so on.
+    The video encoder can't decide the priority id to be applied to a layer,
+    so this has to come from client.
+    This is applicable to H264 and valid Range is from 0 to 63.
+    Source Rec. ITU-T H.264 (06/2019); G.7.4.1.1, G.8.8.1
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 2ad6b5a..9bd795f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -953,6 +953,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "frame LTR index";
 	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
+	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:		return "Base Layer Priority ID";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c0bb87b..404e69c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -425,6 +425,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_LTR_COUNT			(V4L2_CID_CODEC_BASE+230)
 #define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX		(V4L2_CID_CODEC_BASE+231)
 #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+232)
+#define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID	(V4L2_CID_CODEC_BASE+233)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
-- 
2.7.4

