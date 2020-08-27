Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF5C425422E
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 11:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728536AbgH0J0R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 05:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728582AbgH0JZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:14 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64206C061232
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:14 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id w2so4272311wmi.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=WuGQ7x3HV2UIS0keqFLnckrhb9rx8hQfucm7+tXVecY=;
        b=Uv80lNirYdYtow/WgPULTxu46GIn8sRko00tIPzFQNeg2+7EkZsorymB2+0K+xbD+6
         a7HaEnxeZeg1EsD1txk+d//8tYERRq4c3iVnR8N22hOkv+id/Y+VtKHG/k5cfwrERGji
         TGGgnt+qp2jzj5cKWIFoMCs2CIDZWrSXUv7zF2sVDRgBAODxno8P6h+qIjFjXCwOVpTL
         QHJDM1dqzzZPNW9trbJAS4oa2y2qNl7znR1P7rmx6TE7c6W6c8FPEAJH9glXBrnLB49z
         CbzmEfztI4Jr0RJihCbQfZJdBz3AMqoeVj4DaSlYOftZa9uIh6tHgwAfMK2lZulGEA3L
         S9AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=WuGQ7x3HV2UIS0keqFLnckrhb9rx8hQfucm7+tXVecY=;
        b=Zp8ruA022RKMGpbQM6DQBRx7j9TLQIdUsB/zMrqmqgRY/hw0ru9QLMGz4e/sF0Kj91
         h48q1+8JfUrizvDrG7X2Vo+1hQ69Pl/+rJD8WGbINbL/QtXHy9at7oPgVv+DGux+stFZ
         9lpw5OeRQ+ShEIzht1GI91EXUW8iOQfgH8vkN09lOrjf1OK6+n8RKQcyS6mJfHy5OfFB
         ynAv3VGtWvrLnmmBTaw8pbYertkZTmkCsww3bnAEmuO20GORAVRaY3WcrTsppcAdW/nJ
         YBJ3z+ObJaxNIKK/c1Jue6J1bLUyISOtLcodzuz7RrM7nE6HocpB93TFyiWQ+J9JVTX9
         +XSQ==
X-Gm-Message-State: AOAM530gxFNGCtj35En/R6NnCijLqfV4DpXZw0CXuPAU0olGh+5znswY
        lqVfrrMYu8zXEz4XT5uwYJMT7Q==
X-Google-Smtp-Source: ABdhPJwV8Cd18RjbvLfbtnRqHESJsPzZ60KvqrOmN1b+LtxA8lit8wOuHqgDtwZsvsdo5AWebu17yw==
X-Received: by 2002:a05:600c:22c8:: with SMTP id 8mr10182323wmg.143.1598520312867;
        Thu, 27 Aug 2020 02:25:12 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.25.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:25:12 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 08/13] venus: hfi_plat_v6: Populate capabilities for v6
Date:   Thu, 27 Aug 2020 12:24:12 +0300
Message-Id: <20200827092417.16040-9-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new hfi platform file with capabilities of hfi v6.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/Makefile    |   1 +
 .../media/platform/qcom/venus/hfi_platform.c  |   2 +
 .../media/platform/qcom/venus/hfi_platform.h  |   1 +
 .../platform/qcom/venus/hfi_platform_v6.c     | 325 ++++++++++++++++++
 4 files changed, 329 insertions(+)
 create mode 100644 drivers/media/platform/qcom/venus/hfi_platform_v6.c

diff --git a/drivers/media/platform/qcom/venus/Makefile b/drivers/media/platform/qcom/venus/Makefile
index 09ebf4671692..a5d2da537c51 100644
--- a/drivers/media/platform/qcom/venus/Makefile
+++ b/drivers/media/platform/qcom/venus/Makefile
@@ -5,6 +5,7 @@ venus-core-objs += core.o helpers.o firmware.o \
 		   hfi_venus.o hfi_msgs.o hfi_cmds.o hfi.o \
 		   hfi_parser.o pm_helpers.o dbgfs.o \
 		   hfi_platform.o hfi_platform_v4.o \
+		   hfi_platform_v6.o \
 
 venus-dec-objs += vdec.o vdec_ctrls.o
 venus-enc-objs += venc.o venc_ctrls.o
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.c b/drivers/media/platform/qcom/venus/hfi_platform.c
index 06f46900cae8..8f47804e973f 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform.c
@@ -9,6 +9,8 @@ const struct hfi_platform *hfi_platform_get(enum hfi_version version)
 	switch (version) {
 	case HFI_VERSION_4XX:
 		return &hfi_plat_v4;
+	case HFI_VERSION_6XX:
+		return &hfi_plat_v6;
 	default:
 		break;
 	}
diff --git a/drivers/media/platform/qcom/venus/hfi_platform.h b/drivers/media/platform/qcom/venus/hfi_platform.h
index f2a6512b3950..f5f019282eab 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform.h
+++ b/drivers/media/platform/qcom/venus/hfi_platform.h
@@ -52,6 +52,7 @@ struct hfi_platform {
 };
 
 extern const struct hfi_platform hfi_plat_v4;
+extern const struct hfi_platform hfi_plat_v6;
 
 const struct hfi_platform *hfi_platform_get(enum hfi_version version);
 unsigned long hfi_platform_get_codec_vpp_freq(enum hfi_version version, u32 codec,
diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
new file mode 100644
index 000000000000..e76d69a66b6f
--- /dev/null
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020, The Linux Foundation. All rights reserved.
+ */
+#include "hfi_platform.h"
+
+static const struct hfi_plat_caps caps[] = {
+{
+	.codec = HFI_VIDEO_CODEC_H264,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.cap_bufs_mode_dynamic = true,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 5760, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 5760, 1},
+	/* ((5760 * 2880) / 256) */
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 36, 64800, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 200000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 36, 1958400, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
+	.num_caps = 9,
+	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_52},
+	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_52},
+	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_52},
+	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_52},
+	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_52},
+	.num_pl = 5,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_HEVC,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.cap_bufs_mode_dynamic = true,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 2073600, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
+	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 3, 1},
+	.num_caps = 10,
+	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
+	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[4] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.fmts[5] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_P010},
+	.fmts[6] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_YUV420_TP10},
+	.num_fmts = 7,
+}, {
+	.codec = HFI_VIDEO_CODEC_VP8,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.cap_bufs_mode_dynamic = true,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 2073600, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
+	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 3, 1},
+	.num_caps = 10,
+	.pl[0] = {HFI_VPX_PROFILE_MAIN, HFI_VPX_LEVEL_VERSION_0},
+	.pl[1] = {HFI_VPX_PROFILE_MAIN, HFI_VPX_LEVEL_VERSION_1},
+	.pl[2] = {HFI_VPX_PROFILE_MAIN, HFI_VPX_LEVEL_VERSION_2},
+	.pl[3] = {HFI_VPX_PROFILE_MAIN, HFI_VPX_LEVEL_VERSION_3},
+	.num_pl = 4,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_VP9,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.cap_bufs_mode_dynamic = true,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 2073600, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
+	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 3, 1},
+	.num_caps = 10,
+	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
+	.pl[1] = {HFI_VP9_PROFILE_P2_10B, 200},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[4] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.fmts[5] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_P010},
+	.fmts[6] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_YUV420_TP10},
+	.num_fmts = 7,
+}, {
+	.codec = HFI_VIDEO_CODEC_MPEG2,
+	.domain = VIDC_SESSION_TYPE_DEC,
+	.cap_bufs_mode_dynamic = true,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 8160, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 40000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 244800, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 30, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
+	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 1, 1},
+	.num_caps = 10,
+	.pl[0] = {HFI_MPEG2_PROFILE_SIMPLE, HFI_MPEG2_LEVEL_H14},
+	.pl[1] = {HFI_MPEG2_PROFILE_MAIN, HFI_MPEG2_LEVEL_H14},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_OUTPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[1] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV12},
+	.fmts[3] = {HFI_BUFFER_OUTPUT2, HFI_COLOR_FORMAT_NV21},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_H264,
+	.domain = VIDC_SESSION_TYPE_ENC,
+	.cap_bufs_mode_dynamic = true,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 8192, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 1036800, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 3, 1},
+	.caps[9] = {HFI_CAPABILITY_PEAKBITRATE, 32000, 160000000, 1},
+	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 5, 1},
+	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
+	.caps[12] = {HFI_CAPABILITY_LCU_SIZE, 16, 16, 1},
+	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 1, 1},
+	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 5, 1},
+	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
+	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
+	.caps[17] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
+	.caps[18] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 2, 1},
+	.caps[19] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
+	.caps[20] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
+	.num_caps = 21,
+	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_52},
+	.pl[1] = {HFI_H264_PROFILE_MAIN, HFI_H264_LEVEL_52},
+	.pl[2] = {HFI_H264_PROFILE_HIGH, HFI_H264_LEVEL_52},
+	.pl[3] = {HFI_H264_PROFILE_CONSTRAINED_BASE, HFI_H264_LEVEL_52},
+	.pl[4] = {HFI_H264_PROFILE_CONSTRAINED_HIGH, HFI_H264_LEVEL_52},
+	.num_pl = 5,
+	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
+	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
+	.fmts[3] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_P010},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_HEVC,
+	.domain = VIDC_SESSION_TYPE_ENC,
+	.cap_bufs_mode_dynamic = true,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 8192, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 1036800, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 3, 1},
+	.caps[9] = {HFI_CAPABILITY_PEAKBITRATE, 32000, 160000000, 1},
+	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 5, 1},
+	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
+	.caps[12] = {HFI_CAPABILITY_LCU_SIZE, 32, 32, 1},
+	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 1, 1},
+	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 5, 1},
+	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 63, 1},
+	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 63, 1},
+	.caps[17] = {HFI_CAPABILITY_B_FRAME_QP, 0, 63, 1},
+	.caps[18] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 2, 1},
+	.caps[19] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
+	.caps[20] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
+	.caps[21] = {HFI_CAPABILITY_ROTATION, 1, 4, 90},
+	.caps[22] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 16},
+	.caps[23] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 16},
+	.num_caps = 24,
+	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
+	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
+	.num_pl = 2,
+	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
+	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
+	.fmts[3] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_P010},
+	.num_fmts = 4,
+}, {
+	.codec = HFI_VIDEO_CODEC_VP8,
+	.domain = VIDC_SESSION_TYPE_ENC,
+	.cap_bufs_mode_dynamic = true,
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 8192, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 1036800, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 240, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 3, 1},
+	.caps[9] = {HFI_CAPABILITY_PEAKBITRATE, 32000, 160000000, 1},
+	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 3, 1},
+	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 2, 1},
+	.caps[12] = {HFI_CAPABILITY_LCU_SIZE, 16, 16, 1},
+	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 1, 1},
+	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 5, 1},
+	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 127, 1},
+	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 127, 1},
+	.caps[17] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 2, 1},
+	.caps[18] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
+	.caps[19] = {HFI_CAPABILITY_BLUR_WIDTH, 96, 4096, 16},
+	.caps[20] = {HFI_CAPABILITY_BLUR_HEIGHT, 96, 4096, 16},
+	.caps[21] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
+	.caps[22] = {HFI_CAPABILITY_ROTATION, 1, 4, 90},
+	.num_caps = 23,
+	.pl[0] = {HFI_VPX_PROFILE_MAIN, HFI_VPX_LEVEL_VERSION_0},
+	.pl[1] = {HFI_VPX_PROFILE_MAIN, HFI_VPX_LEVEL_VERSION_1},
+	.pl[2] = {HFI_VPX_PROFILE_MAIN, HFI_VPX_LEVEL_VERSION_2},
+	.pl[3] = {HFI_VPX_PROFILE_MAIN, HFI_VPX_LEVEL_VERSION_3},
+	.num_pl = 4,
+	.fmts[0] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12},
+	.fmts[1] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_NV12_UBWC},
+	.fmts[2] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_YUV420_TP10_UBWC},
+	.fmts[3] = {HFI_BUFFER_INPUT, HFI_COLOR_FORMAT_P010},
+	.num_fmts = 4,
+} };
+
+static const struct hfi_plat_caps *get_capabilities(unsigned int *entries)
+{
+	*entries = ARRAY_SIZE(caps);
+	return caps;
+}
+
+static void get_codecs(u32 *enc_codecs, u32 *dec_codecs, u32 *count)
+{
+	*enc_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
+		      HFI_VIDEO_CODEC_VP8;
+	*dec_codecs = HFI_VIDEO_CODEC_H264 | HFI_VIDEO_CODEC_HEVC |
+		      HFI_VIDEO_CODEC_VP8 | HFI_VIDEO_CODEC_VP9 |
+		      HFI_VIDEO_CODEC_MPEG2;
+	*count = 8;
+}
+
+static const struct hfi_platform_codec_freq_data codec_freq_data[] = {
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 25 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 25 },
+	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_ENC, 675, 60 },
+	{ V4L2_PIX_FMT_MPEG2, VIDC_SESSION_TYPE_DEC, 200, 25 },
+	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_DEC, 200, 25 },
+	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_DEC, 200, 25 },
+	{ V4L2_PIX_FMT_VP8, VIDC_SESSION_TYPE_DEC, 200, 60 },
+	{ V4L2_PIX_FMT_VP9, VIDC_SESSION_TYPE_DEC, 200, 60 },
+};
+
+static const struct hfi_platform_codec_freq_data *
+get_codec_freq_data(u32 session_type, u32 pixfmt)
+{
+	const struct hfi_platform_codec_freq_data *data = codec_freq_data;
+	unsigned int i, data_size = ARRAY_SIZE(codec_freq_data);
+	const struct hfi_platform_codec_freq_data *found = NULL;
+
+	for (i = 0; i < data_size; i++) {
+		if (data[i].pixfmt == pixfmt && data[i].session_type == session_type) {
+			found = &data[i];
+			break;
+		}
+	}
+
+	return found;
+}
+
+static unsigned long codec_vpp_freq(u32 session_type, u32 codec)
+{
+	const struct hfi_platform_codec_freq_data *data;
+
+	data = get_codec_freq_data(session_type, codec);
+	if (data)
+		return data->vpp_freq;
+
+	return 0;
+}
+
+static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
+{
+	const struct hfi_platform_codec_freq_data *data;
+
+	data = get_codec_freq_data(session_type, codec);
+	if (data)
+		return data->vsp_freq;
+
+	return 0;
+}
+
+static u8 num_vpp_pipes(void)
+{
+	return 4;
+}
+
+const struct hfi_platform hfi_plat_v6 = {
+	.codec_vpp_freq = codec_vpp_freq,
+	.codec_vsp_freq = codec_vsp_freq,
+	.codecs = get_codecs,
+	.capabilities = get_capabilities,
+	.num_vpp_pipes = num_vpp_pipes,
+};
-- 
2.17.1

