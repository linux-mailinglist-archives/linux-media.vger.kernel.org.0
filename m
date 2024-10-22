Return-Path: <linux-media+bounces-20055-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C62F9AB54E
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 19:41:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BC261F2429D
	for <lists+linux-media@lfdr.de>; Tue, 22 Oct 2024 17:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DD4A1BF80A;
	Tue, 22 Oct 2024 17:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XRLo+SY4"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351D31BE23A
	for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 17:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729618849; cv=none; b=LP4OBsmYHkgfBIYywKEEoEwWg4aw5Tb27PMnvRGrwAXdC0zIltoRbxJAizlHrwW9lL2bbr72S3gXm/hd/fDAOa/GBhlkK3M+qjGMA4YOrSS7ViqWRsu8Hko6AH/ggtkYYHemtgq7KQSBCtWphHaBCpzrfbqqEZ4OyCTqPd2nGbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729618849; c=relaxed/simple;
	bh=8WD3EDDIY6nRwJgBILdejv1KXcxO/XEg4ymdZkEao40=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y/iNGGVtdsFSz7lW/9saM6Tmiyma30Iwy71jdW8QkWY1md07QSnm+Qz8rsZW+QCyy6t5oby/CR0pi2kIXuIITDQ3uvgKMOr03hZ/rY2qQVdh9SFermVyRf+rSLiYfuitblVzyA/NxVesUSNJu4lTs//UpLdJKpVzfb+9B0ahj9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XRLo+SY4; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e72db7bb1so4279883b3a.0
        for <linux-media@vger.kernel.org>; Tue, 22 Oct 2024 10:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729618847; x=1730223647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hiI/WriZlF4yG6diNP/Nfp7ERYOSiUQCm9cUT10e9ls=;
        b=XRLo+SY4+2WfAF9ut5UjI9TFpjp2LjF1Cc1wtAn7ULHM4xFgiAij55b8Fw5qyvFJcK
         wZKC838u4ocYqYkG1WAP2jIAsOX+Vo3vd19F2DgDLEDeuVLXeZwO8NX2jiCCedDlQNIG
         vcfUK1mrpRveOyT34uwOvLoLYIOwFqaJKhiSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729618847; x=1730223647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hiI/WriZlF4yG6diNP/Nfp7ERYOSiUQCm9cUT10e9ls=;
        b=U/UT8JzgIThuU/qmnVXpvVnZY4v0Ui+ONKEwBbJvLCoAp+2A5UMvk9J8Imyi0PXmNc
         1wInaApc68Ytmzqc/Uk+Duc+vza8LTEPONxkVV2UWQJEp3t2mPI8fXn2I3zdTE7Upasa
         51TqFxUok8dvcY1P9vxwwMEhCbFe9cporQs8wmZBGU5Cf3hjKhgI6mOaQD5pzxSQgcJf
         74NeNS1MRWK2LtiQFM5KwFkBaY3G2lLM/avq5E34KdOmmjLRZNfkHan63BkZER54eeJ1
         6ewtMc+54UHsD05lOkA1frs0GSYqs0ozZhHjG2ey6XOaEYPTN4MpFZWmGfLHJpsb/UpB
         hhcg==
X-Forwarded-Encrypted: i=1; AJvYcCVJJjppbpd5LQrwPj5C7YJYX+DO1+M1AsDkxJzMP0xT0lFMxskwbX1+u7Q1+knIUIdt6MOkH1YHGoY1pA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwMy4tKgYPq02ZquR/quXoppoSClC11njwVLdn+tbhdPxRmrJnL
	jWAz+1PJT/JTgL2dAS/k++gDY0rzz63GmSa+4LugAzNZCddZ1TSXMdZWm6qSfg==
X-Google-Smtp-Source: AGHT+IFf5IUrR4y71FXBLu1VA6iTSR+LrclnTni6VlVJv6JQ36EY8E78CmXkX/ydBf6WIxmAiparqw==
X-Received: by 2002:a05:6a00:14c9:b0:71e:3b8:666b with SMTP id d2e1a72fcca58-72030a8069amr43653b3a.15.1729618847483;
        Tue, 22 Oct 2024 10:40:47 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:158a:d1d:c077:7770])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1312d6bsm4992423b3a.29.2024.10.22.10.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 10:40:47 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Tue, 22 Oct 2024 10:40:43 -0700
Subject: [PATCH v5 2/2] media: venus: Enable h.264 hierarchical coding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241022-submit-v5-2-552f0fec8cba@chromium.org>
References: <20241022-submit-v5-0-552f0fec8cba@chromium.org>
In-Reply-To: <20241022-submit-v5-0-552f0fec8cba@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.15-dev-37811

HFI supports hierarchical P encoding and the ability to specify the
bitrate for the different layers.

Connect the controls that V4L2 provides and HFI supports.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
Reviewed-by: Dikshita Agarwal <quic_dikshita@quicinc.com>
---
 drivers/media/platform/qcom/venus/core.h       |  4 ++
 drivers/media/platform/qcom/venus/venc.c       | 71 +++++++++++++-------
 drivers/media/platform/qcom/venus/venc_ctrls.c | 92 ++++++++++++++++++++++++++
 3 files changed, 144 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 55202b89e1b9..fd46a7778d8c 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -26,6 +26,7 @@
 #define VIDC_CLKS_NUM_MAX		4
 #define VIDC_VCODEC_CLKS_NUM_MAX	2
 #define VIDC_RESETS_NUM_MAX		2
+#define VIDC_MAX_HIER_CODING_LAYER 6
 
 extern int venus_fw_debug;
 
@@ -255,6 +256,7 @@ struct venc_controls {
 	u32 rc_enable;
 	u32 const_quality;
 	u32 frame_skip_mode;
+	u32 layer_bitrate;
 
 	u32 h264_i_period;
 	u32 h264_entropy_mode;
@@ -273,6 +275,8 @@ struct venc_controls {
 	s32 h264_loop_filter_alpha;
 	s32 h264_loop_filter_beta;
 	u32 h264_8x8_transform;
+	u32 h264_hier_layers;
+	u32 h264_hier_layer_bitrate[VIDC_MAX_HIER_CODING_LAYER];
 
 	u32 hevc_i_qp;
 	u32 hevc_p_qp;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..75b832ffc0f9 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -734,6 +734,29 @@ static int venc_set_properties(struct venus_inst *inst)
 		if (ret)
 			return ret;
 
+		if (ctr->layer_bitrate) {
+			unsigned int i;
+
+			ptype = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;
+			ret = hfi_session_set_property(inst, ptype, &ctr->h264_hier_layers);
+			if (ret)
+				return ret;
+
+			ptype = HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER;
+			ret = hfi_session_set_property(inst, ptype, &ctr->layer_bitrate);
+			if (ret)
+				return ret;
+
+			for (i = 0; i < ctr->h264_hier_layers; ++i) {
+				ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
+				brate.bitrate = ctr->h264_hier_layer_bitrate[i];
+				brate.layer_id = i;
+
+				ret = hfi_session_set_property(inst, ptype, &brate);
+				if (ret)
+					return ret;
+			}
+		}
 	}
 
 	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
@@ -823,18 +846,33 @@ static int venc_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
-	if (!ctr->bitrate)
-		bitrate = 64000;
-	else
-		bitrate = ctr->bitrate;
+	if (!ctr->layer_bitrate) {
+		if (!ctr->bitrate)
+			bitrate = 64000;
+		else
+			bitrate = ctr->bitrate;
 
-	ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
-	brate.bitrate = bitrate;
-	brate.layer_id = 0;
+		ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
+		brate.bitrate = bitrate;
+		brate.layer_id = 0;
 
-	ret = hfi_session_set_property(inst, ptype, &brate);
-	if (ret)
-		return ret;
+		ret = hfi_session_set_property(inst, ptype, &brate);
+		if (ret)
+			return ret;
+
+		if (!ctr->bitrate_peak)
+			bitrate *= 2;
+		else
+			bitrate = ctr->bitrate_peak;
+
+		ptype = HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE;
+		brate.bitrate = bitrate;
+		brate.layer_id = 0;
+
+		ret = hfi_session_set_property(inst, ptype, &brate);
+		if (ret)
+			return ret;
+	}
 
 	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
 	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
@@ -849,19 +887,6 @@ static int venc_set_properties(struct venus_inst *inst)
 			return ret;
 	}
 
-	if (!ctr->bitrate_peak)
-		bitrate *= 2;
-	else
-		bitrate = ctr->bitrate_peak;
-
-	ptype = HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE;
-	brate.bitrate = bitrate;
-	brate.layer_id = 0;
-
-	ret = hfi_session_set_property(inst, ptype, &brate);
-	if (ret)
-		return ret;
-
 	ptype = HFI_PROPERTY_PARAM_VENC_SESSION_QP;
 	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
 		quant.qp_i = ctr->hevc_i_qp;
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 3e1f6f26eddf..e340783a4ef2 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -346,6 +346,55 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 		ctr->h264_8x8_transform = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
+		if (ctrl->val != V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P)
+			return -EINVAL;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
+		ctr->layer_bitrate = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
+		if (ctrl->val > VIDC_MAX_HIER_CODING_LAYER)
+			return -EINVAL;
+		ctr->h264_hier_layers = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
+		ctr->h264_hier_layer_bitrate[0] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[0], 0);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
+		ctr->h264_hier_layer_bitrate[1] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[1], 1);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
+		ctr->h264_hier_layer_bitrate[2] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[2], 2);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
+		ctr->h264_hier_layer_bitrate[3] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[3], 3);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
+		ctr->h264_hier_layer_bitrate[4] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[4], 4);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
+		ctr->h264_hier_layer_bitrate[5] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_layer_bitrate[5], 5);
+		if (ret)
+			return ret;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -628,6 +677,49 @@ int venc_ctrl_init(struct venus_inst *inst)
 			  V4L2_CID_MPEG_VIDEO_INTRA_REFRESH_PERIOD, 0,
 			  ((4096 * 2304) >> 8), 1, 0);
 
+	if (IS_V4(inst->core) || IS_V6(inst->core)) {
+		v4l2_ctrl_new_std_menu(&inst->ctrl_handler, &venc_ctrl_ops,
+				       V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE,
+				       V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P,
+				       1, V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING, 0, 1, 1, 0);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER, 0,
+				  VIDC_MAX_HIER_CODING_LAYER, 1, 0);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR,
+				  BITRATE_MIN, BITRATE_MAX, BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR,
+				  BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR,
+				  BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR,
+				  BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR,
+				  BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR,
+				  BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+	}
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;

-- 
2.47.0.105.g07ac214952-goog


