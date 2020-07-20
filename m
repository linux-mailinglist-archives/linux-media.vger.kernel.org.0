Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 188C22260CF
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 15:24:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728163AbgGTNYH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 09:24:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726818AbgGTNYG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 09:24:06 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49159C0619D4
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:24:06 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s9so20196252ljm.11
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2020 06:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=MqUU4NwcPoS5ZN35RvVZCwFe9U5tn/4+nbmkAYnncfM=;
        b=PX9OEKkpI/jtSn3vID9ulI98KVskkSEehSSFoiChH9W5domW5LwSB3O8SlIYSY8G2W
         urdoQAOyCy4Fe5al/Ra+s6SR9G6P7B0NqKstWvfIUbilRDNaTb+lQlHtfwCb37av9a2Y
         8BhB17PzbPlxgRLv7YZ7g9odrv5W3O08vy/vLNmRM4Jgv2pyDewwFL2zkF/7gxtvBo/P
         BANErjpf/Ah1Hk4QG0q2RjEblvaVCspAI4Do6eKzNllNQdyvL1Diw8dYk1G9PoAPrQM2
         AxpIYtRde2mZ53hBPzygFN27BJWAqCpoh/e6V8eFLIU7a4BmilWhCdfMqVLSE+TCF2h3
         fsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=MqUU4NwcPoS5ZN35RvVZCwFe9U5tn/4+nbmkAYnncfM=;
        b=saoZuq7MWoa9X3vwlPaxjsL9FyCqYdty7Vqndw4Cg/5mDA31qgkslVXOS5IBbKPY4V
         82DX+E+N53R7LuQfon2YYmi7CijLS273dv7qTlQU1lThCwgEGzlDyZOAJwEcYwANRQzC
         8HZwo612zDn0h+FMM6f5MdbwYXGYJs0lmrmsveU05cmBPK9wmQ7OAquzillRhw4o28WB
         Iauh2oJVDEcA3QjAbVGqCIAJRC1h8yAOBaOEaGleEWk2WH9RST8Jk4r8+IGfIXSpoiMj
         CRLosQGfhN6+nUgKQ6HVPtLpKcoo1394Ll2ESZbPDtwNFQ9WXVatk8RD8ucXswRmzRGJ
         InLA==
X-Gm-Message-State: AOAM531fhBrDXllw4Wl0StN+wFsmK0rrMfwUbx0x8MnpMp1loLF7AVB8
        UGhIj6eutp5fBX6FsXhflIxCriDncX8=
X-Google-Smtp-Source: ABdhPJzGz39fa756++vvpvlHNQabX53riDhr9Hmp/C3WTe9Rem+aeAp3HPtWDrVkHE/Pqyfv5LcG3g==
X-Received: by 2002:a2e:7804:: with SMTP id t4mr10479933ljc.8.1595251444480;
        Mon, 20 Jul 2020 06:24:04 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id h6sm867829lfc.84.2020.07.20.06.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 06:24:03 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kamil Debski <kamil@wypas.org>,
        Jeongtae Park <jtp.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maheshwar Ajja <majja@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 3/6] media: v4l2-ctrl: Add frame-skip std encoder control
Date:   Mon, 20 Jul 2020 16:23:10 +0300
Message-Id: <20200720132313.4810-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
References: <20200720132313.4810-1-stanimir.varbanov@linaro.org>
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
 .../media/v4l/ext-ctrls-codec.rst             | 33 +++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls.c          | 10 ++++++
 include/uapi/linux/v4l2-controls.h            |  6 ++++
 3 files changed, 49 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
index b9d3f7ae6486..3e6b5d61500b 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-codec.rst
@@ -602,6 +602,39 @@ enum v4l2_mpeg_video_bitrate_mode -
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

