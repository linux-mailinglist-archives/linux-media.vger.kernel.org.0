Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF942279E7
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 09:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgGUHwC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 03:52:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728072AbgGUHwA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 03:52:00 -0400
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45507C0619D9
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 00:52:00 -0700 (PDT)
Received: by mail-lf1-x143.google.com with SMTP id u12so11135829lff.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2020 00:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=j9CTrGuuoHUlZAGWfnV64jcGILUKrabUBS1No8VUp1I=;
        b=Pqv9oNkm+9Pyllwjqpce/RwRsaSGWGr+5lDHn44Yg8zbs2uz60bhclQNYbB+p1Hcjc
         VQ1IgVfV0bRdqmrENvzzsrYv6a1kEqITdKiiCdBY91izlprm+tK/KiHxn/Kp9XJh+iUG
         Vos3S2owafkRuZZTsRqGs0RjMXKcaUkZ2pCPEPdmnnWU4uzQzTk/NYhU00OO/yiCa+tL
         Njtzj2G/F5xm0WX+Y7IJM3DvrfNYC4qfQjXMOj0lO/likqKukAyy7/WL126HeEUEX997
         9Nx96Zu/Hlny6SS8VgLvOxQI2oyJRrUNpWyIus56AnoP+rYLNYanke4lrOnFZBAr/l4e
         S8Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=j9CTrGuuoHUlZAGWfnV64jcGILUKrabUBS1No8VUp1I=;
        b=sB3ZDpTtAuHqN04WG/O6o16+dC9etYqaLrG+ep65VzrVZhC/Gj7Ue5aTJDehAclATl
         lN3ObC9GCAPCQQTovVP2rXJW8hHr8Ky78d6vXkervmQPOp9l0Ug+OyeaseWsrZjrIFaE
         KKpKBTFiO9/wK7NiwJ42A88uk+2QpOgoJjbYtaGZBM+NKfb1uvqPOfRShea9DO95r6bd
         pTrKQ5F/qosRrXRMYUVm/SRkznwR45zuC9150MZpMBT1AP5Wy5lc2i90FWWjDGqObuEQ
         7zwWmz3te3ZADCFwrlaxhJfZpGir8lGks/tZzm75JW1ka7iMn+A2YQWn+R+Y5jzOrmPb
         /rKA==
X-Gm-Message-State: AOAM5310cy+hNJNNm1PyIooJQHpbbJxihDWYrEi779aHTkEZ4bLNj7d6
        UsRpTfYyhoez1aSD0Lt3+8cLO6kHQp4=
X-Google-Smtp-Source: ABdhPJwhwYi8BcbhhK+d0NPV7/Ock8IRaNVE45gU8A1BPsbDTrV6VzVsxLBZz5UDMstanyJRUsJ3Tg==
X-Received: by 2002:a19:e204:: with SMTP id z4mr3654835lfg.121.1595317918217;
        Tue, 21 Jul 2020 00:51:58 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id d2sm4045334ljg.6.2020.07.21.00.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2020 00:51:57 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v2 3/6] media: v4l2-ctrl: Add frame-skip std encoder control
Date:   Tue, 21 Jul 2020 10:45:35 +0300
Message-Id: <20200721074538.505-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721074538.505-1-stanimir.varbanov@linaro.org>
References: <20200721074538.505-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Adds encoders standard v4l2 control for frame-skip. The control
is a copy of a custom encoder control so that other v4l2 encoder
drivers can use it.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/ext-ctrls-codec.rst             | 38 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 10 +++++
 include/uapi/linux/v4l2-controls.h            |  6 +++
 3 files changed, 54 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index b9d3f7ae6486..985e4c2d29bf 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -602,6 +602,40 @@ enum v4l2_mpeg_video_bitrate_mode -
     Encoder will decide the appropriate quantization parameter and
     bitrate to produce requested frame quality.
 
+
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
+        level and is defined by the standard.
+    * - ``V4L2_MPEG_FRAME_SKIP_MODE_BUF_LIMIT``
+      - Frame skip mode enabled and buffer limit is set by the
+        :ref:`VBV (MPEG1/2/4) <v4l2-mpeg-video-vbv-size>` or
+        :ref:`CPB (H264) buffer size <v4l2-mpeg-video-h264-cpb-size>` control.
+
+.. raw:: latex
+
+    \normalsize
+
 ``V4L2_CID_MPEG_VIDEO_TEMPORAL_DECIMATION (integer)``
     For every captured frame, skip this many subsequent frames (default
     0).
@@ -1173,6 +1207,8 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     Quantization parameter for an B frame for MPEG4. Valid range: from 1
     to 31.
 
+.. _v4l2-mpeg-video-vbv-size:
+
 ``V4L2_CID_MPEG_VIDEO_VBV_SIZE (integer)``
     The Video Buffer Verifier size in kilobytes, it is used as a
     limitation of frame skip. The VBV is defined in the standard as a
@@ -1210,6 +1246,8 @@ enum v4l2_mpeg_video_h264_entropy_mode -
     Force a key frame for the next queued buffer. Applicable to
     encoders. This is a general, codec-agnostic keyframe control.
 
+.. _v4l2-mpeg-video-h264-cpb-size:
+
 ``V4L2_CID_MPEG_VIDEO_H264_CPB_SIZE (integer)``
     The Coded Picture Buffer size in kilobytes, it is used as a
     limitation of frame skip. The CPB is defined in the H264 standard as
diff --git a/drivers/media/v4l2-core/v4l2-ctrls.c b/drivers/media/v4l2-core/v4l2-ctrls.c
index bc00d02e411f..eb403858d325 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls.c
@@ -591,6 +591,12 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
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
@@ -652,6 +658,8 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
 		return flash_strobe_source;
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
 		return header_mode;
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
+		return mpeg_video_frame_skip;
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
 		return multi_slice;
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
@@ -846,6 +854,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_MPEG_VIDEO_MB_RC_ENABLE:			return "H264 MB Level Rate Control";
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:			return "Sequence Header Mode";
 	case V4L2_CID_MPEG_VIDEO_MAX_REF_PIC:			return "Max Number of Reference Pics";
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:		return "Frame Skip Mode";
 	case V4L2_CID_MPEG_VIDEO_H263_I_FRAME_QP:		return "H263 I-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_P_FRAME_QP:		return "H263 P-Frame QP Value";
 	case V4L2_CID_MPEG_VIDEO_H263_B_FRAME_QP:		return "H263 B-Frame QP Value";
@@ -1267,6 +1276,7 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_FLASH_LED_MODE:
 	case V4L2_CID_FLASH_STROBE_SOURCE:
 	case V4L2_CID_MPEG_VIDEO_HEADER_MODE:
+	case V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE:
 	case V4L2_CID_MPEG_VIDEO_MULTI_SLICE_MODE:
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 0f7e4388dcce..053827cda8e6 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -744,6 +744,12 @@ enum v4l2_cid_mpeg_video_hevc_size_of_length_field {
 #define V4L2_CID_MPEG_VIDEO_REF_NUMBER_FOR_PFRAMES	(V4L2_CID_MPEG_BASE + 643)
 #define V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR	(V4L2_CID_MPEG_BASE + 644)
 #define V4L2_CID_MPEG_VIDEO_CONSTANT_QUALITY		(V4L2_CID_MPEG_BASE + 645)
+#define V4L2_CID_MPEG_VIDEO_FRAME_SKIP_MODE		(V4L2_CID_MPEG_BASE + 646)
+enum v4l2_mpeg_video_frame_skip_mode {
+	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_DISABLED	= 0,
+	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_LEVEL_LIMIT	= 1,
+	V4L2_MPEG_VIDEO_FRAME_SKIP_MODE_BUF_LIMIT	= 2,
+};
 
 /*  MPEG-class control IDs specific to the CX2341x driver as defined by V4L2 */
 #define V4L2_CID_MPEG_CX2341X_BASE				(V4L2_CTRL_CLASS_MPEG | 0x1000)
-- 
2.17.1

