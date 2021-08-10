Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0E33E576D
	for <lists+linux-media@lfdr.de>; Tue, 10 Aug 2021 11:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239285AbhHJJtG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Aug 2021 05:49:06 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:28230 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238647AbhHJJsw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Aug 2021 05:48:52 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 10 Aug 2021 02:48:28 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 10 Aug 2021 02:48:27 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 10 Aug 2021 15:18:16 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 1102821CA3; Tue, 10 Aug 2021 15:18:15 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v4 7/7] media: venus: Set buffer to FW based on FW min count requirement.
Date:   Tue, 10 Aug 2021 15:17:55 +0530
Message-Id: <1628588875-23790-8-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
References: <1628588875-23790-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Get the min buffer count required by FW from source event change
  and use the same value to decide actual buffer count and for
  buffer size calculation.
- Setup DPB and OPB buffers after session continue incase of
  reconfig.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.h             |  1 +
 drivers/media/platform/qcom/venus/helpers.c          |  8 +++++++-
 drivers/media/platform/qcom/venus/hfi_helper.h       |  9 +++++++++
 drivers/media/platform/qcom/venus/hfi_msgs.c         |  7 +++++++
 drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c |  6 ++++--
 drivers/media/platform/qcom/venus/vdec.c             | 20 +++++++++++++-------
 6 files changed, 41 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 29f2c4f..90ca6f9 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -407,6 +407,7 @@ struct venus_inst {
 	u32 width;
 	u32 height;
 	struct v4l2_rect crop;
+	u32 fw_min_cnt;
 	u32 out_width;
 	u32 out_height;
 	u32 colorspace;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 2db33ba..c076926 100644
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
index dc9f992..bc11d15 100644
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
@@ -910,6 +911,14 @@ struct hfi_extradata_input_crop {
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
index d9fde66..21ab990 100644
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
index 479178b..ea25c45 100644
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
index 4e7b9e5..45cccd2 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -988,23 +988,23 @@ static int vdec_start_capture(struct venus_inst *inst)
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
 
@@ -1411,6 +1411,11 @@ static void vdec_event_change(struct venus_inst *inst,
 		inst->crop.height = ev_data->height;
 	}
 
+	inst->fw_min_cnt = ev_data->buf_count;
+	/* overwriting this to 11 for vp9 due to fw bug */
+	if (inst->hfi_codec == HFI_VIDEO_CODEC_VP9)
+		inst->fw_min_cnt = 11;
+
 	inst->out_width = ev_data->width;
 	inst->out_height = ev_data->height;
 
@@ -1514,6 +1519,7 @@ static void vdec_inst_init(struct venus_inst *inst)
 	inst->crop.top = 0;
 	inst->crop.width = inst->width;
 	inst->crop.height = inst->height;
+	inst->fw_min_cnt = 8;
 	inst->out_width = frame_width_min(inst);
 	inst->out_height = frame_height_min(inst);
 	inst->fps = 30;
-- 
2.7.4

