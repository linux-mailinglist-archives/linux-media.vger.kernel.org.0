Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0A60388AD0
	for <lists+linux-media@lfdr.de>; Wed, 19 May 2021 11:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345933AbhESJjZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 19 May 2021 05:39:25 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:31762 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346016AbhESJjS (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 19 May 2021 05:39:18 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 19 May 2021 02:37:58 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 19 May 2021 02:37:57 -0700
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg02-blr.qualcomm.com with ESMTP; 19 May 2021 15:07:54 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id B4DAD219EB; Wed, 19 May 2021 15:07:45 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, vgarodia@codeaurora.org,
        Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH 7/7] media: venus: Set buffer to FW based on FW min count requirement.
Date:   Wed, 19 May 2021 15:06:48 +0530
Message-Id: <1621417008-6117-8-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621417008-6117-1-git-send-email-dikshita@codeaurora.org>
References: <1621417008-6117-1-git-send-email-dikshita@codeaurora.org>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- Get the min buffer count required by FW from source event change
  and use the same value to decide actual buffer count and for
  buffer size calculation.
- Setup DPB and OPB buffers after session continue incase of
  reconfig.

Co-developed-by: Mansur Alisha Shaik <mansur@codeaurora.org>
Co-developed-by: Vikash Garodia <vgarodia@codeaurora.org>
Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/core.h           |  1 +
 drivers/media/platform/qcom/venus/helpers.c        | 11 ++++++++++-
 drivers/media/platform/qcom/venus/hfi.h            |  1 +
 drivers/media/platform/qcom/venus/hfi_helper.h     |  9 +++++++++
 drivers/media/platform/qcom/venus/hfi_msgs.c       |  7 +++++++
 .../media/platform/qcom/venus/hfi_plat_bufs_v6.c   |  3 ++-
 drivers/media/platform/qcom/venus/vdec.c           | 22 ++++++++++++----------
 7 files changed, 42 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.h b/drivers/media/platform/qcom/venus/core.h
index 1ff20d9..b2b023e 100644
--- a/drivers/media/platform/qcom/venus/core.h
+++ b/drivers/media/platform/qcom/venus/core.h
@@ -403,6 +403,7 @@ struct venus_inst {
 	u32 width;
 	u32 height;
 	struct v4l2_rect crop;
+	u32 fw_min_cnt;
 	u32 out_width;
 	u32 out_height;
 	u32 colorspace;
diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index cbe653f..83c3009 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -576,6 +576,7 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
 	struct hfi_plat_buffers_params params;
 	bool is_dec = inst->session_type == VIDC_SESSION_TYPE_DEC;
 	struct venc_controls *enc_ctr = &inst->controls.enc;
+	int ret = 0;
 
 	hfi_plat = hfi_platform_get(version);
 
@@ -610,7 +611,15 @@ static int platform_get_bufreq(struct venus_inst *inst, u32 buftype,
 		params.enc.is_tenbit = inst->bit_depth == VIDC_BITDEPTH_10;
 	}
 
-	return hfi_plat->bufreq(&params, inst->session_type, buftype, req);
+	if (buftype == HFI_BUFFER_OUTPUT || buftype == HFI_BUFFER_OUTPUT2 ||
+	    buftype == HFI_BUFFER_INTERNAL_SCRATCH_1(version))
+		req->count_min = inst->fw_min_cnt;
+
+	ret = hfi_plat->bufreq(&params, inst->session_type, buftype, req);
+	if (buftype == HFI_BUFFER_OUTPUT || buftype == HFI_BUFFER_OUTPUT2)
+		if (inst->fw_min_cnt != req->count_min)
+			inst->fw_min_cnt = req->count_min;
+	return ret;
 }
 
 int venus_helper_get_bufreq(struct venus_inst *inst, u32 type,
diff --git a/drivers/media/platform/qcom/venus/hfi.h b/drivers/media/platform/qcom/venus/hfi.h
index f25d412..287d544 100644
--- a/drivers/media/platform/qcom/venus/hfi.h
+++ b/drivers/media/platform/qcom/venus/hfi.h
@@ -75,6 +75,7 @@ struct hfi_event_data {
 		u32 left, top;
 		u32 width, height;
 	} input_crop;
+	u32 fw_min_cnt;
 };
 
 /* define core states */
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 185c302..5162f09 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -167,6 +167,7 @@
 #define HFI_PROPERTY_PARAM_VDEC_RECOVERY_POINT_SEI_EXTRADATA	0x120300c
 #define HFI_PROPERTY_PARAM_VDEC_THUMBNAIL_MODE			0x120300d
 #define HFI_PROPERTY_PARAM_VDEC_FRAME_ASSEMBLY			0x120300e
+#define HFI_PROPERTY_PARAM_VDEC_DPB_COUNTS			0x120300e
 #define HFI_PROPERTY_PARAM_VDEC_VC1_FRAMEDISP_EXTRADATA		0x1203011
 #define HFI_PROPERTY_PARAM_VDEC_VC1_SEQDISP_EXTRADATA		0x1203012
 #define HFI_PROPERTY_PARAM_VDEC_TIMESTAMP_EXTRADATA		0x1203013
@@ -906,6 +907,14 @@ struct hfi_extradata_input_crop {
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
index a2d436d..2d207254 100644
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
+			event.fw_min_cnt = dpb_count->fw_min_cnt;
+			data_ptr += sizeof(*dpb_count);
+			break;
 		default:
 			break;
 		}
diff --git a/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c b/drivers/media/platform/qcom/venus/hfi_plat_bufs_v6.c
index 479178b..c7aea06 100644
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
@@ -1213,6 +1213,7 @@ static int bufreq_dec(struct hfi_plat_buffers_params *params, u32 buftype,
 	}
 
 	out_min_count = output_buffer_count(VIDC_SESSION_TYPE_DEC, codec);
+	out_min_count = max(out_min_count, bufreq->count_min);
 
 	bufreq->type = buftype;
 	bufreq->region_size = 0;
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index a674281..d8f0529 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -977,7 +977,7 @@ static int vdec_start_capture(struct venus_inst *inst)
 		return ret;
 
 	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
-					VB2_MAX_FRAME, VB2_MAX_FRAME);
+					inst->num_output_bufs, inst->num_output_bufs);
 	if (ret)
 		return ret;
 
@@ -985,6 +985,14 @@ static int vdec_start_capture(struct venus_inst *inst)
 	if (ret)
 		goto err;
 
+	venus_pm_load_scale(inst);
+
+	inst->next_buf_last = false;
+
+	ret = hfi_session_continue(inst);
+	if (ret)
+		goto err;
+
 	ret = venus_helper_alloc_dpb_bufs(inst);
 	if (ret)
 		goto err;
@@ -997,14 +1005,6 @@ static int vdec_start_capture(struct venus_inst *inst)
 	if (ret)
 		goto free_dpb_bufs;
 
-	venus_pm_load_scale(inst);
-
-	inst->next_buf_last = false;
-
-	ret = hfi_session_continue(inst);
-	if (ret)
-		goto free_dpb_bufs;
-
 	inst->codec_state = VENUS_DEC_STATE_DECODING;
 
 	if (inst->drain_active)
@@ -1069,7 +1069,7 @@ static int vdec_start_output(struct venus_inst *inst)
 		return ret;
 
 	ret = venus_helper_set_num_bufs(inst, inst->num_input_bufs,
-					VB2_MAX_FRAME, VB2_MAX_FRAME);
+					inst->num_output_bufs, inst->num_output_bufs);
 	if (ret)
 		return ret;
 
@@ -1410,6 +1410,7 @@ static void vdec_event_change(struct venus_inst *inst,
 		inst->crop.height = ev_data->height;
 	}
 
+	inst->fw_min_cnt = ev_data->fw_min_cnt;
 	inst->out_width = ev_data->width;
 	inst->out_height = ev_data->height;
 
@@ -1513,6 +1514,7 @@ static void vdec_inst_init(struct venus_inst *inst)
 	inst->crop.top = 0;
 	inst->crop.width = inst->width;
 	inst->crop.height = inst->height;
+	inst->fw_min_cnt = 8;
 	inst->out_width = frame_width_min(inst);
 	inst->out_height = frame_height_min(inst);
 	inst->fps = 30;
-- 
2.7.4

