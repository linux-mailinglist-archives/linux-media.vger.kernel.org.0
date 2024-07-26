Return-Path: <linux-media+bounces-15369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B9293DA3A
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 23:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A48541C232CD
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 21:38:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CF0514A0BD;
	Fri, 26 Jul 2024 21:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jwGHbmAT"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBC9149E06
	for <linux-media@vger.kernel.org>; Fri, 26 Jul 2024 21:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722029923; cv=none; b=eq7sJHcoqvp8taynI3t6ClshIl5dPTNuc9N2MBdVk4gBGiOdjL2KbHbGHYWnTsl/xGop/M/LG14Gtvz1cxcG7sxvPRusde/R1OXmRQGozp/60cvf68xKArehbW8cqJL2YmI3NMwj3fD2ZGobxuy7GPVok0s07NUHVgDBKzA+M7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722029923; c=relaxed/simple;
	bh=oyisSSqjsyiYhbYGeEMUn3BJQQHTE4nG01oaTApJn3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPvBSpSQH55UP3kVbX8mNlzYR9frzqTNAtIXZj87LrivgsgoYRTCHIsbTIQFV6rg/R6OuvhH1WVvqcwTOZKNZzwA+Yo4DrjxQgJmDPuJkVv++wJ4hXN0kFBhYgpfOc3fYCYMyPdteTE4riRh2euUrqqMOE0Lrh/tx9oYZ5XnGh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jwGHbmAT; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1fd66cddd07so9459035ad.2
        for <linux-media@vger.kernel.org>; Fri, 26 Jul 2024 14:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722029920; x=1722634720; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BUFb5p7xsncnTrsEyvWD9gJY6IYJ7AW5CoZA5iMZA8Q=;
        b=jwGHbmATalE5GykP4aa+3WlsarQCknbnRkF0qfcTaSY9Kjqaxh2epTsgijDfRrpOvq
         80+SciJdjzz+GPYTBvEmH9CT0N+67V2g9GKUbBvPpxgVXCmuBJXTpeCca1+mWP1MXcwP
         WByTv4hzI4ne4RIo9JQm8ZO+zPjq7TwRRHWns=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722029920; x=1722634720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BUFb5p7xsncnTrsEyvWD9gJY6IYJ7AW5CoZA5iMZA8Q=;
        b=phX/z2HrxhnKq1VbognHEpXHVw7QtVfOsJEyJRybQxYfM3XX8jRkamD2yO2sDOF6iB
         OxMkXfusASW2TnETxwKEZaqMhpmNPL2BHqmPSSOHgF7rMbZY6j54zZequNJWw2QifMzu
         QWQ6jW/LoAfCDseXhAH05DRGfjAvRRxTOOrennBTCqrM5lG6OgT27x4njP/EztItWOKz
         KbO2pemnbMwEhjDnrZ7hFnM1yaamOu1A161nbw81iNRHpqGM3IuduwbCdU/NG00Ir9NF
         EkWnd94gqqZ9g2/YesyaZuCb1KYUMhg7idn7GDAsm0bH+BU3R98yjaNk5zgpsVEr938h
         ZNPA==
X-Gm-Message-State: AOJu0YyTySXXEJUPSv2vn5wNHFF2iF4r7+mkPIVegxWHCSEZV+JZb59e
	cpY4gpMwOBzKw7KEr9BXsBQ8WC1uW+z1+aqwgRxRVlxHb3NFTnNFLmRvoUpM6H4xFfCPCjqJwFA
	=
X-Google-Smtp-Source: AGHT+IHInaevswBW/hxFYzTUIYY3pDt/FWfo09exeE3UnUjWXntfrdlBfaOVJUD8piA38iPjjKwf9g==
X-Received: by 2002:a17:902:e847:b0:1fd:82fa:dfc2 with SMTP id d9443c01a7336-1ff048e58b7mr10762795ad.50.1722029920487;
        Fri, 26 Jul 2024 14:38:40 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:197c:4043:3e17:8623])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fed7fcb33dsm37467045ad.281.2024.07.26.14.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 14:38:40 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	bryan.odonoghue@linaro.org,
	Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH 3/3] media: venus: Enable h.264 hierarchical coding
Date: Fri, 26 Jul 2024 14:38:11 -0700
Message-ID: <20240726213811.562200-3-frkoenig@chromium.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
In-Reply-To: <20240726213811.562200-1-frkoenig@chromium.org>
References: <20240726213811.562200-1-frkoenig@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

HFI already supports, V4L2 already has the control,
put them together!
---
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


