Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF91E261DB2
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 21:41:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731696AbgIHTlF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:41:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730935AbgIHPyn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 11:54:43 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7F8C061346
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 05:33:30 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id c8so15798664edv.5
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 05:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=1+TohLeDYlN1Yf+ps+jhwsXTShnc7sKaopngyekPTD0=;
        b=m9ej34LWVzwItDY8WU/x8L+TqkZNInkR1/Skvw2d3ykFznu6wLP+B0oz+fyvbt4OPY
         8uGbEHZ0D/5v4WVfNI4dQGbJSbY4VMehOiRRbJ9TPHfO1Oj+RASJtGk/A7eNeh8hCz1A
         SMvtjJobtXQu0rnyHarJ8WqJdmMYKVXkum88NY9KTvJb4NoiZLF09P+wGg5dJMull1Qg
         v3yCHevySMP01igaSY5eiaW8wd/l1JSgAiyodLHQuH3kPmz0IMwkXCzcPpklLCbxPoSS
         CSNBhQYz62feVI0pvXHIEToxFVNnDIAW43XXChCwb5aBdK1/j9fH8GKHqyZHEcb1Ldby
         IGHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=1+TohLeDYlN1Yf+ps+jhwsXTShnc7sKaopngyekPTD0=;
        b=DS48r9nUAlvnGLMioIIwdr9Wm6oGc/5n8Yo3w2ehASvcp3HgY5FaM6MDUTp0qswkqb
         xUgvdUG+V+KfsgT+biqfY2JgkYkdMtj8aTom7GeyKFppicRwkgduHKmBz1rtvrQ9cDA8
         4DYUroBS4tJRXgDd432N4z0+y8bYBgv7Y/jMipfo3pt4wMOW+MGO6CGvnFe1bkhhw20U
         YXO8c+un2YIbSeEPIFLEIJiWTVXqK8Ai44xTdC7oNlMGpl97ggm9ODCqAE3XSUsZ5cAJ
         miuG/fAiisQi3HtwYd9sq4g9Am3MpTJxhrFztllL0NCmN0P72ZwFZAwacgJnoa8EHa9b
         IR8A==
X-Gm-Message-State: AOAM531AweX4JLB4qT48IKcrxOr0ZygEkiCtNITGXQxG3XzUs2VwSoCV
        XB2DQR8WfRHP1j4BqOSYnAMrBw==
X-Google-Smtp-Source: ABdhPJx7ZLzA73WVBugJeh+bp5FAXxemrmcVuaOUhlQMnyasWc7Zd1BBQS2MQPiYvctkJg4skx5jEg==
X-Received: by 2002:a50:cf0b:: with SMTP id c11mr10801599edk.87.1599568406173;
        Tue, 08 Sep 2020 05:33:26 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id y9sm17499744edo.37.2020.09.08.05.33.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 05:33:25 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 1/6] v4l2-ctrl: Add VP9 codec levels
Date:   Tue,  8 Sep 2020 15:32:16 +0300
Message-Id: <20200908123221.2793-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
References: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add menu control for VP9 codec levels. A total of 14 levels are
defined for Profile 0 (8bit) and Profile 2 (10bit). Each level
is a set of constrained bitstreams coded with targeted resolutions,
frame rates, and bitrates.

The definitions have been taken from webm project [1].

[1] https://www.webmproject.org/vp9/levels/

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../media/v4l/ext-ctrls-codec.rst             | 43 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 21 +++++++++
 include/uapi/linux/v4l2-controls.h            | 17 ++++++++
 3 files changed, 81 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index 289d380e2cf0..ce728c757eaf 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3383,6 +3383,49 @@ enum v4l2_mpeg_video_vp9_profile -
     * - ``V4L2_MPEG_VIDEO_VP9_PROFILE_3``
       - Profile 3
 
+.. _v4l2-mpeg-video-vp9-level:
+
+``V4L2_CID_MPEG_VIDEO_VP9_LEVEL (enum)``
+
+enum v4l2_mpeg_video_vp9_level -
+    This control allows selecting the level for VP9 encoder.
+    This is also used to enumerate supported levels by VP9 encoder or decoder.
+    More information can be found at
+    `webmproject <https://www.webmproject.org/vp9/levels/>`__. Possible values are:
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_1_0``
+      - Level 1
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_1_1``
+      - Level 1.1
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_2_0``
+      - Level 2
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_2_1``
+      - Level 2.1
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_3_0``
+      - Level 3
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_3_1``
+      - Level 3.1
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_4_0``
+      - Level 4
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_4_1``
+      - Level 4.1
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_0``
+      - Level 5
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_1``
+      - Level 5.1
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_5_2``
+      - Level 5.2
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_0``
+      - Level 6
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_1``
+      - Level 6.1
+    * - ``V4L2_MPEG_VIDEO_VP9_LEVEL_6_2``
+      - Level 6.2
+
 
 High Efficiency Video Coding (HEVC/H.265) Control Reference
 ===========================================================
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 73f3d65957ff..bd7f330c941c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -475,6 +475,23 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"3",
 		NULL,
 	};
+	static const char * const vp9_level[] = {
+		"1",
+		"1.1",
+		"2",
+		"2.1",
+		"3",
+		"3.1",
+		"4",
+		"4.1",
+		"5",
+		"5.1",
+		"5.2",
+		"6",
+		"6.1",
+		"6.2",
+		NULL,
+	};
 
 	static const char * const flash_led_mode[] = {
 		"Off",
@@ -694,6 +711,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return vp8_profile;
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
 		return vp9_profile;
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
+		return vp9_level;
 	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
 		return jpeg_chroma_subsampling;
 	case V4L2_CID_DV_TX_MODE:
@@ -950,6 +969,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:			return "VP9 Level";
 	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:		return "VP8 Frame Header";
 
 	/* HEVC controls */
@@ -1307,6 +1327,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
 	case V4L2_CID_DETECT_MD_MODE:
 	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 053827cda8e6..a184c4939438 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -651,6 +651,23 @@ enum v4l2_mpeg_video_vp9_profile {
 	V4L2_MPEG_VIDEO_VP9_PROFILE_2				= 2,
 	V4L2_MPEG_VIDEO_VP9_PROFILE_3				= 3,
 };
+#define V4L2_CID_MPEG_VIDEO_VP9_LEVEL			(V4L2_CID_MPEG_BASE+513)
+enum v4l2_mpeg_video_vp9_level {
+	V4L2_MPEG_VIDEO_VP9_LEVEL_1_0	= 0,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_1_1	= 1,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_2_0	= 2,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_2_1	= 3,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_3_0	= 4,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_3_1	= 5,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_4_0	= 6,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_4_1	= 7,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_5_0	= 8,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_5_1	= 9,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_5_2	= 10,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_6_0	= 11,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_6_1	= 12,
+	V4L2_MPEG_VIDEO_VP9_LEVEL_6_2	= 13,
+};
 
 /* CIDs for HEVC encoding. */
 
-- 
2.17.1

