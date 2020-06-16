Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71C7B1FBFCC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2020 22:16:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731659AbgFPUPl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Jun 2020 16:15:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731631AbgFPUPh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Jun 2020 16:15:37 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F83BC061755
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 13:15:37 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id p18so133017eds.7
        for <linux-media@vger.kernel.org>; Tue, 16 Jun 2020 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=UhE+zbVBx6mzDVILaZnHei28SizFjJx0SU7vvL+dRhE=;
        b=n2WHA01s9EZkeKKyqUap0wZLNfqCP7Rl1UOcp9o8SfsO8C8DO9Qu0GWnbIyUDh4kRe
         8Cn6uwIh0W2kzAOPd2AjYqzYNsBJ/ToYFVs1CQl/Fc53WSPAgf4NT7hcT/0Q2qSea7AG
         mwSJ8BfyRgVLqjsgFIk/BtIkoacdZinAe2hy1qjQiGfUtJPF93N63BUBYkLNEU1qlYvt
         3mtjqBQA+yyK3HzSbCfJfj9LRaje4tQxjbEZ99tSpyqb11dvyP4L7WOxGkNfVHtoXW58
         qLMaC8Je3VE7+eVC3xn7Dzd4SoPl3gFmL9TKAR9esxd/HIgx9OU+lNFWt6xeUa1t9/Wl
         R04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=UhE+zbVBx6mzDVILaZnHei28SizFjJx0SU7vvL+dRhE=;
        b=GA7kSsw4odUWpoWyTWNtzMG/Q2eXIfFDlmn/ne5lznxeNLSUtiyKbvCZOZtfdfoB+L
         MEk0oVlIpfzRgMbUu9ILa7D4Q265In1elD5BN3Vy0oNUUPhvZ763RkNEonv8n0NGRVsA
         iq3kC7RVyy7zRqYMa+ncgrliNoEba9OqCRZYaa8UpyscKl//AiVCzGvUS0SJEYQWEp9T
         rM78zLIKXI1JmtUO1XPVQfx8XGeyLoKze7ZmtgzWqSB7sF3OXEhEAiOFIEXqUdI33Gpg
         cl1eiZF0igwVNK6LGJn3xShpmVpUGVax/g35IO8DoblAWtRmcWZegeWqLDDc1woGAu4G
         tv6g==
X-Gm-Message-State: AOAM533cOv1uJUas0taVk0sTHNG+EioKtBaE+aPllg76uGlkD1fQYHqd
        XIDJPPSWwXTL9dQHFlHJuaPAUi6x8cjdKQ==
X-Google-Smtp-Source: ABdhPJwZhGuBTTi2k/dcfpp0D9MSWNcg/wp+Nt6SmME+tlAslpJVGt7nDZbYn6k9lKEKWfk9nUcqoA==
X-Received: by 2002:a05:6402:cbc:: with SMTP id cn28mr4273902edb.220.1592338535462;
        Tue, 16 Jun 2020 13:15:35 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-38.ip.btc-net.bg. [212.5.158.38])
        by smtp.gmail.com with ESMTPSA id b14sm11602658ejq.105.2020.06.16.13.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 13:15:34 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 1/4] media: v4l2-ctrls: Add encoder constant quality control
Date:   Tue, 16 Jun 2020 23:14:43 +0300
Message-Id: <20200616201446.15996-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616201446.15996-1-stanimir.varbanov@linaro.org>
References: <20200616201446.15996-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Maheshwar Ajja <majja@codeaurora.org>

When V4L2_CID_MPEG_VIDEO_BITRATE_MODE value is
V4L2_MPEG_VIDEO_BITRATE_MODE_CQ, encoder will produce
constant quality output indicated by
V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY control value.
Encoder will choose appropriate quantization parameter
and bitrate to produce requested frame quality level.

Signed-off-by: Maheshwar Ajja <majja@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../userspace-api/media/v4l/ext-ctrls-codec.rst        | 10 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c                   |  2 ++
 include/uapi/linux/v4l2-controls.h                     |  2 ++
 3 files changed, 14 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d0d506a444b1..b9d3f7ae6486 100644
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
index 3f3fbcd60cc6..bc00d02e411f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -200,6 +200,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 	static const char * const mpeg_video_bitrate_mode[] = {
 		"Variable Bitrate",
 		"Constant Bitrate",
+		"Constant Quality",
 		NULL
 	};
 	static const char * const mpeg_stream_type[] = {
@@ -832,6 +833,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_GOP_CLOSURE:	return "Video GOP Closure";
 	case V4L2_CID_MPEG_VIDEO_PULLDOWN:	return "Video Pulldown";
 	case V4L2_CID_MPEG_VIDEO_BITRATE_MODE:	return "Video Bitrate Mode";
+	case V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY:	return "Constant Quality";
 	case V4L2_CID_MPEG_VIDEO_BITRATE:	return "Video Bitrate";
 	case V4L2_CID_MPEG_VIDEO_BITRATE_PEAK:	return "Video Peak Bitrate";
 	case V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION: return "Video Temporal Decimation";
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 62271418c1be..0f7e4388dcce 100644
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
2.17.1

