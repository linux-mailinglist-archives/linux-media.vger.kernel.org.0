Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41E99287273
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 12:22:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729419AbgJHKVx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 06:21:53 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:21776 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729325AbgJHKVx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 06:21:53 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 08 Oct 2020 03:21:52 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 08 Oct 2020 03:21:50 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 08 Oct 2020 15:51:32 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 6372350C1; Thu,  8 Oct 2020 15:51:31 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, majja@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH] media: v4l2-ctrl: Add base layer priority id control.
Date:   Thu,  8 Oct 2020 15:51:20 +0530
Message-Id: <1602152480-3930-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
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
index 690b066..264fb83 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1251,6 +1251,15 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     Force a key frame for the next queued buffer. Applicable to
     encoders. This is a general, codec-agnostic keyframe control.
 
+``V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITYID (integer)``
+	Specifies a priority identifier for the NAL unit,
+	which will be applied to base layer.
+	By default this value is set to 0 for base layer.
+	And the next layer will have priority ID assigned as 1,2,3 and so on.
+	Video encode can't decide the priority id to be applied to a layer
+	so this has to come from client.
+	Valid Range: from 0 to 63
+
 .. _v4l2-mpeg-video-h264-cpb-size:
 
 ``V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE (integer)``
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 9296294..ec78510 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -958,6 +958,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE:		return "Vertical MV Search Range";
 	case V4L2_CID_MPEG_VIDEO_REPEAT_SEQ_HEADER:		return "Repeat Sequence Header";
 	case V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME:		return "Force Key Frame";
+	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITYID:		return "Base Layer Priority ID"
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
 	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index b869b54..9ed3e39 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -415,6 +415,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_MV_H_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+227)
 #define V4L2_CID_MPEG_VIDEO_MV_V_SEARCH_RANGE		(V4L2_CID_MPEG_BASE+228)
 #define V4L2_CID_MPEG_VIDEO_FORCE_KEY_FRAME		(V4L2_CID_MPEG_BASE+229)
+#define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITYID	(V4L2_CID_MPEG_BASE+230)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
-- 
1.9.1

