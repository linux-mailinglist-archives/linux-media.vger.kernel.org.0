Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C436F1F65AA
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2020 12:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgFKK0C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jun 2020 06:26:02 -0400
Received: from alexa-out-blr-02.qualcomm.com ([103.229.18.198]:23911 "EHLO
        alexa-out-blr-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727063AbgFKK0A (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jun 2020 06:26:00 -0400
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA; 11 Jun 2020 15:55:52 +0530
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 11 Jun 2020 15:55:30 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id E72273BDB; Thu, 11 Jun 2020 15:55:28 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, boris.brezillon@collabora.com,
        ribalda@kernel.org, paul.kocialkowski@bootlin.com,
        posciak@chromium.org, linux-media@vger.kernel.org,
        stanimir.varbanov@linaro.org, linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org, vgarodia@codeaurora.org,
        majja@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [RFC PATCH 1/1] media: v4l2-ctrls: add control for ltr
Date:   Thu, 11 Jun 2020 15:55:21 +0530
Message-Id: <1591871121-25420-2-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1591871121-25420-1-git-send-email-dikshita@codeaurora.org>
References: <1591871121-25420-1-git-send-email-dikshita@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add v4l2 controls for ltr

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 6 ++++++
 include/uapi/linux/v4l2-controls.h   | 4 ++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 93d33d1..205863e 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -977,6 +977,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
+	case V4L2_CID_MPEG_VIDEO_LTRCOUNT: 			return "LTR Count";
+	case V4L2_CID_MPEG_VIDEO_MARKLTRFRAME: 			return "Mark LTR";
+	case V4L2_CID_MPEG_VIDEO_USELTRFRAME:			return "Use LTR";
 
 	/* CAMERA controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
@@ -1208,6 +1211,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
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
index 1a58d7c..88d24e1 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -737,6 +737,10 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
 #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
 #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
+#define V4L2_CID_MPEG_VIDEO_LTRCOUNT			(V4L2_CID_MPEG_BASE + 645)
+#define V4L2_CID_MPEG_VIDEO_MARKLTRFRAME		(V4L2_CID_MPEG_BASE + 646)
+#define V4L2_CID_MPEG_VIDEO_USELTRFRAME		(V4L2_CID_MPEG_BASE + 647)
+
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
-- 
1.9.1

