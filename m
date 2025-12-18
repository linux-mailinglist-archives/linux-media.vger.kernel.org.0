Return-Path: <linux-media+bounces-49108-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED592CCDF39
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 00:33:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3D33309076A
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 23:29:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07C02E9733;
	Thu, 18 Dec 2025 23:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="G1WTFJq0"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27E8E2D5419;
	Thu, 18 Dec 2025 23:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766100542; cv=none; b=lpdrf8APnvAheaA85Pbisu/St9Y81bwc7QuXNwQczfrC7XWyTCfnn9lfhUV8oy3fqN8SGWFlKbVnEqodbTMUkvKk6+qakVIBCKvRCRwuMvy8jFDrod+hy9vv8iGpXG+pY9ePGHOssoFZZh+LApvNii3kuXK1+lGrhZ1RnDGwQtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766100542; c=relaxed/simple;
	bh=CBWACUaja3Rmfd7Ucv0xM+IAeSe4majq/0lp56NIRZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VEGKNdkQRm4kHkljOXg3O822aR4Al+aixtvs5qjynIjnos9ro7uROwXurrjGGhRCjlCoWt8TXKay5cMPkWAEW/Lp59tVi6XEpl0FE2XBNWYxUOIaKXNofh7dvosbvoglN1M97zA9KDJ7hkTfQxnijNk+rI8eMbahEq7l8YjUVZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=G1WTFJq0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766100535;
	bh=CBWACUaja3Rmfd7Ucv0xM+IAeSe4majq/0lp56NIRZQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G1WTFJq0yosyKbk3AAtwNzRm2Jew3o9CUvi4T42YI2CMN6Ty3oldLQvZ11QjTzoQR
	 J8mFASvtXknM+UPf8vG5oj+A458Xcei91LetPotaOQKG0vrsVQoZcHqRbv7Y4uR0/7
	 2/1RkcSvUKCZigQJp668QTO66w/nymIC60UIqxr7GDak2mDOU8kEqLzVee07rg+zV2
	 HQppA4GuJVubj37QmOiYd6w2oxwc1Zm11jQ872Rt8TG2m4FmHTOijMFtinTq1TbOC3
	 aNBK7FCP/eb6K2z59gl+ql2mvMojnmnZgNUr0XJ7RR1ewD2lzI10Zbo2bbYWXk6fRK
	 +9Pnjg0wrZlPw==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 02E4A17E13F9;
	Fri, 19 Dec 2025 00:28:52 +0100 (CET)
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
	Jonas Karlman <jonas@kwiboo.se>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v7 08/17] media: rkvdec: Move hevc functions to common file
Date: Thu, 18 Dec 2025 18:28:18 -0500
Message-ID: <20251218232829.337811-9-detlev.casanova@collabora.com>
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

This is a preparation commit to add support for new variants of the
decoder.

The functions will later be shared with vdpu381 (rk3588) and vdpu383
(rk3576).

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 .../media/platform/rockchip/rkvdec/Makefile   |   1 +
 .../rockchip/rkvdec/rkvdec-hevc-common.c      | 206 +++++++++++++++++
 .../rockchip/rkvdec/rkvdec-hevc-common.h      |  49 ++++
 .../platform/rockchip/rkvdec/rkvdec-hevc.c    | 217 +-----------------
 4 files changed, 263 insertions(+), 210 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h

diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
index d2ba7a7c15e59..1b4bc44be23ee 100644
--- a/drivers/media/platform/rockchip/rkvdec/Makefile
+++ b/drivers/media/platform/rockchip/rkvdec/Makefile
@@ -6,4 +6,5 @@ rockchip-vdec-y += \
 		   rkvdec-h264.o \
 		   rkvdec-h264-common.o \
 		   rkvdec-hevc.o \
+		   rkvdec-hevc-common.o \
 		   rkvdec-vp9.o
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
new file mode 100644
index 0000000000000..cb56a9a243927
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.c
@@ -0,0 +1,206 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip video decoder hevc common functions
+ *
+ * Copyright (C) 2025 Collabora, Ltd.
+ *      Detlev Casanova <detlev.casanova@collabora.com>
+ *
+ * Copyright (C) 2023 Collabora, Ltd.
+ *      Sebastian Fricke <sebastian.fricke@collabora.com>
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ *
+ * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
+ *	Jeffy Chen <jeffy.chen@rock-chips.com>
+ */
+
+#include <linux/v4l2-common.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "rkvdec.h"
+#include "rkvdec-hevc-common.h"
+
+/*
+ * Flip one or more matrices along their main diagonal and flatten them
+ * before writing it to the memory.
+ * Convert:
+ * ABCD         AEIM
+ * EFGH     =>  BFJN     =>     AEIMBFJNCGKODHLP
+ * IJKL         CGKO
+ * MNOP         DHLP
+ */
+static void transpose_and_flatten_matrices(u8 *output, const u8 *input,
+					   int matrices, int row_length)
+{
+	int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_size, new_value;
+
+	matrix_size = row_length * row_length;
+	for (i = 0; i < matrices; i++) {
+		row = 0;
+		x_offset = 0;
+		matrix_offset = i * matrix_size;
+		for (j = 0; j < matrix_size; j++) {
+			y_offset = j - (row * row_length);
+			rot_index = y_offset * row_length + x_offset;
+			new_value = *(input + i * matrix_size + j);
+			output[matrix_offset + rot_index] = new_value;
+			if ((j + 1) % row_length == 0) {
+				row += 1;
+				x_offset += 1;
+			}
+		}
+	}
+}
+
+static void assemble_scalingfactor0(u8 *output, const struct v4l2_ctrl_hevc_scaling_matrix *input)
+{
+	int offset = 0;
+
+	transpose_and_flatten_matrices(output, (const u8 *)input->scaling_list_4x4, 6, 4);
+	offset = 6 * 16 * sizeof(u8);
+	transpose_and_flatten_matrices(output + offset, (const u8 *)input->scaling_list_8x8, 6, 8);
+	offset += 6 * 64 * sizeof(u8);
+	transpose_and_flatten_matrices(output + offset,
+				       (const u8 *)input->scaling_list_16x16, 6, 8);
+	offset += 6 * 64 * sizeof(u8);
+	/* Add a 128 byte padding with 0s between the two 32x32 matrices */
+	transpose_and_flatten_matrices(output + offset,
+				       (const u8 *)input->scaling_list_32x32, 1, 8);
+	offset += 64 * sizeof(u8);
+	memset(output + offset, 0, 128);
+	offset += 128 * sizeof(u8);
+	transpose_and_flatten_matrices(output + offset,
+				       (const u8 *)input->scaling_list_32x32 + (64 * sizeof(u8)),
+				       1, 8);
+	offset += 64 * sizeof(u8);
+	memset(output + offset, 0, 128);
+}
+
+/*
+ * Required layout:
+ * A = scaling_list_dc_coef_16x16
+ * B = scaling_list_dc_coef_32x32
+ * 0 = Padding
+ *
+ * A, A, A, A, A, A, B, 0, 0, B, 0, 0
+ */
+static void assemble_scalingdc(u8 *output, const struct v4l2_ctrl_hevc_scaling_matrix *input)
+{
+	u8 list_32x32[6] = {0};
+
+	memcpy(output, input->scaling_list_dc_coef_16x16, 6 * sizeof(u8));
+	list_32x32[0] = input->scaling_list_dc_coef_32x32[0];
+	list_32x32[3] = input->scaling_list_dc_coef_32x32[1];
+	memcpy(output + 6 * sizeof(u8), list_32x32, 6 * sizeof(u8));
+}
+
+static void translate_scaling_list(struct scaling_factor *output,
+				   const struct v4l2_ctrl_hevc_scaling_matrix *input)
+{
+	assemble_scalingfactor0(output->scalingfactor0, input);
+	memcpy(output->scalingfactor1, (const u8 *)input->scaling_list_4x4, 96);
+	assemble_scalingdc(output->scalingdc, input);
+	memset(output->reserved, 0, 4 * sizeof(u8));
+}
+
+void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
+					  struct scaling_factor *scaling_factor,
+					  struct v4l2_ctrl_hevc_scaling_matrix *cache)
+{
+	const struct v4l2_ctrl_hevc_scaling_matrix *scaling = run->scaling_matrix;
+
+	if (!memcmp(cache, scaling,
+		    sizeof(struct v4l2_ctrl_hevc_scaling_matrix)))
+		return;
+
+	translate_scaling_list(scaling_factor, scaling);
+
+	memcpy(cache, scaling,
+	       sizeof(struct v4l2_ctrl_hevc_scaling_matrix));
+}
+
+struct vb2_buffer *
+get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run,
+	    unsigned int dpb_idx)
+{
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	const struct v4l2_ctrl_hevc_decode_params *decode_params = run->decode_params;
+	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
+	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
+	struct vb2_buffer *buf = NULL;
+
+	if (dpb_idx < decode_params->num_active_dpb_entries)
+		buf = vb2_find_buffer(cap_q, dpb[dpb_idx].timestamp);
+
+	/*
+	 * If a DPB entry is unused or invalid, the address of current destination
+	 * buffer is returned.
+	 */
+	if (!buf)
+		return &run->base.bufs.dst->vb2_buf;
+
+	return buf;
+}
+
+#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
+
+int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
+
+	fmt->num_planes = 1;
+	if (!fmt->plane_fmt[0].sizeimage)
+		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
+					      RKVDEC_HEVC_MAX_DEPTH_IN_BYTES;
+	return 0;
+}
+
+enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
+						struct v4l2_ctrl *ctrl)
+{
+	const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
+
+	if (ctrl->id != V4L2_CID_STATELESS_HEVC_SPS)
+		return RKVDEC_IMG_FMT_ANY;
+
+	if (sps->bit_depth_luma_minus8 == 0) {
+		if (sps->chroma_format_idc == 2)
+			return RKVDEC_IMG_FMT_422_8BIT;
+		else
+			return RKVDEC_IMG_FMT_420_8BIT;
+	} else if (sps->bit_depth_luma_minus8 == 2) {
+		if (sps->chroma_format_idc == 2)
+			return RKVDEC_IMG_FMT_422_10BIT;
+		else
+			return RKVDEC_IMG_FMT_420_10BIT;
+	}
+
+	return RKVDEC_IMG_FMT_ANY;
+}
+
+
+void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
+			      struct rkvdec_hevc_run *run)
+{
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
+	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_SLICE_PARAMS);
+	run->slices_params = ctrl ? ctrl->p_cur.p : NULL;
+	run->num_slices = ctrl ? ctrl->new_elems : 0;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_SPS);
+	run->sps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_PPS);
+	run->pps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
+	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
+
+	rkvdec_run_preamble(ctx, &run->base);
+}
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
new file mode 100644
index 0000000000000..e3099fdd784b1
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc-common.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip video decoder hevc common functions
+ *
+ * Copyright (C) 2025 Collabora, Ltd.
+ *      Detlev Casanova <detlev.casanova@collabora.com>
+ *
+ * Copyright (C) 2023 Collabora, Ltd.
+ *      Sebastian Fricke <sebastian.fricke@collabora.com>
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ *
+ * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
+ *	Jeffy Chen <jeffy.chen@rock-chips.com>
+ */
+
+#include <media/v4l2-mem2mem.h>
+#include "rkvdec.h"
+
+#define RKV_HEVC_CABAC_TABLE_SIZE		27456
+extern const u8 rkvdec_hevc_cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
+
+struct rkvdec_hevc_run {
+	struct rkvdec_run base;
+	const struct v4l2_ctrl_hevc_slice_params *slices_params;
+	const struct v4l2_ctrl_hevc_decode_params *decode_params;
+	const struct v4l2_ctrl_hevc_sps *sps;
+	const struct v4l2_ctrl_hevc_pps *pps;
+	const struct v4l2_ctrl_hevc_scaling_matrix *scaling_matrix;
+	int num_slices;
+};
+
+struct scaling_factor {
+	u8 scalingfactor0[1248];
+	u8 scalingfactor1[96];	/*4X4 TU Rotate, total 16X4*/
+	u8 scalingdc[12];	/*N1005 Vienna Meeting*/
+	u8 reserved[4];		/*16Bytes align*/
+};
+
+void rkvdec_hevc_assemble_hw_scaling_list(struct rkvdec_hevc_run *run,
+					  struct scaling_factor *scaling_factor,
+					  struct v4l2_ctrl_hevc_scaling_matrix *cache);
+struct vb2_buffer *get_ref_buf(struct rkvdec_ctx *ctx,
+			       struct rkvdec_hevc_run *run,
+			       unsigned int dpb_idx);
+int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f);
+enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
+void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
index dfadb9a13c9a8..156ce381f0680 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-hevc.c
@@ -16,6 +16,7 @@
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
+#include "rkvdec-hevc-common.h"
 
 /* Size in u8/u32 units. */
 #define RKV_SCALING_LIST_SIZE		1360
@@ -24,9 +25,6 @@
 #define RKV_RPS_SIZE			(32 / 4)
 #define RKV_RPS_LEN			600
 
-#define RKV_HEVC_CABAC_TABLE_SIZE		27456
-extern const u8 rkvdec_hevc_cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
-
 struct rkvdec_sps_pps_packet {
 	u32 info[RKV_PPS_SIZE];
 };
@@ -113,34 +111,17 @@ struct rkvdec_ps_field {
 /* Data structure describing auxiliary buffer format. */
 struct rkvdec_hevc_priv_tbl {
 	u8 cabac_table[RKV_HEVC_CABAC_TABLE_SIZE];
-	u8 scaling_list[RKV_SCALING_LIST_SIZE];
+	struct scaling_factor scaling_list;
 	struct rkvdec_sps_pps_packet param_set[RKV_PPS_LEN];
 	struct rkvdec_rps_packet rps[RKV_RPS_LEN];
 };
 
-struct rkvdec_hevc_run {
-	struct rkvdec_run base;
-	const struct v4l2_ctrl_hevc_slice_params *slices_params;
-	const struct v4l2_ctrl_hevc_decode_params *decode_params;
-	const struct v4l2_ctrl_hevc_sps *sps;
-	const struct v4l2_ctrl_hevc_pps *pps;
-	const struct v4l2_ctrl_hevc_scaling_matrix *scaling_matrix;
-	int num_slices;
-};
-
 struct rkvdec_hevc_ctx {
 	struct rkvdec_aux_buf priv_tbl;
 	struct v4l2_ctrl_hevc_scaling_matrix scaling_matrix_cache;
 	struct rkvdec_regs regs;
 };
 
-struct scaling_factor {
-	u8 scalingfactor0[1248];
-	u8 scalingfactor1[96];		/*4X4 TU Rotate, total 16X4*/
-	u8 scalingdc[12];		/*N1005 Vienna Meeting*/
-	u8 reserved[4];		/*16Bytes align*/
-};
-
 static void set_ps_field(u32 *buf, struct rkvdec_ps_field field, u32 value)
 {
 	u8 bit = field.offset % 32, word = field.offset / 32;
@@ -417,131 +398,6 @@ static void assemble_sw_rps(struct rkvdec_ctx *ctx,
 	}
 }
 
-/*
- * Flip one or more matrices along their main diagonal and flatten them
- * before writing it to the memory.
- * Convert:
- * ABCD         AEIM
- * EFGH     =>  BFJN     =>     AEIMBFJNCGKODHLP
- * IJKL         CGKO
- * MNOP         DHLP
- */
-static void transpose_and_flatten_matrices(u8 *output, const u8 *input,
-					   int matrices, int row_length)
-{
-	int i, j, row, x_offset, matrix_offset, rot_index, y_offset, matrix_size, new_value;
-
-	matrix_size = row_length * row_length;
-	for (i = 0; i < matrices; i++) {
-		row = 0;
-		x_offset = 0;
-		matrix_offset = i * matrix_size;
-		for (j = 0; j < matrix_size; j++) {
-			y_offset = j - (row * row_length);
-			rot_index = y_offset * row_length + x_offset;
-			new_value = *(input + i * matrix_size + j);
-			output[matrix_offset + rot_index] = new_value;
-			if ((j + 1) % row_length == 0) {
-				row += 1;
-				x_offset += 1;
-			}
-		}
-	}
-}
-
-static void assemble_scalingfactor0(u8 *output, const struct v4l2_ctrl_hevc_scaling_matrix *input)
-{
-	int offset = 0;
-
-	transpose_and_flatten_matrices(output, (const u8 *)input->scaling_list_4x4, 6, 4);
-	offset = 6 * 16 * sizeof(u8);
-	transpose_and_flatten_matrices(output + offset, (const u8 *)input->scaling_list_8x8, 6, 8);
-	offset += 6 * 64 * sizeof(u8);
-	transpose_and_flatten_matrices(output + offset,
-				       (const u8 *)input->scaling_list_16x16, 6, 8);
-	offset += 6 * 64 * sizeof(u8);
-	/* Add a 128 byte padding with 0s between the two 32x32 matrices */
-	transpose_and_flatten_matrices(output + offset,
-				       (const u8 *)input->scaling_list_32x32, 1, 8);
-	offset += 64 * sizeof(u8);
-	memset(output + offset, 0, 128);
-	offset += 128 * sizeof(u8);
-	transpose_and_flatten_matrices(output + offset,
-				       (const u8 *)input->scaling_list_32x32 + (64 * sizeof(u8)),
-				       1, 8);
-	offset += 64 * sizeof(u8);
-	memset(output + offset, 0, 128);
-}
-
-/*
- * Required layout:
- * A = scaling_list_dc_coef_16x16
- * B = scaling_list_dc_coef_32x32
- * 0 = Padding
- *
- * A, A, A, A, A, A, B, 0, 0, B, 0, 0
- */
-static void assemble_scalingdc(u8 *output, const struct v4l2_ctrl_hevc_scaling_matrix *input)
-{
-	u8 list_32x32[6] = {0};
-
-	memcpy(output, input->scaling_list_dc_coef_16x16, 6 * sizeof(u8));
-	list_32x32[0] = input->scaling_list_dc_coef_32x32[0];
-	list_32x32[3] = input->scaling_list_dc_coef_32x32[1];
-	memcpy(output + 6 * sizeof(u8), list_32x32, 6 * sizeof(u8));
-}
-
-static void translate_scaling_list(struct scaling_factor *output,
-				   const struct v4l2_ctrl_hevc_scaling_matrix *input)
-{
-	assemble_scalingfactor0(output->scalingfactor0, input);
-	memcpy(output->scalingfactor1, (const u8 *)input->scaling_list_4x4, 96);
-	assemble_scalingdc(output->scalingdc, input);
-	memset(output->reserved, 0, 4 * sizeof(u8));
-}
-
-static void assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
-				     struct rkvdec_hevc_run *run)
-{
-	const struct v4l2_ctrl_hevc_scaling_matrix *scaling = run->scaling_matrix;
-	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
-	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
-	u8 *dst;
-
-	if (!memcmp((void *)&hevc_ctx->scaling_matrix_cache, scaling,
-		    sizeof(struct v4l2_ctrl_hevc_scaling_matrix)))
-		return;
-
-	dst = tbl->scaling_list;
-	translate_scaling_list((struct scaling_factor *)dst, scaling);
-
-	memcpy((void *)&hevc_ctx->scaling_matrix_cache, scaling,
-	       sizeof(struct v4l2_ctrl_hevc_scaling_matrix));
-}
-
-static struct vb2_buffer *
-get_ref_buf(struct rkvdec_ctx *ctx, struct rkvdec_hevc_run *run,
-	    unsigned int dpb_idx)
-{
-	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
-	const struct v4l2_ctrl_hevc_decode_params *decode_params = run->decode_params;
-	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
-	struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
-	struct vb2_buffer *buf = NULL;
-
-	if (dpb_idx < decode_params->num_active_dpb_entries)
-		buf = vb2_find_buffer(cap_q, dpb[dpb_idx].timestamp);
-
-	/*
-	 * If a DPB entry is unused or invalid, the address of current destination
-	 * buffer is returned.
-	 */
-	if (!buf)
-		return &run->base.bufs.dst->vb2_buf;
-
-	return buf;
-}
-
 static void config_registers(struct rkvdec_ctx *ctx,
 			     struct rkvdec_hevc_run *run)
 {
@@ -645,43 +501,6 @@ static void config_registers(struct rkvdec_ctx *ctx,
 			   MIN(sizeof(*regs), sizeof(u32) * rkvdec->variant->num_regs));
 }
 
-#define RKVDEC_HEVC_MAX_DEPTH_IN_BYTES		2
-
-static int rkvdec_hevc_adjust_fmt(struct rkvdec_ctx *ctx,
-				  struct v4l2_format *f)
-{
-	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
-
-	fmt->num_planes = 1;
-	if (!fmt->plane_fmt[0].sizeimage)
-		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
-					      RKVDEC_HEVC_MAX_DEPTH_IN_BYTES;
-	return 0;
-}
-
-static enum rkvdec_image_fmt rkvdec_hevc_get_image_fmt(struct rkvdec_ctx *ctx,
-						       struct v4l2_ctrl *ctrl)
-{
-	const struct v4l2_ctrl_hevc_sps *sps = ctrl->p_new.p_hevc_sps;
-
-	if (ctrl->id != V4L2_CID_STATELESS_HEVC_SPS)
-		return RKVDEC_IMG_FMT_ANY;
-
-	if (sps->bit_depth_luma_minus8 == 0) {
-		if (sps->chroma_format_idc == 2)
-			return RKVDEC_IMG_FMT_422_8BIT;
-		else
-			return RKVDEC_IMG_FMT_420_8BIT;
-	} else if (sps->bit_depth_luma_minus8 == 2) {
-		if (sps->chroma_format_idc == 2)
-			return RKVDEC_IMG_FMT_422_10BIT;
-		else
-			return RKVDEC_IMG_FMT_420_10BIT;
-	}
-
-	return RKVDEC_IMG_FMT_ANY;
-}
-
 static int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx,
 				    const struct v4l2_ctrl_hevc_sps *sps)
 {
@@ -692,7 +511,7 @@ static int rkvdec_hevc_validate_sps(struct rkvdec_ctx *ctx,
 		/* Luma and chroma bit depth mismatch */
 		return -EINVAL;
 	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
-		/* Only 8-bit and 10-bit is supported */
+		/* Only 8-bit and 10-bit are supported */
 		return -EINVAL;
 
 	if (sps->pic_width_in_luma_samples > ctx->coded_fmt.fmt.pix_mp.width ||
@@ -738,40 +557,18 @@ static void rkvdec_hevc_stop(struct rkvdec_ctx *ctx)
 	kfree(hevc_ctx);
 }
 
-static void rkvdec_hevc_run_preamble(struct rkvdec_ctx *ctx,
-				     struct rkvdec_hevc_run *run)
-{
-	struct v4l2_ctrl *ctrl;
-
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_HEVC_DECODE_PARAMS);
-	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_HEVC_SLICE_PARAMS);
-	run->slices_params = ctrl ? ctrl->p_cur.p : NULL;
-	run->num_slices = ctrl ? ctrl->new_elems : 0;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_HEVC_SPS);
-	run->sps = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_HEVC_PPS);
-	run->pps = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_HEVC_SCALING_MATRIX);
-	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
-
-	rkvdec_run_preamble(ctx, &run->base);
-}
-
 static int rkvdec_hevc_run(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_hevc_run run;
+	struct rkvdec_hevc_ctx *hevc_ctx = ctx->priv;
+	struct rkvdec_hevc_priv_tbl *tbl = hevc_ctx->priv_tbl.cpu;
 	u32 reg;
 
 	rkvdec_hevc_run_preamble(ctx, &run);
 
-	assemble_hw_scaling_list(ctx, &run);
+	rkvdec_hevc_assemble_hw_scaling_list(&run, &tbl->scaling_list,
+					     &hevc_ctx->scaling_matrix_cache);
 	assemble_hw_pps(ctx, &run);
 	assemble_sw_rps(ctx, &run);
 	config_registers(ctx, &run);
-- 
2.52.0


