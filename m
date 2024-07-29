Return-Path: <linux-media+bounces-15485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79EEC93FE4C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 21:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C22282DEA
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 19:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03C5D188CA3;
	Mon, 29 Jul 2024 19:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bewE35Ot"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F69187324
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 19:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722281556; cv=none; b=pjLKMLTEqm5inAFwuOqBXY3WZh2+vT8tHAOk6DM9w/Askhy2k8pdurBYGGGGW74DHc2z+H4oUUpJe3h/7FGuhPcHxUr0AR2N0wfBR4gu2poxVvJVRsLG2UheDccU509edCGOpbuFQmiQ8CM55kaWnYEKutK4SmdSL1K4081GqiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722281556; c=relaxed/simple;
	bh=LNoD2+pbavtvKAu5PYc7V/mZXMH1gzefksirxA8POWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ps0CQvh+s3NqRDeRjlPQj86+KdpKlvR5ZXUgUMT2W2+RtvwSq7jStpuGXmdwmiUijYNIq0ZQI0KnTvhhJedltSuUoSnfoz/YpWHjYLTIuGw6+Tgrl4D0hIq6b0qTaDQ8AQ6dwbdRaqhlVngjkhjcX7KKYQWl7PcsOtfJQN5fYNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bewE35Ot; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc692abba4so22915865ad.2
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722281554; x=1722886354; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAYGHDekdM2SCbf/2ptxx9Mv3z3j6xxjhaqSJCtfArI=;
        b=bewE35OtKu6vz7mA1Gzhe7o2dljNEm27MtQK6K2v6/mCdqk/PR4OkunLcSyuCrDaX3
         6grTTXhDMB2sk/vDyk+IzDangAMuX8x9mOiKUHmMdIVfebLs4/y4GiX7ePwWZOa/xfe/
         VCr7n65W7RaMOQUqatM3D1XWoprADA3kDKMhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722281554; x=1722886354;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAYGHDekdM2SCbf/2ptxx9Mv3z3j6xxjhaqSJCtfArI=;
        b=VysOh6WbSFQj7mbk4LNFqYRqmdPw9SbQMK1lePsMTd5NmEK8xwR02hbWOC5A3AQO5A
         gVOTOigM4ECON4OpRw3P3sKzrJwDgh+baHlZeVqI3h+GUUNReNRvzeyRXElrF1Svs55g
         pSokqAkb4+LY9YqtfaoCN7WfhHoHo1nLrQQuc8VR/lUN+CagAtSDWdghQELiXhQpP6aF
         VYrQc13UaX8egZMV/IDW4wQ+gZDCygCBZhFR3qQSjg/1A116D2Lkx0c6G62zxKN10jlX
         2sCqQvHe64MPaW2kh8ZhWe+bsTR6gA7tPJyfHbLO93wre8tBp7kNMaZ1qfirN+T7pG/O
         55wA==
X-Gm-Message-State: AOJu0Yyk5YNSnpI0Q8FtYB8IFb/pErxhMBs1nwOWmfjAYiMaUALXuCnn
	ekfdp9pWO4beT3OvqBZqeuhna6pfJMsFZpfBaNUuz/o1Qf4vLCrl255+OAkGPwSkqLLZHEYeu9U
	=
X-Google-Smtp-Source: AGHT+IEQXfMiiYnjbH75kiR1p59qlKzo4PsAEjfVafvcJl3daV8K8yHf5HdxVKFGFKWMumdpseFBvA==
X-Received: by 2002:a17:902:74ca:b0:1fc:4940:d3ad with SMTP id d9443c01a7336-1ff0487db67mr55661965ad.59.1722281554025;
        Mon, 29 Jul 2024 12:32:34 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:5aa6:a2c1:9047:7da2])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fed7f60539sm86435565ad.220.2024.07.29.12.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 12:32:33 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	bryan.odonoghue@linaro.org,
	Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH v2 3/3] media: venus: Enable h.264 hierarchical coding
Date: Mon, 29 Jul 2024 12:19:12 -0700
Message-ID: <20240729193219.1260463-4-frkoenig@chromium.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
In-Reply-To: <20240729193219.1260463-1-frkoenig@chromium.org>
References: <20240729193219.1260463-1-frkoenig@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The series of V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING* controls
provides the functionality for temporal layering. These controls allow
for different framerates in a single stream.

HFI supports hierarchical P encoding and the ability to specify the
bitrate for the different layers.

Connect the controls that V4L2 provides and HFI supports.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
v2:
- update commit message

 drivers/media/platform/qcom/venus/core.h      |  4 +
 drivers/media/platform/qcom/venus/venc.c      | 24 ++++++
 .../media/platform/qcom/venus/venc_ctrls.c    | 84 +++++++++++++++++++
 3 files changed, 112 insertions(+)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 55202b89e1b9..fc9552311a71 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -274,6 +274,10 @@ struct venc_controls {
 	s32 h264_loop_filter_beta;
 	u32 h264_8x8_transform;
 
+	u32 h264_hier_enabled;
+	u32 h264_hier_p_layers;
+	u32 h264_hier_p_bitrate[6];
+
 	u32 hevc_i_qp;
 	u32 hevc_p_qp;
 	u32 hevc_b_qp;
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index ae24de125c56..301b0015b356 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -875,6 +875,30 @@ static int venc_set_properties(struct venus_inst *inst)
 		ret = hfi_session_set_property(inst, ptype, &h264_transform);
 		if (ret)
 			return ret;
+
+		if (ctr->h264_hier_enabled) {
+			unsigned int i;
+
+			ptype = HFI_PROPERTY_PARAM_VENC_HIER_P_MAX_NUM_ENH_LAYER;
+			ret = hfi_session_set_property(inst, ptype, &ctr->h264_hier_p_layers);
+			if (ret)
+				return ret;
+
+			ptype = HFI_PROPERTY_CONFIG_VENC_HIER_P_ENH_LAYER;
+			ret = hfi_session_set_property(inst, ptype, &ctr->h264_hier_p_layers);
+			if (ret)
+				return ret;
+
+			for (i = 0; i < ctr->h264_hier_p_layers; ++i) {
+				ptype = HFI_PROPERTY_CONFIG_VENC_TARGET_BITRATE;
+				brate.bitrate = ctr->h264_hier_p_bitrate[i];
+				brate.layer_id = i;
+
+				ret = hfi_session_set_property(inst, ptype, &brate);
+				if (ret)
+					return ret;
+			}
+		}
 	}
 
 	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 6304cc97d37f..4cad8058339a 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -345,6 +345,52 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 
 		ctr->h264_8x8_transform = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_TYPE:
+		if (ctrl->val != V4L2_MPEG_VIDEO_H264_HIERARCHICAL_CODING_P)
+			return -EINVAL;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING:
+		ctr->h264_hier_enabled = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIERARCHICAL_CODING_LAYER:
+		ctr->h264_hier_p_layers = ctrl->val;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR:
+		ctr->h264_hier_p_bitrate[0] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[0], 0);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR:
+		ctr->h264_hier_p_bitrate[1] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[1], 1);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR:
+		ctr->h264_hier_p_bitrate[2] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[2], 2);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR:
+		ctr->h264_hier_p_bitrate[3] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[3], 3);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR:
+		ctr->h264_hier_p_bitrate[4] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[4], 4);
+		if (ret)
+			return ret;
+		break;
+	case V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR:
+		ctr->h264_hier_p_bitrate[5] = ctrl->val;
+		ret = dynamic_bitrate_update(inst, ctr->h264_hier_p_bitrate[5], 5);
+		if (ret)
+			return ret;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -627,6 +673,44 @@ int venc_ctrl_init(struct venus_inst *inst)
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
+				  6, 1, 0);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L0_BR, BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L1_BR, BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L2_BR, BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L3_BR, BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L4_BR, BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+
+		v4l2_ctrl_new_std(&inst->ctrl_handler, &venc_ctrl_ops,
+				  V4L2_CID_MPEG_VIDEO_H264_HIER_CODING_L5_BR, BITRATE_MIN, BITRATE_MAX,
+				  BITRATE_STEP, BITRATE_DEFAULT);
+	}
+
 	ret = inst->ctrl_handler.error;
 	if (ret)
 		goto err;
-- 
2.46.0.rc1.232.g9752f9e123-goog


