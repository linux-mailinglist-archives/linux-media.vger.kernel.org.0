Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F1D3B02FF
	for <lists+linux-media@lfdr.de>; Tue, 22 Jun 2021 13:40:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhFVLmo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Jun 2021 07:42:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230300AbhFVLmk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Jun 2021 07:42:40 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FEDDC061574
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 04:40:22 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id f15so7814323wro.8
        for <linux-media@vger.kernel.org>; Tue, 22 Jun 2021 04:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jUBkBWWpavQfJ/XXZFQzGX0EU9d+FGRKZtwFN9vG+OA=;
        b=vyE3RxJoCu5DMSxbDGOfacy7HyUP9y0Txh3uYhEUKh/FBMLutl5b9mXWMKbN2AEQCg
         +nzElUppRSE3mIeyBJTGRW/wKN7j49HsTJSNI/p13Rhv/JgvZKHZgeMiR+nwv4SesSa7
         1A4q5+EubABALDEa7qh9gBae8IuFvrirRrI8oLyXWxuWmhVw0N/auuo8BLS1tt8naljY
         vb9AN/Rnh2Wsog4yxaF0V2xifTZekod6/WpFcOPvIRXx1CLkLfAktCSvx5IezPA0QOMS
         6xNyHoOTmjSc5HN0X614njJjD+Fsi9875FUhWQxXjTAfPHrXNctkeItokoMxGFepChmC
         l16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jUBkBWWpavQfJ/XXZFQzGX0EU9d+FGRKZtwFN9vG+OA=;
        b=pnEbc7PxGNxUK0DYcTfWp3jn4eneNoCYtFKQ1vpdUkLenRoHqK7yYIvadAPY1KrCd5
         rWyiFClkRbon8xyVqK6aygH9VV2tTZ+egM5vHBdG6gNaGwqJ244Mbjq/dqmDG6sIgNih
         RGEW3tu+tKmSwvGWobflAnGNhj1718cvVLBSbR6HjajmDinXOSNuAuRszdYjaoknbnfQ
         JzMwmdXQk6ErM0HvfT9ehthdjWFEMyr/vj8iEy6hQksOJNN1EIoLQg0dKipr4q6FccPk
         dkljgcznMk7TuJ7gxE7b0gHsrR8S9XCl3kAWHcccJRQBCKH67O1ocDlSNMjbtmNyhHc+
         dzgw==
X-Gm-Message-State: AOAM531U9kY5eUMgnKQg90zTk307zuE6DTqmNaCc6lBRPWmVml7jsi1M
        fzm5DuXZUBk+LwpYfqeKZ1lSDwm4EdGO4rr+
X-Google-Smtp-Source: ABdhPJytmq1wHQ+S/OsD4Ekc6a4R9V5gIBbT4aui9p8X/DVFcP1ylbK0V4uXpl2U3TfC0hLHi5RnDw==
X-Received: by 2002:a5d:6a01:: with SMTP id m1mr4224961wru.363.1624362020790;
        Tue, 22 Jun 2021 04:40:20 -0700 (PDT)
Received: from localhost.localdomain (hst-221-32.medicom.bg. [84.238.221.32])
        by smtp.gmail.com with ESMTPSA id k2sm20690929wrw.93.2021.06.22.04.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:40:20 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 3/3] venus: venc: Add support for intra-refresh period
Date:   Tue, 22 Jun 2021 14:39:58 +0300
Message-Id: <20210622113958.809173-4-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
References: <20210622113958.809173-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add support for intra-refresh period v4l2 control and drop
cyclic intra-refresh macroblock control in the same time.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/venc.c      | 26 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 14 +++++-----
 3 files changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 8df2d497d706..df9f79f5b164 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -256,6 +256,7 @@ struct venc_controls {
 
 	u32 header_mode;
 	bool aud_enable;
+	u32 intra_refresh_period;
 
 	struct {
 		u32 h264;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 8dd49d4f124c..718ce3578be8 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -547,6 +547,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	struct hfi_quantization_range quant_range;
 	struct hfi_enable en;
 	struct hfi_ltr_mode ltr_mode;
+	struct hfi_intra_refresh intra_refresh = {};
 	u32 ptype, rate_control, bitrate;
 	u32 profile, level;
 	int ret;
@@ -802,6 +803,31 @@ static int venc_set_properties(struct venus_inst *inst)
 			en.enable = 1;
 
 		ret = hfi_session_set_property(inst, ptype, &en);
+	}
+
+	if ((inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
+	     inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) &&
+	    (rate_control == HFI_RATE_CONTROL_CBR_VFR ||
+	     rate_control == HFI_RATE_CONTROL_CBR_CFR)) {
+		intra_refresh.mode = HFI_INTRA_REFRESH_NONE;
+		intra_refresh.cir_mbs = 0;
+
+		if (ctr->intra_refresh_period) {
+			u32 mbs;
+
+			mbs = ALIGN(inst->width, 16) * ALIGN(inst->height, 16);
+			mbs /= 16 * 16;
+			if (mbs % ctr->intra_refresh_period)
+				mbs++;
+			mbs /= ctr->intra_refresh_period;
+
+			intra_refresh.mode = HFI_INTRA_REFRESH_RANDOM;
+			intra_refresh.cir_mbs = mbs;
+		}
+
+		ptype = HFI_PROPERTY_PARAM_VENC_INTRA_REFRESH;
+
+		ret = hfi_session_set_property(inst, ptype, &intra_refresh);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 637c92f6c5be..eb10affc6277 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -17,7 +17,6 @@
 #define SLICE_BYTE_SIZE_MAX	1024
 #define SLICE_BYTE_SIZE_MIN	1024
 #define SLICE_MB_SIZE_MAX	300
-#define INTRA_REFRESH_MBS_MAX	300
 #define AT_SLICE_BOUNDARY	\
 	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY
 #define MAX_LTR_FRAME_COUNT 4
@@ -227,8 +226,6 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&inst->lock);
 		break;
-	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
-		break;
 	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
 		ret = venc_calc_bpframes(ctrl->val, ctr->num_b_frames, &bframes,
 					 &ctr->num_p_frames);
@@ -319,6 +316,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY:
 		ctr->mastering = *ctrl->p_new.p_hdr10_mastering;
 		break;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
+		ctr->intra_refresh_period = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -502,10 +502,6 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA, -6, 6, 1, 0);
 
-	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB,
-		0, INTRA_REFRESH_MBS_MAX, 1, 0);
-
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_GOP_SIZE, 0, (1 << 16) - 1, 1, 30);
 
@@ -564,6 +560,10 @@ int venc_ctrl_init(struct venus_inst *inst)
 				   V4L2_CID_COLORIMETRY_HDR10_MASTERING_DISPLAY,
 				   v4l2_ctrl_ptr_create(NULL));
 
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
+			  ((4096 * 2304) >> 8), 1, 0);
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.25.1

