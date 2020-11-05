Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 248D12A770C
	for <lists+linux-media@lfdr.de>; Thu,  5 Nov 2020 06:25:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729860AbgKEFZP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 5 Nov 2020 00:25:15 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56760 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727711AbgKEFZO (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 5 Nov 2020 00:25:14 -0500
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 04 Nov 2020 21:25:13 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Nov 2020 21:25:11 -0800
X-QCInternal: smtphost
Received: from dikshita-linux.qualcomm.com ([10.204.65.237])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Nov 2020 10:54:59 +0530
Received: by dikshita-linux.qualcomm.com (Postfix, from userid 347544)
        id 08AC455F9; Thu,  5 Nov 2020 10:54:57 +0530 (IST)
From:   Dikshita Agarwal <dikshita@codeaurora.org>
To:     linux-media@vger.kernel.org, stanimir.varbanov@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vgarodia@codeaurora.org, Dikshita Agarwal <dikshita@codeaurora.org>
Subject: [PATCH v2] venus: venc: fix handlig of S_SELECTION and G_SELECTION
Date:   Thu,  5 Nov 2020 10:54:56 +0530
Message-Id: <1604553896-10301-1-git-send-email-dikshita@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

- return correct width and height for G_SELECTION
- update capture port wxh with rectangle wxh.
- add support for HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO
  to set stride info and chroma offset to FW.

Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
---
 drivers/media/platform/qcom/venus/helpers.c    | 18 +++++++++++++
 drivers/media/platform/qcom/venus/helpers.h    |  2 ++
 drivers/media/platform/qcom/venus/hfi_cmds.c   | 12 +++++++++
 drivers/media/platform/qcom/venus/hfi_helper.h |  4 +--
 drivers/media/platform/qcom/venus/venc.c       | 36 ++++++++++++++++++--------
 5 files changed, 59 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
index 2b6925b..efa2781 100644
--- a/drivers/media/platform/qcom/venus/helpers.c
+++ b/drivers/media/platform/qcom/venus/helpers.c
@@ -1621,3 +1621,21 @@ int venus_helper_get_out_fmts(struct venus_inst *inst, u32 v4l2_fmt,
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(venus_helper_get_out_fmts);
+
+int venus_helper_set_stride(struct venus_inst *inst,
+			    unsigned int width, unsigned int height)
+{
+	const u32 ptype = HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO;
+
+	struct hfi_uncompressed_plane_actual_info plane_actual_info;
+
+	plane_actual_info.buffer_type = HFI_BUFFER_INPUT;
+	plane_actual_info.num_planes = 2;
+	plane_actual_info.plane_format[0].actual_stride = width;
+	plane_actual_info.plane_format[0].actual_plane_buffer_height = height;
+	plane_actual_info.plane_format[1].actual_stride = width;
+	plane_actual_info.plane_format[1].actual_plane_buffer_height = height / 2;
+
+	return hfi_session_set_property(inst, ptype, &plane_actual_info);
+}
+EXPORT_SYMBOL_GPL(venus_helper_set_stride);
diff --git a/drivers/media/platform/qcom/venus/helpers.h b/drivers/media/platform/qcom/venus/helpers.h
index a4a0562..f36c9f71 100644
--- a/drivers/media/platform/qcom/venus/helpers.h
+++ b/drivers/media/platform/qcom/venus/helpers.h
@@ -63,4 +63,6 @@ void venus_helper_get_ts_metadata(struct venus_inst *inst, u64 timestamp_us,
 				  struct vb2_v4l2_buffer *vbuf);
 int venus_helper_get_profile_level(struct venus_inst *inst, u32 *profile, u32 *level);
 int venus_helper_set_profile_level(struct venus_inst *inst, u32 profile, u32 level);
+int venus_helper_set_stride(struct venus_inst *inst, unsigned int aligned_width,
+			    unsigned int aligned_height);
 #endif
diff --git a/drivers/media/platform/qcom/venus/hfi_cmds.c b/drivers/media/platform/qcom/venus/hfi_cmds.c
index 7022368..4f75658 100644
--- a/drivers/media/platform/qcom/venus/hfi_cmds.c
+++ b/drivers/media/platform/qcom/venus/hfi_cmds.c
@@ -1205,6 +1205,18 @@ static int pkt_session_set_property_1x(struct hfi_session_set_property_pkt *pkt,
 		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*cu);
 		break;
 	}
+	case HFI_PROPERTY_PARAM_UNCOMPRESSED_PLANE_ACTUAL_INFO: {
+		struct hfi_uncompressed_plane_actual_info *in = pdata;
+		struct hfi_uncompressed_plane_actual_info *info = prop_data;
+
+		info->buffer_type = in->buffer_type;
+		info->num_planes = in->num_planes;
+		info->plane_format[0] = in->plane_format[0];
+		if (in->num_planes > 1)
+			info->plane_format[1] = in->plane_format[1];
+		pkt->shdr.hdr.size += sizeof(u32) + sizeof(*info);
+		break;
+	}
 	case HFI_PROPERTY_CONFIG_VENC_MAX_BITRATE:
 	case HFI_PROPERTY_CONFIG_VDEC_POST_LOOP_DEBLOCKER:
 	case HFI_PROPERTY_PARAM_BUFFER_ALLOC_MODE:
diff --git a/drivers/media/platform/qcom/venus/hfi_helper.h b/drivers/media/platform/qcom/venus/hfi_helper.h
index 60ee247..5938a96 100644
--- a/drivers/media/platform/qcom/venus/hfi_helper.h
+++ b/drivers/media/platform/qcom/venus/hfi_helper.h
@@ -908,13 +908,13 @@ struct hfi_uncompressed_plane_actual {
 struct hfi_uncompressed_plane_actual_info {
 	u32 buffer_type;
 	u32 num_planes;
-	struct hfi_uncompressed_plane_actual plane_format[1];
+	struct hfi_uncompressed_plane_actual plane_format[2];
 };
 
 struct hfi_uncompressed_plane_actual_constraints_info {
 	u32 buffer_type;
 	u32 num_planes;
-	struct hfi_uncompressed_plane_constraints plane_format[1];
+	struct hfi_uncompressed_plane_constraints plane_format[2];
 };
 
 struct hfi_codec_supported {
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index 4ecf78e..99bfabf 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -190,8 +190,10 @@ static int venc_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
 	pixmp->height = clamp(pixmp->height, frame_height_min(inst),
 			      frame_height_max(inst));
 
-	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE) {
+		pixmp->width = ALIGN(pixmp->width, 128);
 		pixmp->height = ALIGN(pixmp->height, 32);
+	}
 
 	pixmp->width = ALIGN(pixmp->width, 2);
 	pixmp->height = ALIGN(pixmp->height, 2);
@@ -335,13 +337,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP_DEFAULT:
 	case V4L2_SEL_TGT_CROP_BOUNDS:
-		s->r.width = inst->width;
-		s->r.height = inst->height;
-		break;
-	case V4L2_SEL_TGT_CROP:
 		s->r.width = inst->out_width;
 		s->r.height = inst->out_height;
 		break;
+	case V4L2_SEL_TGT_CROP:
+		s->r.width = inst->width;
+		s->r.height = inst->height;
+		break;
 	default:
 		return -EINVAL;
 	}
@@ -360,12 +362,19 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
 	if (s->type != V4L2_BUF_TYPE_VIDEO_OUTPUT)
 		return -EINVAL;
 
+	if (s->r.width > inst->out_width ||
+	    s->r.height > inst->out_height)
+		return -EINVAL;
+
+	s->r.width = ALIGN(s->r.width, 2);
+	s->r.height = ALIGN(s->r.height, 2);
+
 	switch (s->target) {
 	case V4L2_SEL_TGT_CROP:
-		if (s->r.width != inst->out_width ||
-		    s->r.height != inst->out_height ||
-		    s->r.top != 0 || s->r.left != 0)
-			return -EINVAL;
+		s->r.top = 0;
+		s->r.left = 0;
+		inst->width = s->r.width;
+		inst->height = s->r.height;
 		break;
 	default:
 		return -EINVAL;
@@ -728,6 +737,11 @@ static int venc_init_session(struct venus_inst *inst)
 	if (ret)
 		return ret;
 
+	ret = venus_helper_set_stride(inst, inst->out_width,
+				      inst->out_height);
+	if (ret)
+		goto deinit;
+
 	ret = venus_helper_set_input_resolution(inst, inst->width,
 						inst->height);
 	if (ret)
@@ -816,8 +830,8 @@ static int venc_queue_setup(struct vb2_queue *q,
 		inst->num_input_bufs = *num_buffers;
 
 		sizes[0] = venus_helper_get_framesz(inst->fmt_out->pixfmt,
-						    inst->width,
-						    inst->height);
+						    inst->out_width,
+						    inst->out_height);
 		inst->input_buf_size = sizes[0];
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-- 
1.9.1

