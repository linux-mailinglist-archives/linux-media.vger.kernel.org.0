Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E0732C01AD
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 09:51:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726302AbgKWIvN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 03:51:13 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:21293 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725275AbgKWIvN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 03:51:13 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 23 Nov 2020 00:51:12 -0800
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Nov 2020 00:51:11 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 23 Nov 2020 14:20:57 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 0020B21220; Mon, 23 Nov 2020 14:20:55 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, hverkuil-cisco@xs4all.nl,
        nicolas@ndufresne.ca, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v3] media: v4l2-ctrl: Add base layer priority id control.
Date:   Mon, 23 Nov 2020 14:20:42 +0530
Message-Id: <1606121442-31074-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
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
index 22222ce..a518d4f 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -4467,3 +4467,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
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
index 0b81b39..799ab85 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -961,6 +961,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "frame LTR index";
 	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES:		return "Use LTR Frame(s)";
+	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:		return "Base Layer Priority ID";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
 	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index b77fa7d..3c4fdc1 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -424,6 +424,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_LTR_COUNT                  (V4L2_CID_MPEG_BASE+230)
 #define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX            (V4L2_CID_MPEG_BASE+231)
 #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES             (V4L2_CID_MPEG_BASE+232)
+#define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID      (V4L2_CID_MPEG_BASE + 233)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
-- 
2.7.4

