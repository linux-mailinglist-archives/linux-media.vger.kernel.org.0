Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5D84D7D1C
	for <lists+linux-media@lfdr.de>; Mon, 14 Mar 2022 09:05:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237437AbiCNIGD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Mar 2022 04:06:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238642AbiCNIES (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Mar 2022 04:04:18 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 011D237A04;
        Mon, 14 Mar 2022 01:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1647244918; x=1678780918;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9WK4o3HN1RtKbNHRl+PUTuLbo5koTnYkQaQV8cV28Bk=;
  b=c9ohnOMNVZ5azO79SUPp9+Dq6LUjBLajDRZen2pFe9w1GVgMItopA/ul
   PtjPENfRTeDdkee6ANmjSFokE3nS+i378CpR8XEdZOab07bS/7DaOpyjn
   RphD5dlBq6fdhgxtsiuOQMMCKZkvjvmPP1qF1tRNvLGs4dxIlJhuXh2Ik
   c=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 14 Mar 2022 01:00:22 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 14 Mar 2022 01:00:20 -0700
X-QCInternal: smtphost
Received: from hu-dikshita-hyd.qualcomm.com (HELO hu-sgudaval-hyd.qualcomm.com) ([10.213.110.13])
  by ironmsg02-blr.qualcomm.com with ESMTP; 14 Mar 2022 13:30:20 +0530
Received: by hu-sgudaval-hyd.qualcomm.com (Postfix, from userid 347544)
        id CB9084679; Mon, 14 Mar 2022 13:30:18 +0530 (+0530)
From:   quic_dikshita@quicinc.com
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        hverkuil-cisco@xs4all.nl
Cc:     linux-arm-msm@vger.kernel.org, ezequiel@collabora.com,
        stanimir.varbanov@linaro.org, quic_vgarodia@quicinc.com,
        quic_majja@quicinc.com, quic_jdas@quicinc.com,
        Dikshita Agarwal <quic_dikshita@quicinc.com>
Subject: [PATCH v3 1/2] media: v4l2-ctrls: Add intra-refresh type control
Date:   Mon, 14 Mar 2022 13:30:08 +0530
Message-Id: <1647244809-25340-2-git-send-email-quic_dikshita@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1647244809-25340-1-git-send-email-quic_dikshita@quicinc.com>
References: <1647244809-25340-1-git-send-email-quic_dikshita@quicinc.com>
X-Spam-Status: No, score=-4.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <quic_dikshita@quicinc.com>

Add a control to set intra-refresh type.

Signed-off-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst    | 27 ++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c          |  9 ++++++++
 include/uapi/linux/v4l2-controls.h                 |  5 ++++
 3 files changed, 41 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 4cd7c54..2406272 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1180,6 +1180,33 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     is set to non zero value.
     Applicable to H264, H263 and MPEG4 encoder.
 
+``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE (enum)``
+
+enum v4l2_mpeg_video_intra_refresh_period_type -
+    Sets the type of intra refresh. The period to refresh
+    the whole frame is specified by V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD.
+    Note if the client sets this control to either
+    ``V4L2_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM``or
+    ``V4L2_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC``
+    the ``V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB`` control
+    shall be ignored.
+    And if this control is not present that it is undefined what
+    refresh type is used and it is upto the drive to decide.
+    Applicable to H264 and HEVC encoders. Possible values are:
+
+.. tabularcolumns:: |p{9.6cm}|p{7.9cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM``
+      - The whole frame is completely refreshed randomly
+      after the specified period.
+    * - ``V4L2_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC``
+      - The whole frame MBs are completely refreshed in cyclic order
+      after the specified period.
+
 ``V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD (integer)``
     Intra macroblock refresh period. This sets the period to refresh
     the whole frame. In other words, this defines the number of frames
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 54ca4e6..451c8b0 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -572,6 +572,11 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"VBV/CPB Limit",
 		NULL,
 	};
+	static const char * const intra_refresh_period_type[] = {
+		"Random",
+		"Cyclic",
+		NULL,
+	};
 
 	switch (id) {
 	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
@@ -705,6 +710,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return hevc_start_code;
 	case V4L2_CID_CAMERA_ORIENTATION:
 		return camera_orientation;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
+		return intra_refresh_period_type;
 	default:
 		return NULL;
 	}
@@ -834,6 +841,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:	return "Decoder Slice Interface";
 	case V4L2_CID_MPEG_VIDEO_DECODER_MPEG4_DEBLOCK_FILTER:	return "MPEG4 Loop Filter Enable";
 	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:	return "Number of Intra Refresh MBs";
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:	return "Intra Refresh Type";
 	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:		return "Intra Refresh Period";
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:		return "Frame Level Rate Control Enable";
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
@@ -1360,6 +1368,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_H264_DECODE_MODE:
 	case V4L2_CID_STATELESS_H264_START_CODE:
 	case V4L2_CID_CAMERA_ORIENTATION:
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE:
 		*type = V4L2_CTRL_TYPE_MENU;
 		break;
 	case V4L2_CID_LINK_FREQ:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index c8e0f84..e7df4c5 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -443,6 +443,11 @@ enum v4l2_mpeg_video_multi_slice_mode {
 #define V4L2_CID_MPEG_VIDEO_USE_LTR_FRAMES		(V4L2_CID_CODEC_BASE+234)
 #define V4L2_CID_MPEG_VIDEO_DEC_CONCEAL_COLOR		(V4L2_CID_CODEC_BASE+235)
 #define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD	(V4L2_CID_CODEC_BASE+236)
+#define V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE	(V4L2_CID_CODEC_BASE+237)
+enum v4l2_mpeg_video_intra_refresh_period_type {
+	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_RANDOM	= 0,
+	V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD_TYPE_CYCLIC	= 1,
+};
 
 /* CIDs for the MPEG-2 Part 2 (H.262) codec */
 #define V4L2_CID_MPEG_VIDEO_MPEG2_LEVEL			(V4L2_CID_CODEC_BASE+270)
-- 
2.7.4

