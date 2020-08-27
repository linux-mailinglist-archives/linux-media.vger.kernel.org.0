Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDCB254233
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 11:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728555AbgH0JZN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 05:25:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728568AbgH0JZK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 05:25:10 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F655C061264
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:10 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id z9so4469519wmk.1
        for <linux-media@vger.kernel.org>; Thu, 27 Aug 2020 02:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=LujfUfd41Yj2fFMWp1Mlk5xGhLsPfGyixkNmKr84uN4=;
        b=o09e0BXbN0pj+pMtcX1VGqXH5mw3dwMrX6fWTOJa2vBd60PPyxqIL4pHPS76mim4mC
         oV68cosNoGDqltCDI1rw1B0yzD2hZSFWDRCTzNeoY356LKrsMmeeu6grnixXqln2pbM5
         u0VzTxfKXYins3QbzJB13EtdGoWOesfQwYwd8WD8Zw6zXk/I8/CeQuw2rGgKm33xDawg
         /rP/l0fghtm+bGA6IofuESdnZwAJArtRGgrm+Ml3Na2T8YnJuwl9NjwOg88V2L2PPNnp
         mMtdAPSsNMvMQffepLbM6FTgVVpAd0jhl9yOWWUBYFyYcz0A2wLaJ8IxHgx8hvlxyE3g
         /TsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=LujfUfd41Yj2fFMWp1Mlk5xGhLsPfGyixkNmKr84uN4=;
        b=ZjvJcwQAyAfIF/YdMoKdpry1SR9sBV/VxyTTYCdsZ9rNHr54Ij9X9PEikke5KQrqxL
         C/lEgzfw315lqOb1g3XKtetO+MJDUhGZoPELjUVCaCGtrO/RCE0wrLX9wKR9LMtcKyzy
         FBeZb+zPpBIS8LZwmhNaOGs3Yxy8U+BTSupA0dmuQmKwWt4fawWAlEcP9ZLh4ThTCmlV
         oGoTIiB1MaXY1YKYe4/wlW5knuX+UiCvMax+oJFEjQyIh2eIHPxkq3DUcpbc8hSNrz7q
         hSykihJKNsWs+iIW6GU0km2/be6THp9mNPVWfievYArMQTOEE2/7iDiguCQ9eAvu4FzS
         bk1Q==
X-Gm-Message-State: AOAM531bh0f/ST7BvQYwUH0frtXgmCHMp/sRLsU6egh/20D7dNXQQY3h
        GTFuNPeKMJglPCXGO9X7dic66w==
X-Google-Smtp-Source: ABdhPJwKcBu7awrjr9G6ae2qP7ccOu5tggZf0mUPvgXgRqQPXf5OpirA9Xu9uD3id+JX1HrH4CeIww==
X-Received: by 2002:a1c:f20e:: with SMTP id s14mr8840278wmc.23.1598520308467;
        Thu, 27 Aug 2020 02:25:08 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id z203sm4357330wmc.31.2020.08.27.02.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 02:25:07 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Dikshita Agarwal <dikshita@codeaurora.org>,
        Vikash Garodia <vgarodia@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH 06/13] venus: hfi_plat_v4: Populate codecs and capabilities for v4
Date:   Thu, 27 Aug 2020 12:24:10 +0300
Message-Id: <20200827092417.16040-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
References: <20200827092417.16040-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add new file for Venus hfi v4 with supported codecs and capabilities.

Co-developed-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 .../platform/qcom/venus/hfi_platform_v4.c     | 259 ++++++++++++++++++
 1 file changed, 259 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v4.c b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
index 4fc2fd04ca9d..3848bb6d7408 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v4.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v4.c
@@ -4,6 +4,263 @@
  */
 #include "hfi_platform.h"
 
+static const struct hfi_plat_caps caps[] = {
+{
+	.codec = HFI_VIDEO_CODEC_H264,
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
+	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0 << 28},
+	.pl[1] = {HFI_HEVC_PROFILE_MAIN10, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0 << 28},
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
 static const struct hfi_platform_codec_freq_data codec_freq_data[] =  {
 	{ V4L2_PIX_FMT_H264, VIDC_SESSION_TYPE_ENC, 675, 10 },
 	{ V4L2_PIX_FMT_HEVC, VIDC_SESSION_TYPE_ENC, 675, 10 },
@@ -57,4 +314,6 @@ static unsigned long codec_vsp_freq(u32 session_type, u32 codec)
 const struct hfi_platform hfi_plat_v4 = {
 	.codec_vpp_freq = codec_vpp_freq,
 	.codec_vsp_freq = codec_vsp_freq,
+	.codecs = get_codecs,
+	.capabilities = get_capabilities,
 };
-- 
2.17.1

