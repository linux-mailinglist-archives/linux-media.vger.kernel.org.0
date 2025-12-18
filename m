Return-Path: <linux-media+bounces-49102-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F885CCDF0C
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 00:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0BC903040A43
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 23:28:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90B4F2BE029;
	Thu, 18 Dec 2025 23:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ERYfxJtm"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9D8299923;
	Thu, 18 Dec 2025 23:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766100522; cv=none; b=V2PFzpDNjApshatsoGKREcqZyBZ6B4Fa2lv/ccE6NBt7QxZWieLprDxLGU0C4GNUqjqHnePVeIKvgGsecpfzFnkxQo6STp66zger0n27XjpngQvVy++RfqztaI4k+74Oz1D8B8yvXlgBrVIiasKlKlR4Nlsdv3QwFcevVReKNfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766100522; c=relaxed/simple;
	bh=F5qZAL3164R+JVuB6FU6TEMRwfXL4JAhA3VAndIF6KI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=un6VffcSKJ98f7v5iQReM8Ft4OGJGtM53K/pQFOYJ/buxF4VcfJl5PsYuZxNTJpLSr0JKLNdTMb822KagHQjSfSidpQFpN2iK9K3tLCdORkxZA/1xFqF7trMdlvFI3pBswRP7keECXSkW1w70vXigJx6VeRelLKuLKRZNMdbdSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ERYfxJtm; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766100519;
	bh=F5qZAL3164R+JVuB6FU6TEMRwfXL4JAhA3VAndIF6KI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ERYfxJtmKxoRyL4oYUzUoZzCeBmjOzblcm8ILY78vNSlqdnmCi0BPscaUwduDugsJ
	 UwrrTUdmR/3xTjO37FZsxKExmAr36lzzUTNfh32CDcT4UKenOIpphJpxGe6RnNQ2yE
	 OFVgy1TQ8Vqh+RSjjNl7jQ9cgA6kmb8MkzIctU72aLfssFIQAcqabBMfgmkn73pjpM
	 Tu9eyllDxsO+OA1gxTMc2M8QZmRFaL/6RmoLJVFmZaH+ZdiQZ9XTM+Jc0guHW/zifP
	 U3qx5nw4eFYoNWU46r+nlbgJHvjF4zIdF4E0vYDyhvdvzRMmoZIlRe07iwMs2rvGcz
	 lMKb2N74A4ucg==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F28EC17E12D6;
	Fri, 19 Dec 2025 00:28:36 +0100 (CET)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Hans de Goede <hansg@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Pavan Bobba <opensource206@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v7 02/17] media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps controls
Date: Thu, 18 Dec 2025 18:28:12 -0500
Message-ID: <20251218232829.337811-3-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218232829.337811-1-detlev.casanova@collabora.com>
References: <20251218232829.337811-1-detlev.casanova@collabora.com>
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
 drivers/media/v4l2-core/v4l2-ctrls-core.c | 28 +++++++++++
 drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++
 include/uapi/linux/v4l2-controls.h        | 61 +++++++++++++++++++++++
 include/uapi/linux/videodev2.h            |  2 +
 4 files changed, 101 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index 209bc05883bb1..f11255255c74f 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -424,6 +424,12 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
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
@@ -961,6 +967,8 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_h264_pred_weights *p_h264_pred_weights;
 	struct v4l2_ctrl_h264_slice_params *p_h264_slice_params;
 	struct v4l2_ctrl_h264_decode_params *p_h264_dec_params;
+	struct v4l2_ctrl_hevc_ext_sps_lt_rps *p_hevc_lt_rps;
+	struct v4l2_ctrl_hevc_ext_sps_st_rps *p_hevc_st_rps;
 	struct v4l2_ctrl_hevc_sps *p_hevc_sps;
 	struct v4l2_ctrl_hevc_pps *p_hevc_pps;
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
@@ -1254,6 +1262,20 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
 		break;
 
+	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
+		p_hevc_st_rps = p;
+
+		if (p_hevc_st_rps->flags & ~V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED)
+			return -EINVAL;
+		break;
+
+	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
+		p_hevc_lt_rps = p;
+
+		if (p_hevc_lt_rps->flags & ~V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT)
+			return -EINVAL;
+		break;
+
 	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
 		break;
 
@@ -2006,6 +2028,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
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
index ad41f65374e23..167286c9e4243 100644
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
index f84ed133a6c9b..e9f1fcc4f8409 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -2099,6 +2099,8 @@ struct v4l2_ctrl_mpeg2_quantisation {
 #define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_STATELESS_BASE + 405)
 #define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_STATELESS_BASE + 406)
 #define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC_STATELESS_BASE + 407)
+#define V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS  (V4L2_CID_CODEC_STATELESS_BASE + 408)
+#define V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS  (V4L2_CID_CODEC_STATELESS_BASE + 409)
 
 enum v4l2_stateless_hevc_decode_mode {
 	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
@@ -2554,6 +2556,65 @@ struct v4l2_ctrl_hevc_scaling_matrix {
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
+	__u8	num_negative_pics;
+	__u8	num_positive_pics;
+	__u32	used_by_curr_pic;
+	__u32	use_delta_flag;
+	__u16	abs_delta_rps_minus1;
+	__u16	delta_poc_s0_minus1[16];
+	__u16	delta_poc_s1_minus1[16];
+	__u16	flags;
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
+	__u16	flags;
+};
+
 /* Stateless VP9 controls */
 
 #define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index add08188f0689..5efaeb74ef92d 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1985,6 +1985,8 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	= 0x0272,
 	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	= 0x0273,
 	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	= 0x0274,
+	V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS	= 0x0275,
+	V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS	= 0x0276,
 
 	V4L2_CTRL_TYPE_AV1_SEQUENCE	    = 0x280,
 	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY = 0x281,
-- 
2.52.0


