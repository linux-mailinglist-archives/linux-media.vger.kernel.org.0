Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EFCAD1DF3BA
	for <lists+linux-media@lfdr.de>; Sat, 23 May 2020 03:07:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387530AbgEWBHO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 May 2020 21:07:14 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:35028 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387453AbgEWBHN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 May 2020 21:07:13 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590196032; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kC/dl/V3vLG5GJYc4tMyBfR//6G/sHvL+fgCx9U0Eww=; b=Fme9lQoh0ZCjB11z5rcLMpw0TC1fy6FLM8wFTnA/rCqCbqv6M3o0py2byEbCbDvR/yqxOJ6n
 OwbWxkRLvwDD19x5ZMplR3Ock3jspbVLwN9jFbogoG/OVOX0zLAb3+s92LSto05k2iAU9Y4s
 1jwUYBA4J96PmhtuW6obWuMe7xs=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 5ec87734c60c306cc8a5c5ac (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 23 May 2020 01:07:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D4F7C433CB; Sat, 23 May 2020 01:07:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from majja-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: majja)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9114C433C8;
        Sat, 23 May 2020 01:06:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9114C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=majja@codeaurora.org
From:   Maheshwar Ajja <majja@codeaurora.org>
To:     mchehab@kernel.org, hverkuil-cisco@xs4all.nl,
        ezequiel@collabora.com, paul.kocialkowski@bootlin.com,
        p.zabel@pengutronix.de, posciak@chromium.org, jonas@kwiboo.se,
        boris.brezillon@collabora.com, ribalda@kernel.org,
        tglx@linutronix.de, sumitg@nvidia.com, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Maheshwar Ajja <majja@codeaurora.org>
Subject: [PATCH] media: v4l2-ctrls: Add encoder constant quality control
Date:   Fri, 22 May 2020 18:05:26 -0700
Message-Id: <1590195927-14438-1-git-send-email-majja@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589836035-16579-1-git-send-email-majja@codeaurora.org>
References: <1589836035-16579-1-git-send-email-majja@codeaurora.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

When V4L2_CID_MPEG_VIDEO_BITRATE_MODE value is
V4L2_MPEG_VIDEO_BITRATE_MODE_CQ, encoder will produce
constant quality output indicated by
V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY control value.
Encoder will choose appropriate quantization parameter
and bitrate to produce requested frame quality level.

Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
---
 Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                      |  2 ++
 include/uapi/linux/v4l2-controls.h                        |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d0d506a..b9d3f7a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -581,6 +581,8 @@ enum v4l2_mpeg_video_bitrate_mode -
       - Variable bitrate
     * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CBR``
       - Constant bitrate
+    * - ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``
+      - Constant quality
 
 
 
@@ -592,6 +594,14 @@ enum v4l2_mpeg_video_bitrate_mode -
     the average video bitrate. It is ignored if the video bitrate mode
     is set to constant bitrate.
 
+``V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY (integer)``
+    Constant quality level control. This control is applicable when
+    ``V4L2_CID_MPEG_VIDEO_BITRATE_MODE`` value is
+    ``V4L2_MPEG_VIDEO_BITRATE_MODE_CQ``. Valid range is 1 to 100
+    where 1 indicates lowest quality and 100 indicates highest quality.
+    Encoder will decide the appropriate quantization parameter and
+    bitrate to produce requested frame quality.
+
 ``V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (integer)``
     For every captured frame, skip this many subsequent frames (default
     0).
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 1c617b4..f94cc9d 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -199,6 +199,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 	static const char * const mpeg_video_bitrate_mode[] = {
 		"Variable Bitrate",
 		"Constant Bitrate",
+		"Constant Quality",
 		NULL
 	};
 	static const char * const mpeg_stream_type[] = {
@@ -982,6 +983,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_HEVC_SLICE_PARAMS:		return "HEVC Slice Parameters";
 	case V4L2_CID_MPEG_VIDEO_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_MPEG_VIDEO_HEVC_START_CODE:		return "HEVC Start Code";
+	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:		return "Constant Quality";
 
 	/* CAMERA controls */
 	/* Keep the order of the 'case's the same as in v4l2-controls.h! */
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 0ba1005..ca916da 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -375,6 +375,7 @@ enum v4l2_mpeg_video_aspect {
 enum v4l2_mpeg_video_bitrate_mode {
 	V4L2_MPEG_VIDEO_BITRATE_MODE_VBR = 0,
 	V4L2_MPEG_VIDEO_BITRATE_MODE_CBR = 1,
+	V4L2_MPEG_VIDEO_BITRATE_MODE_CQ  = 2,
 };
 #define V4L2_CID_MPEG_VIDEO_BITRATE		(V4L2_CID_MPEG_BASE+207)
 #define V4L2_CID_MPEG_VIDEO_BITRATE_PEAK	(V4L2_CID_MPEG_BASE+208)
@@ -742,6 +743,7 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
 #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
 #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
+#define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_MPEG_BASE + 645)
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

