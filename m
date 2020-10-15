Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15E3928F09C
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 13:03:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730361AbgJOLC6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 07:02:58 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:19296 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728513AbgJOLC6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 07:02:58 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 15 Oct 2020 04:02:55 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Oct 2020 04:02:54 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 Oct 2020 16:32:35 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 59352522C; Thu, 15 Oct 2020 16:32:34 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, majja@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3] media: v4l2-ctrl: add control for long term reference.
Date:   Thu, 15 Oct 2020 16:31:56 +0530
Message-Id: <1602759716-7584-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

LTR (Long Term Reference) frames are the frames that are encoded
sometime in the past and stored in the DPB buffer list to be used
as reference to encode future frames.
This change adds controls to enable this feature.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 25 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c               | 12 +++++++++++
 include/uapi/linux/v4l2-controls.h                 |  3 +++
 3 files changed, 40 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index ce728c75..6e9240a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -4382,3 +4382,28 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - Selecting this value specifies that HEVC slices are expected
         to be prefixed by Annex B start codes. According to :ref:`hevc`
         valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
+
+``V4L2_CID_MPEG_VIDEO_LTR_COUNT (integer)``
+       Specifies the number of LTR frames encoder needs to generate or keep.
+       This control is used to query or configure the number of LTR frames.
+       If LTR Count is more than max supported LTR count by driver,
+       it will be rejected.
+       This is applicable to H264 and HEVC encoder and can be applied using
+       request api.
+
+``V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX (integer)``
+       This control is used to mark current frame as LTR frame.
+       this provides a LTR index that ranges from 0 to LTR count-1 and
+       then the particular frame will be marked with that LTR index.
+       This is applicable to H264 and HEVC encoder and can be applied using
+       request api.
+
+``V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME (bitmask)``
+       Specifies the LTR frame(s) to be used for encoding the current frame.
+       This provides a bitmask which consists of bits [0, 15]. A total of N
+       LSB bits of this field are valid, where N is the maximum number of
+       LTRs supported. All the other bits are invalid and should be rejected.
+       The LSB corresponds to the LTR index 0. Bit N-1 from the LSB corresponds
+       to the LTR index max LTR count-1.
+       This is applicable to H264 and HEVC encoder and can be applied using
+       request api.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index bd7f330..046198f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -949,6 +949,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
 	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Mark LTR frame index";
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME:			return "Use LTR Frame";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
 	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
@@ -1258,6 +1261,15 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
+	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:
+	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:
+		*type = V4L2_CTRL_TYPE_INTEGER;
+		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+		break;
+	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME:
+		*type = V4L2_CTRL_TYPE_BITMASK;
+		*flags |= V4L2_CTRL_FLAG_EXECUTE_ON_WRITE;
+		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
 	case V4L2_CID_PAN_RESET:
 	case V4L2_CID_TILT_RESET:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a184c49..3801372 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -415,6 +415,9 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+227)
 #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
+#define V4L2_CID_MPEG_VIDEO_LTR_COUNT                  (V4L2_CID_MPEG_BASE+230)
+#define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX            (V4L2_CID_MPEG_BASE+231)
+#define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME              (V4L2_CID_MPEG_BASE+232)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
-- 
1.9.1

