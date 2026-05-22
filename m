Return-Path: <linux-media+bounces-62580-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uG9fHtAvEGoaUwYAu9opvQ
	(envelope-from <linux-media+bounces-62580-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:28:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2B15B213E
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:28:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 378FB3029303
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A72D63CBE97;
	Fri, 22 May 2026 10:17:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840EF3CA48E;
	Fri, 22 May 2026 10:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445055; cv=none; b=WolM/ffZpOqZtLxEYV6myuDm0tXaVKqpTSnFthEaM+QhsR5g3AZg9oHfNahJPIyD3QEGN7tAh5kgICAw/jUxp8JTuxgbZbZWwVBtyCjC5Zk1JywJfKPpcbvrtryM8j4PPMCFj4VqNvgufZFHyR10mAWsZc1QZhIE3H8gt24b4X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445055; c=relaxed/simple;
	bh=JaTEffBMfxaL4Sy0FpmmWWRhKiTjrSafs6DcCUtXn20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETPg11ONdeN3zC8W77BDGjkleBnTbzIO/KbUo77YkiFWssKg8k9+4NRXqJdsmH/r+Gpk3FMhXTxWh0elzjbN8VpuWSNqKyl5YmkuTFgP1ZQ1p27BELcMLefsHNekhwtCJZIdxdETfw5o5cqoyhqWYpMSUxMwmZXx94NYoSTjCzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C3AB3370029F;
	Fri, 22 May 2026 10:17:19 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 45D15B408CB; Fri, 22 May 2026 10:17:19 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id CC5AFB408CC;
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
Subject: [PATCH 03/14] media: h264: Add SPS video definitions
Date: Fri, 22 May 2026 12:16:42 +0200
Message-ID: <20260522101653.2565125-4-paulk@sys-base.io>
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
	TAGGED_FROM(0.00)[bounces-62580-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.514];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sys-base.io:mid,sys-base.io:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 8F2B15B213E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

These definitions are used to build the video part of the SPS,
including important fields such as frame cropping, timing info
(frame rate) and pixel coding.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 include/media/v4l2-h264.h | 115 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 115 insertions(+)

diff --git a/include/media/v4l2-h264.h b/include/media/v4l2-h264.h
index 1833c0556963..3b00a1b67fe5 100644
--- a/include/media/v4l2-h264.h
+++ b/include/media/v4l2-h264.h
@@ -12,6 +12,121 @@
 
 #include <media/v4l2-ctrls.h>
 
+#define V4L2_H264_START_CODE_ANNEX_B		0x00000001
+
+#define V4L2_H264_NALU_TYPE_SLICE_NON_IDR	1
+#define V4L2_H264_NALU_TYPE_SLICE_IDR		5
+#define V4L2_H264_NALU_TYPE_SPS			7
+#define V4L2_H264_NALU_TYPE_PPS			8
+#define V4L2_H264_NALU_TYPE_AUD			9
+
+#define V4L2_H264_PRIMARY_PIC_TYPE_I		0
+#define V4L2_H264_PRIMARY_PIC_TYPE_IP		1
+#define V4L2_H264_PRIMARY_PIC_TYPE_IPB		2
+
+#define V4L2_H264_VUI_ASPECT_RATIO_IDC_EXTENDED	255
+
+#define V4L2_H264_VUI_VIDEO_COMPONENT		0
+#define V4L2_H264_VUI_VIDEO_PAL			1
+#define V4L2_H264_VUI_VIDEO_NTSC		2
+#define V4L2_H264_VUI_VIDEO_SECAM		3
+#define V4L2_H264_VUI_VIDEO_MAC			4
+#define V4L2_H264_VUI_VIDEO_UNSPECIFIED		5
+
+#define V4L2_H264_VUI_COLOUR_BT709		1
+#define V4L2_H264_VUI_COLOUR_UNSPECIFIED	2
+#define V4L2_H264_VUI_COLOUR_BT470_SYSTEM_M	4
+#define V4L2_H264_VUI_COLOUR_BT470_SYSTEM_BG	5
+#define V4L2_H264_VUI_COLOUR_SMPTE170M		6
+#define V4L2_H264_VUI_COLOUR_SMPTE240M		7
+#define V4L2_H264_VUI_COLOUR_BT2020		9
+
+#define V4L2_H264_VUI_TRANSFER_BT709		1
+#define V4L2_H264_VUI_TRANSFER_UNSPECIFIED	2
+#define V4L2_H264_VUI_TRANSFER_BT470_SYSTEM_M	4
+#define V4L2_H264_VUI_TRANSFER_BT470_SYSTEM_BG	5
+#define V4L2_H264_VUI_TRANSFER_SMPTE170M	6
+#define V4L2_H264_VUI_TRANSFER_SMPTE240M	7
+#define V4L2_H264_VUI_TRANSFER_LINEAR		8
+#define V4L2_H264_VUI_TRANSFER_SRGB		13
+
+#define V4L2_H264_VUI_MATRIX_IDENTITY		0
+#define V4L2_H264_VUI_MATRIX_BT709		1
+#define V4L2_H264_VUI_MATRIX_UNSPECIFIED	2
+#define V4L2_H264_VUI_MATRIX_BT470_SYSTEM_M	4
+#define V4L2_H264_VUI_MATRIX_BT470_SYSTEM_BG	5
+#define V4L2_H264_VUI_MATRIX_SMPTE170M		6
+#define V4L2_H264_VUI_MATRIX_SMPTE240M		7
+#define V4L2_H264_VUI_MATRIX_BT2020		9
+#define V4L2_H264_VUI_MATRIX_BT2020_CONST_LUM	10
+
+#define V4L2_H264_SPS_VIDEO_FLAG_FRAME_CROPPING				BIT(0)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_PARAMETERS_PRESENT			BIT(1)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_ASPECT_RATIO_INFO_PRESENT		BIT(2)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_OVERSCAN_INFO_PRESENT		BIT(3)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_OVERSCAN_APPROPRIATE		BIT(4)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_VIDEO_SIGNAL_TYPE_PRESENT		BIT(5)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_VIDEO_FULL_RANGE			BIT(6)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_COLOUR_DESCRIPTION_PRESENT		BIT(7)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_CHROMA_LOC_INFO_PRESENT		BIT(8)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_TIMING_INFO_PRESENT		BIT(9)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_FIXED_FRAME_RATE			BIT(10)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_NAL_HRD_PARAMETERS_PRESENT		BIT(11)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_VCL_HRD_PARAMETERS_PRESENT		BIT(12)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_LOW_DELAY_HRD			BIT(13)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_PIC_STRUCT_PRESENT			BIT(14)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_BITSTREAM_RESTRICTION		BIT(15)
+#define V4L2_H264_SPS_VIDEO_FLAG_VUI_MOTION_VECTORS_OVER_PIC_BOUNDARIES	BIT(16)
+
+struct v4l2_h264_sps_video_hrd {
+	u8 cpb_cnt_minus1;
+	u8 bit_rate_scale;
+	u8 cpb_size_scale;
+
+	u32 bit_rate_value_minus1[32];
+	u32 cpb_size_value_minus1[32];
+	u8 cbr_flag[32];
+
+	u8 initial_cpb_removal_delay_length_minus1;
+	u8 cpb_removal_delay_length_minus1;
+	u8 dpb_output_delay_length_minus1;
+	u8 time_offset_length;
+};
+
+struct v4l2_h264_sps_video {
+	u32 frame_crop_left_offset;
+	u32 frame_crop_right_offset;
+	u32 frame_crop_top_offset;
+	u32 frame_crop_bottom_offset;
+
+	u8 aspect_ratio_idc;
+	u16 sar_width;
+	u16 sar_height;
+
+	u8 video_format;
+	u8 colour_primaries;
+	u8 transfer_characteristics;
+	u8 matrix_coefficients;
+
+	u8 chroma_sample_loc_type_top_field;
+	u8 chroma_sample_loc_type_bottom_field;
+
+	u32 num_units_in_tick;
+	u32 time_scale;
+
+	struct v4l2_h264_sps_video_hrd nal_hrd;
+	struct v4l2_h264_sps_video_hrd vcl_hrd;
+
+	u32 max_bytes_per_pic_denom;
+	u32 max_bits_per_mb_denom;
+	u32 log2_max_mv_length_horizontal;
+	u32 log2_max_mv_length_vertical;
+	u32 max_num_reorder_frames;
+	u32 max_dec_frame_buffering;
+
+	u32 flags;
+};
+
 /**
  * struct v4l2_h264_reflist_builder - Reference list builder object
  *
-- 
2.53.0


