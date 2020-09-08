Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46BA4261D8F
	for <lists+linux-media@lfdr.de>; Tue,  8 Sep 2020 21:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732360AbgIHTit (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Sep 2020 15:38:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730957AbgIHPzg (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 8 Sep 2020 11:55:36 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 623F2C061358
        for <linux-media@vger.kernel.org>; Tue,  8 Sep 2020 05:33:40 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id n22so15825888edt.4
        for <linux-media@vger.kernel.org>; Tue, 08 Sep 2020 05:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=07BSV6FZ4poiSm+/jd7LwQlNgIEpEAXaLzeC1JvctXE=;
        b=SMnPVAVq+CNLCQ0T1LSMvvpTkQRhfvdC957DRxw55JGRxDy5/pS2LaaThhquaUeRgM
         WT0sbDcx7fSYus/UO1AvvQosPZ0EcmhZuOnInyVngJ/1/+16lk5G/xTyvSpGmuyFw0kP
         z0wvXwOtokUqe+li/riRJvOUQ1GkXVF7mJShxVUPHps33vmyLliIi341pj2pw7U/1U08
         eVWq/GTiJFsUVybw3vTBvXwyNE3w9pNuqW94qCtkFUZDG8an5lFUTOuwoB/3LqE+LbYF
         LXJmvjlJXYSq+12BX2+o0TnlANatNc0GXbdeF8ZLxNTDlfSetrbq11lKZH/PbAclQhli
         ouKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=07BSV6FZ4poiSm+/jd7LwQlNgIEpEAXaLzeC1JvctXE=;
        b=D5L18zYccJTba7YTZWOvcHXKmuU2yetCwUEdpcStOBfd4DE7tB0is+/lrTQMFvxpHv
         XNzA5hencJdqqTEvolaG58GrROw0KkoMIMHXl1mSFJCvOqF+Xl1Film6oZtr3DTMlpM5
         xvYt53DLIFkBK+hAfzdlv5IFJCjkjQcMtqTiQamcpMP8F8Qr48Ie0qWhaO+QFyQym4GO
         oInI2wS8bqxD3LKJZd4RCRzPmKH+KkqE4ZbE4gHlwC1pmaMDV0LCeGbTX6xFRumRJaLF
         GgY4SzcUq3nBF1A0VkJlklS2TmnKt+rXwT3uVf8X34m3btvPfd4W/nuYFp9vprh5UdDD
         mCpw==
X-Gm-Message-State: AOAM531fZKMprv1OrU1ZIInzTIySyTmZCaPSD/M7yBIZrzDUNYVGXnv9
        mgiu0N9mlJb0uR9wgELNF5VBqA==
X-Google-Smtp-Source: ABdhPJylpKUjFNTj+4ln7S/mA8s9ebnd7qm/7712WoMGQt+HTyZC3PQpWuLcRKlwleHYGksF7zruIw==
X-Received: by 2002:a50:ee14:: with SMTP id g20mr15064878eds.32.1599568419058;
        Tue, 08 Sep 2020 05:33:39 -0700 (PDT)
Received: from localhost.localdomain ([195.24.90.54])
        by smtp.gmail.com with ESMTPSA id y9sm17499744edo.37.2020.09.08.05.33.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 05:33:38 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        nicolas.dufresne@collabora.com,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v3 6/6] venus: venc: Use helper to set profile and level
Date:   Tue,  8 Sep 2020 15:32:21 +0300
Message-Id: <20200908123221.2793-7-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
References: <20200908123221.2793-1-stanimir.varbanov@linaro.org>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

We have a new helper to set profile and level use it
instead.

Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  13 +-
 drivers/media/platform/qcom/venus/venc.c      | 159 +-----------------
 .../media/platform/qcom/venus/venc_ctrls.c    |  14 +-
 3 files changed, 6 insertions(+), 180 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 1a7aee7ee628..2e70004ef195 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -239,17 +239,8 @@ struct venc_controls {
 
 	u32 header_mode;
 
-	struct {
-		u32 mpeg4;
-		u32 h264;
-		u32 vpx;
-		u32 hevc;
-	} profile;
-	struct {
-		u32 mpeg4;
-		u32 h264;
-		u32 hevc;
-	} level;
+	u32 profile;
+	u32 level;
 };
 
 struct venus_buffer {
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 6b758a33397e..f8b1484e7dcd 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -113,80 +113,6 @@ find_format_by_index(struct venus_inst *inst, unsigned int index, u32 type)
 static int venc_v4l2_to_hfi(int id, int value)
 {
 	switch (id) {
-	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
-		switch (value) {
-		case V4L2_MPEG_VIDEO_MPEG4_LEVEL_0:
-		default:
-			return HFI_MPEG4_LEVEL_0;
-		case V4L2_MPEG_VIDEO_MPEG4_LEVEL_0B:
-			return HFI_MPEG4_LEVEL_0b;
-		case V4L2_MPEG_VIDEO_MPEG4_LEVEL_1:
-			return HFI_MPEG4_LEVEL_1;
-		case V4L2_MPEG_VIDEO_MPEG4_LEVEL_2:
-			return HFI_MPEG4_LEVEL_2;
-		case V4L2_MPEG_VIDEO_MPEG4_LEVEL_3:
-			return HFI_MPEG4_LEVEL_3;
-		case V4L2_MPEG_VIDEO_MPEG4_LEVEL_4:
-			return HFI_MPEG4_LEVEL_4;
-		case V4L2_MPEG_VIDEO_MPEG4_LEVEL_5:
-			return HFI_MPEG4_LEVEL_5;
-		}
-	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
-		switch (value) {
-		case V4L2_MPEG_VIDEO_MPEG4_PROFILE_SIMPLE:
-		default:
-			return HFI_MPEG4_PROFILE_SIMPLE;
-		case V4L2_MPEG_VIDEO_MPEG4_PROFILE_ADVANCED_SIMPLE:
-			return HFI_MPEG4_PROFILE_ADVANCEDSIMPLE;
-		}
-	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
-		switch (value) {
-		case V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE:
-			return HFI_H264_PROFILE_BASELINE;
-		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
-			return HFI_H264_PROFILE_CONSTRAINED_BASE;
-		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
-			return HFI_H264_PROFILE_MAIN;
-		case V4L2_MPEG_VIDEO_H264_PROFILE_HIGH:
-		default:
-			return HFI_H264_PROFILE_HIGH;
-		}
-	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
-		switch (value) {
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_0:
-			return HFI_H264_LEVEL_1;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1B:
-			return HFI_H264_LEVEL_1b;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_1:
-			return HFI_H264_LEVEL_11;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_2:
-			return HFI_H264_LEVEL_12;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_1_3:
-			return HFI_H264_LEVEL_13;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_2_0:
-			return HFI_H264_LEVEL_2;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_2_1:
-			return HFI_H264_LEVEL_21;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_2_2:
-			return HFI_H264_LEVEL_22;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_3_0:
-			return HFI_H264_LEVEL_3;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_3_1:
-			return HFI_H264_LEVEL_31;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_3_2:
-			return HFI_H264_LEVEL_32;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_4_0:
-			return HFI_H264_LEVEL_4;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_4_1:
-			return HFI_H264_LEVEL_41;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_4_2:
-			return HFI_H264_LEVEL_42;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_5_0:
-		default:
-			return HFI_H264_LEVEL_5;
-		case V4L2_MPEG_VIDEO_H264_LEVEL_5_1:
-			return HFI_H264_LEVEL_51;
-		}
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
 		switch (value) {
 		case V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CAVLC:
@@ -195,18 +121,6 @@ static int venc_v4l2_to_hfi(int id, int value)
 		case V4L2_MPEG_VIDEO_H264_ENTROPY_MODE_CABAC:
 			return HFI_H264_ENTROPY_CABAC;
 		}
-	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
-		switch (value) {
-		case 0:
-		default:
-			return HFI_VPX_PROFILE_VERSION_0;
-		case 1:
-			return HFI_VPX_PROFILE_VERSION_1;
-		case 2:
-			return HFI_VPX_PROFILE_VERSION_2;
-		case 3:
-			return HFI_VPX_PROFILE_VERSION_3;
-		}
 	case V4L2_CID_MPEG_VIDEO_H264_LOOP_FILTER_MODE:
 		switch (value) {
 		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_ENABLED:
@@ -217,46 +131,6 @@ static int venc_v4l2_to_hfi(int id, int value)
 		case V4L2_MPEG_VIDEO_H264_LOOP_FILTER_MODE_DISABLED_AT_SLICE_BOUNDARY:
 			return HFI_H264_DB_MODE_SKIP_SLICE_BOUNDARY;
 		}
-	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
-		switch (value) {
-		case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN:
-		default:
-			return HFI_HEVC_PROFILE_MAIN;
-		case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE:
-			return HFI_HEVC_PROFILE_MAIN_STILL_PIC;
-		case V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10:
-			return HFI_HEVC_PROFILE_MAIN10;
-		}
-	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
-		switch (value) {
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_1:
-		default:
-			return HFI_HEVC_LEVEL_1;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_2:
-			return HFI_HEVC_LEVEL_2;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_2_1:
-			return HFI_HEVC_LEVEL_21;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_3:
-			return HFI_HEVC_LEVEL_3;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_3_1:
-			return HFI_HEVC_LEVEL_31;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_4:
-			return HFI_HEVC_LEVEL_4;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_4_1:
-			return HFI_HEVC_LEVEL_41;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_5:
-			return HFI_HEVC_LEVEL_5;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1:
-			return HFI_HEVC_LEVEL_51;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2:
-			return HFI_HEVC_LEVEL_52;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_6:
-			return HFI_HEVC_LEVEL_6;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_6_1:
-			return HFI_HEVC_LEVEL_61;
-		case V4L2_MPEG_VIDEO_HEVC_LEVEL_6_2:
-			return HFI_HEVC_LEVEL_62;
-		}
 	}
 
 	return 0;
@@ -657,13 +531,12 @@ static int venc_set_properties(struct venus_inst *inst)
 {
 	struct venc_controls *ctr = &inst->controls.enc;
 	struct hfi_intra_period intra_period;
-	struct hfi_profile_level pl;
 	struct hfi_framerate frate;
 	struct hfi_bitrate brate;
 	struct hfi_idr_period idrp;
 	struct hfi_quantization quant;
 	struct hfi_quantization_range quant_range;
-	u32 ptype, rate_control, bitrate, profile = 0, level = 0;
+	u32 ptype, rate_control, bitrate;
 	int ret;
 
 	ret = venus_helper_set_work_mode(inst, VIDC_WORK_MODE_2);
@@ -811,35 +684,7 @@ static int venc_set_properties(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
-	if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H264) {
-		profile = venc_v4l2_to_hfi(V4L2_CID_MPEG_VIDEO_H264_PROFILE,
-					   ctr->profile.h264);
-		level = venc_v4l2_to_hfi(V4L2_CID_MPEG_VIDEO_H264_LEVEL,
-					 ctr->level.h264);
-	} else if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_VP8) {
-		profile = venc_v4l2_to_hfi(V4L2_CID_MPEG_VIDEO_VP8_PROFILE,
-					   ctr->profile.vpx);
-		level = 0;
-	} else if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_MPEG4) {
-		profile = venc_v4l2_to_hfi(V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE,
-					   ctr->profile.mpeg4);
-		level = venc_v4l2_to_hfi(V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL,
-					 ctr->level.mpeg4);
-	} else if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_H263) {
-		profile = 0;
-		level = 0;
-	} else if (inst->fmt_cap->pixfmt == V4L2_PIX_FMT_HEVC) {
-		profile = venc_v4l2_to_hfi(V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
-					   ctr->profile.hevc);
-		level = venc_v4l2_to_hfi(V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
-					 ctr->level.hevc);
-	}
-
-	ptype = HFI_PROPERTY_PARAM_PROFILE_LEVEL_CURRENT;
-	pl.profile = profile;
-	pl.level = level;
-
-	ret = hfi_session_set_property(inst, ptype, &pl);
+	ret = venus_helper_set_profile_level(inst, ctr->profile, ctr->level);
 	if (ret)
 		return ret;
 
diff --git a/drivers/media/platform/qcom/venus/venc_ctrls.c b/drivers/media/platform/qcom/venus/venc_ctrls.c
index 22a7c045c6a9..0708b3b89d0c 100644
--- a/drivers/media/platform/qcom/venus/venc_ctrls.c
+++ b/drivers/media/platform/qcom/venus/venc_ctrls.c
@@ -103,25 +103,15 @@ static int venc_op_s_ctrl(struct v4l2_ctrl *ctrl)
 		ctr->h264_entropy_mode = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_MPEG4_PROFILE:
-		ctr->profile.mpeg4 = ctrl->val;
-		break;
 	case V4L2_CID_MPEG_VIDEO_H264_PROFILE:
-		ctr->profile.h264 = ctrl->val;
-		break;
 	case V4L2_CID_MPEG_VIDEO_HEVC_PROFILE:
-		ctr->profile.hevc = ctrl->val;
-		break;
 	case V4L2_CID_MPEG_VIDEO_VP8_PROFILE:
-		ctr->profile.vpx = ctrl->val;
+		ctr->profile = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_MPEG4_LEVEL:
-		ctr->level.mpeg4 = ctrl->val;
-		break;
 	case V4L2_CID_MPEG_VIDEO_H264_LEVEL:
-		ctr->level.h264 = ctrl->val;
-		break;
 	case V4L2_CID_MPEG_VIDEO_HEVC_LEVEL:
-		ctr->level.hevc = ctrl->val;
+		ctr->level = ctrl->val;
 		break;
 	case V4L2_CID_MPEG_VIDEO_H264_I_FRAME_QP:
 		ctr->h264_i_qp = ctrl->val;
-- 
2.17.1

