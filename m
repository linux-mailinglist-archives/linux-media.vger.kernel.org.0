Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 050C7398594
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 11:48:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232231AbhFBJte (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 05:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232312AbhFBJtN (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Jun 2021 05:49:13 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7B7CC0613CE
        for <linux-media@vger.kernel.org>; Wed,  2 Jun 2021 02:47:29 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id u24so2118702edy.11
        for <linux-media@vger.kernel.org>; Wed, 02 Jun 2021 02:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jUBkBWWpavQfJ/XXZFQzGX0EU9d+FGRKZtwFN9vG+OA=;
        b=dqlp68XgwnH/5WSR5prdBJfKu54+bYTh6b6Qs1yT8pMAeZHV0aKwW0wG4T4UePvFXd
         GIkXP07Z5R78TWifQtE/khIDPSNkr0M3jIQ8OvFtCBCED52CtyXxo6cVX+mKboKM3jt2
         Hk23I+zzjBAVxpobLMa7lZeBKd+kke2iP3dNanaqn5MoW0UhwH6gmse7Wu+q6P0fsD6r
         NTSIagw+J7hInOkrKC4Ldl1rvPu345COOaCinwq7AZarccx74UTjcXdtTR9iDW11+A2v
         Ie7lOBsrvRCGdTeebHEmvGDTM8bbNdFQ1fS3Ks3PNIQlIZT7gzvJyzgmJQs1O+DW6GAg
         c8pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jUBkBWWpavQfJ/XXZFQzGX0EU9d+FGRKZtwFN9vG+OA=;
        b=LBBcplUXJyd/d7bhjljSl0UL+KkDRvQdc2h2hHGQO5QfpVEI7+bACCWZiRzxHDZTM0
         0jUvaHQfg4m4DEw8zGD6e1xWDYHiHQx7QOkGJix6UVQDHf4lRZMYsxolbhgQsB894ZEY
         Y+yFdzCN3vEaGaSdigVtu2gVxjkgP3jJa5mZescAKCIpQ4vx1o3f1HgYPLuenxfjaN+Q
         xXihu3YxJizllQrmD+RJVZzFYURrDITZ/KU6X8DNVsGDKD0afxLtsMeSGCQMg68d9BM3
         8ZEgKMpSHejHSgEy8VugvZMD552WR6htpS3geqSSH7ddwqMRg1PXvtpNEpvcUOaCSpzz
         RIQg==
X-Gm-Message-State: AOAM5301Nx+/8Bqltzu8PIidB+tXybo7Ju0CBbzHdsyRlDVP64s+VMjX
        Fx9sP5szyHAxRWlsyIdm3IhgMiqh4vnfXrPe
X-Google-Smtp-Source: ABdhPJylh1Ez4tGzoeBlTpyeDixq0uRQnRp+1nT/DNmAMumLZbrF4ZKR6rf6qrJmWr5WvmQ+HVoiQw==
X-Received: by 2002:aa7:d5d6:: with SMTP id d22mr8777514eds.302.1622627248235;
        Wed, 02 Jun 2021 02:47:28 -0700 (PDT)
Received: from localhost.localdomain (hst-221-100.medicom.bg. [84.238.221.100])
        by smtp.gmail.com with ESMTPSA id q18sm945138edd.3.2021.06.02.02.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 02:47:27 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v4 2/2] venus: venc: Add support for intra-refresh period
Date:   Wed,  2 Jun 2021 12:47:14 +0300
Message-Id: <20210602094714.607828-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210602094714.607828-1-stanimir.varbanov@linaro.org>
References: <20210602094714.607828-1-stanimir.varbanov@linaro.org>
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

