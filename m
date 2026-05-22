Return-Path: <linux-media+bounces-62581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sLK7DucuEGrIUgYAu9opvQ
	(envelope-from <linux-media+bounces-62581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:24:39 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C148E5B2028
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 12:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2C38430AC40C
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 10:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D842F3CC32D;
	Fri, 22 May 2026 10:17:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043063CA48E;
	Fri, 22 May 2026 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779445060; cv=none; b=rANc5q053UbAgw2TOIdinHm4+nH2hEyegiX0ah7bPW86XB4gIF0DOMxzqueTgEn90nizK0+MN+QpsizG0nDckhoRD3HFRCLXzZB7vI7LTO6S2OG2qtpEomDzWk0SiuXJeLw2ImRW1pVdP9tSMNhVMrhULS2jA0KsVn2NnV0vvWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779445060; c=relaxed/simple;
	bh=YBufOHBaZig6PYj3Q6iKqP26PCif52Zktkm6lVRiFwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5HYdtLU79su09BJXIDWl0MlwrOUKCT9XsnCMmB/SlF3P6Frpij9VczGrAN5lN77G0vtGyMTavfzWAuDu2uXirHDPtuxVPxF2QSXqUhkfjCE/axAAoLudh4EChFdJLL8AQz3PQ+YCLR9TZ9TWfqMHTf5KzX0ysw2jE9mgSYdqCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id DB55D3700291;
	Fri, 22 May 2026 10:17:25 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 518ECB408CB; Fri, 22 May 2026 10:17:25 +0000 (UTC)
X-Spam-Level: **
Received: from shepard (unknown [192.168.1.65])
	by laika.paulk.fr (Postfix) with ESMTP id 3F05EB408CE;
	Fri, 22 May 2026 10:16:58 +0000 (UTC)
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
Subject: [PATCH 04/14] media: h264: Add stateless encode core
Date: Fri, 22 May 2026 12:16:43 +0200
Message-ID: <20260522101653.2565125-5-paulk@sys-base.io>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[sys-base.io];
	RCVD_COUNT_FIVE(0.00)[6];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-62581-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.545];
	FROM_NEQ_ENVFROM(0.00)[paulk@sys-base.io,linux-media@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,sys-base.io:mid,sys-base.io:email]
X-Rspamd-Queue-Id: C148E5B2028
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The H.264 stateless encode core is the common implementation called by
drivers to coordinate stateless encoding. It provides all the relevant
configuration parameters to drivers, through a state mechanism.

States are built from controls (some of which are optional) with various
inter-control checks along the way. A state can be constrained by the
driver through a dedicated operation callback in order to disable
unsupported features that may have been requested by userspace.
The general philosophy is to adapt parameters provided by userspace to
reach a state that can be handled by the hardware and bail out if no
such accommodation can be made.

Adapted parameters are returned to userspace by updating the controls.
This is currently not attached to the inbound media request but should
be when support for it becomes available.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 drivers/media/v4l2-core/Kconfig         |   4 +
 drivers/media/v4l2-core/Makefile        |   1 +
 drivers/media/v4l2-core/v4l2-h264-enc.c | 555 ++++++++++++++++++++++++
 include/media/v4l2-h264-enc.h           |  79 ++++
 4 files changed, 639 insertions(+)
 create mode 100644 drivers/media/v4l2-core/v4l2-h264-enc.c
 create mode 100644 include/media/v4l2-h264-enc.h

diff --git a/drivers/media/v4l2-core/Kconfig b/drivers/media/v4l2-core/Kconfig
index 331b8e535e5b..121ab82a9631 100644
--- a/drivers/media/v4l2-core/Kconfig
+++ b/drivers/media/v4l2-core/Kconfig
@@ -44,6 +44,10 @@ config V4L2_JPEG_HELPER
 config V4L2_H264
 	tristate
 
+# Used by drivers that need v4l2-h264-enc.ko
+config V4L2_H264_ENC
+	tristate
+
 # Used by drivers that need v4l2-vp9.ko
 config V4L2_VP9
 	tristate
diff --git a/drivers/media/v4l2-core/Makefile b/drivers/media/v4l2-core/Makefile
index 2177b9d63a8f..bd319e363c8e 100644
--- a/drivers/media/v4l2-core/Makefile
+++ b/drivers/media/v4l2-core/Makefile
@@ -29,6 +29,7 @@ obj-$(CONFIG_V4L2_CCI) += v4l2-cci.o
 obj-$(CONFIG_V4L2_FLASH_LED_CLASS) += v4l2-flash-led-class.o
 obj-$(CONFIG_V4L2_FWNODE) += v4l2-fwnode.o
 obj-$(CONFIG_V4L2_H264) += v4l2-h264.o
+obj-$(CONFIG_V4L2_H264_ENC) += v4l2-h264-enc.o
 obj-$(CONFIG_V4L2_JPEG_HELPER) += v4l2-jpeg.o
 obj-$(CONFIG_V4L2_MEM2MEM_DEV) += v4l2-mem2mem.o
 obj-$(CONFIG_V4L2_VP9) += v4l2-vp9.o
diff --git a/drivers/media/v4l2-core/v4l2-h264-enc.c b/drivers/media/v4l2-core/v4l2-h264-enc.c
new file mode 100644
index 000000000000..d4e1450691fb
--- /dev/null
+++ b/drivers/media/v4l2-core/v4l2-h264-enc.c
@@ -0,0 +1,555 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * V4L2 H.264 Encode Core
+ *
+ * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
+ */
+
+#include <linux/module.h>
+#include <linux/v4l2-controls.h>
+#include <media/v4l2-h264.h>
+#include <media/v4l2-h264-enc.h>
+#include <media/videobuf2-v4l2.h>
+
+int v4l2_h264_enc_init(struct v4l2_h264_enc *enc)
+{
+	int ret;
+
+	if ((!enc->format && !enc->format_mplane) || !enc->timeperframe ||
+	    !enc->ctrl_handler)
+		return -EINVAL;
+
+	memset(&enc->state_active, 0, sizeof(enc->state_active));
+	memset(&enc->state_next, 0, sizeof(enc->state_next));
+	enc->state_serial = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_init);
+
+void v4l2_h264_enc_exit(struct v4l2_h264_enc *enc)
+{
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_exit);
+
+static int state_prepare_params(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_next;
+	struct v4l2_ctrl_h264_sps *sps = &state->sps;
+	struct v4l2_h264_sps_video *sps_video = &state->sps_video;
+	struct v4l2_ctrl_h264_pps *pps = &state->pps;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+	struct v4l2_ctrl_handler *handler = enc->ctrl_handler;
+	struct v4l2_fract *timeperframe = enc->timeperframe;
+	unsigned int width, height;
+	unsigned int colorspace, quantization, xfer_func, ycbcr_enc;
+	struct v4l2_ctrl *ctrl;
+
+	/* Time per frame */
+
+	state->timeperframe = *timeperframe;
+
+	/* Format */
+
+	if (enc->format_mplane)
+		width = enc->format_mplane->width;
+	else
+		width = enc->format->width;
+
+	state->width_mbs = DIV_ROUND_UP(width, V4L2_H264_ENC_MB_UNIT);
+	state->width_aligned = ALIGN(width, V4L2_H264_ENC_MB_UNIT);
+
+	if (enc->format_mplane)
+		height = enc->format_mplane->height;
+	else
+		height = enc->format->height;
+
+	state->height_mbs = DIV_ROUND_UP(height, V4L2_H264_ENC_MB_UNIT);
+	state->height_aligned = ALIGN(height, V4L2_H264_ENC_MB_UNIT);
+
+	/* SPS */
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_STATELESS_H264_SPS);
+	if (!ctrl)
+		return -EINVAL;
+
+	memcpy(sps, ctrl->p_cur.p_h264_sps, sizeof(*sps));
+
+	sps->pic_width_in_mbs_minus1 = state->width_mbs - 1;
+	sps->pic_height_in_map_units_minus1 = state->height_mbs - 1;
+
+	/*
+	 * Only pic_order_cnt_type = 0 is currently supported.
+	 * Error out since no pic_order_cnt_lsb was provided.
+	 */
+	if (sps->pic_order_cnt_type)
+		return -EINVAL;
+
+	/* SPS Video */
+
+	if (width < state->width_aligned || height < state->height_aligned) {
+		sps_video->flags |= V4L2_H264_SPS_VIDEO_FLAG_FRAME_CROPPING;
+
+		sps_video->frame_crop_left_offset = 0;
+		sps_video->frame_crop_right_offset = (state->width_aligned -
+						      width) / 2;
+		sps_video->frame_crop_top_offset = 0;
+		sps_video->frame_crop_bottom_offset = (state->height_aligned -
+						       height) / 2;
+	}
+
+	if (timeperframe->numerator && timeperframe->denominator) {
+		sps_video->flags |=
+			V4L2_H264_SPS_VIDEO_FLAG_VUI_PARAMETERS_PRESENT |
+			V4L2_H264_SPS_VIDEO_FLAG_VUI_TIMING_INFO_PRESENT |
+			V4L2_H264_SPS_VIDEO_FLAG_VUI_FIXED_FRAME_RATE;
+
+		/* Timing info is always provided as a field rate. */
+		sps_video->num_units_in_tick = timeperframe->numerator;
+		sps_video->time_scale = timeperframe->denominator * 2;
+	}
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_ENABLE);
+	if (ctrl && ctrl->cur.val) {
+		sps_video->flags |=
+			V4L2_H264_SPS_VIDEO_FLAG_VUI_ASPECT_RATIO_INFO_PRESENT;
+
+		ctrl = v4l2_ctrl_find(handler,
+				      V4L2_CID_MPEG_VIDEO_H264_VUI_SAR_IDC);
+		if (!ctrl)
+			return -EINVAL;
+
+		if (ctrl->cur.val == V4L2_MPEG_VIDEO_H264_VUI_SAR_IDC_EXTENDED)
+			sps_video->aspect_ratio_idc =
+				V4L2_H264_VUI_ASPECT_RATIO_IDC_EXTENDED;
+		else
+			sps_video->aspect_ratio_idc = ctrl->cur.val;
+
+		if (sps_video->aspect_ratio_idc ==
+		    V4L2_H264_VUI_ASPECT_RATIO_IDC_EXTENDED) {
+			ctrl = v4l2_ctrl_find(handler,
+					      V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_WIDTH);
+			if (!ctrl)
+				return -EINVAL;
+
+			sps_video->sar_width = ctrl->cur.val;
+
+			ctrl = v4l2_ctrl_find(handler,
+					      V4L2_CID_MPEG_VIDEO_H264_VUI_EXT_SAR_HEIGHT);
+			if (!ctrl)
+				return -EINVAL;
+
+			sps_video->sar_height = ctrl->cur.val;
+		}
+	}
+
+	if (enc->format_mplane) {
+		colorspace = enc->format_mplane->colorspace;
+		quantization = enc->format_mplane->quantization;
+		xfer_func = enc->format_mplane->xfer_func;
+		ycbcr_enc = enc->format_mplane->ycbcr_enc;
+	} else {
+		colorspace = enc->format->colorspace;
+		quantization = enc->format->quantization;
+		xfer_func = enc->format->xfer_func;
+		ycbcr_enc = enc->format->ycbcr_enc;
+	}
+
+	if (colorspace != V4L2_COLORSPACE_DEFAULT ||
+	    quantization != V4L2_QUANTIZATION_DEFAULT ||
+	    xfer_func != V4L2_XFER_FUNC_DEFAULT ||
+	    ycbcr_enc != V4L2_YCBCR_ENC_DEFAULT) {
+		sps_video->flags |=
+			V4L2_H264_SPS_VIDEO_FLAG_VUI_VIDEO_SIGNAL_TYPE_PRESENT |
+			V4L2_H264_SPS_VIDEO_FLAG_VUI_COLOUR_DESCRIPTION_PRESENT;
+
+		sps_video->video_format = V4L2_H264_VUI_VIDEO_UNSPECIFIED;
+
+		switch (colorspace) {
+		case V4L2_COLORSPACE_SMPTE170M:
+			sps_video->colour_primaries =
+				V4L2_H264_VUI_COLOUR_SMPTE170M;
+			break;
+		case V4L2_COLORSPACE_SMPTE240M:
+			sps_video->colour_primaries =
+				V4L2_H264_VUI_COLOUR_SMPTE240M;
+			break;
+		case V4L2_COLORSPACE_REC709:
+			sps_video->colour_primaries =
+				V4L2_H264_VUI_COLOUR_BT709;
+			break;
+		case V4L2_COLORSPACE_470_SYSTEM_M:
+			sps_video->colour_primaries =
+				V4L2_H264_VUI_COLOUR_BT470_SYSTEM_M;
+			break;
+		case V4L2_COLORSPACE_470_SYSTEM_BG:
+			sps_video->colour_primaries =
+				V4L2_H264_VUI_COLOUR_BT470_SYSTEM_BG;
+			break;
+		case V4L2_COLORSPACE_BT2020:
+			sps_video->colour_primaries =
+				V4L2_H264_VUI_COLOUR_BT2020;
+			break;
+		case V4L2_COLORSPACE_JPEG:
+			sps_video->colour_primaries =
+				V4L2_H264_VUI_COLOUR_BT709;
+			break;
+		case V4L2_COLORSPACE_SRGB:
+			sps_video->colour_primaries =
+				V4L2_H264_VUI_COLOUR_BT709;
+			break;
+		default:
+			sps_video->colour_primaries =
+				V4L2_H264_VUI_COLOUR_UNSPECIFIED;
+			break;
+		}
+
+		if (quantization == V4L2_QUANTIZATION_FULL_RANGE)
+			sps_video->flags |=
+				V4L2_H264_SPS_VIDEO_FLAG_VUI_VIDEO_FULL_RANGE;
+
+		switch (xfer_func) {
+		case V4L2_XFER_FUNC_709:
+			/*
+			 * All of these are equivalent but the H.264
+			 * specification allows being more specific.
+			 */
+			switch (colorspace) {
+			case V4L2_COLORSPACE_SMPTE170M:
+				sps_video->transfer_characteristics =
+					V4L2_H264_VUI_TRANSFER_SMPTE170M;
+				break;
+			case V4L2_COLORSPACE_470_SYSTEM_M:
+				sps_video->transfer_characteristics =
+					V4L2_H264_VUI_TRANSFER_BT470_SYSTEM_M;
+				break;
+			case V4L2_COLORSPACE_470_SYSTEM_BG:
+				sps_video->transfer_characteristics =
+					V4L2_H264_VUI_TRANSFER_BT470_SYSTEM_BG;
+				break;
+			default:
+				sps_video->transfer_characteristics =
+					V4L2_H264_VUI_TRANSFER_BT709;
+				break;
+			}
+			break;
+		case V4L2_XFER_FUNC_SRGB:
+			sps_video->transfer_characteristics =
+				V4L2_H264_VUI_TRANSFER_SRGB;
+			break;
+		case V4L2_XFER_FUNC_SMPTE240M:
+			sps_video->transfer_characteristics =
+				V4L2_H264_VUI_TRANSFER_SMPTE240M;
+			break;
+		case V4L2_XFER_FUNC_NONE:
+			sps_video->transfer_characteristics =
+				V4L2_H264_VUI_TRANSFER_LINEAR;
+			break;
+		default:
+			sps_video->transfer_characteristics =
+				V4L2_H264_VUI_TRANSFER_UNSPECIFIED;
+			break;
+		}
+
+		switch (ycbcr_enc) {
+		case V4L2_YCBCR_ENC_601:
+			/*
+			 * All of these are equivalent but the H.264
+			 * specification allows being more specific.
+			 */
+			switch (colorspace) {
+			case V4L2_COLORSPACE_SMPTE170M:
+				sps_video->matrix_coefficients =
+					V4L2_H264_VUI_MATRIX_SMPTE170M;
+				break;
+			case V4L2_COLORSPACE_470_SYSTEM_M:
+				sps_video->matrix_coefficients =
+					V4L2_H264_VUI_MATRIX_BT470_SYSTEM_M;
+				break;
+			default:
+				sps_video->matrix_coefficients =
+					V4L2_H264_VUI_MATRIX_BT470_SYSTEM_BG;
+				break;
+			}
+			break;
+		case V4L2_YCBCR_ENC_709:
+			sps_video->matrix_coefficients =
+				V4L2_H264_VUI_MATRIX_BT709;
+			break;
+		case V4L2_YCBCR_ENC_SMPTE240M:
+			sps_video->matrix_coefficients =
+				V4L2_H264_VUI_MATRIX_SMPTE240M;
+			break;
+		case V4L2_YCBCR_ENC_BT2020:
+			sps_video->matrix_coefficients =
+				V4L2_H264_VUI_MATRIX_BT2020;
+			break;
+		case V4L2_YCBCR_ENC_BT2020_CONST_LUM:
+			sps_video->matrix_coefficients =
+				V4L2_H264_VUI_MATRIX_BT2020_CONST_LUM;
+			break;
+		default:
+			sps_video->matrix_coefficients =
+				V4L2_H264_VUI_MATRIX_UNSPECIFIED;
+			break;
+		}
+	}
+
+	/* PPS */
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_STATELESS_H264_PPS);
+	if (!ctrl)
+		return -EINVAL;
+
+	memcpy(pps, ctrl->p_cur.p_h264_pps, sizeof(*pps));
+
+	/* Only single instances of PPS and SPS are supported. */
+	if (pps->seq_parameter_set_id != sps->seq_parameter_set_id)
+		pps->seq_parameter_set_id = sps->seq_parameter_set_id;
+
+	pps->flags &= ~V4L2_H264_PPS_FLAG_BOTTOM_FIELD_PIC_ORDER_IN_FRAME_PRESENT;
+
+	/* Slice groups are not supported. */
+	pps->num_slice_groups_minus1 = 0;
+
+	if (pps->num_ref_idx_l0_default_active_minus1 >
+	    (sps->max_num_ref_frames - 1))
+		pps->num_ref_idx_l0_default_active_minus1 =
+			sps->max_num_ref_frames - 1;
+
+	if (pps->num_ref_idx_l1_default_active_minus1 >
+	    (sps->max_num_ref_frames - 1))
+		pps->num_ref_idx_l1_default_active_minus1 =
+			sps->max_num_ref_frames - 1;
+
+	pps->flags &= ~V4L2_H264_PPS_FLAG_WEIGHTED_PRED;
+	pps->weighted_bipred_idc = 0;
+
+	/* Switching slices are not supported. */
+	pps->pic_init_qs_minus26 = 0;
+
+	/* Redundant pictures are not supported. */
+	pps->flags &= ~V4L2_H264_PPS_FLAG_REDUNDANT_PIC_CNT_PRESENT;
+
+	/* Scaling matrix is not supported. */
+	pps->flags &= ~V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT;
+
+	/*
+	 * RBSP always writes the optional second_chroma_qp_index_offset,
+	 * which has to take the chroma_qp_index_offset value if unsupported.
+	 */
+	if (!(enc->flags & V4L2_H264_ENC_FLAG_CHROMA_QP_CR_OFFSET))
+		pps->second_chroma_qp_index_offset =
+			pps->chroma_qp_index_offset;
+
+	/* Encode */
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_STATELESS_H264_ENCODE_PARAMS);
+	if (!ctrl)
+		return -EINVAL;
+
+	memcpy(encode, ctrl->p_cur.p_h264_encode_params, sizeof(*encode));
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_SI)
+		encode->slice_type = V4L2_H264_SLICE_TYPE_I;
+	else if (encode->slice_type == V4L2_H264_SLICE_TYPE_SP)
+		encode->slice_type = V4L2_H264_SLICE_TYPE_P;
+
+	/* We cannot safely reuse parameters of a B frane for a P frame. */
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_B &&
+	    !(enc->flags & V4L2_H264_ENC_FLAG_INTER_BIPRED))
+		return -EINVAL;
+
+	/* We can safely reuse parameters of a P frame for an I frame. */
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_P &&
+	    !(enc->flags & V4L2_H264_ENC_FLAG_INTER_PRED))
+		encode->slice_type = V4L2_H264_SLICE_TYPE_I;
+
+	if (encode->slice_type != V4L2_H264_SLICE_TYPE_I &&
+	    !sps->max_num_ref_frames)
+		return -EINVAL;
+
+	/* Ensure the stream starts with an I frame. */
+	if (!enc->state_serial && encode->slice_type != V4L2_H264_SLICE_TYPE_I)
+		return -EINVAL;
+
+	/* Only single instances of PPS and SPS are supported. */
+	if (encode->pic_parameter_set_id != pps->pic_parameter_set_id)
+		encode->pic_parameter_set_id = pps->pic_parameter_set_id;
+
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_NUM_REF_IDX_ACTIVE_OVERRIDE) {
+		if (encode->num_ref_idx_l0_active_minus1 >
+		    (sps->max_num_ref_frames - 1))
+			encode->num_ref_idx_l0_active_minus1 =
+				sps->max_num_ref_frames - 1;
+
+		if (encode->num_ref_idx_l1_active_minus1 >
+		    (sps->max_num_ref_frames - 1))
+			encode->num_ref_idx_l1_active_minus1 =
+				sps->max_num_ref_frames - 1;
+	}
+
+	return 0;
+}
+
+static int state_prepare(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_next;
+	int ret;
+
+	memset(state, 0, sizeof(*state));
+
+	ret = state_prepare_params(enc);
+	if (ret)
+		return ret;
+
+	ret = v4l2_h264_enc_op(enc, state_constrain, state);
+	if (ret && ret != -EOPNOTSUPP)
+		return ret;
+
+	return 0;
+}
+
+static void state_debug(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_sps *sps = &state->sps;
+	struct v4l2_ctrl_h264_pps *pps = &state->pps;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+
+	pr_debug("+ v4l2-h264-enc: state");
+
+	pr_debug("  type: %c%s, ref: %s%s",
+		 v4l2_h264_slice_type_char(encode->slice_type),
+		 encode->flags & V4L2_H264_ENCODE_FLAG_IDR_PIC ? " (IDR)" : "",
+		 encode->nal_ref_idc ? "marked" : "unmarked",
+		 encode->flags & V4L2_H264_ENCODE_FLAG_LONG_TERM_REFERENCE ?
+		 " (long-term)" : "");
+	pr_debug("  width: %u mbs, height: %u mbs",
+		 sps->pic_width_in_mbs_minus1,
+		 sps->pic_height_in_map_units_minus1);
+	pr_debug("  profile: %u, level: %u", sps->profile_idc,
+		 sps->level_idc);
+
+	pr_debug("  entropy coding: %s",
+		 pps->flags & V4L2_H264_PPS_FLAG_ENTROPY_CODING_MODE ? "cabac" :
+								       "cavlc");
+
+	if (pps->flags & (V4L2_H264_PPS_FLAG_WEIGHTED_PRED |
+			  V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED |
+			  V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE |
+			  V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT) ||
+	    encode->flags & V4L2_H264_ENCODE_FLAG_DIRECT_SPATIAL_MV_PRED)
+		pr_debug("  coding features:");
+
+	if (pps->flags & V4L2_H264_PPS_FLAG_WEIGHTED_PRED)
+		pr_debug("  - weighted-pred");
+	if (pps->flags & V4L2_H264_PPS_FLAG_CONSTRAINED_INTRA_PRED)
+		pr_debug("  - constrained-intra-pred");
+	if (pps->flags & V4L2_H264_PPS_FLAG_TRANSFORM_8X8_MODE)
+		pr_debug("  - transform-8x8");
+	if (pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT)
+		pr_debug("  - scaling-matrix");
+	if (encode->flags & V4L2_H264_ENCODE_FLAG_DIRECT_SPATIAL_MV_PRED)
+		pr_debug("  - direct-spatial-mv-pred");
+}
+
+static int state_commit(struct v4l2_h264_enc *enc)
+{
+	struct v4l2_h264_enc_state *state = &enc->state_next;
+	struct v4l2_ctrl_handler *handler = enc->ctrl_handler;
+	struct v4l2_ctrl *ctrl;
+	int ret;
+
+	/* The presence of required controls was checked already. */
+	/* TODO: Attach to media request. */
+
+	/* SPS */
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_STATELESS_H264_SPS);
+	ret = v4l2_ctrl_s_ctrl_compound(ctrl, V4L2_CTRL_TYPE_H264_SPS,
+					&state->sps);
+	if (ret)
+		return ret;
+
+	/* PPS */
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_STATELESS_H264_PPS);
+	ret = v4l2_ctrl_s_ctrl_compound(ctrl, V4L2_CTRL_TYPE_H264_PPS,
+					&state->pps);
+	if (ret)
+		return ret;
+
+	/* Encode */
+
+	ctrl = v4l2_ctrl_find(handler, V4L2_CID_STATELESS_H264_ENCODE_PARAMS);
+	ret = v4l2_ctrl_s_ctrl_compound(ctrl, V4L2_CTRL_TYPE_H264_ENCODE_PARAMS,
+					&state->encode);
+	if (ret)
+		return ret;
+
+	/* State */
+
+	memcpy(&enc->state_active, &enc->state_next, sizeof(enc->state_active));
+
+	state_debug(enc);
+
+	return 0;
+}
+
+static int state_complete(struct v4l2_h264_enc *enc,
+			  struct vb2_v4l2_buffer *buffer)
+{
+
+	struct v4l2_h264_enc_state *state = &enc->state_active;
+	struct v4l2_ctrl_h264_encode_params *encode = &state->encode;
+
+	if (encode->slice_type == V4L2_H264_SLICE_TYPE_I)
+		buffer->flags |= V4L2_BUF_FLAG_KEYFRAME;
+	else if (encode->slice_type == V4L2_H264_SLICE_TYPE_P)
+		buffer->flags |= V4L2_BUF_FLAG_PFRAME;
+	else if (encode->slice_type == V4L2_H264_SLICE_TYPE_B)
+		buffer->flags |= V4L2_BUF_FLAG_BFRAME;
+
+	/*
+	 * This is only incremented after a successful encode so we can still
+	 * detect a stream start case after the first frame failed to encode.
+	 */
+	enc->state_serial++;
+
+	return 0;
+}
+
+int v4l2_h264_enc_step(struct v4l2_h264_enc *enc,
+		       struct vb2_v4l2_buffer *buffer)
+{
+	int ret;
+
+	ret = state_prepare(enc);
+	if (ret)
+		return ret;
+
+	ret = state_commit(enc);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_step);
+
+int v4l2_h264_enc_complete(struct v4l2_h264_enc *enc,
+			   struct vb2_v4l2_buffer *buffer)
+{
+	int ret;
+
+	ret = state_complete(enc, buffer);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(v4l2_h264_enc_complete);
+
+MODULE_DESCRIPTION("V4L2 H.264 Encode Core");
+MODULE_AUTHOR("Paul Kocialkowski <paulk@sys-base.io>");
+MODULE_LICENSE("GPL");
diff --git a/include/media/v4l2-h264-enc.h b/include/media/v4l2-h264-enc.h
new file mode 100644
index 000000000000..2978a73baacd
--- /dev/null
+++ b/include/media/v4l2-h264-enc.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * V4L2 H.264 Encode Core
+ *
+ * Copyright (C) 2025-2026 Paul Kocialkowski <paulk@sys-base.io>
+ */
+
+#ifndef _MEDIA_V4L2_H264_ENC_H
+#define _MEDIA_V4L2_H264_ENC_H
+
+#include <linux/v4l2-controls.h>
+#include <linux/videodev2.h>
+#include <media/videobuf2-v4l2.h>
+
+#define V4L2_H264_ENC_MB_UNIT	16
+
+#define V4L2_H264_ENC_FLAG_INTER_PRED		0x1
+#define V4L2_H264_ENC_FLAG_INTER_BIPRED		0x2
+#define V4L2_H264_ENC_FLAG_HW_AUD		0x4
+#define V4L2_H264_ENC_FLAG_HW_SPS		0x8
+#define V4L2_H264_ENC_FLAG_HW_PPS		0x10
+#define V4L2_H264_ENC_FLAG_HW_SLICE_HEADER	0x20
+#define V4L2_H264_ENC_FLAG_CHROMA_QP_CR_OFFSET	0x40
+
+#define v4l2_h264_enc_op(e, o, a...) \
+	({ \
+		int ret; \
+		if ((e)->ops && (e)->ops->o) \
+			ret = (e)->ops->o(e, ##a); \
+		else \
+			ret = -EOPNOTSUPP; \
+		ret; \
+	})
+
+struct v4l2_h264_enc;
+
+struct v4l2_h264_enc_state {
+	struct v4l2_ctrl_h264_sps sps;
+	struct v4l2_h264_sps_video sps_video;
+	struct v4l2_ctrl_h264_pps pps;
+	struct v4l2_ctrl_h264_encode_params encode;
+
+	struct v4l2_fract timeperframe;
+
+	unsigned int width_mbs;
+	unsigned int width_aligned;
+	unsigned int height_mbs;
+	unsigned int height_aligned;
+};
+
+struct v4l2_h264_enc_ops {
+	int (*state_constrain)(struct v4l2_h264_enc *enc,
+			       struct v4l2_h264_enc_state *state);
+};
+
+struct v4l2_h264_enc {
+	const struct v4l2_h264_enc_ops *ops;
+	void *private_data;
+
+	struct v4l2_pix_format *format;
+	struct v4l2_pix_format_mplane *format_mplane;
+	struct v4l2_fract *timeperframe;
+	struct v4l2_ctrl_handler *ctrl_handler;
+
+	struct v4l2_h264_enc_state state_active;
+	struct v4l2_h264_enc_state state_next;
+	unsigned int state_serial;
+
+	unsigned int flags;
+};
+
+int v4l2_h264_enc_init(struct v4l2_h264_enc *enc);
+void v4l2_h264_enc_exit(struct v4l2_h264_enc *enc);
+int v4l2_h264_enc_step(struct v4l2_h264_enc *enc,
+		       struct vb2_v4l2_buffer *buffer);
+int v4l2_h264_enc_complete(struct v4l2_h264_enc *enc,
+			   struct vb2_v4l2_buffer *buffer);
+
+#endif
-- 
2.53.0


