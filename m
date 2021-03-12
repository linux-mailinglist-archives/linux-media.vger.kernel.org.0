Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F23F3394BE
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 18:29:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232537AbhCLR3Y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 12:29:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232138AbhCLR3O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 12:29:14 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFCB8C061762
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:13 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id c76-20020a1c9a4f0000b029010c94499aedso16268326wme.0
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 09:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7D6lkspcofvjWGkPuH5XFGkauH881L6IwSvfokYi6CI=;
        b=VcizTwID4JmsJdLjuz9vNMxWLLO/2WEU7oZGS8nD8zBdq6MkJ1KpLgqfYsi/co1u6R
         yDkadCl67Na35Esj2ddKtWz2MXNYfZUFZdSAc59Cn40PP7tokJUxPK7PKdrG4IveHrm2
         626v/c2psj/LzTOnUScCwgpfbg7MwXyhpcdReLZW6KwUdHfm8T2vppfXZsPHZdnDnXDE
         sUHDSBKb4K39jXykIfosQ7i+eQI2GN9GlZBuL0gNrFXlu689KaiiV1zaRv/rxSo3sWWp
         kAxM9ru6gq+qLLmhe5XQ/k5qqii661AiK7QvS0XCecN3XFWGnUKexQZ31NqEkWp7FTX5
         DZHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7D6lkspcofvjWGkPuH5XFGkauH881L6IwSvfokYi6CI=;
        b=Jj22b3UhByPcaX6htvr8NuADhmWHHzG+01BAoHii82niVdZMRDUwzHGxxuy3liKKLd
         Nn4qXq3gRJWKcDpGhHxPv6PR3S0Wm8vX7xOIaV7VrNhjZvpr3l5Ja5DsioFpsiEpKsom
         5+JMfrVPRBvVt9Z6W9KIcMbL06lruOTo1NEu2VZbJmkJ6KKqB/QYx3e0YXAGDRinQtH/
         eRm2fWBw+Ls4jeOVnChMwdm8FNQuV8Dydog6g+muHpRVV5S4Z1vg+Cl7M8OkeQyg1oFF
         7ArJqjHPjGLsRLqlOkEqCT4KLQlppFLyNrqJbGRlGgrgxMUgUdok0alZd1yVRre2dWxe
         C/0w==
X-Gm-Message-State: AOAM533zCn2gyMsPtwR5ywmb0UfkzwfhbSVAXdcxnp1U6dyBOCi9z/7w
        vECqhc8Ksh5FBbDoDFzhNJpO7g==
X-Google-Smtp-Source: ABdhPJxi1165wHkohfBRM12paGm52DfFnxt3CNLV8d8918NwVa2Hs3bQMn3vSGLy04c/az8htv4zgQ==
X-Received: by 2002:a1c:e244:: with SMTP id z65mr14163783wmg.130.1615570152399;
        Fri, 12 Mar 2021 09:29:12 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id 18sm2876375wmj.21.2021.03.12.09.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 09:29:11 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v2 01/25] media: venus: Update v6 buffer descriptors
Date:   Fri, 12 Mar 2021 17:30:15 +0000
Message-Id: <20210312173039.1387617-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
References: <20210312173039.1387617-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently hfi_platform_v6.c adds a bunch of capability parameters.
Reviewing downstream we can see a number of these need to be updated.

techpack/video/msm/vidc/msm_vidc_platform.c :: kona_capabilities[]

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/venus/hfi_platform_v6.c     | 138 +++++++++---------
 1 file changed, 69 insertions(+), 69 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_platform_v6.c b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
index 2278be13cb90..dd1a03911b6c 100644
--- a/drivers/media/platform/qcom/venus/hfi_platform_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_platform_v6.c
@@ -9,15 +9,15 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_H264,
 	.domain = VIDC_SESSION_TYPE_DEC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 5760, 1},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 5760, 1},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 1},
 	/* ((5760 * 2880) / 256) */
-	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 36, 64800, 1},
-	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 200000000, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 220000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
 	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
-	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 36, 1958400, 1},
-	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 960, 1},
 	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
 	.num_caps = 9,
 	.pl[0] = {HFI_H264_PROFILE_BASELINE, HFI_H264_LEVEL_52},
@@ -35,15 +35,15 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_HEVC,
 	.domain = VIDC_SESSION_TYPE_DEC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
-	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
-	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
-	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
-	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
-	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 2073600, 1},
-	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
-	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 220000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 960, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
 	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 3, 1},
 	.num_caps = 10,
 	.pl[0] = {HFI_HEVC_PROFILE_MAIN, HFI_HEVC_LEVEL_6 | HFI_HEVC_TIER_HIGH0},
@@ -61,15 +61,15 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_VP8,
 	.domain = VIDC_SESSION_TYPE_DEC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
-	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
-	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
-	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
-	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
-	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 2073600, 1},
-	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
-	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 4096, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 4096, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 36864, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 100000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 4423680, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
 	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 3, 1},
 	.num_caps = 10,
 	.pl[0] = {HFI_VPX_PROFILE_MAIN, HFI_VPX_LEVEL_VERSION_0},
@@ -86,15 +86,15 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_VP9,
 	.domain = VIDC_SESSION_TYPE_DEC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 1},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 1},
-	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
-	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
-	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
-	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
-	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 2073600, 1},
-	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
-	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 220000000, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 960, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
 	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 3, 1},
 	.num_caps = 10,
 	.pl[0] = {HFI_VP9_PROFILE_P0, 200},
@@ -112,15 +112,15 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_MPEG2,
 	.domain = VIDC_SESSION_TYPE_DEC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 1920, 1},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 1920, 1},
-	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 8160, 1},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 1920, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 1920, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 8160, 1},
 	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 40000000, 1},
-	.caps[4] = {HFI_CAPABILITY_SCALE_X, 4096, 65536, 1},
-	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 4096, 65536, 1},
-	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 244800, 1},
+	.caps[4] = {HFI_CAPABILITY_SCALE_X, 65536, 65536, 1},
+	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 65536, 65536, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
 	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 30, 1},
-	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 2, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
 	.caps[9] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 1, 1},
 	.num_caps = 10,
 	.pl[0] = {HFI_MPEG2_PROFILE_SIMPLE, HFI_MPEG2_LEVEL_H14},
@@ -135,21 +135,21 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_H264,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
-	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
-	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 1},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 1},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 220000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
 	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 8192, 65536, 1},
-	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 1036800, 1},
-	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
-	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 3, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 960, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
 	.caps[9] = {HFI_CAPABILITY_PEAKBITRATE, 32000, 160000000, 1},
-	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 5, 1},
-	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
+	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 6, 1},
+	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 2, 1},
 	.caps[12] = {HFI_CAPABILITY_LCU_SIZE, 16, 16, 1},
 	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 1, 1},
-	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 5, 1},
+	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 6, 1},
 	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
 	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
 	.caps[17] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
@@ -172,24 +172,24 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_HEVC,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
-	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
-	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 8192, 16},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 8192, 16},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 138240, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 160000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
 	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 8192, 65536, 1},
-	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 1036800, 1},
-	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 480, 1},
-	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 3, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 7833600, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 960, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
 	.caps[9] = {HFI_CAPABILITY_PEAKBITRATE, 32000, 160000000, 1},
 	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 5, 1},
-	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 4, 1},
+	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 2, 1},
 	.caps[12] = {HFI_CAPABILITY_LCU_SIZE, 32, 32, 1},
 	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 1, 1},
 	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 5, 1},
-	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 63, 1},
-	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 63, 1},
-	.caps[17] = {HFI_CAPABILITY_B_FRAME_QP, 0, 63, 1},
+	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 51, 1},
+	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 51, 1},
+	.caps[17] = {HFI_CAPABILITY_B_FRAME_QP, 0, 51, 1},
 	.caps[18] = {HFI_CAPABILITY_MAX_WORKMODES, 1, 2, 1},
 	.caps[19] = {HFI_CAPABILITY_RATE_CONTROL_MODES, 0x1000001, 0x1000005, 1},
 	.caps[20] = {HFI_CAPABILITY_COLOR_SPACE_CONVERSION, 0, 2, 1},
@@ -209,20 +209,20 @@ static const struct hfi_plat_caps caps[] = {
 	.codec = HFI_VIDEO_CODEC_VP8,
 	.domain = VIDC_SESSION_TYPE_ENC,
 	.cap_bufs_mode_dynamic = true,
-	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 96, 4096, 16},
-	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 96, 4096, 16},
-	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 1, 36864, 1},
-	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 120000000, 1},
+	.caps[0] = {HFI_CAPABILITY_FRAME_WIDTH, 128, 4096, 16},
+	.caps[1] = {HFI_CAPABILITY_FRAME_HEIGHT, 128, 4096, 16},
+	.caps[2] = {HFI_CAPABILITY_MBS_PER_FRAME, 64, 36864, 1},
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 74000000, 1},
 	.caps[4] = {HFI_CAPABILITY_SCALE_X, 8192, 65536, 1},
 	.caps[5] = {HFI_CAPABILITY_SCALE_Y, 8192, 65536, 1},
-	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 1, 1036800, 1},
-	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 240, 1},
-	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 1, 3, 1},
+	.caps[6] = {HFI_CAPABILITY_MBS_PER_SECOND, 64, 4423680, 1},
+	.caps[7] = {HFI_CAPABILITY_FRAMERATE, 1, 120, 1},
+	.caps[8] = {HFI_CAPABILITY_MAX_VIDEOCORES, 0, 1, 1},
 	.caps[9] = {HFI_CAPABILITY_PEAKBITRATE, 32000, 160000000, 1},
 	.caps[10] = {HFI_CAPABILITY_HIER_P_NUM_ENH_LAYERS, 0, 3, 1},
 	.caps[11] = {HFI_CAPABILITY_ENC_LTR_COUNT, 0, 2, 1},
 	.caps[12] = {HFI_CAPABILITY_LCU_SIZE, 16, 16, 1},
-	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 1, 1},
+	.caps[13] = {HFI_CAPABILITY_BFRAME, 0, 0, 1},
 	.caps[14] = {HFI_CAPABILITY_HIER_P_HYBRID_NUM_ENH_LAYERS, 0, 5, 1},
 	.caps[15] = {HFI_CAPABILITY_I_FRAME_QP, 0, 127, 1},
 	.caps[16] = {HFI_CAPABILITY_P_FRAME_QP, 0, 127, 1},
-- 
2.30.1

