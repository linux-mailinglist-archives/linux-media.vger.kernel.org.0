Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A0831D8D78
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2020 04:06:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728003AbgESCGS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 May 2020 22:06:18 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:50263 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726492AbgESCGR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 May 2020 22:06:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589853976; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=shu1nRH4yOUpMsF9x6Loiw97DfWS+2VXjIP+je/cjo4=; b=oWzLF/YBxpfPwAuW5Z5Qh/ntHSSyTBaBc2ujgchYdvc4yFb7fcDgshZuR9yeDDz0qYLwVBDd
 vcGD5gRXeF6JQmI12kD33kNJyRqeo+yKjNvBXNSaVyD8JYJm2W87kb5rQf8YlHxmsvPKVrBD
 FvkZei1nmT/RRWimyHGruOWAy9A=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5ec33f0daefa5a01cc32da9d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 May 2020 02:06:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1F196C43637; Tue, 19 May 2020 02:06:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from majja-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: majja)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 57895C433F2;
        Tue, 19 May 2020 02:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 57895C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=majja@codeaurora.org
From:   Maheshwar Ajja <majja@codeaurora.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, p.zabel@pengutronix.de,
        paul.kocialkowski@bootlin.com, jonas@kwiboo.se,
        posciak@chromium.org, boris.brezillon@collabora.com,
        ribalda@kernel.org, tglx@linutronix.de, sumitg@nvidia.com,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Maheshwar Ajja <majja@codeaurora.org>
Subject: [PATCH] media: v4l2-ctrls: add encoder skip frames control
Date:   Mon, 18 May 2020 19:05:51 -0700
Message-Id: <1589853951-27948-1-git-send-email-majja@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

If V4L2_CID_MPEG_VIDEO_ENC_SKIP_FRAMES control is enabled
encoder can drop frames, if required, to achieve target bitrate
instead of modifying the quantization parameter which lowers
the encoded frame quality.

Reference: 4.3.8.1 OMX_Video_ControlRateConstantSkipFrames
https://www.khronos.org/registry/OpenMAX-IL/specs/OpenMAX_IL_1_1_2_Specification.pdf

Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 7 +++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                      | 2 ++
 include/uapi/linux/v4l2-controls.h                        | 1 +
 3 files changed, 10 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d0d506a..bc9265d 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -1081,6 +1081,13 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     Macroblock level rate control enable. Applicable to the MPEG4 and
     H264 encoders.
 
+``V4L2_CID_MPEG_VIDEO_ENC_SKIP_FRAMES (boolean)``
+    Encoder skip frames enable. This control is applicable only if
+    ``V4L2_CID_MPEG_VIDEO_BITRATE_MODE`` control is set. If this control
+    is enabled encoder can drop frames, if required, to achieve target
+    bitrate instead of modifying the quantization parameter which lowers
+    the encoded frame quality.
+
 ``V4L2_CID_MPEG_VIDEO_MPEG4_QPEL (boolean)``
     Quarter pixel motion estimation for MPEG4. Applicable to the MPEG4
     encoder.
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 1c617b4..d2cb766 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -914,6 +914,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_FWHT_PARAMS:			return "FWHT Stateless Parameters";
 	case V4L2_CID_FWHT_I_FRAME_QP:				return "FWHT I-Frame QP Value";
 	case V4L2_CID_FWHT_P_FRAME_QP:				return "FWHT P-Frame QP Value";
+	case V4L2_CID_MPEG_VIDEO_ENC_SKIP_FRAMES:		return "Encoder Skip Frames";
 
 	/* VPX controls */
 	case V4L2_CID_MPEG_VIDEO_VPX_NUM_PARTITIONS:		return "VPX Number of Partitions";
@@ -1180,6 +1181,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_DECODER_SLICE_INTERFACE:
 	case V4L2_CID_MPEG_VIDEO_FRAME_RC_ENABLE:
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:
+	case V4L2_CID_MPEG_VIDEO_ENC_SKIP_FRAMES:
 	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
 	case V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE:
 	case V4L2_CID_MPEG_VIDEO_MPEG4_QPEL:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 0ba1005..d3bc015 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -742,6 +742,7 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
 #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
 #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
+#define V4L2_CID_MPEG_VIDEO_ENC_SKIP_FRAMES		(V4L2_CID_MPEG_BASE + 645)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

