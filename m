Return-Path: <linux-media+bounces-16322-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 27209952559
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2024 00:14:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 88B47B240A5
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2024 22:14:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F40F3149C5A;
	Wed, 14 Aug 2024 22:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b0JXmDwO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BD08149C60
	for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723673660; cv=none; b=FC5Riuffo0WRWqUxOL7sURqC3iWeIr4nUr4UhZUoiKgUW9gdBLcnIidmxxwpAHmYr7I0vTxASIxi7d2OTjRTVMYyyUlazo6mnferDhGZBK1Y/GqpQcAddrvyFp2Frms8WAf+z2cEDrS8gly0deSUjHUeiyYZ3wL4AQRJjL6qejg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723673660; c=relaxed/simple;
	bh=g3+1rXrVGK6e6kvEGUQXjS1eg9BCbbdzxfIWW2UBOzs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NZMBcPKh4ElfkDrpQIigiiUGEVftbShP3YQ/UpO0me1s9OF2XDwsxMuKX9Tp7/NCmojq7ZLB7drkOIplb44MfycGGgKT9S8Z6Zg/0ZK7HCGLLgb/HKyIWNzmOpbgAw6Br00juGQwrO5vHTqS2DpHJpkS271+Xe+AMvXpZ8mQVFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b0JXmDwO; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fc692abba4so2989225ad.2
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2024 15:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723673657; x=1724278457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIq4wNydhj/PvuoGRWZ7DkKKTJPlbKQ7LujNOleJ5eo=;
        b=b0JXmDwOM4+UyLSjrsKKaC6r9HP8IFWzOJaZ5hHTE+i4H/MHxz5EmToXIGJZSUJF2C
         CY4fC+H5/Qqa3l4l3TVBTSeImvcxr04gBwetyULzGGxCYdWCTiIDsjWKxTVQL62jmf2d
         L48tBHNfUbPM1DwX1npL+B+6ra5RdJtCXuiqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723673657; x=1724278457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIq4wNydhj/PvuoGRWZ7DkKKTJPlbKQ7LujNOleJ5eo=;
        b=olD22Ms06ROwzUiutOJNTBNKE174mpey794H9cxfX5xzpV31YSHpmXTKmX0EctzITa
         pa8qtN9U0X9OY0ExJrBKLhYXDYQPiRjufTgowuGaT3dzhJuTeqYsAh7bJTbDwimL16rb
         y0WqLaKNGX6LRzTXRf1I6qEk5KxE1ZoklPkz8Y3K4YLV0G7ZYvZw59R5dfBW1IQTynGl
         qp358g5/yeHHFDs3tqi++CSrOX4SOEgsrZXoZlpREg2oJQAddhhtMPV9ivGW3qPEhxS9
         Qvpe3+TaTZHF5+wfXCVNswtwsMW3h7t5h5fCwpUSdFfa4Q9bc9zJUnjDna4zkPR/xjwu
         5dNw==
X-Forwarded-Encrypted: i=1; AJvYcCWC1MhK9PjWs7haCS6WioC+4fU8LB5yQKHzsTHA/RE+M6jiZhtqx4cB9jHuDhQ2jEP2/QprTDpu+K9Srf04A9wHXGLsKn/l3k6V+PY=
X-Gm-Message-State: AOJu0Yy/a7K3t2+ZtCQdvJP3G9E7PqQb5eP9JtpHQb77MPFg+Arzr5W5
	K1vcScL9lTUsFDNlT0eMbkiJbHN9YaRcMpMtxo3ExjCx59hys9TDnRIo1CYnow==
X-Google-Smtp-Source: AGHT+IF75/3P+9x6GVjTTX48CbPnzoDxgCxwnu6xe/hY2peSPXpuIomwL61xlReWeDCnp009l7PdwQ==
X-Received: by 2002:a17:902:ecc3:b0:1fc:72f5:43b6 with SMTP id d9443c01a7336-201d63dcbbcmr49050035ad.20.1723673656770;
        Wed, 14 Aug 2024 15:14:16 -0700 (PDT)
Received: from zipper.pdx.corp.google.com ([2a00:79e0:2e13:6:aab8:3da7:4601:820d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201f0375725sm1046595ad.132.2024.08.14.15.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 15:14:15 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
Date: Wed, 14 Aug 2024 15:14:05 -0700
Subject: [PATCH v3 2/2] media: venus: Enable h.264 hierarchical coding
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240814-submit-v3-2-f7d05e3e8560@chromium.org>
References: <20240814-submit-v3-0-f7d05e3e8560@chromium.org>
In-Reply-To: <20240814-submit-v3-0-f7d05e3e8560@chromium.org>
To: Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Dikshita Agarwal <quic_dikshita@quicinc.com>
Cc: Nathan Hebert <nhebert@chromium.org>, linux-media@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Fritz Koenig <frkoenig@chromium.org>
X-Mailer: b4 0.13.0

HFI supports hierarchical P encoding and the ability to specify the
bitrate for the different layers.

Connect the controls that V4L2 provides and HFI supports.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
 drivers/media/platform/qcom/venus/core.h       |  4 ++
 drivers/media/platform/qcom/venus/venc.c       | 85 +++++++++++++++---------
 drivers/media/platform/qcom/venus/venc_ctrls.c | 92 ++++++++++++++++++++++++++
 3 files changed, 151 insertions(+), 30 deletions(-)

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
index 3ec2fb8d9fab..af2c92069967 100644
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
@@ -823,45 +846,47 @@ static int venc_set_properties(struct venus_inst *inst)
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
 
-	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
-	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
-		ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
-		if (ctr->header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
-			en.enable = 0;
+		if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
+				inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+			ptype = HFI_PROPERTY_CONFIG_VENC_SYNC_FRAME_SEQUENCE_HEADER;
+			if (ctr->header_mode == V4L2_MPEG_VIDEO_HEADER_MODE_SEPARATE)
+				en.enable = 0;
+			else
+				en.enable = 1;
+
+			ret = hfi_session_set_property(inst, ptype, &en);
+			if (ret)
+				return ret;
+		}
+
+		if (!ctr->bitrate_peak)
+			bitrate *= 2;
 		else
-			en.enable = 1;
+			bitrate = ctr->bitrate_peak;
 
-		ret = hfi_session_set_property(inst, ptype, &en);
+		ptype = HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE;
+		brate.bitrate = bitrate;
+		brate.layer_id = 0;
+
+		ret = hfi_session_set_property(inst, ptype, &brate);
 		if (ret)
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
2.46.0.184.g6999bdac58-goog


