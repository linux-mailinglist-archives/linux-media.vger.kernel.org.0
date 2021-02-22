Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C1A0321C0F
	for <lists+linux-media@lfdr.de>; Mon, 22 Feb 2021 17:03:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhBVQC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 22 Feb 2021 11:02:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230461AbhBVQCU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 22 Feb 2021 11:02:20 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EC1AC06178A
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:39 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id v62so14847900wmg.4
        for <linux-media@vger.kernel.org>; Mon, 22 Feb 2021 08:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=y8d2o4JJYMS5p/tt9BlRayK29wkUF0Vv46rTG4jjeqM=;
        b=R3PkEKDTkdP3FIzZ3KDTZoC1UHN4Bi88PupLTbteoKKppXgEKJ2O+ACDepxGxRUI6/
         LwWnjlc0uF6rbfd606O0s7PxT7FCw/yEiVPfATS1N3V38EQk1AJMfPgjtRp5b+qSbt8d
         jRCm4Wty4P83B9EUL9u3YSxbLPL7zMSJAgeSWiYqUUe+jvlUt+8aSpe+PSUAJwX1u3Pt
         TCG8bp8tFbZiWDD1goZzZQnTOAYi7SeX6/FQLiWsfycBBtrIVi4v3ehA5dfqKadm9EeJ
         CCqdXhft/DkiMVL5S2QLrOtuJ3PclBytJBvGWPGRIYxusBq7g8xy1pyop7DN5S1mBn0E
         69Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=y8d2o4JJYMS5p/tt9BlRayK29wkUF0Vv46rTG4jjeqM=;
        b=H8a4yp3Otctd4iLCl0tfP52r4SGtnP9mzg6dmtR0t6L12/XVCYAjVSC8irjU3WfUX5
         WRY9leZ1QnrO6dhJiCMXaGLV2AIbQGjHH6ceyGv5iryN1zWL0bRCaT7usThdvvqo18LK
         LyD/2wzOx8IisaXCTsZ5Od/0zhvnC4fKPNfp0ybbHVwxNQCKUjgm285bp77ZKJOuiqF6
         Y/ZiBDTMWhjZp2N0MYBl5QprD/mo8Q4DOWuu8gECMkl/Q+ywkxjREW/wY8CoheKKs5g3
         lrV4p1f8LdxkUqHA2NFm41v6v5ZdESD8I77c/yhMtzdfmVpG35J0CP0PR9RYbRJM0yVM
         wGNQ==
X-Gm-Message-State: AOAM5324KQBy/yC9iy4gfrkcHsrxpIbijw4L0GrBmKEK2xbmMnSEmb3k
        cEextAZIm4j4oMjALUyj2oiVTA==
X-Google-Smtp-Source: ABdhPJzzDmbAcmBHt9wCAIQZMliftWXHRpnaiOXSgyF8JToCDD5bzfBxMuO2iy7ga0fbtt6veusmEQ==
X-Received: by 2002:a1c:c904:: with SMTP id f4mr21257523wmb.14.1614009697746;
        Mon, 22 Feb 2021 08:01:37 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id c3sm7373697wrw.80.2021.02.22.08.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 08:01:37 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH 01/25] media: venus: Update v6 buffer descriptors
Date:   Mon, 22 Feb 2021 16:02:36 +0000
Message-Id: <20210222160300.1811121-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
References: <20210222160300.1811121-1-bryan.odonoghue@linaro.org>
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
index 2278be13cb90..6fa80353bcce 100644
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
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 22000000, 1},
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
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 22000000, 1},
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
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 22000000, 1},
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
+	.caps[3] = {HFI_CAPABILITY_BITRATE, 1, 22000000, 1},
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
2.29.2

