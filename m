Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91AA728F0A7
	for <lists+linux-media@lfdr.de>; Thu, 15 Oct 2020 13:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727717AbgJOLFv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Oct 2020 07:05:51 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:55499 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgJOLFv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Oct 2020 07:05:51 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 15 Oct 2020 04:05:50 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 15 Oct 2020 04:05:49 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 15 Oct 2020 16:35:46 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 7A8B6522C; Thu, 15 Oct 2020 16:35:45 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, stanimir.varbanov@linaro.org,
        vgarodia@codeaurora.org, majja@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v2] media: v4l2-ctrl: Add base layer priority id control.
Date:   Thu, 15 Oct 2020 16:35:35 +0530
Message-Id: <1602759935-12965-1-git-send-email-dikshita@codeaurora.org>
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
index 6e9240a..aac1ea3 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -4407,3 +4407,12 @@ enum v4l2_mpeg_video_hevc_size_of_length_field -
        to the LTR index max LTR count-1.
        This is applicable to H264 and HEVC encoder and can be applied using
        request api.
+
+``V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITYID (integer)``
+       Specifies a priority identifier for the NAL unit,
+       which will be applied to base layer.
+       By default this value is set to 0 for base layer.
+       And the next layer will have priority ID assigned as 1,2,3 and so on.
+       Video encode can't decide the priority id to be applied to a layer
+       so this has to come from client.
+       Valid Range: from 0 to 63
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 046198f..c973058 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -952,6 +952,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_LTR_COUNT:			return "LTR Count";
 	case V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX:		return "Mark LTR frame index";
 	case V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME:			return "Use LTR Frame";
+	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITYID:		return "Base Layer Priority ID";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_SLICE_PARAMS:		return "MPEG-2 Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_MPEG2_QUANTIZATION:		return "MPEG-2 Quantization Matrices";
 	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 3801372..433e119 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -418,6 +418,7 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_LTR_COUNT                  (V4L2_CID_MPEG_BASE+230)
 #define V4L2_CID_MPEG_VIDEO_FRAME_LTR_INDEX            (V4L2_CID_MPEG_BASE+231)
 #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAME              (V4L2_CID_MPEG_BASE+232)
+#define V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITYID       (V4L2_CID_MPEG_BASE+233)
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_MPEG_BASE+270)
-- 
1.9.1

