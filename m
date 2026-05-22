Return-Path: <linux-media+bounces-62579-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kHqHHaEvEGrIUgYAu9opvQ
	(envelope-from <linux-media+bounces-62579-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:27:45 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F8235B210B
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:27:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id CFDAB3023C07
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 925253CB8FC;
	Fri, 22 May 2026 10:17:29 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCDC3C9897;
	Fri, 22 May 2026 10:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445049; cv=none; b=VEpJ7ijVJb7Cx5sZnsp/LSku+L8q3NjYVpOGGsSqCsZZA1eNda2yFfynLG22stsv4Pne++prh54h/U/j4r3+sDqjqEX5mFV73F9qlrJ09q7/G5QCEnyLAgN2dpURjGsG78CiwmNrGeCYCPYT2GuoMcAbmOq3VNNKfN0UyXi8ss0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445049; c=relaxed/simple;
	bh=mrP0KMECiXq4KHQaEjRbnH49AXt8cSuAoGNS9rJUjwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onZX50DN8E23suGeq5bd89l86aMHntw5GMEYSWVQvjYxdnV20CwjITdkxBj35pFuLS7ldHkq9id6iQUgPfHntGccg/v3/QJ0dvJgMeVaV1l+lusxPnzjkNOzvmansO75Z/9UNGQwXxgoIcohmjxgIRpb7JLPMV1ps57rSlqLrnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 21DAA3700295;
	Fri, 22 May 2026 10:17:15 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A2EF1B408CB; Fri, 22 May 2026 10:17:14 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 4EBFCB408CA;
	Fri, 22 May 2026 10:16:57 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 02/14] media: uapi: Add H.264 stateless encode support
Date: Fri, 22 May 2026 12:16:41 +0200
Message-ID: <20260522101653.2565125-3-paulk@sys-base.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260522101653.2565125-1-paulk@sys-base.io>
References: <20260522101653.2565125-1-paulk@sys-base.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62579-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.566];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sys-base.io:mid,sys-base.io:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5F8235B210B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This introduces the stateless H.264 encode params control that allows
configuring an H.264 encode run.

Note that the current uAPI does not support explicit passing of
references and works following the sliding window decoded reference
picture marking process. This may change in the future.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 62 +++++++++++++++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c |  4 ++
 include/media/v4l2-ctrls.h                |  2 +
 include/uapi/linux/v4l2-controls.h        | 33 ++++++++++++
 include/uapi/linux/videodev2.h            |  1 +
 5 files changed, 102 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 85d07ef44f62..48217811b0f1 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -382,6 +382,9 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
 		pr_cont("H264_PRED_WEIGHTS");
 		break;
+	case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
+		pr_cont("H264_ENCODE_PARAMS");
+		break;
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
 		pr_cont("FWHT_PARAMS");
 		break;
@@ -880,6 +883,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
+	struct v4l2_ctrl_h264_encode_params *p_h264_enc_params;
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
@@ -1102,6 +1106,61 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		zero_reserved(*p_h264_dec_params);
 		break;
 
+	case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
+		p_h264_enc_params = p;
+
+		if (p_h264_enc_params->slice_type != V4L2_H264_SLICE_TYPE_B)
+			p_h264_enc_params->flags &=
+				~V4L2_H264_ENCODE_FLAG_DIRECT_SPATIAL_MV_PRED;
+		if (!(p_h264_enc_params->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC) ||
+		    !p_h264_enc_params->nal_ref_idc)
+			p_h264_enc_params->flags &=
+				~V4L2_H264_ENCODE_FLAG_LONG_TERM_REFERENCE;
+
+		if (p_h264_enc_params->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC &&
+		    p_h264_enc_params->slice_type != V4L2_H264_SLICE_TYPE_I)
+			return -EINVAL;
+		if (p_h264_enc_params->colour_plane_id > 2)
+			return -EINVAL;
+		if (p_h264_enc_params->cabac_init_idc > 2)
+			return -EINVAL;
+		if (p_h264_enc_params->disable_deblocking_filter_idc > 2)
+			return -EINVAL;
+		if (p_h264_enc_params->slice_alpha_c0_offset_div2 < -6 ||
+		    p_h264_enc_params->slice_alpha_c0_offset_div2 > 6)
+			return -EINVAL;
+		if (p_h264_enc_params->slice_beta_offset_div2 < -6 ||
+		    p_h264_enc_params->slice_beta_offset_div2 > 6)
+			return -EINVAL;
+
+		if (p_h264_enc_params->slice_type == V4L2_H264_SLICE_TYPE_I ||
+		    p_h264_enc_params->slice_type == V4L2_H264_SLICE_TYPE_SI)
+			p_h264_enc_params->num_ref_idx_l0_active_minus1 = 0;
+		if (p_h264_enc_params->slice_type != V4L2_H264_SLICE_TYPE_B)
+			p_h264_enc_params->num_ref_idx_l1_active_minus1 = 0;
+
+		if (p_h264_enc_params->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC) {
+			p_h264_enc_params->frame_num = 0;
+			p_h264_enc_params->pic_order_cnt_lsb = 0;
+			p_h264_enc_params->delta_pic_order_cnt_bottom = 0;
+			p_h264_enc_params->delta_pic_order_cnt0 = 0;
+			p_h264_enc_params->delta_pic_order_cnt1 = 0;
+		} else {
+			p_h264_enc_params->idr_pic_id = 0;
+		}
+
+		if (p_h264_enc_params->num_ref_idx_l0_active_minus1 >
+		    (V4L2_H264_REF_LIST_LEN - 1))
+			return -EINVAL;
+		if (p_h264_enc_params->num_ref_idx_l1_active_minus1 >
+		    (V4L2_H264_REF_LIST_LEN - 1))
+			return -EINVAL;
+		memset(&p_h264_enc_params->reserved0, 0,
+		       sizeof(p_h264_enc_params->reserved0));
+		memset(&p_h264_enc_params->reserved1, 0,
+		       sizeof(p_h264_enc_params->reserved1));
+		break;
+
 	case V4L2_CTRL_TYPE_VP8_FRAME:
 		p_vp8_frame = p;
 
@@ -1913,6 +1972,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
 		elem_size = sizeof(struct v4l2_ctrl_h264_pred_weights);
 		break;
+	case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
+		elem_size = sizeof(struct v4l2_ctrl_h264_encode_params);
+		break;
 	case V4L2_CTRL_TYPE_VP8_FRAME:
 		elem_size = sizeof(struct v4l2_ctrl_vp8_frame);
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index ad41f65374e2..4fa6dc7a3b00 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1216,6 +1216,7 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_H264_PPS:			return "H264 Picture Parameter Set";
 	case V4L2_CID_STATELESS_H264_SCALING_MATRIX:		return "H264 Scaling Matrix";
 	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
+	case V4L2_CID_STATELESS_H264_ENCODE_PARAMS:		return "H264 Encode Parameters";
 	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
 	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
 	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
@@ -1555,6 +1556,9 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
 		*type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
 		break;
+	case V4L2_CID_STATELESS_H264_ENCODE_PARAMS:
+		*type = V4L2_CTRL_TYPE_H264_ENCODE_PARAMS;
+		break;
 	case V4L2_CID_STATELESS_VP8_FRAME:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME;
 		break;
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 31fc1bee3797..54133cda7bc7 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -42,6 +42,7 @@ struct video_device;
  * @p_h264_scaling_matrix:	Pointer to a struct v4l2_ctrl_h264_scaling_matrix.
  * @p_h264_slice_params:	Pointer to a struct v4l2_ctrl_h264_slice_params.
  * @p_h264_decode_params:	Pointer to a struct v4l2_ctrl_h264_decode_params.
+ * @p_h264_encode_params:	Pointer to a struct v4l2_ctrl_h264_encode_params.
  * @p_h264_pred_weights:	Pointer to a struct v4l2_ctrl_h264_pred_weights.
  * @p_vp8_frame:		Pointer to a VP8 frame params structure.
  * @p_vp9_compressed_hdr_probs:	Pointer to a VP9 frame compressed header probs structure.
@@ -76,6 +77,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_h264_scaling_matrix *p_h264_scaling_matrix;
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_decode_params;
+	struct v4l2_ctrl_h264_encode_params *p_h264_encode_params;
 	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
 	struct v4l2_ctrl_vp8_frame *p_vp8_frame;
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 2d30107e047e..9add059ca02a 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1568,6 +1568,7 @@ struct v4l2_h264_reference {
 
 #define V4L2_H264_SLICE_FLAG_DIRECT_SPATIAL_MV_PRED		0x01
 #define V4L2_H264_SLICE_FLAG_SP_FOR_SWITCH			0x02
+#define V4L2_H264_SLICE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE	0x04
 
 #define V4L2_CID_STATELESS_H264_SLICE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 6)
 /**
@@ -1707,6 +1708,38 @@ struct v4l2_ctrl_h264_decode_params {
 	__u32 flags;
 };
 
+#define V4L2_H264_ENCODE_FLAG_IDR_PIC				0x01
+#define V4L2_H264_ENCODE_FLAG_FIELD_PIC				0x02
+#define V4L2_H264_ENCODE_FLAG_BOTTOM_FIELD			0x04
+#define V4L2_H264_ENCODE_FLAG_DIRECT_SPATIAL_MV_PRED		0x08
+#define V4L2_H264_ENCODE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE	0x10
+#define V4L2_H264_ENCODE_FLAG_NO_OUTPUT_OF_PRIOR_PICS		0x20
+#define V4L2_H264_ENCODE_FLAG_LONG_TERM_REFERENCE		0x40
+
+#define V4L2_CID_STATELESS_H264_ENCODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 8)
+struct v4l2_ctrl_h264_encode_params {
+	__u8 nal_ref_idc;
+	__u8 slice_type;
+	__u8 pic_parameter_set_id;
+	__u8 colour_plane_id;
+	__u16 frame_num;
+	__u16 idr_pic_id;
+	__u16 pic_order_cnt_lsb;
+	__u8 reserved0[2];
+	__s32 delta_pic_order_cnt_bottom;
+	__s32 delta_pic_order_cnt0;
+	__s32 delta_pic_order_cnt1;
+	__u8 num_ref_idx_l0_active_minus1;
+	__u8 num_ref_idx_l1_active_minus1;
+	__u8 cabac_init_idc;
+	__s8 slice_qp_delta;
+	__u8 disable_deblocking_filter_idc;
+	__s8 slice_alpha_c0_offset_div2;
+	__s8 slice_beta_offset_div2;
+	__u8 reserved1[6];
+	__u32 flags; /* V4L2_H264_ENCODE_FLAG_ */
+};
+
 /* Stateless FWHT control, used by the vicodec driver */
 
 /* Current FWHT version */
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index becd08fdbddb..1d5e27b65544 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1964,6 +1964,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_H264_SLICE_PARAMS    = 0x0203,
 	V4L2_CTRL_TYPE_H264_DECODE_PARAMS   = 0x0204,
 	V4L2_CTRL_TYPE_H264_PRED_WEIGHTS    = 0x0205,
+	V4L2_CTRL_TYPE_H264_ENCODE_PARAMS   = 0x0206,
 
 	V4L2_CTRL_TYPE_FWHT_PARAMS	    = 0x0220,
 
-- 
2.53.0


