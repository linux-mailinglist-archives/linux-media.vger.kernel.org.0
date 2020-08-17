Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50DC224619F
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 10:59:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728152AbgHQI7U (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 04:59:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726930AbgHQI7T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 04:59:19 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B51D9C061389
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 01:59:18 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id r2so14155850wrs.8
        for <linux-media@vger.kernel.org>; Mon, 17 Aug 2020 01:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=Jdr7HG0I+BWc3UfIli5Unc2Xw8mJlIZM3+wr92pTL+Q=;
        b=ggP3x2KbPgJvf3ElMuqNvM2/4ujwMxF5id0JY5GtBhqdHn9xgkL32MKe3Jpb5e5Z33
         M8qU6uDMkQONjSiYJ4J2DPo+OS2an3lViX7IMXunQG8h3RdDDeacBn31ZfydREdry7ho
         uPd9dkxOPFT+DWttd4BxWXEJRyG9Ph6y6JQ5pg+FLT0B/pv49RVAXZh53LnJIw8oH1PW
         rN31FCTa/tm0Iz9kCPKYRL1y02FgGAU/yYpA3TbV2RjYeoEVIBoHQ0ZGeQEXbWShm6rq
         XEh5KDhtvId38eD6LoILxn8+bPJTHeSaIrkn/XIvL5/la9qo8+Ld4cTyqPcES0QncyPR
         Kbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Jdr7HG0I+BWc3UfIli5Unc2Xw8mJlIZM3+wr92pTL+Q=;
        b=bBe+kE1P30a5/5wFQ69bDkXYJMMCrmKXDqcvwDohMSc5RHjeTYzJt12tZ39Ot7gLpv
         4hFLcSxxP6EWWDnV4kGHJevomp05WOVw94IpeGYZinyEmAy1m5fpxzafHkkgXJtkiQDC
         zZ7w373hCjmmNXuwG3hSdLoK3H9hb2dg5r/qb/m34XGYBj6jIMc2pTxK+Y347iAZ7VS5
         9tfvctyJ4IwJGPHp7rGeOKfS/GR0X+ppCKnNWlwh18NfQuxid6v7bm1A5EnBRG5A2UUy
         51goVmzhIJPVQyduJqBSGSkssX0sp3+5tS+wu07AttXn0rE2zoYBRhe57CRruYNmjFEq
         OG0Q==
X-Gm-Message-State: AOAM532ruGKYsvV8p64Sx1+fp9eMAVy2wXHobbbstIoNUfc61qPLw4x8
        E0RqcWJb9r6rOLmaBSw8kPJpwp7jEieoKCq9
X-Google-Smtp-Source: ABdhPJzVkyM8/q4NPkgLATpzzXOY7f2bMYtgtvyz2/FwWFcC+myOFqG7+SqccStg6rIjtSK9jIG2Yg==
X-Received: by 2002:adf:c981:: with SMTP id f1mr14181945wrh.14.1597654757224;
        Mon, 17 Aug 2020 01:59:17 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z127sm29439883wme.44.2020.08.17.01.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 01:59:16 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2] v4l2-ctrl: Add VP9 codec levels
Date:   Mon, 17 Aug 2020 11:58:52 +0300
Message-Id: <20200817085852.20415-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
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
---
v2: Added links to webmproject in commit message and docs.

 .../media/v4l/ext-ctrls-codec.rst             | 43 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 21 +++++++++
 include/uapi/linux/v4l2-controls.h            | 17 ++++++++
 3 files changed, 81 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d0d506a444b1..23a45172404a 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -3316,6 +3316,49 @@ enum v4l2_mpeg_video_vp9_profile -
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
index 3f3fbcd60cc6..359dc737053d 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -474,6 +474,23 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
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
@@ -685,6 +702,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return vp8_profile;
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
 		return vp9_profile;
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
+		return vp9_level;
 	case V4L2_CID_JPEG_CHROMA_SUBSAMPLING:
 		return jpeg_chroma_subsampling;
 	case V4L2_CID_DV_TX_MODE:
@@ -938,6 +957,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_VPX_P_FRAME_QP:		return "VPX P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:			return "VP8 Profile";
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:			return "VP9 Profile";
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:			return "VP9 Level";
 	case V4L2_CID_MPEG_VIDEO_VP8_FRAME_HEADER:		return "VP8 Frame Header";
 
 	/* HEVC controls */
@@ -1294,6 +1314,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_MPEG_VIDEO_VPX_GOLDEN_FRAME_SEL:
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_VP9_PROFILE:
+	case V4L2_CID_MPEG_VIDEO_VP9_LEVEL:
 	case V4L2_CID_DETECT_MD_MODE:
 	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
 	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 62271418c1be..1b0bc79c1bc3 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -650,6 +650,23 @@ enum v4l2_mpeg_video_vp9_profile {
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

