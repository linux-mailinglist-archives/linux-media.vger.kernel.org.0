Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D389532A85F
	for <lists+linux-media@lfdr.de>; Tue,  2 Mar 2021 18:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1580232AbhCBRax (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 2 Mar 2021 12:30:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1577811AbhCBJyn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 2 Mar 2021 04:54:43 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE2C9C0617AA
        for <linux-media@vger.kernel.org>; Tue,  2 Mar 2021 01:54:02 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id p8so7714556ejb.10
        for <linux-media@vger.kernel.org>; Tue, 02 Mar 2021 01:54:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EdJzhp+FqGbnwXajAcOWTyezJi1vdCAgMV7g3U64BvE=;
        b=YgQInyUWTvGwp8jPCKBjOeGiWJ+75shBSiz2A4QcgVDROuE+TlXwnjpMluW1PmEwla
         n8+hC4No+gAM/JwGTfV7pfnKgiQqBlcI0L+rDNOlYbS/wcX3Bx1F6G2H9MCKc/pFM+KE
         QAlPtlHmGRmBLZydwere7wXRkYhlTVE5o3G5ruEKCQ1q7HS2R7YHbbN39Bwpyh2iigm7
         8amWvGgi94kxuHupxsiKm0IV3vfe3hmoX4vz1WiYL1rBVNz2P/A82IYnx8DQou/Xu1pL
         uj267aAhg+TXRFgNxVo/tiGyFjqqFMcmY2w4Z0SrobsjltTnO1ZPavsA527EtokJf9iD
         Y1pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EdJzhp+FqGbnwXajAcOWTyezJi1vdCAgMV7g3U64BvE=;
        b=IZAgXuRJ1pUxItkjDo4fpFbCHHJ3KGJdRpX917om1LTqH9mPINtw06mNvw7ixv8poB
         +fqt3qaqwISzkLpdDUPcmv7arkAGmDJ/yLl/vuNAMH3un3v4xd9TrG+q0yXIBN2fEAVv
         Q2rSEvvlehIsljhue2Drgeruf/nF053uKBOmlmTu6V1TLAVn+Ide78ugFX1j+A/AZQU6
         etJuasWvogFzkfRMG5vbFbePfk0cw/qcgQhGQwtlZo6cuglR1XHkLd8a9Z1tpttefd22
         A+/bbPMfYmKQ5bnsgNi2v7WISTp1fmbwyr8YZVncEdp9rPV8gDx91V77ffFTzEFdtwZN
         gykQ==
X-Gm-Message-State: AOAM531SifzmmwDOz24IQVdt+/z3OvoFlHhsrA+Sj2Bayl0BTXL1WzAD
        XXOfHhRbg9jZ7cD6nrWGNt0ah1jp1WYOfEso
X-Google-Smtp-Source: ABdhPJws8QMOHgtX0hmI2FudbbSYVTTdds5QWLCsp+oFND6r5MnM2K9QLLygahCAJqS28wkudoOfnQ==
X-Received: by 2002:a17:906:4d44:: with SMTP id b4mr17521325ejv.338.1614678841487;
        Tue, 02 Mar 2021 01:54:01 -0800 (PST)
Received: from localhost.localdomain (hst-208-217.medicom.bg. [84.238.208.217])
        by smtp.gmail.com with ESMTPSA id be27sm2530535edb.47.2021.03.02.01.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 01:54:01 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Cc:     Ezequiel Garcia <ezequiel@collabora.com>,
        nicolas.dufresne@collabora.com,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 2/2] venus: venc: Add support for intra-refresh period
Date:   Tue,  2 Mar 2021 11:53:40 +0200
Message-Id: <20210302095340.3584204-3-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210302095340.3584204-1-stanimir.varbanov@linaro.org>
References: <20210302095340.3584204-1-stanimir.varbanov@linaro.org>
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
 drivers/media/platform/qcom/venus/venc.c      | 28 +++++++++++++++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 13 ++++-----
 3 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index a252ed32cc14..8602b7af6a6f 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -222,6 +222,7 @@ struct venc_controls {
 	u32 multi_slice_max_mb;
 
 	u32 header_mode;
+	u32 intra_refresh_period;
 
 	struct {
 		u32 h264;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 6976ed553647..dcc9bd3475bf 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -546,6 +546,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	struct hfi_quantization quant;
 	struct hfi_quantization_range quant_range;
 	struct hfi_enable en;
+	struct hfi_intra_refresh intra_refresh = {};
 	u32 ptype, rate_control, bitrate;
 	u32 profile, level;
 	int ret;
@@ -754,6 +755,33 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
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
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index a52b80055173..6909426882ac 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -17,7 +17,6 @@
 #define SLICE_BYTE_SIZE_MAX	1024
 #define SLICE_BYTE_SIZE_MIN	1024
 #define SLICE_MB_SIZE_MAX	300
-#define INTRA_REFRESH_MBS_MAX	300
 #define AT_SLICE_BOUNDARY	\
 	V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY
 
@@ -224,8 +223,6 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		}
 		mutex_unlock(&inst->lock);
 		break;
-	case V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB:
-		break;
 	case V4L2_CID_MPEG_VIDEO_GOP_SIZE:
 		ret = venc_calc_bpframes(ctrl->val, ctr->num_b_frames, &bframes,
 					 &ctr->num_p_frames);
@@ -276,6 +273,9 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID:
 		ctr->base_priority_id = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD:
+		ctr->intra_refresh_period = ctrl->val;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -459,10 +459,6 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_BETA, -6, 6, 1, 0);
 
-	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
-		V4L2_CID_MPEG_VIDEO_CYCLIC_INTRA_REFRESH_MB,
-		0, INTRA_REFRESH_MBS_MAX, 1, 0);
-
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 		V4L2_CID_MPEG_VIDEO_GOP_SIZE, 0, (1 << 16) - 1, 1, 30);
 
@@ -497,6 +493,9 @@ int venc_ctrl_init(struct venus_inst *inst)
 	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_BASELAYER_PRIORITY_ID, 0,
 			  6, 1, 0);
+	v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
+			  ((4096 * 2304) >> 8), 1, 0);
 
 	ret = inst->ctrl_handler.error;
 	if (ret)
-- 
2.25.1

