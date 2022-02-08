Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50C8A4ADDA4
	for <lists+linux-media@lfdr.de>; Tue,  8 Feb 2022 16:52:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240085AbiBHPwP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Feb 2022 10:52:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376280AbiBHPwO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Feb 2022 10:52:14 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00FD9C0613C9
        for <linux-media@vger.kernel.org>; Tue,  8 Feb 2022 07:52:11 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id i14so1915625wrc.10
        for <linux-media@vger.kernel.org>; Tue, 08 Feb 2022 07:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6oXg4Jj3B9xQjIaqAFM3fLctpAtmS47DYSQULyyYcAA=;
        b=ZmCN0TwD5zfpR1hL+i7yhZ7sHOiHkyV+2LHh1DCCmPa1hlUWNeTTplb2NISm3IpBXs
         TL/n5fgI893+GUe4KN5COGUy+2YhjUC2DtySCrOyuoygRlD9zBJQaOTi6jROC91fGaxQ
         mZvlNuQQQZz2JmyO1irBv6LzOAziHKg3E3+f/m/KikHQf53NUVaM3YigX/uEu0u1AhDj
         U6k9C7QwLt27E26fF8ikOTfuphXDXutuFogpfL0OZkgV3ObMYyeWxyiq5J+J8m3YqpUq
         e7e0JzCd+gXy/O8i4MPrD0tf9LWVqe3N3qwJPxD8f/XtKtr+uBk+ZE7jwoWVFeu8M5yu
         BZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6oXg4Jj3B9xQjIaqAFM3fLctpAtmS47DYSQULyyYcAA=;
        b=mCF7MeaV9gl/4ntWWWs+nBeaGr5E33m8B+3zIO6TN49MXhqXibLvB/JaBMyIEqbVrk
         AyLB/cJoeMCDNoa/7JvwtJVxdtlPuh09Rcic5PQiqYKcPigMVe/1pnIt9WuJKQ6BfI4S
         WqvjkOtRAnCt3jlDY6+eUYeheicF83Qzi0ImrNXNtoX1m8xThCrlZksckYHdxWPyrMSC
         rJ+X4KgD8t7/0jejUZfDc+YZoDSAaFVGew19dtYXv5T/jXSbrCYFkqcpA3GRAGIqvRzy
         7nr3wB6ihWuQTcTBDZ9nk2dFA/fMP+Vlgr7d8laOyTFjM0O4nQ2/LhsQNzqr5wOUzpjU
         oKhA==
X-Gm-Message-State: AOAM5323Bz190W9jHcECizatDuheCNF23q+3meXuZrsoaLhNiHs3quVe
        /GYr9/xYR1Varz0fTfOFlFF+exzp6xJBJw==
X-Google-Smtp-Source: ABdhPJy7L/4LKj0W2KQsp+BjC1Ka9Iz9ZZMvlooOUqwrdj6d19WKhR4wooW515NHj/8MT5dlEyJ0ow==
X-Received: by 2002:a05:6000:11c8:: with SMTP id i8mr4005541wrx.590.1644335530343;
        Tue, 08 Feb 2022 07:52:10 -0800 (PST)
Received: from localhost.localdomain (hst-221-62.medicom.bg. [84.238.221.62])
        by smtp.gmail.com with ESMTPSA id m6sm15076068wrw.54.2022.02.08.07.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 07:52:09 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Vikash Garodia <vgarodia@codeaurora.org>, dikshita@codeaurora.org,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH] venus: venc: Fix h264 8x8 transform control
Date:   Tue,  8 Feb 2022 17:52:04 +0200
Message-Id: <20220208155204.630966-1-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

During encoder driver open controls are initialized via a call
to v4l2_ctrl_handler_setup which returns EINVAL error for
V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM v4l2 control. The control
default value is disabled and because of firmware limitations
8x8 transform cannot be disabled for the supported HIGH and
CONSTRAINED_HIGH profiles.

To fix the issue change the control default value to enabled
(this is fine because the firmware enables 8x8 transform for
high and constrained_high profiles by default). Also, correct
the checking of profile ids in s_ctrl from hfi to v4l2 ids.

Fixes: bfee75f73c37 ("media: venus: venc: add support for V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM control")
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/venc.c       | 4 ++--
 drivers/media/platform/qcom/venus/venc_ctrls.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 84bafc3118cc..adea4c3b8c20 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -662,8 +662,8 @@ static int venc_set_properties(struct venus_inst *inst)
 
 		ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
 		h264_transform.enable_type = 0;
-		if (ctr->profile.h264 == HFI_H264_PROFILE_HIGH ||
-		    ctr->profile.h264 == HFI_H264_PROFILE_CONSTRAINED_HIGH)
+		if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
+		    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
 			h264_transform.enable_type = ctr->h264_8x8_transform;
 
 		ret = hfi_session_set_property(inst, ptype, &h264_transform);
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 1ada42df314d..ea5805e71c14 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -320,8 +320,8 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctr->intra_refresh_period = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM:
-		if (ctr->profile.h264 != HFI_H264_PROFILE_HIGH &&
-		    ctr->profile.h264 != HFI_H264_PROFILE_CONSTRAINED_HIGH)
+		if (ctr->profile.h264 != V4L2_MPEG_VIDEO_H264_PROFILE_HIGH &&
+		    ctr->profile.h264 != V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
 			return -EINVAL;
 
 		/*
@@ -457,7 +457,7 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_H264_I_FRAME_MIN_QP, 1, 51, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 0);
+			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM, 0, 1, 1, 1);
 
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_H264_P_FRAME_MIN_QP, 1, 51, 1, 1);
-- 
2.25.1

