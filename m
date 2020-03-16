Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B52601875BF
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 23:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732852AbgCPWnH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 18:43:07 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:40034 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732791AbgCPWnH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 18:43:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584398586; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=8RXmUUdj99K0SeMhBlE3eAxq4g+Jx7OU47A7A+eN1IM=; b=xJqpOXfNPWwxZGznKjrSXlU8Ndh7Coeaxc7/tS26GpkMa+DaDQsj+kOTfLk4fEez2U6iO0a+
 6jRgQ+gadcpINC5FXE7P61J4a7IydSpnuAcqINV557OEEp1MdlMGlNhonU9PZHSvoMd9vDuf
 /YNMN3v2x9mMnUFTvIBjflgi7Oc=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e7000f2.7f4415630ab0-smtp-out-n03;
 Mon, 16 Mar 2020 22:42:58 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 594E9C433D2; Mon, 16 Mar 2020 22:42:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from majja-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: majja)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9149DC433CB;
        Mon, 16 Mar 2020 22:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9149DC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=majja@codeaurora.org
From:   Maheshwar Ajja <majja@codeaurora.org>
To:     mchehab@kernel.org
Cc:     Maheshwar Ajja <majja@codeaurora.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: v4l2-ctrl: Add H264 profile and levels
Date:   Mon, 16 Mar 2020 15:42:30 -0700
Message-Id: <1584398550-19727-1-git-send-email-majja@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add H264 profile "Contrained High" and H264 levels "5.2",
"6.0", "6.1" and "6.2".

Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
---
 drivers/media/v4l2-core/v4l2-ctrls.c | 5 +++++
 include/uapi/linux/v4l2-controls.h   | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 2928c5e..67ce711 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -336,6 +336,10 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"4.2",
 		"5",
 		"5.1",
+		"5.2",
+		"6.0",
+		"6.1",
+		"6.2",
 		NULL,
 	};
 	static const char * const h264_loop_filter[] = {
@@ -362,6 +366,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"Scalable High Intra",
 		"Stereo High",
 		"Multiview High",
+		"Constrained High",
 		NULL,
 	};
 	static const char * const vui_sar_idc[] = {
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 5a7bede..fbe3f82d 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -467,6 +467,10 @@ enum v4l2_mpeg_video_h264_level {
 	V4L2_MPEG_VIDEO_H264_LEVEL_4_2	= 13,
 	V4L2_MPEG_VIDEO_H264_LEVEL_5_0	= 14,
 	V4L2_MPEG_VIDEO_H264_LEVEL_5_1	= 15,
+	V4L2_MPEG_VIDEO_H264_LEVEL_5_2	= 16,
+	V4L2_MPEG_VIDEO_H264_LEVEL_6_0	= 17,
+	V4L2_MPEG_VIDEO_H264_LEVEL_6_1	= 18,
+	V4L2_MPEG_VIDEO_H264_LEVEL_6_2	= 19,
 };
 #define V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_ALPHA	(V4L2_CID_MPEG_BASE+360)
 #define V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA	(V4L2_CID_MPEG_BASE+361)
@@ -495,6 +499,7 @@ enum v4l2_mpeg_video_h264_profile {
 	V4L2_MPEG_VIDEO_H264_PROFILE_SCALABLE_HIGH_INTRA	= 14,
 	V4L2_MPEG_VIDEO_H264_PROFILE_STEREO_HIGH		= 15,
 	V4L2_MPEG_VIDEO_H264_PROFILE_MULTIVIEW_HIGH		= 16,
+	V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH		= 17,
 };
 #define V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT	(V4L2_CID_MPEG_BASE+364)
 #define V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH	(V4L2_CID_MPEG_BASE+365)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
