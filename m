Return-Path: <linux-media+bounces-31606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D3DAA758C
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 17:06:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8CCF7B5ED5
	for <lists+linux-media@lfdr.de>; Fri,  2 May 2025 15:05:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F73D257432;
	Fri,  2 May 2025 15:06:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6682571D6
	for <linux-media@vger.kernel.org>; Fri,  2 May 2025 15:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746198382; cv=none; b=Erhheqii0kTpPFK1Dz43xvtUP/Ijm2yNzVgwy1zW6bIttYDmxF5u6ggjPa/ffkYH98b56EqmyxM2bcdQ1VhkxRMybJlzcrJ8/dO126WWm/8cAQZ+fqOPKfwZe3YUxlp9YVKl+vpAskZSL/6ACsy4TXGEG/Gq2CntTeJM5xZfIPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746198382; c=relaxed/simple;
	bh=HNy4hU14ZjGj9LNbB9ueRUzWgj7sD7nXYVzHIa+tI7M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KZ+wGTqqSy3wLze05XOMuTODNoY3ZZd0pYYm1FhIoW2q7BhvNhxLm4RWrKVa3WOhEmkO6+RFyxt6K9H7dSL4Pv30HIRiNUPYIXooEtPKrJboSsjGCUR8HboD+W3xUafq3ITMtEiGZr6ty1u4Eq96Zf1An3gk3bE95zE3ABu+0EY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uArxk-0004HG-9i; Fri, 02 May 2025 17:06:04 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paulk@sys-base.io,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	sebastian.fricke@collabora.com,
	ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [RFC PATCH 01/11] media: Introduce Hantro V4L2 H.264 stateless encoding API
Date: Fri,  2 May 2025 17:05:04 +0200
Message-Id: <20250502150513.4169098-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502150513.4169098-1-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 23 ++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 12 +++++
 include/uapi/linux/v4l2-controls.h        | 55 +++++++++++++++++++++++
 include/uapi/linux/videodev2.h            |  3 ++
 4 files changed, 93 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..b52d04ba8fd4 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -316,6 +316,15 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
 		pr_cont("H264_PRED_WEIGHTS");
 		break;
+	case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
+		pr_cont("H264_ENCODE_PARAMS");
+		break;
+	case V4L2_CTRL_TYPE_H264_ENCODE_RC:
+		pr_cont("H264_ENCODE_RC");
+		break;
+	case V4L2_CTRL_TYPE_H264_ENCODE_FEEDBACK:
+		pr_cont("H264_ENCODE_FEEDBACK");
+		break;
 	case V4L2_CTRL_TYPE_FWHT_PARAMS:
 		pr_cont("FWHT_PARAMS");
 		break;
@@ -1031,6 +1040,11 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 		zero_reserved(*p_h264_dec_params);
 		break;
 
+	case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
+	case V4L2_CTRL_TYPE_H264_ENCODE_RC:
+	case V4L2_CTRL_TYPE_H264_ENCODE_FEEDBACK:
+		break;
+
 	case V4L2_CTRL_TYPE_VP8_FRAME:
 		p_vp8_frame = p;
 
@@ -1827,6 +1841,15 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_H264_PRED_WEIGHTS:
 		elem_size = sizeof(struct v4l2_ctrl_h264_pred_weights);
 		break;
+	case V4L2_CTRL_TYPE_H264_ENCODE_PARAMS:
+		elem_size = sizeof(struct v4l2_ctrl_h264_encode_params);
+		break;
+	case V4L2_CTRL_TYPE_H264_ENCODE_RC:
+		elem_size = sizeof(struct v4l2_ctrl_h264_encode_rc);
+		break;
+	case V4L2_CTRL_TYPE_H264_ENCODE_FEEDBACK:
+		elem_size = sizeof(struct v4l2_ctrl_h264_encode_feedback);
+		break;
 	case V4L2_CTRL_TYPE_VP8_FRAME:
 		elem_size = sizeof(struct v4l2_ctrl_vp8_frame);
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247a..6cc53842778c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1218,6 +1218,9 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:		return "H264 Prediction Weight Table";
 	case V4L2_CID_STATELESS_H264_SLICE_PARAMS:		return "H264 Slice Parameters";
 	case V4L2_CID_STATELESS_H264_DECODE_PARAMS:		return "H264 Decode Parameters";
+	case V4L2_CID_STATELESS_H264_ENCODE_PARAMS:		return "H264 Encode Parameters";
+	case V4L2_CID_STATELESS_H264_ENCODE_RC:			return "H264 Encode Rate-Control";
+	case V4L2_CID_STATELESS_H264_ENCODE_FEEDBACK:		return "H264 Encode Feedback";
 	case V4L2_CID_STATELESS_FWHT_PARAMS:			return "FWHT Stateless Parameters";
 	case V4L2_CID_STATELESS_VP8_FRAME:			return "VP8 Frame Parameters";
 	case V4L2_CID_STATELESS_MPEG2_SEQUENCE:			return "MPEG-2 Sequence Header";
@@ -1555,6 +1558,15 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 	case V4L2_CID_STATELESS_H264_PRED_WEIGHTS:
 		*type = V4L2_CTRL_TYPE_H264_PRED_WEIGHTS;
 		break;
+	case V4L2_CID_STATELESS_H264_ENCODE_PARAMS:
+		*type = V4L2_CTRL_TYPE_H264_ENCODE_PARAMS;
+		break;
+	case V4L2_CID_STATELESS_H264_ENCODE_RC:
+		*type = V4L2_CTRL_TYPE_H264_ENCODE_RC;
+		break;
+	case V4L2_CID_STATELESS_H264_ENCODE_FEEDBACK:
+		*type = V4L2_CTRL_TYPE_H264_ENCODE_FEEDBACK;
+		break;
 	case V4L2_CID_STATELESS_VP8_FRAME:
 		*type = V4L2_CTRL_TYPE_VP8_FRAME;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index 974fd254e573..4f6b37513edc 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1694,6 +1694,61 @@ struct v4l2_ctrl_h264_decode_params {
 	__u32 flags;
 };
 
+#define V4L2_CID_STATELESS_H264_ENCODE_PARAMS	(V4L2_CID_CODEC_STATELESS_BASE + 8)
+
+struct v4l2_ctrl_h264_encode_params {
+	/* Slice parameters */
+
+	__u8 slice_type;
+	__u8 pic_parameter_set_id;
+	__u16 frame_num;
+	__u16 idr_pic_id;
+	__u8 cabac_init_idc;
+	__u8 disable_deblocking_filter_idc;
+	__s8 slice_alpha_c0_offset_div2;
+	__s8 slice_beta_offset_div2;
+
+	__s32 slice_size_mb_rows;
+
+	/* PPS parameters */
+
+	__s8 pic_init_qp_minus26;
+	__s8 chroma_qp_index_offset;
+
+	__u32 flags; /* V4L2_H264_ENCODE_FLAG_ */
+
+	/* Reference */
+
+	__u64 reference_ts;
+};
+
+#define V4L2_H264_ENCODE_FLAG_ENTROPY_CODING_MODE	0x01
+#define V4L2_H264_ENCODE_FLAG_TRANSFORM_8X8_MODE	0x02
+#define V4L2_H264_ENCODE_FLAG_CONSTRAINED_INTRA_PRED	0x04
+
+#define V4L2_CID_STATELESS_H264_ENCODE_RC	(V4L2_CID_CODEC_STATELESS_BASE + 9)
+
+struct v4l2_ctrl_h264_encode_rc {
+	__u32 qp;
+	__u32 qp_min;
+	__u32 qp_max;
+	__s32 mad_qp_delta;
+	__u32 mad_threshold;
+
+	__u32 cp_distance_mbs;
+	__u32 cp_target[10];
+	__s32 cp_target_error[6];
+	__s32 cp_qp_delta[7];
+};
+
+#define V4L2_CID_STATELESS_H264_ENCODE_FEEDBACK	(V4L2_CID_CODEC_STATELESS_BASE + 10)
+
+struct v4l2_ctrl_h264_encode_feedback {
+	__u32 qp_sum;
+	__u32 cp[10];
+	__u32 mad_count;
+	__u32 rlc_count;
+};
 
 /* Stateless FWHT control, used by the vicodec driver */
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..9962532d32e3 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1939,6 +1939,9 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_H264_SLICE_PARAMS    = 0x0203,
 	V4L2_CTRL_TYPE_H264_DECODE_PARAMS   = 0x0204,
 	V4L2_CTRL_TYPE_H264_PRED_WEIGHTS    = 0x0205,
+	V4L2_CTRL_TYPE_H264_ENCODE_PARAMS   = 0x0206,
+	V4L2_CTRL_TYPE_H264_ENCODE_RC       = 0x0207,
+	V4L2_CTRL_TYPE_H264_ENCODE_FEEDBACK = 0x0208,
 
 	V4L2_CTRL_TYPE_FWHT_PARAMS	    = 0x0220,
 
-- 
2.39.5


