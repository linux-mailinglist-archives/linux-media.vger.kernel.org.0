Return-Path: <linux-media+bounces-15367-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBC993DA38
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 23:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EFFB6B21BBC
	for <lists+linux-media@lfdr.de>; Fri, 26 Jul 2024 21:38:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC05149E16;
	Fri, 26 Jul 2024 21:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f4VGNXHo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F8411C83
	for <linux-media@vger.kernel.org>; Fri, 26 Jul 2024 21:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722029921; cv=none; b=DhEVpiaA7nHrxUqUW4XjDNT9DOak+Kg0TaQERpoynnrLUctBFTRAw1xugD1wTPf5Fer3FD2WcPDu0sjTOhhdjlqt1V8ZBWL0vez1Tn6ANONz55eRQgMKngOApku7D+UklIDr/Tq8i+CaGEhb/OJjhx/qKUH50V2ogFbJzpw3tdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722029921; c=relaxed/simple;
	bh=7VFdmxw54KU9fz4EQl1WASZFk2FfQn25Zj9vNwaZrKg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AptlNwBBO8b/1MF3gCgGu4DCvUacZ3QlSoqCS8QEBHNXA+Z0pcK0ZEs3GJi14iSH4d2mqn7pRq0vem3XZXBAD4b6kVNRGdaKIZjEhna/aK5mYaEse9eiup2Kr1RR1O9kb431S4izMR6yUAZqfzTNTUxfGxufYsuwFo4+bBJDiUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f4VGNXHo; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-70d2d7e692eso1242221b3a.0
        for <linux-media@vger.kernel.org>; Fri, 26 Jul 2024 14:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722029918; x=1722634718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr+j5F5xUEwSEAluUJYgrWjccakpov5FGoXsHZjNFoM=;
        b=f4VGNXHoASzw/DgG+yNBT4noJHMthEC7xRmQb1RzUvtNSNp1PpfJUYNj+YRri1XaHY
         157teAwAlLRrTSOLJtJ48JRFZipRLPkHbeG6n15+pFWj7JLK8b6I4rY0iOZTMFoPHFHF
         CxH0wbmPKuHCospMwrN970xPt6tcEuifH+lnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722029918; x=1722634718;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Hr+j5F5xUEwSEAluUJYgrWjccakpov5FGoXsHZjNFoM=;
        b=AfEDVnu4hWN6ExFFJ37HNqbVvFL5hv5t8ZYRD8q/nSI2QPFpTDncaH5u5UNZ2rvJva
         Cu6uz1S0X9dPYk8PcfjS+GXc1GIIdL417xWVkY53nZsHwpvyDesvOYK0tVl6P1lceHee
         2dkPvuE2q65dlrfiV99usMoE3ovJ9QKDQPzmloLBNdpCQ7fewcnCctRzwO9GDXfkj/Wj
         a4rxXVyfSl4LXsufw3K5W9fknRkQRKe00VY1+IH5iccuD7MtnYHI7ngg4CmdoYrib0Ag
         uh4Awn0z6PKxct7N+26No1nykisJgLiOug2xWCu1D6afahOevnGLgGFpNesW/beDnwYd
         /+WA==
X-Gm-Message-State: AOJu0YyeEbdzJm8UE1RrRAFjei3dwRppQGALtZoEuV/HqBUiifJfLwo3
	G16KtOIVFSu0TMfbSUWzQ3ww3aJ9wp1h3RIVUWRc8AmRegkYfMaH+ps4/WGIcV0gH1N/LO/JblU
	=
X-Google-Smtp-Source: AGHT+IHpE+MqzNRAUj7U4iLhxs7VR6bD6khDxZS6vpH2EYKYY09Lu9EVsvuOe1F3CZ+f0aYFRmRKdw==
X-Received: by 2002:a05:6a20:c781:b0:1c4:8650:d6db with SMTP id adf61e73a8af0-1c4a14d9a44mr942187637.40.1722029918573;
        Fri, 26 Jul 2024 14:38:38 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:197c:4043:3e17:8623])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-7a9f7d6bba6sm3296309a12.9.2024.07.26.14.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jul 2024 14:38:38 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	bryan.odonoghue@linaro.org,
	Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH 1/3] media: venus: Reorder encoder property setting
Date: Fri, 26 Jul 2024 14:38:09 -0700
Message-ID: <20240726213811.562200-1-frkoenig@chromium.org>
X-Mailer: git-send-email 2.46.0.rc1.232.g9752f9e123-goog
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Configure the generic controls before the codec specific ones.
Some codec specific controls can override the generic ones.
---
 drivers/media/platform/qcom/venus/venc.c | 183 +++++++++++------------
 1 file changed, 91 insertions(+), 92 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 3ec2fb8d9fab..ae24de125c56 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -688,98 +688,6 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264) {
-		struct hfi_h264_vui_timing_info info;
-		struct hfi_h264_entropy_control entropy;
-		struct hfi_h264_db_control deblock;
-		struct hfi_h264_8x8_transform h264_transform;
-
-		ptype = HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
-		info.enable = 1;
-		info.fixed_framerate = 1;
-		info.time_scale = NSEC_PER_SEC;
-
-		ret = hfi_session_set_property(inst, ptype, &info);
-		if (ret)
-			return ret;
-
-		ptype = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL;
-		entropy.entropy_mode = venc_v4l2_to_hfi(
-					  V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
-					  ctr->h264_entropy_mode);
-		entropy.cabac_model = HFI_H264_CABAC_MODEL_0;
-
-		ret = hfi_session_set_property(inst, ptype, &entropy);
-		if (ret)
-			return ret;
-
-		ptype = HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL;
-		deblock.mode = venc_v4l2_to_hfi(
-				      V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
-				      ctr->h264_loop_filter_mode);
-		deblock.slice_alpha_offset = ctr->h264_loop_filter_alpha;
-		deblock.slice_beta_offset = ctr->h264_loop_filter_beta;
-
-		ret = hfi_session_set_property(inst, ptype, &deblock);
-		if (ret)
-			return ret;
-
-		ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
-		h264_transform.enable_type = 0;
-		if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
-		    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
-			h264_transform.enable_type = ctr->h264_8x8_transform;
-
-		ret = hfi_session_set_property(inst, ptype, &h264_transform);
-		if (ret)
-			return ret;
-
-	}
-
-	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
-	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
-		/* IDR periodicity, n:
-		 * n = 0 - only the first I-frame is IDR frame
-		 * n = 1 - all I-frames will be IDR frames
-		 * n > 1 - every n-th I-frame will be IDR frame
-		 */
-		ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
-		idrp.idr_period = 0;
-		ret = hfi_session_set_property(inst, ptype, &idrp);
-		if (ret)
-			return ret;
-	}
-
-	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC &&
-	    ctr->profile.hevc == V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10) {
-		struct hfi_hdr10_pq_sei hdr10;
-		unsigned int c;
-
-		ptype = HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI;
-
-		for (c = 0; c < 3; c++) {
-			hdr10.mastering.display_primaries_x[c] =
-				ctr->mastering.display_primaries_x[c];
-			hdr10.mastering.display_primaries_y[c] =
-				ctr->mastering.display_primaries_y[c];
-		}
-
-		hdr10.mastering.white_point_x = ctr->mastering.white_point_x;
-		hdr10.mastering.white_point_y = ctr->mastering.white_point_y;
-		hdr10.mastering.max_display_mastering_luminance =
-			ctr->mastering.max_display_mastering_luminance;
-		hdr10.mastering.min_display_mastering_luminance =
-			ctr->mastering.min_display_mastering_luminance;
-
-		hdr10.cll.max_content_light = ctr->cll.max_content_light_level;
-		hdr10.cll.max_pic_average_light =
-			ctr->cll.max_pic_average_light_level;
-
-		ret = hfi_session_set_property(inst, ptype, &hdr10);
-		if (ret)
-			return ret;
-	}
-
 	if (ctr->num_b_frames) {
 		u32 max_num_b_frames = NUM_B_FRAMES_MAX;
 
@@ -922,6 +830,97 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264) {
+		struct hfi_h264_vui_timing_info info;
+		struct hfi_h264_entropy_control entropy;
+		struct hfi_h264_db_control deblock;
+		struct hfi_h264_8x8_transform h264_transform;
+
+		ptype = HFI_PROPERTY_PARAM_VENC_H264_VUI_TIMING_INFO;
+		info.enable = 1;
+		info.fixed_framerate = 1;
+		info.time_scale = NSEC_PER_SEC;
+
+		ret = hfi_session_set_property(inst, ptype, &info);
+		if (ret)
+			return ret;
+
+		ptype = HFI_PROPERTY_PARAM_VENC_H264_ENTROPY_CONTROL;
+		entropy.entropy_mode = venc_v4l2_to_hfi(
+					  V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE,
+					  ctr->h264_entropy_mode);
+		entropy.cabac_model = HFI_H264_CABAC_MODEL_0;
+
+		ret = hfi_session_set_property(inst, ptype, &entropy);
+		if (ret)
+			return ret;
+
+		ptype = HFI_PROPERTY_PARAM_VENC_H264_DEBLOCK_CONTROL;
+		deblock.mode = venc_v4l2_to_hfi(
+				      V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE,
+				      ctr->h264_loop_filter_mode);
+		deblock.slice_alpha_offset = ctr->h264_loop_filter_alpha;
+		deblock.slice_beta_offset = ctr->h264_loop_filter_beta;
+
+		ret = hfi_session_set_property(inst, ptype, &deblock);
+		if (ret)
+			return ret;
+
+		ptype = HFI_PROPERTY_PARAM_VENC_H264_TRANSFORM_8X8;
+		h264_transform.enable_type = 0;
+		if (ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_HIGH ||
+		    ctr->profile.h264 == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_HIGH)
+			h264_transform.enable_type = ctr->h264_8x8_transform;
+
+		ret = hfi_session_set_property(inst, ptype, &h264_transform);
+		if (ret)
+			return ret;
+	}
+
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264 ||
+	    inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
+		/* IDR periodicity, n:
+		 * n = 0 - only the first I-frame is IDR frame
+		 * n = 1 - all I-frames will be IDR frames
+		 * n > 1 - every n-th I-frame will be IDR frame
+		 */
+		ptype = HFI_PROPERTY_CONFIG_VENC_IDR_PERIOD;
+		idrp.idr_period = 0;
+		ret = hfi_session_set_property(inst, ptype, &idrp);
+		if (ret)
+			return ret;
+	}
+
+	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC &&
+	    ctr->profile.hevc == V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10) {
+		struct hfi_hdr10_pq_sei hdr10;
+		unsigned int c;
+
+		ptype = HFI_PROPERTY_PARAM_VENC_HDR10_PQ_SEI;
+
+		for (c = 0; c < 3; c++) {
+			hdr10.mastering.display_primaries_x[c] =
+				ctr->mastering.display_primaries_x[c];
+			hdr10.mastering.display_primaries_y[c] =
+				ctr->mastering.display_primaries_y[c];
+		}
+
+		hdr10.mastering.white_point_x = ctr->mastering.white_point_x;
+		hdr10.mastering.white_point_y = ctr->mastering.white_point_y;
+		hdr10.mastering.max_display_mastering_luminance =
+			ctr->mastering.max_display_mastering_luminance;
+		hdr10.mastering.min_display_mastering_luminance =
+			ctr->mastering.min_display_mastering_luminance;
+
+		hdr10.cll.max_content_light = ctr->cll.max_content_light_level;
+		hdr10.cll.max_pic_average_light =
+			ctr->cll.max_pic_average_light_level;
+
+		ret = hfi_session_set_property(inst, ptype, &hdr10);
+		if (ret)
+			return ret;
+	}
+
 	switch (inst->hfi_codec) {
 	case HFI_VIDEO_CODEC_H264:
 		profile = ctr->profile.h264;
-- 
2.46.0.rc1.232.g9752f9e123-goog


