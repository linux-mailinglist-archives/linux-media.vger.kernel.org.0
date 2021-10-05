Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFEF42203B
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 10:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233289AbhJEINN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 04:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbhJEINE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 04:13:04 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1C1CC061745
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 01:11:13 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id p11so22270870edy.10
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 01:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uxY6ejfvYQo+Xeiis9nW6znCc784F580RAf/At/05f0=;
        b=JU6CFK/h5KiubJfPEKppyr6cQnhD3o43JAUNk9e1wkT6s1zsbqcC3ivrpye9qQJrDq
         HlBMNlbZUtRggVvwVxUZIaVi1hVt6bX+2L8bd263GRO/z1eEuDB5K52s2K8+cNHehP6p
         4jZktgdkyFw4TgGFvyKOp0X8HnoparfD5UkqsvSvyz3u0h5T++ZQQhIByoA9twDVhCbF
         FQ/IaP7cq71JV0IIMnVXrPivGHa+99C3GktsnmTpfqDqmxl80jx8I+nRATjENlDfEnrW
         Fbqef5OuSOQF88SAjUhDVI9YsCHNlrLHaSOCsM2/nlYxqxOIqZj+Y0UpX02l6Pv3ThIH
         rmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uxY6ejfvYQo+Xeiis9nW6znCc784F580RAf/At/05f0=;
        b=ww562mV+WIJzhRBFwePV+mDMT2Jx+O4O+iqwqhuNS7X0CxYsdy3CNaR+6/AFqkuBfa
         Kn7j33Fpkt5ljcDhwd6t6Larzq1PnAd3SweDInl246IIKVMmtAuHd9Dr44KJOcUSOd4f
         j9TFZBiskNcM5ESEwDurcoNxGHGVMTVQpk6RBHh5ImJZ8cdXWrdJa5aqliZhJyRDaQmY
         8d13ZiEjmGu6xPTtkImZc5MTqyN0N5T2syP//k4khbkcIYHOg5eiR9GrzjqKcseHMMva
         GnuOxXGEfLScslGsPn3ya0UIP9sgKjn9/QZw7loub7OGwjaBFZ3QgqOXs8sLjUSFKDLY
         XP9A==
X-Gm-Message-State: AOAM532rKaaM62Zoci+3GwatLUVT7a3U3EresywMPMM8l9uUEdg7H0TP
        I8VGPTbpU+tarqTt0EWkO9Rq8LIhNbCT0Q==
X-Google-Smtp-Source: ABdhPJxyZwNgFrsDqgs7ALVwLND0RGj7pz2UpjJ+f8CHVgFPzqmg6gX5AkGpEQpAM3rHl6lGKUsmwg==
X-Received: by 2002:a17:906:165a:: with SMTP id n26mr22215783ejd.236.1633421472196;
        Tue, 05 Oct 2021 01:11:12 -0700 (PDT)
Received: from localhost.localdomain ([84.238.208.199])
        by smtp.gmail.com with ESMTPSA id f1sm3096258edz.47.2021.10.05.01.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 01:11:11 -0700 (PDT)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
To:     linux-media@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: [PATCH v5 7/7] media: venus: Set buffer to FW based on FW min count requirement.
Date:   Tue,  5 Oct 2021 11:10:48 +0300
Message-Id: <20211005081048.3095252-8-stanimir.varbanov@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
References: <20211005081048.3095252-1-stanimir.varbanov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dikshita Agarwal <dikshita@codeaurora.org>

- Get the min buffer count required by FW from source event change
  and use the same value to decide actual buffer count and for
  buffer size calculation.
- Setup DPB and OPB buffers after session continue incase of
  reconfig.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
---
 drivers/media/platform/qcom/venus/core.h      |  1 +
 drivers/media/platform/qcom/venus/helpers.c   |  8 +++++++-
 .../media/platform/qcom/venus/hfi_helper.h    |  9 +++++++++
 drivers/media/platform/qcom/venus/hfi_msgs.c  |  7 +++++++
 .../platform/qcom/venus/hfi_plat_bufs_v6.c    |  6 ++++--
 drivers/media/platform/qcom/venus/vdec.c      | 20 ++++++++++++-------
 6 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 62228cc6b032..a3f077f64be0 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -409,6 +409,7 @@ struct venus_inst {
 	u32 width;
 	u32 height;
 	struct v4l2_rect crop;
+	u32 fw_min_cnt;
 	u32 out_width;
 	u32 out_height;
 	u32 colorspace;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 196a24892176..7f2f5b91caaa 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -623,9 +623,15 @@ int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
 	if (req)
 		memset(req, 0, sizeof(*req));
 
+	if (type == HFI_BUFFER_OUTPUT || type == HFI_BUFFER_OUTPUT2)
+		req->count_min = inst->fw_min_cnt;
+
 	ret = platform_get_bufreq(inst, type, req);
-	if (!ret)
+	if (!ret) {
+		if (type == HFI_BUFFER_OUTPUT || type == HFI_BUFFER_OUTPUT2)
+			inst->fw_min_cnt = req->count_min;
 		return 0;
+	}
 
 	ret = hfi_session_get_property(inst, ptype, &hprop);
 	if (ret)
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 253911272b4c..2daa88e3df9f 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -167,6 +167,7 @@
 #define HFI_PROPERTY_PARAM_VDEC_RECOVERY_POINT_SEI_EXTRADATA	0x120300c
 #define HFI_PROPERTY_PARAM_VDEC_THUMBNAIL_MODE			0x120300d
 #define HFI_PROPERTY_PARAM_VDEC_FRAME_ASSEMBLY			0x120300e
+#define HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS				0x120300e
 #define HFI_PROPERTY_PARAM_VDEC_VC1_FRAMEDISP_EXTRADATA		0x1203011
 #define HFI_PROPERTY_PARAM_VDEC_VC1_SEQDISP_EXTRADATA		0x1203012
 #define HFI_PROPERTY_PARAM_VDEC_TIMESTAMP_EXTRADATA		0x1203013
@@ -915,6 +916,14 @@ struct hfi_extradata_input_crop {
 	u32 height;
 };
 
+struct hfi_dpb_counts {
+	u32 max_dpb_count;
+	u32 max_ref_frames;
+	u32 max_dec_buffering;
+	u32 max_reorder_frames;
+	u32 fw_min_cnt;
+};
+
 #define HFI_COLOR_FORMAT_MONOCHROME		0x01
 #define HFI_COLOR_FORMAT_NV12			0x02
 #define HFI_COLOR_FORMAT_NV21			0x03
diff --git a/drivers/media/platform/qcom/venus/hfi_msgs.c b/drivers/media/platform/qcom/venus/hfi_msgs.c
index 9a2bdb002edc..df96db3761a7 100644
--- a/drivers/media/platform/qcom/venus/hfi_msgs.c
+++ b/drivers/media/platform/qcom/venus/hfi_msgs.c
@@ -32,6 +32,7 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 	struct hfi_colour_space *colour_info;
 	struct hfi_buffer_requirements *bufreq;
 	struct hfi_extradata_input_crop *crop;
+	struct hfi_dpb_counts *dpb_count;
 	u8 *data_ptr;
 	u32 ptype;
 
@@ -110,6 +111,12 @@ static void event_seq_changed(struct venus_core *core, struct venus_inst *inst,
 			event.input_crop.height = crop->height;
 			data_ptr += sizeof(*crop);
 			break;
+		case HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS:
+			data_ptr += sizeof(u32);
+			dpb_count = (struct hfi_dpb_counts *)data_ptr;
+			event.buf_count = dpb_count->fw_min_cnt;
+			data_ptr += sizeof(*dpb_count);
+			break;
 		default:
 			break;
 		}
diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index 479178b0600d..ea25c451222b 100644
--- a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
+++ b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
@@ -1164,7 +1164,7 @@ static int output_buffer_count(u32 session_type, u32 codec)
 			output_min_count = 6;
 			break;
 		case V4L2_PIX_FMT_VP9:
-			output_min_count = 9;
+			output_min_count = 11;
 			break;
 		case V4L2_PIX_FMT_H264:
 		case V4L2_PIX_FMT_HEVC:
@@ -1213,6 +1213,8 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
 	}
 
 	out_min_count = output_buffer_count(VIDC_SESSION_TYPE_DEC, codec);
+	/* Max of driver and FW count */
+	out_min_count = max(out_min_count, bufreq->count_min);
 
 	bufreq->type = buftype;
 	bufreq->region_size = 0;
@@ -1237,7 +1239,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
 	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH(version)) {
 		bufreq->size = dec_ops->scratch(width, height, is_interlaced);
 	} else if (buftype == HFI_BUFFER_INTERNAL_SCRATCH_1(version)) {
-		bufreq->size = dec_ops->scratch1(width, height, out_min_count,
+		bufreq->size = dec_ops->scratch1(width, height, VB2_MAX_FRAME,
 						 is_secondary_output,
 						 num_vpp_pipes);
 	} else if (buftype == HFI_BUFFER_INTERNAL_PERSIST_1) {
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 88cd9e46c333..41c5a353fcae 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -986,23 +986,23 @@ static int vdec_start_capture(struct venus_inst *inst)
 	if (ret)
 		goto err;
 
+	venus_pm_load_scale(inst);
+
+	inst->next_buf_last = false;
+
 	ret = venus_helper_alloc_dpb_bufs(inst);
 	if (ret)
 		goto err;
 
-	ret = venus_helper_queue_dpb_bufs(inst);
+	ret = hfi_session_continue(inst);
 	if (ret)
 		goto free_dpb_bufs;
 
-	ret = venus_helper_process_initial_cap_bufs(inst);
+	ret = venus_helper_queue_dpb_bufs(inst);
 	if (ret)
 		goto free_dpb_bufs;
 
-	venus_pm_load_scale(inst);
-
-	inst->next_buf_last = false;
-
-	ret = hfi_session_continue(inst);
+	ret = venus_helper_process_initial_cap_bufs(inst);
 	if (ret)
 		goto free_dpb_bufs;
 
@@ -1409,6 +1409,11 @@ static void vdec_event_change(struct venus_inst *inst,
 		inst->crop.height = ev_data->height;
 	}
 
+	inst->fw_min_cnt = ev_data->buf_count;
+	/* overwriting this to 11 for vp9 due to fw bug */
+	if (inst->hfi_codec == HFI_VIDEO_CODEC_VP9)
+		inst->fw_min_cnt = 11;
+
 	inst->out_width = ev_data->width;
 	inst->out_height = ev_data->height;
 
@@ -1512,6 +1517,7 @@ static void vdec_inst_init(struct venus_inst *inst)
 	inst->crop.top = 0;
 	inst->crop.width = inst->width;
 	inst->crop.height = inst->height;
+	inst->fw_min_cnt = 8;
 	inst->out_width = frame_width_min(inst);
 	inst->out_height = frame_height_min(inst);
 	inst->fps = 30;
-- 
2.25.1

