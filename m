Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F421135294D
	for <lists+linux-media@lfdr.de>; Fri,  2 Apr 2021 12:05:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229932AbhDBKF2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Apr 2021 06:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbhDBKFZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 2 Apr 2021 06:05:25 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10768C06178C
        for <linux-media@vger.kernel.org>; Fri,  2 Apr 2021 03:05:19 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id z6-20020a1c4c060000b029010f13694ba2so2135674wmf.5
        for <linux-media@vger.kernel.org>; Fri, 02 Apr 2021 03:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7s5+7BK8xNEcPbMP0ljsXGekLiTrPOPpZVr6AknmyEo=;
        b=FObTkccKPG4KH/tIZP31XkR/nf2b6A7tB/ury4NREB1yDnAl3Y89tfPAiu4cU8199c
         uT9NTNbP6pSyc2EGoLB/hagEr193UxINIDfCnfj8jBf7pp5cV71fPmbEtw9sVTIdPqek
         ec6fjwtiJfxQYB6QROuxqC8VZlF9+RlIs/WchmHiMcmwGS/YDcK07qXk53bfwdZuVGun
         BD3cAAtmi5hGgs+pBaLYObiDW4GmEeG08zP9MZTecm4qYjSzHy3zl6Ug7SvZntfYQ8SA
         BOV1kigLrGvqWOtCI6XTea0gscOIr+KKOoYjmsrphbtVTQaDS832TdvTCD8EIoWim4sJ
         yYAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7s5+7BK8xNEcPbMP0ljsXGekLiTrPOPpZVr6AknmyEo=;
        b=JX5kPUDEY4c1VeVK3fPFLNZfolrmSi0OWM1uA93NUkQTblFzypwMyQnwArSHGwFF/A
         QxUgoQhBsToItUMg6himwGBz6AeiO1IDdf9Q+yT+FXs1LmgLCqmlsIFCtIMY7sLY+LCF
         0VdDvw/0jd0dzxn5ZBYhsZRz6MtKyxtjXJUFxUByDc517fuFRYhyLQGyAYSz1X341Ut9
         TJscy0QeQo3NGHcDicyAtX8nmCGvym3HJnOYgjZ5ycjdRyxJSA0I05Bxb7PGbmqk04ih
         VlS3Lud5JdjgwKr3QEmIRaif/iVgPq/JYMIXIzvqakYqleTdPlNt3AXeRhScGCud2H5W
         A1Hw==
X-Gm-Message-State: AOAM530K6XTTHbmqJ9NmDm+GUiLJhU6mcNFGEnIOi80B++uG+J9YtJRY
        RCgVltVoIxQqjlSwiSNPZXp1u1BgGLoAgRCx
X-Google-Smtp-Source: ABdhPJy+C8LlnsirjCBdjgtkLqhRBECjcJgVhyQjCFSJZMKNgbSnlYbOZC8V9MsVRHvN98V4k5AGzg==
X-Received: by 2002:a1c:ed0d:: with SMTP id l13mr2525245wmh.78.1617357917625;
        Fri, 02 Apr 2021 03:05:17 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v18sm15466618wrf.41.2021.04.02.03.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 03:05:17 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     stanimir.varbanov@linaro.org, agross@kernel.org,
        bjorn.andersson@linaro.org, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     bryan.odonoghue@linaro.org, dikshita@codeaurora.org,
        jonathan@marek.ca, vgarodia@codeaurora.org
Subject: [PATCH v3 01/25] media: venus: Update v6 buffer descriptors
Date:   Fri,  2 Apr 2021 11:06:24 +0100
Message-Id: <20210402100648.1815854-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
References: <20210402100648.1815854-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Currently hfi_platform_v6.c adds a bunch of capability parameters.
Reviewing downstream we can see a number of these need to be updated.

techpack/video/msm/vidc/msm_vidc_platform.c :: kona_capabilities[]

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
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

