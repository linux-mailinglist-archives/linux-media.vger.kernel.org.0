Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5DBF244490
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 07:29:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbgHNF3y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 01:29:54 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:10118 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726320AbgHNF3y (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 01:29:54 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 13 Aug 2020 22:29:52 -0700
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 13 Aug 2020 22:29:50 -0700
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Aug 2020 10:59:32 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 2AC0D4702; Fri, 14 Aug 2020 10:59:31 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl, nicolas@ndufresne.ca,
        majja@codeaurora.org, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v2] media: v4l2-ctrl: add control for long term reference.
Date:   Fri, 14 Aug 2020 10:59:27 +0530
Message-Id: <1597382967-32729-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

LTR (Long Term Reference) frames are the frames that are encoded
sometime in the past and stored in the DPB buffer list to be used
as reference to encode future frames.
This change adds controls to enable this feature.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 23 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c               |  6 ++++++
 include/uapi/linux/v4l2-controls.h                 |  4 ++++
 3 files changed, 33 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d0d506a..6d1b005 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -4272,3 +4272,26 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
       - Selecting this value specifies that HEVC slices are expected
         to be prefixed by Annex B start codes. According to :ref:`hevc`
         valid start codes can be 3-bytes 0x000001 or 4-bytes 0x00000001.
+
+``V4L2_CID_MPEG_VIDEO_LTRCOUNT (enum)``
+	Specifies the number of Long Term Reference frames encoder needs to
+	generate or keep.
+	This control is used to query or configure the number of Long Term
+	Reference frames.
+
+``V4L2_CID_MPEG_VIDEO_MARKLTRFRAME (enum)``
+	This control is used to mark current frame as Long Term Reference
+	frame.
+	this provides a Long Term Reference index that ranges from 0
+	to LTR count-1 and then the particular frame will be marked with that
+	Long Term Reference index.
+
+``V4L2_CID_MPEG_VIDEO_USELTRFRAME (enum)``
+	Specifies the Long Term Reference frame(s) to be used for encoding
+	the current frame.
+	This provides a bitmask which consists of bits [0, 15]. A total of N
+	LSB bits of this field are valid, where N is the maximum number of
+	Long Term Reference frames supported.
+	All the other bits are invalid and should be rejected.
+	The LSB corresponds to the Long Term Reference index 0. Bit N-1 from
+	the LSB corresponds to the Long Term Reference index max LTR count-1.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 3f3fbcd..3138c72 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -991,6 +991,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
+	case V4L2_CID_MPEG_VIDEO_LTRCOUNT:		return "LTR Count";
+	case V4L2_CID_MPEG_VIDEO_MARKLTRFRAME:		return "Mark LTR";
+	case V4L2_CID_MPEG_VIDEO_USELTRFRAME:		return "Use LTR";
 
 	/* CAMERA controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1224,6 +1227,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		break;
 	case V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE:
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:
+	case V4L2_CID_MPEG_VIDEO_LTRCOUNT:
+	case V4L2_CID_MPEG_VIDEO_MARKLTRFRAME:
+	case V4L2_CID_MPEG_VIDEO_USELTRFRAME:
 		*type = V4L2_CTRL_TYPE_INTEGER;
 		break;
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 6227141..f2daa86 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -742,6 +742,10 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
 #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
 #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
+#define V4L2_CID_MPEG_VIDEO_LTRCOUNT	(V4L2_CID_MPEG_BASE + 645)
+#define V4L2_CID_MPEG_VIDEO_MARKLTRFRAME	(V4L2_CID_MPEG_BASE + 646)
+#define V4L2_CID_MPEG_VIDEO_USELTRFRAME		(V4L2_CID_MPEG_BASE + 647)
+
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
-- 
1.9.1

