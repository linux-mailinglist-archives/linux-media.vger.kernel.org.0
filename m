Return-Path: <linux-media+bounces-15483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AA493FE49
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 21:32:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E3251F22AA3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 19:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40ED8187343;
	Mon, 29 Jul 2024 19:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ywstro0o"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F0E243AAB
	for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 19:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722281554; cv=none; b=edP7z+6kG0mhEbahwFNt2N7vHqxjap9kWdPbZ38ahyKi/McyEiiAayYAsynxWbI0Ei52VycXn1YfEbXqVgFYiRZ6x7Ii5l717DPMTlWMTkzrh0ht+4rQTLZ6NXlnGdKVVlG+f0p6NEJ7qPW7Ry5xZgLzZJbg3H+HHGtAn9JfxZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722281554; c=relaxed/simple;
	bh=nPB5R5zMUohDrDsw/pzurXea3MenbZ7xHK/QXg+oMRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVRFt3GHfNyMDhVCAT30O165netR7/Qu6seft8SJXuhS8lgUYS97u+nmDL3ascodkl2DuuO5fNjGf0efmilcRM41okofK83+eJpAlcl0HiKkyJkigjxA/7nAofGx/KbFmuIivPWIcZP2MDWAk/26udRcWJ5xeSeAbj43Ib235tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ywstro0o; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1fda7fa60a9so32201255ad.3
        for <linux-media@vger.kernel.org>; Mon, 29 Jul 2024 12:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1722281552; x=1722886352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CG1pkz7SlddZO0wW8RkMbL2xlw76r2Yw3/9eifPocFA=;
        b=Ywstro0obBqBUeu0/u5L0cZzGCzlwIbPH+4Ek7EOa6QUs8jtmmZjFWGqzEPIlQieE6
         ltZssM93LrwoR6NckDX/uDYKQQR9mjtbYJxirAOCs32DLh5Uwi1BIxMK24De/JvHnMFB
         hys2pRydVs3ZETnEaxVta0L6SHQCzUYd7kCMA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722281552; x=1722886352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CG1pkz7SlddZO0wW8RkMbL2xlw76r2Yw3/9eifPocFA=;
        b=e8EfFskjuYVYE7KETNt4gJfKhSbJubq60Xr1gvmUzd5cbVrl8vYSDcpjS2K7uLeR3R
         GYGO9ach6gLT6wmLF1t67+XGmZU3rhw2I0KKTxCUd5X6ZOtrEhfVPf/k+U/E4VYCZ0q6
         y1gXnfDMcZ3nqYLevNtVzb0y1FXzKlGW83P0WGiybD2zIgBqZcbVvjzC4DnrwKM+9phO
         n8I332oNgM94iBZTbfssXQdVJ4yq1rXwRhoWp8PeGc7U0bZFC/vbOtbXG4NVJHOcgE0Z
         JHp7MoBtRArEYe6uEk0R9Zdap5jxC+9Vc7L6ZLETQrYXAjwLiMf8E/gdGQc130eq8eKj
         thmQ==
X-Gm-Message-State: AOJu0YxwUSQUIYT7aEdUvxWP1o5QeLijDw4+GR6GFH4DHTwHxBYLCtKa
	796CVzNzO1vg1lUweXH1Z/5uXgo2IKmBMZ/kzSBb5g7B1VVCNk2kY732mhCJJLfVyIKA9N8wzbE
	=
X-Google-Smtp-Source: AGHT+IHCdNF5UPJKv0qx0uHW7PN+F14P9k1AUim99Iu4RGORosLOkXLDBw2tdT63gu7CvwntMhsHCA==
X-Received: by 2002:a17:903:24e:b0:1fb:451a:449b with SMTP id d9443c01a7336-1ff048e1919mr128704715ad.60.1722281552085;
        Mon, 29 Jul 2024 12:32:32 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e13:6:5aa6:a2c1:9047:7da2])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-1fed7c86b05sm86652895ad.55.2024.07.29.12.32.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 12:32:31 -0700 (PDT)
From: Fritz Koenig <frkoenig@chromium.org>
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	stanimir.k.varbanov@gmail.com,
	quic_vgarodia@quicinc.com,
	bryan.odonoghue@linaro.org,
	Fritz Koenig <frkoenig@chromium.org>
Subject: [PATCH v2 1/3] media: venus: Reorder encoder property setting
Date: Mon, 29 Jul 2024 12:19:10 -0700
Message-ID: <20240729193219.1260463-2-frkoenig@chromium.org>
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

Configure the generic controls before the codec specific ones.
Some codec specific controls can override the generic ones.

Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
---
v2:
- requested testing methodology added to cover letter

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


