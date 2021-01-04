Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C352C2E8FEA
	for <lists+linux-media@lfdr.de>; Mon,  4 Jan 2021 06:11:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727460AbhADFKs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Jan 2021 00:10:48 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:7178 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725830AbhADFKs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Jan 2021 00:10:48 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 03 Jan 2021 21:09:53 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 03 Jan 2021 21:09:52 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 04 Jan 2021 10:39:37 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 53A64214AA; Mon,  4 Jan 2021 10:39:37 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v5 1/2] media: v4l2-ctrl: add control for long term reference.
Date:   Mon,  4 Jan 2021 10:39:30 +0530
Message-Id: <1609736971-14454-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1609736971-14454-1-git-send-email-dikshita@codeaurora.org>
References: <1609736971-14454-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Long Term Reference (LTR) frames are the frames that are encoded
sometime in the past and stored in the DPB buffer list to be used
as reference to encode future frames.
This change adds controls to enable this feature.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 18 ++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                   | 14 ++++++++++++++
 include/uapi/linux/v4l2-controls.h                     |  3 +++
 3 files changed, 35 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 400774c..1675bcf 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3637,3 +3637,21 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - Selecting this value specifies that HEVC slices are expected
         to be prefixed by Annex B start codes. According to :ref:`hevc`
         valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
+
+``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
+       Specifies the number of Long Term Reference (LTR) frames encoder needs
+       to generate or keep. This is applicable to H264 and HEVC encoder.
+
+``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
+       The current frame is marked as a Long Term Reference (LTR) frame
+       and given this LTR index which ranges from 0 to LTR_COUNT-1.
+       This is applicable to H264 and HEVC encoder and can be applied using
+       Request Api.
+       Source Rec. ITU-T H.264 (06/2019); Table 7.9
+
+``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES (bitmask)``
+       Specifies the Long Term Reference (LTR) frame(s) to be used for
+       encoding the current frame.
+       This provides a bitmask which consists of bits [0, LTR_COUNT-1].
+       This is applicable to H264 and HEVC encoder and can be applied using
+       Request Api.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 16ab54f..2ad6b5a 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -950,6 +950,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
 	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "frame LTR index";
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frames";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
@@ -1277,6 +1280,17 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		break;
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+		break;
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:
+		*type = V4L2_CTRL_TYPE_BITMASK;
+		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
 	case V4L2_CID_PAN_RESET:
 	case V4L2_CID_TILT_RESET:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index af8dda2..c0bb87b 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -422,6 +422,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+227)
 #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_CODEC_BASE+228)
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_CODEC_BASE+229)
+#define V4L2_CID_MPEG_VIDEO_LTR_COUNT			(V4L2_CID_CODEC_BASE+230)
+#define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX		(V4L2_CID_CODEC_BASE+231)
+#define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+232)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
-- 
2.7.4

