Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A09214C64
	for <lists+linux-media@lfdr.de>; Sun,  5 Jul 2020 14:12:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbgGEMME (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Jul 2020 08:12:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726933AbgGEMME (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Jul 2020 08:12:04 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9546C08C5DF
        for <linux-media@vger.kernel.org>; Sun,  5 Jul 2020 05:12:03 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id n26so25598767ejx.0
        for <linux-media@vger.kernel.org>; Sun, 05 Jul 2020 05:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=c3pGEpF7DAEXcC0pN3mSKCevTRzMwQB5I1tTMzDxF0M=;
        b=vbZMpbtLs7CMVmEYX3n7vzrtz2n0vXIVLeeIYUduO9/JCmDVzmpE694X79b/QX8vbk
         g79hDHalKGmtcUL12AUmRKvMKm1EBXLb1nyJH7sS/R7R/YunYkUlpLDWakrxNIHfvO6m
         EKYd5Rghwsgo34jU1V8Kk0yV/7jBrcc2tPGQupqn0K7yl83ucAPK/zzudLC2BH4e65tx
         X6O3YYZ4f1tloPGYPuULuSiNoZMYUuIBy6Osww1D0Bmx0lXeoKn9uByUILggLchm9IKF
         grffUmDqIbnH+zRGIG70MjEr5QUfwh2NgcV/iWw1zagwRdSt8ZqA9jRqThntJprFW5Ar
         nqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=c3pGEpF7DAEXcC0pN3mSKCevTRzMwQB5I1tTMzDxF0M=;
        b=lj/i1jEprxzbVlcwEwomcMO6qoNCtEdHL9iLK6EdFA6kvF6B6NTJYAxf+7EKUtMH5v
         Z/64yo+fbrioWa8CXci13/Hv6cH/MlgBSWhDlJSAl/jPLVvegxz3qsUZ9ZuNJTSkl054
         sPddEpc0HVjtnfePp1unfytuvtYNNZGZ7Eft/5CO5C5X2EVQgXyW7XnRtEsmTihDoGer
         QExpQlN+x2b4mlOdcF2kxI37sViXBSC86W1RivH52rBDcsOotH13Q5WXjqxW2FlyPP+8
         b+gUngZGJ5//Ds8bcWTXEHF3bWsh1emTohSkcODGEFY3/GqdCV/+N8OlY9ARY1IDpqTi
         yhbg==
X-Gm-Message-State: AOAM5333l0azaG/AHIY5wc3719DZdx0DUIzYHf0UOWKxAM6GR+7zMc6u
        pHNi5JOnhZZXBv9y9QL8ZTPY12Qn2EcZKA==
X-Google-Smtp-Source: ABdhPJwegaq+qx2Qs3TctwwlzOm8u+gVW6hpz/YzvS9BnNgGVly0C6L2+37x3HsFr6j0j1L5FmD2LA==
X-Received: by 2002:a17:906:8316:: with SMTP id j22mr38504760ejx.97.1593951122243;
        Sun, 05 Jul 2020 05:12:02 -0700 (PDT)
Received: from localhost.localdomain (212-5-158-133.ip.btc-net.bg. [212.5.158.133])
        by smtp.gmail.com with ESMTPSA id j64sm1517458edd.61.2020.07.05.05.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2020 05:12:01 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 1/4] media: v4l2-ctrl: Add frame-skip std encoder control
Date:   Sun,  5 Jul 2020 15:11:25 +0300
Message-Id: <20200705121128.5250-2-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
References: <20200705121128.5250-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds encoders standard v4l2 control for frame-skip. The control
is a copy of a custom encoder control so that other v4l2 encoder
drivers can use it.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../media/v4l/ext-ctrls-codec.rst             | 32 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 10 ++++++
 include/uapi/linux/v4l2-controls.h            |  6 ++++
 3 files changed, 48 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index d0d506a444b1..a8b4c0b40747 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -592,6 +592,38 @@ enum v4l2_mpeg_video_bitrate_mode -
     the average video bitrate. It is ignored if the video bitrate mode
     is set to constant bitrate.
 
+``V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE (enum)``
+
+enum v4l2_mpeg_video_frame_skip_mode -
+    Indicates in what conditions the encoder should skip frames. If
+    encoding a frame would cause the encoded stream to be larger then a
+    chosen data limit then the frame will be skipped. Possible values
+    are:
+
+
+.. tabularcolumns:: |p{9.2cm}|p{8.3cm}|
+
+.. raw:: latex
+
+    \small
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+
+    * - ``V4L2_MPEG_FRAME_SKIP_MODE_DISABLED``
+      - Frame skip mode is disabled.
+    * - ``V4L2_MPEG_FRAME_SKIP_MODE_LEVEL_LIMIT``
+      - Frame skip mode enabled and buffer limit is set by the chosen
+	level and is defined by the standard.
+    * - ``V4L2_MPEG_FRAME_SKIP_MODE_BUF_LIMIT``
+      - Frame skip mode enabled and buffer limit is set by the VBV
+	(MPEG1/2/4) or CPB (H264) buffer size control.
+
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (integer)``
     For every captured frame, skip this many subsequent frames (default
     0).
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index 3f3fbcd60cc6..d088acfa6dd8 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -590,6 +590,12 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		"External",
 		NULL,
 	};
+	static const char * const mpeg_video_frame_skip[] = {
+		"Disabled",
+		"Level Limit",
+		"VBV/CPB Limit",
+		NULL,
+	};
 
 	switch (id) {
 	case V4L2_CID_MPEG_AUDIO_SAMPLING_FREQ:
@@ -651,6 +657,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return flash_strobe_source;
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
 		return header_mode;
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+		return mpeg_video_frame_skip;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
 		return multi_slice;
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
@@ -844,6 +852,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
 	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
 	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
@@ -1265,6 +1274,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_FLASH_LED_MODE:
 	case V4L2_CID_FLASH_STROBE_SOURCE:
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 62271418c1be..4e1526175a4c 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -742,6 +742,12 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 #define V4L2_CID_MPEG_VIDEO_HEVC_HIER_CODING_L6_BR	(V4L2_CID_MPEG_BASE + 642)
 #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
 #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
+#define V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE		(V4L2_CID_MPEG_BASE + 645)
+enum v4l2_mpeg_video_frame_skip_mode {
+	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED	= 0,
+	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
+	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT	= 2,
+};
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
-- 
2.17.1

