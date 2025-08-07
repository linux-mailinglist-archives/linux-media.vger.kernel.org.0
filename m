Return-Path: <linux-media+bounces-39074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CA6B1DDA4
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 21:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5FCC18A832F
	for <lists+linux-media@lfdr.de>; Thu,  7 Aug 2025 19:44:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282A52376FC;
	Thu,  7 Aug 2025 19:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="JA1n+rRH"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55548227599;
	Thu,  7 Aug 2025 19:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754595828; cv=none; b=ghOGBVI1S6FM2DFZZ/cpapB4dwB4mYjjJHIwILpUm2rzz7COjmlYruCGyzHGxu/SBEvIZbQkkkeZsZxvHAztPl1f8KsWk1vK5jceAj6ajDkxMbmfne6yzYPqMYmJP+vwp0Zw59ZqiBaVHcrOiwyhzCC11xUKQvc99hTSpbyY71M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754595828; c=relaxed/simple;
	bh=oAXKX7kiFD/86IYkfc0GI6gblxwF+uB9a6AuOq4h3Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ok/jkyUqtThq3XE2l9j7V7Yq5HOizEOavD6xBlVcBJe+7mcZZbYWbLR6y3PMibC1os+t0QyB14YKTmCACQatVI76qkFJufrADwDvyAxLx49yVRShPkPVL3+tQynI9OvdhADb0n3ExV570UsNMwz2iq/9JSqt1LTL7LI1kCc+wuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=JA1n+rRH; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754595819;
	bh=oAXKX7kiFD/86IYkfc0GI6gblxwF+uB9a6AuOq4h3Zg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JA1n+rRHIGAERx63CVWQKW/EMMk7lVsUNoigyQEeWnnDIj0e+5W/PYBCRJEAdno7u
	 uJpyaN90NmlVg8gYbqN4bptLW3oBW0uz72bFghSTZlFvxfkJgc8IqOhJPZ9y4/HfYo
	 mix62hvy7dEs/zX5k+4XEchXI9FjihX8O90EK9GBxLlx+5/QOStugTZOGySfnOdYEN
	 RVxeZsTHBl+EOWZ/IZ9RFEqpXjjp/OcFY1ltlrxVB48rwWDunnKXPRbOr9nD9yTYDc
	 cmAWsw67kazeivTc/aYyTxYyM1DNs5htrH7Nt4FCyRzrsy8EIfYcHQomafMIKGjZ2q
	 yePxcqN9ipnbA==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DE1017E1298;
	Thu,  7 Aug 2025 21:43:37 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fritz Koenig <frkoenig@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v3 2/2] media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps controls
Date: Thu,  7 Aug 2025 15:43:27 -0400
Message-ID: <20250807194327.69900-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250807194327.69900-1-detlev.casanova@collabora.com>
References: <20250807194327.69900-1-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The vdpu381 decoder found on newer Rockchip SoC need the information
from the long term and short term ref pic sets from the SPS.

So far, it wasn't included in the v4l2 API, so add it with new dynamic
sized controls.

Each element of the hevc_ext_sps_lt_rps array contains the long term ref
pic set at that index.
Each element of the hevc_ext_sps_st_rps contains the short term ref pic
set at that index, as the raw data.
It is the role of the drivers to calculate the reference sets values.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 18 +++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++
 include/uapi/linux/v4l2-controls.h        | 61 +++++++++++++++++++++++
 include/uapi/linux/videodev2.h            |  2 +
 4 files changed, 91 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 98b960775e87d..142e26134ef0c 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -418,6 +418,12 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
 		pr_cont("HEVC_SLICE_PARAMS");
 		break;
+	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
+		pr_cont("HEVC_EXT_SPS_ST_RPS");
+		break;
+	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
+		pr_cont("HEVC_EXT_SPS_LT_RPS");
+		break;
 	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
 		pr_cont("HEVC_SCALING_MATRIX");
 		break;
@@ -1173,6 +1179,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
 		break;
 
+	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
+		break;
+
+	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
+		break;
+
 	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
 		break;
 
@@ -1925,6 +1937,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
 		elem_size = sizeof(struct v4l2_ctrl_hevc_slice_params);
 		break;
+	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
+		elem_size = sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps);
+		break;
+	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
+		elem_size = sizeof(struct v4l2_ctrl_hevc_ext_sps_lt_rps);
+		break;
 	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
 		elem_size = sizeof(struct v4l2_ctrl_hevc_scaling_matrix);
 		break;
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
index 1ea52011247ac..86c7ee224b666 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
@@ -1233,6 +1233,8 @@ const char *v4l2_ctrl_get_name(u32 id)
 	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mode";
 	case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code";
 	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return "HEVC Entry Point Offsets";
+	case V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS:		return "HEVC Short Term Ref Sets";
+	case V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS:		return "HEVC Long Term Ref Sets";
 	case V4L2_CID_STATELESS_AV1_SEQUENCE:			return "AV1 Sequence Parameters";
 	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:		return "AV1 Tile Group Entry";
 	case V4L2_CID_STATELESS_AV1_FRAME:			return "AV1 Frame Parameters";
@@ -1578,6 +1580,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enum v4l2_ctrl_type *type,
 		*type = V4L2_CTRL_TYPE_U32;
 		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
 		break;
+	case V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS:
+		*type = V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
+	case V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS:
+		*type = V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS;
+		*flags |= V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
+		break;
 	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
 		*type = V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR;
 		break;
diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index f836512e9debb..08f869124474b 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2094,6 +2094,8 @@ struct v4l2_ctrl_mpeg2_quantisation {
 #define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_STATELESS_BASE + 405)
 #define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_STATELESS_BASE + 406)
 #define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC_STATELESS_BASE + 407)
+#define V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS  (V4L2_CID_CODEC_STATELESS_BASE + 408)
+#define V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS  (V4L2_CID_CODEC_STATELESS_BASE + 409)
 
 enum v4l2_stateless_hevc_decode_mode {
 	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
@@ -2549,6 +2551,65 @@ struct v4l2_ctrl_hevc_scaling_matrix {
 	__u8	scaling_list_dc_coef_32x32[2];
 };
 
+#define V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED	0x1
+
+/*
+ * struct v4l2_ctrl_hevc_ext_sps_st_rps - HEVC short term RPS parameters
+ *
+ * Dynamic size 1-dimension array for short term RPS. The number of elements
+ * is v4l2_ctrl_hevc_sps::num_short_term_ref_pic_sets. It can contain up to 65 elements.
+ *
+ * @delta_idx_minus1: Specifies the delta compare to the index. See details in section 7.4.8
+ *                    "Short-term reference picture set semantics" of the specification.
+ * @delta_rps_sign: Sign of the delta as specified in section 7.4.8 "Short-term reference picture
+ *                  set semantics" of the specification.
+ * @abs_delta_rps_minus1: Absolute delta RPS as specified in section 7.4.8 "Short-term reference
+ *                        picture set semantics" of the specification.
+ * @num_negative_pics: Number of short-term RPS entries that have picture order count values less
+ *                     than the picture order count value of the current picture.
+ * @num_positive_pics: Number of short-term RPS entries that have picture order count values
+ *                     greater than the picture order count value of the current picture.
+ * @used_by_curr_pic: Bit j specifies if short-term RPS j is used by the current picture.
+ * @use_delta_flag: Bit j equals to 1 specifies that the j-th entry in the source candidate
+ *                  short-term RPS is included in this candidate short-term RPS.
+ * @delta_poc_s0_minus1: Specifies the negative picture order count delta for the i-th entry in
+ *                       the short-term RPS. See details in section 7.4.8 "Short-term reference
+ *                       picture set semantics" of the specification.
+ * @delta_poc_s1_minus1: Specifies the positive picture order count delta for the i-th entry in
+ *                       the short-term RPS. See details in section 7.4.8 "Short-term reference
+ *                       picture set semantics" of the specification.
+ * @flags: See V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_{}
+ */
+struct v4l2_ctrl_hevc_ext_sps_st_rps {
+	__u8	delta_idx_minus1;
+	__u8	delta_rps_sign;
+	__u16	abs_delta_rps_minus1;
+	__u8	num_negative_pics;
+	__u8	num_positive_pics;
+	__u32	used_by_curr_pic;
+	__u32	use_delta_flag;
+	__u16	delta_poc_s0_minus1[16];
+	__u16	delta_poc_s1_minus1[16];
+	__u8	flags;
+};
+
+#define V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT		0x1
+
+/*
+ * struct v4l2_ctrl_hevc_ext_sps_lt_rps - HEVC long term RPS parameters
+ *
+ * Dynamic size 1-dimension array for long term RPS. The number of elements
+ * is v4l2_ctrl_hevc_sps::num_long_term_ref_pics_sps. It can contain up to 65 elements.
+ *
+ * @lt_ref_pic_poc_lsb_sps: picture order count modulo MaxPicOrderCntLsb of the i-th candidate
+ *                          long-term reference picture.
+ * @flags: See V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_{}
+ */
+struct v4l2_ctrl_hevc_ext_sps_lt_rps {
+	__u16	lt_ref_pic_poc_lsb_sps;
+	__u8	flags;
+};
+
 #define V4L2_CID_COLORIMETRY_CLASS_BASE	(V4L2_CTRL_CLASS_COLORIMETRY | 0x900)
 #define V4L2_CID_COLORIMETRY_CLASS	(V4L2_CTRL_CLASS_COLORIMETRY | 1)
 
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 3dd9fa45dde10..a3aa1f8c3894d 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1981,6 +1981,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	= 0x0272,
 	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	= 0x0273,
 	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	= 0x0274,
+	V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS	= 0x0275,
+	V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS	= 0x0276,
 
 	V4L2_CTRL_TYPE_AV1_SEQUENCE	    = 0x280,
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
-- 
2.50.1


