Return-Path: <linux-media+bounces-49107-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 740F6CCDF30
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 00:32:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE50B302B113
	for <lists+linux-media@lfdr.de>; Thu, 18 Dec 2025 23:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78E427CB0A;
	Thu, 18 Dec 2025 23:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qXA3tmkT"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892B6299A90;
	Thu, 18 Dec 2025 23:28:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766100538; cv=none; b=p78mZ0i6bIqbg+CyOZiOu+U96ppcmfLoAIot6PcsNsAlwNziyHRMb46sCRhDsmxZOxhDW2+1zLgP3sR/puUbeYB+JGP21E8BVbXdhSle5U45261/ivZlM/li0uVe1jCZ35z6vyaGKElYX6HShNKTdSSovMWeLAvAemjKNdXhrx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766100538; c=relaxed/simple;
	bh=5Q+wqiRn/AlnjwK0Ia9EZOs6BfJzHW45SrcKHzwtE+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CeVtDCGX6ctYLOtCpPxfwrTwA7/wo6mBcoIkPSJawQwD8eHBMrtm+ulSYU1aRp4GXy9ceoZk3uiBXbZwHnpAVxCqtakDKpo7/OvZJtJVL8RVfCzLed0DEYv1Xrmto7JhaEa4IQLYn3CYaJGJoPoecQpur8lZJbrEVRsmPOoE+08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qXA3tmkT; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766100532;
	bh=5Q+wqiRn/AlnjwK0Ia9EZOs6BfJzHW45SrcKHzwtE+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qXA3tmkTKkbdKGPCjA3OA5ddZghimO8JiU8vhnd92u87/lRPb0ETQp4FbzgZTNsFd
	 hkqIxduKH8vDYChMthiUy28DKc7Ib6ouIHJuqgRKzDOdt+uLq4BVeJ6qVN7F+PmeUe
	 N36/6THI/6EqviPjd5Mo9W+kz+gW4pjjOTAL3O9UUJV6ZHcw92H1YuTKdvuIgx3fyD
	 tmvFUVVeHpEVjEv0z+XAWWpdYPvHjHBFo/Yh05MzzSTwD4V6qs2oX+Wz3EL0P+xIwF
	 WwD6d/UzYexwoPBxux7guYb2olu1bg4V3ty0+De851GrdwXhBILFkGnddoSSJe5dw5
	 FQdasp/Ge1mgQ==
Received: from earth.mtl.collabora.ca (mtl.collabora.ca [66.171.169.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DED917E12D6;
	Fri, 19 Dec 2025 00:28:50 +0100 (CET)
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
Subject: [PATCH v7 07/17] media: rkvdec: Move h264 functions to common file
Date: Thu, 18 Dec 2025 18:28:17 -0500
Message-ID: <20251218232829.337811-8-detlev.casanova@collabora.com>
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
 .../rockchip/rkvdec/rkvdec-h264-common.c      | 258 +++++++++++++++
 .../rockchip/rkvdec/rkvdec-h264-common.h      |  87 +++++
 .../platform/rockchip/rkvdec/rkvdec-h264.c    | 310 +-----------------
 4 files changed, 350 insertions(+), 306 deletions(-)
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
 create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h

diff --git a/drivers/media/platform/rockchip/rkvdec/Makefile b/drivers/media/platform/rockchip/rkvdec/Makefile
index a8ff5e3d7bec3..d2ba7a7c15e59 100644
--- a/drivers/media/platform/rockchip/rkvdec/Makefile
+++ b/drivers/media/platform/rockchip/rkvdec/Makefile
@@ -4,5 +4,6 @@ rockchip-vdec-y += \
 		   rkvdec.o \
 		   rkvdec-cabac.o \
 		   rkvdec-h264.o \
+		   rkvdec-h264-common.o \
 		   rkvdec-hevc.o \
 		   rkvdec-vp9.o
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
new file mode 100644
index 0000000000000..e28f063944705
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.c
@@ -0,0 +1,258 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip video decoder h264 common functions
+ *
+ * Copyright (C) 2025 Collabora, Ltd.
+ *	Detlev Casanova <detlev.casanova@collabora.com>
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ *
+ * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
+ *	Jeffy Chen <jeffy.chen@rock-chips.com>
+ */
+
+#include <linux/v4l2-common.h>
+#include <media/v4l2-h264.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "rkvdec.h"
+#include "rkvdec-h264-common.h"
+
+#define RKVDEC_NUM_REFLIST		3
+
+static void set_dpb_info(struct rkvdec_rps_entry *entries,
+			 u8 reflist,
+			 u8 refnum,
+			 u8 info,
+			 bool bottom)
+{
+	struct rkvdec_rps_entry *entry = &entries[(reflist * 4) + refnum / 8];
+	u8 idx = refnum % 8;
+
+	switch (idx) {
+	case 0:
+		entry->dpb_info0 = info;
+		entry->bottom_flag0 = bottom;
+		break;
+	case 1:
+		entry->dpb_info1 = info;
+		entry->bottom_flag1 = bottom;
+		break;
+	case 2:
+		entry->dpb_info2 = info;
+		entry->bottom_flag2 = bottom;
+		break;
+	case 3:
+		entry->dpb_info3 = info;
+		entry->bottom_flag3 = bottom;
+		break;
+	case 4:
+		entry->dpb_info4 = info;
+		entry->bottom_flag4 = bottom;
+		break;
+	case 5:
+		entry->dpb_info5 = info;
+		entry->bottom_flag5 = bottom;
+		break;
+	case 6:
+		entry->dpb_info6 = info;
+		entry->bottom_flag6 = bottom;
+		break;
+	case 7:
+		entry->dpb_info7 = info;
+		entry->bottom_flag7 = bottom;
+		break;
+	}
+}
+
+void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
+			struct rkvdec_h264_run *run)
+{
+	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
+		struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+		const struct v4l2_h264_dpb_entry *dpb = run->decode_params->dpb;
+		struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
+		struct vb2_buffer *buf = NULL;
+
+		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE) {
+			buf = vb2_find_buffer(cap_q, dpb[i].reference_ts);
+			if (!buf)
+				pr_debug("No buffer for reference_ts %llu",
+					 dpb[i].reference_ts);
+		}
+
+		run->ref_buf[i] = buf;
+	}
+}
+
+void assemble_hw_rps(struct v4l2_h264_reflist_builder *builder,
+		     struct rkvdec_h264_run *run,
+		     struct rkvdec_h264_reflists *reflists,
+		     struct rkvdec_rps *hw_rps)
+{
+	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
+	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
+
+	u32 i, j;
+
+	memset(hw_rps, 0, sizeof(*hw_rps));
+
+	/*
+	 * Assign an invalid pic_num if DPB entry at that position is inactive.
+	 * If we assign 0 in that position hardware will treat that as a real
+	 * reference picture with pic_num 0, triggering output picture
+	 * corruption.
+	 */
+	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
+		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
+			continue;
+
+		hw_rps->frame_num[i] = builder->refs[i].frame_num;
+	}
+
+	for (j = 0; j < RKVDEC_NUM_REFLIST; j++) {
+		for (i = 0; i < builder->num_valid; i++) {
+			struct v4l2_h264_reference *ref;
+			bool dpb_valid;
+			bool bottom;
+
+			switch (j) {
+			case 0:
+				ref = &reflists->p[i];
+				break;
+			case 1:
+				ref = &reflists->b0[i];
+				break;
+			case 2:
+				ref = &reflists->b1[i];
+				break;
+			}
+
+			if (WARN_ON(ref->index >= ARRAY_SIZE(dec_params->dpb)))
+				continue;
+
+			dpb_valid = !!(run->ref_buf[ref->index]);
+			bottom = ref->fields == V4L2_H264_BOTTOM_FIELD_REF;
+
+			set_dpb_info(hw_rps->entries, j, i, ref->index | (dpb_valid << 4), bottom);
+		}
+	}
+}
+
+void assemble_hw_scaling_list(struct rkvdec_h264_run *run,
+			      struct rkvdec_h264_scaling_list *scaling_list)
+{
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling = run->scaling_matrix;
+	const struct v4l2_ctrl_h264_pps *pps = run->pps;
+
+	if (!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
+		return;
+
+	BUILD_BUG_ON(sizeof(scaling_list->scaling_list_4x4) !=
+		     sizeof(scaling->scaling_list_4x4));
+	BUILD_BUG_ON(sizeof(scaling_list->scaling_list_8x8) !=
+		     sizeof(scaling->scaling_list_8x8));
+
+	memcpy(scaling_list->scaling_list_4x4,
+	       scaling->scaling_list_4x4,
+	       sizeof(scaling->scaling_list_4x4));
+
+	memcpy(scaling_list->scaling_list_8x8,
+	       scaling->scaling_list_8x8,
+	       sizeof(scaling->scaling_list_8x8));
+}
+
+#define RKVDEC_H264_MAX_DEPTH_IN_BYTES		2
+
+int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
+			   struct v4l2_format *f)
+{
+	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
+
+	fmt->num_planes = 1;
+	if (!fmt->plane_fmt[0].sizeimage)
+		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
+					      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
+	return 0;
+}
+
+enum rkvdec_image_fmt rkvdec_h264_get_image_fmt(struct rkvdec_ctx *ctx,
+						struct v4l2_ctrl *ctrl)
+{
+	const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
+
+	if (ctrl->id != V4L2_CID_STATELESS_H264_SPS)
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
+int rkvdec_h264_validate_sps(struct rkvdec_ctx *ctx,
+			     const struct v4l2_ctrl_h264_sps *sps)
+{
+	unsigned int width, height;
+
+	if (sps->chroma_format_idc > 2)
+		/* Only 4:0:0, 4:2:0 and 4:2:2 are supported */
+		return -EINVAL;
+	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
+		/* Luma and chroma bit depth mismatch */
+		return -EINVAL;
+	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
+		/* Only 8-bit and 10-bit is supported */
+		return -EINVAL;
+
+	width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
+	height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
+
+	/*
+	 * When frame_mbs_only_flag is not set, this is field height,
+	 * which is half the final height (see (7-18) in the
+	 * specification)
+	 */
+	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
+		height *= 2;
+
+	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
+	    height > ctx->coded_fmt.fmt.pix_mp.height)
+		return -EINVAL;
+
+	return 0;
+}
+
+void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
+			      struct rkvdec_h264_run *run)
+{
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_H264_DECODE_PARAMS);
+	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_H264_SPS);
+	run->sps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_H264_PPS);
+	run->pps = ctrl ? ctrl->p_cur.p : NULL;
+	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
+			      V4L2_CID_STATELESS_H264_SCALING_MATRIX);
+	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
+
+	rkvdec_run_preamble(ctx, &run->base);
+}
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
new file mode 100644
index 0000000000000..bd0c0081365b1
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264-common.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Rockchip video decoder h264 common functions
+ *
+ * Copyright (C) 2025 Collabora, Ltd.
+ *	Detlev Casanova <detlev.casanova@collabora.com>
+ *
+ * Copyright (C) 2019 Collabora, Ltd.
+ *	Boris Brezillon <boris.brezillon@collabora.com>
+ *
+ * Copyright (C) 2016 Rockchip Electronics Co., Ltd.
+ *	Jeffy Chen <jeffy.chen@rock-chips.com>
+ */
+
+#include <media/v4l2-h264.h>
+#include <media/v4l2-mem2mem.h>
+
+#include "rkvdec.h"
+
+extern const s8 rkvdec_h264_cabac_table[4][464][2];
+
+struct rkvdec_h264_scaling_list {
+	u8 scaling_list_4x4[6][16];
+	u8 scaling_list_8x8[6][64];
+	u8 padding[128];
+};
+
+struct rkvdec_h264_reflists {
+	struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
+	struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
+	struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
+};
+
+struct rkvdec_h264_run {
+	struct rkvdec_run base;
+	const struct v4l2_ctrl_h264_decode_params *decode_params;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
+	struct vb2_buffer *ref_buf[V4L2_H264_NUM_DPB_ENTRIES];
+};
+
+struct rkvdec_rps_entry {
+	u32 dpb_info0:          5;
+	u32 bottom_flag0:       1;
+	u32 view_index_off0:    1;
+	u32 dpb_info1:          5;
+	u32 bottom_flag1:       1;
+	u32 view_index_off1:    1;
+	u32 dpb_info2:          5;
+	u32 bottom_flag2:       1;
+	u32 view_index_off2:    1;
+	u32 dpb_info3:          5;
+	u32 bottom_flag3:       1;
+	u32 view_index_off3:    1;
+	u32 dpb_info4:          5;
+	u32 bottom_flag4:       1;
+	u32 view_index_off4:    1;
+	u32 dpb_info5:          5;
+	u32 bottom_flag5:       1;
+	u32 view_index_off5:    1;
+	u32 dpb_info6:          5;
+	u32 bottom_flag6:       1;
+	u32 view_index_off6:    1;
+	u32 dpb_info7:          5;
+	u32 bottom_flag7:       1;
+	u32 view_index_off7:    1;
+} __packed;
+
+struct rkvdec_rps {
+	u16 frame_num[16];
+	u32 reserved0;
+	struct rkvdec_rps_entry entries[12];
+	u32 reserved1[66];
+} __packed;
+
+void lookup_ref_buf_idx(struct rkvdec_ctx *ctx, struct rkvdec_h264_run *run);
+void assemble_hw_rps(struct v4l2_h264_reflist_builder *builder,
+		     struct rkvdec_h264_run *run,
+		     struct rkvdec_h264_reflists *reflists,
+		     struct rkvdec_rps *hw_rps);
+void assemble_hw_scaling_list(struct rkvdec_h264_run *run,
+			      struct rkvdec_h264_scaling_list *scaling_list);
+int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx, struct v4l2_format *f);
+enum rkvdec_image_fmt rkvdec_h264_get_image_fmt(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
+int rkvdec_h264_validate_sps(struct rkvdec_ctx *ctx, const struct v4l2_ctrl_h264_sps *sps);
+void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx, struct rkvdec_h264_run *run);
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
index fd941e9262796..d93c7953692d6 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-h264.c
@@ -14,59 +14,16 @@
 
 #include "rkvdec.h"
 #include "rkvdec-regs.h"
-
-extern const s8 rkvdec_h264_cabac_table[4][464][2];
+#include "rkvdec-h264-common.h"
 
 /* Size with u32 units. */
 #define RKV_CABAC_INIT_BUFFER_SIZE	(3680 + 128)
 #define RKV_ERROR_INFO_SIZE		(256 * 144 * 4)
 
-#define RKVDEC_NUM_REFLIST		3
-
-struct rkvdec_h264_scaling_list {
-	u8 scaling_list_4x4[6][16];
-	u8 scaling_list_8x8[6][64];
-	u8 padding[128];
-};
-
 struct rkvdec_sps_pps_packet {
 	u32 info[8];
 };
 
-struct rkvdec_rps_entry {
-	u32 dpb_info0:          5;
-	u32 bottom_flag0:       1;
-	u32 view_index_off0:    1;
-	u32 dpb_info1:          5;
-	u32 bottom_flag1:       1;
-	u32 view_index_off1:    1;
-	u32 dpb_info2:          5;
-	u32 bottom_flag2:       1;
-	u32 view_index_off2:    1;
-	u32 dpb_info3:          5;
-	u32 bottom_flag3:       1;
-	u32 view_index_off3:    1;
-	u32 dpb_info4:          5;
-	u32 bottom_flag4:       1;
-	u32 view_index_off4:    1;
-	u32 dpb_info5:          5;
-	u32 bottom_flag5:       1;
-	u32 view_index_off5:    1;
-	u32 dpb_info6:          5;
-	u32 bottom_flag6:       1;
-	u32 view_index_off6:    1;
-	u32 dpb_info7:          5;
-	u32 bottom_flag7:       1;
-	u32 view_index_off7:    1;
-} __packed;
-
-struct rkvdec_rps {
-	u16 frame_num[16];
-	u32 reserved0;
-	struct rkvdec_rps_entry entries[12];
-	u32 reserved1[66];
-} __packed;
-
 struct rkvdec_ps_field {
 	u16 offset;
 	u8 len;
@@ -118,11 +75,6 @@ struct rkvdec_ps_field {
 #define SCALING_LIST_ADDRESS				PS_FIELD(184, 32)
 #define IS_LONG_TERM(i)				PS_FIELD(216 + (i), 1)
 
-#define DPB_OFFS(i, j)					(288 + ((j) * 32 * 7) + ((i) * 7))
-#define DPB_INFO(i, j)					PS_FIELD(DPB_OFFS(i, j), 5)
-#define BOTTOM_FLAG(i, j)				PS_FIELD(DPB_OFFS(i, j) + 5, 1)
-#define VIEW_INDEX_OFF(i, j)				PS_FIELD(DPB_OFFS(i, j) + 6, 1)
-
 /* Data structure describing auxiliary buffer format. */
 struct rkvdec_h264_priv_tbl {
 	s8 cabac_table[4][464][2];
@@ -132,21 +84,6 @@ struct rkvdec_h264_priv_tbl {
 	u8 err_info[RKV_ERROR_INFO_SIZE];
 };
 
-struct rkvdec_h264_reflists {
-	struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
-	struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
-	struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
-};
-
-struct rkvdec_h264_run {
-	struct rkvdec_run base;
-	const struct v4l2_ctrl_h264_decode_params *decode_params;
-	const struct v4l2_ctrl_h264_sps *sps;
-	const struct v4l2_ctrl_h264_pps *pps;
-	const struct v4l2_ctrl_h264_scaling_matrix *scaling_matrix;
-	struct vb2_buffer *ref_buf[V4L2_H264_NUM_DPB_ENTRIES];
-};
-
 struct rkvdec_h264_ctx {
 	struct rkvdec_aux_buf priv_tbl;
 	struct rkvdec_h264_reflists reflists;
@@ -270,155 +207,6 @@ static void assemble_hw_pps(struct rkvdec_ctx *ctx,
 	}
 }
 
-static void lookup_ref_buf_idx(struct rkvdec_ctx *ctx,
-			       struct rkvdec_h264_run *run)
-{
-	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
-	u32 i;
-
-	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
-		struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
-		const struct v4l2_h264_dpb_entry *dpb = run->decode_params->dpb;
-		struct vb2_queue *cap_q = &m2m_ctx->cap_q_ctx.q;
-		struct vb2_buffer *buf = NULL;
-
-		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE) {
-			buf = vb2_find_buffer(cap_q, dpb[i].reference_ts);
-			if (!buf)
-				pr_debug("No buffer for reference_ts %llu",
-					 dpb[i].reference_ts);
-		}
-
-		run->ref_buf[i] = buf;
-	}
-}
-
-static void set_dpb_info(struct rkvdec_rps_entry *entries,
-			 u8 reflist,
-			 u8 refnum,
-			 u8 info,
-			 bool bottom)
-{
-	struct rkvdec_rps_entry *entry = &entries[(reflist * 4) + refnum / 8];
-	u8 idx = refnum % 8;
-
-	switch (idx) {
-	case 0:
-		entry->dpb_info0 = info;
-		entry->bottom_flag0 = bottom;
-		break;
-	case 1:
-		entry->dpb_info1 = info;
-		entry->bottom_flag1 = bottom;
-		break;
-	case 2:
-		entry->dpb_info2 = info;
-		entry->bottom_flag2 = bottom;
-		break;
-	case 3:
-		entry->dpb_info3 = info;
-		entry->bottom_flag3 = bottom;
-		break;
-	case 4:
-		entry->dpb_info4 = info;
-		entry->bottom_flag4 = bottom;
-		break;
-	case 5:
-		entry->dpb_info5 = info;
-		entry->bottom_flag5 = bottom;
-		break;
-	case 6:
-		entry->dpb_info6 = info;
-		entry->bottom_flag6 = bottom;
-		break;
-	case 7:
-		entry->dpb_info7 = info;
-		entry->bottom_flag7 = bottom;
-		break;
-	}
-}
-
-static void assemble_hw_rps(struct rkvdec_ctx *ctx,
-			    struct v4l2_h264_reflist_builder *builder,
-			    struct rkvdec_h264_run *run)
-{
-	const struct v4l2_ctrl_h264_decode_params *dec_params = run->decode_params;
-	const struct v4l2_h264_dpb_entry *dpb = dec_params->dpb;
-	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
-	struct rkvdec_h264_priv_tbl *priv_tbl = h264_ctx->priv_tbl.cpu;
-
-	struct rkvdec_rps *hw_rps = &priv_tbl->rps;
-	u32 i, j;
-
-	memset(hw_rps, 0, sizeof(*hw_rps));
-
-	/*
-	 * Assign an invalid pic_num if DPB entry at that position is inactive.
-	 * If we assign 0 in that position hardware will treat that as a real
-	 * reference picture with pic_num 0, triggering output picture
-	 * corruption.
-	 */
-	for (i = 0; i < ARRAY_SIZE(dec_params->dpb); i++) {
-		if (!(dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_ACTIVE))
-			continue;
-
-		hw_rps->frame_num[i] = builder->refs[i].frame_num;
-	}
-
-	for (j = 0; j < RKVDEC_NUM_REFLIST; j++) {
-		for (i = 0; i < builder->num_valid; i++) {
-			struct v4l2_h264_reference *ref;
-			bool dpb_valid;
-			bool bottom;
-
-			switch (j) {
-			case 0:
-				ref = &h264_ctx->reflists.p[i];
-				break;
-			case 1:
-				ref = &h264_ctx->reflists.b0[i];
-				break;
-			case 2:
-				ref = &h264_ctx->reflists.b1[i];
-				break;
-			}
-
-			if (WARN_ON(ref->index >= ARRAY_SIZE(dec_params->dpb)))
-				continue;
-
-			dpb_valid = run->ref_buf[ref->index] != NULL;
-			bottom = ref->fields == V4L2_H264_BOTTOM_FIELD_REF;
-
-			set_dpb_info(hw_rps->entries, j, i, ref->index | (dpb_valid << 4), bottom);
-		}
-	}
-}
-
-static void assemble_hw_scaling_list(struct rkvdec_ctx *ctx,
-				     struct rkvdec_h264_run *run)
-{
-	const struct v4l2_ctrl_h264_scaling_matrix *scaling = run->scaling_matrix;
-	const struct v4l2_ctrl_h264_pps *pps = run->pps;
-	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
-	struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
-
-	if (!(pps->flags & V4L2_H264_PPS_FLAG_SCALING_MATRIX_PRESENT))
-		return;
-
-	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_4x4) !=
-		     sizeof(scaling->scaling_list_4x4));
-	BUILD_BUG_ON(sizeof(tbl->scaling_list.scaling_list_8x8) !=
-		     sizeof(scaling->scaling_list_8x8));
-
-	memcpy(tbl->scaling_list.scaling_list_4x4,
-	       scaling->scaling_list_4x4,
-	       sizeof(scaling->scaling_list_4x4));
-
-	memcpy(tbl->scaling_list.scaling_list_8x8,
-	       scaling->scaling_list_8x8,
-	       sizeof(scaling->scaling_list_8x8));
-}
-
 /*
  * Set the ref POC in the correct register.
  *
@@ -569,76 +357,6 @@ static void config_registers(struct rkvdec_ctx *ctx,
 			   MIN(sizeof(*regs), sizeof(u32) * rkvdec->variant->num_regs));
 }
 
-#define RKVDEC_H264_MAX_DEPTH_IN_BYTES		2
-
-static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
-				  struct v4l2_format *f)
-{
-	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
-
-	fmt->num_planes = 1;
-	if (!fmt->plane_fmt[0].sizeimage)
-		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
-					      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
-	return 0;
-}
-
-static enum rkvdec_image_fmt rkvdec_h264_get_image_fmt(struct rkvdec_ctx *ctx,
-						       struct v4l2_ctrl *ctrl)
-{
-	const struct v4l2_ctrl_h264_sps *sps = ctrl->p_new.p_h264_sps;
-
-	if (ctrl->id != V4L2_CID_STATELESS_H264_SPS)
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
-static int rkvdec_h264_validate_sps(struct rkvdec_ctx *ctx,
-				    const struct v4l2_ctrl_h264_sps *sps)
-{
-	unsigned int width, height;
-
-	if (sps->chroma_format_idc > 2)
-		/* Only 4:0:0, 4:2:0 and 4:2:2 are supported */
-		return -EINVAL;
-	if (sps->bit_depth_luma_minus8 != sps->bit_depth_chroma_minus8)
-		/* Luma and chroma bit depth mismatch */
-		return -EINVAL;
-	if (sps->bit_depth_luma_minus8 != 0 && sps->bit_depth_luma_minus8 != 2)
-		/* Only 8-bit and 10-bit is supported */
-		return -EINVAL;
-
-	width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
-	height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
-
-	/*
-	 * When frame_mbs_only_flag is not set, this is field height,
-	 * which is half the final height (see (7-18) in the
-	 * specification)
-	 */
-	if (!(sps->flags & V4L2_H264_SPS_FLAG_FRAME_MBS_ONLY))
-		height *= 2;
-
-	if (width > ctx->coded_fmt.fmt.pix_mp.width ||
-	    height > ctx->coded_fmt.fmt.pix_mp.height)
-		return -EINVAL;
-
-	return 0;
-}
-
 static int rkvdec_h264_start(struct rkvdec_ctx *ctx)
 {
 	struct rkvdec_dev *rkvdec = ctx->dev;
@@ -690,33 +408,13 @@ static void rkvdec_h264_stop(struct rkvdec_ctx *ctx)
 	kfree(h264_ctx);
 }
 
-static void rkvdec_h264_run_preamble(struct rkvdec_ctx *ctx,
-				     struct rkvdec_h264_run *run)
-{
-	struct v4l2_ctrl *ctrl;
-
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_H264_DECODE_PARAMS);
-	run->decode_params = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_H264_SPS);
-	run->sps = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_H264_PPS);
-	run->pps = ctrl ? ctrl->p_cur.p : NULL;
-	ctrl = v4l2_ctrl_find(&ctx->ctrl_hdl,
-			      V4L2_CID_STATELESS_H264_SCALING_MATRIX);
-	run->scaling_matrix = ctrl ? ctrl->p_cur.p : NULL;
-
-	rkvdec_run_preamble(ctx, &run->base);
-}
-
 static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 {
 	struct v4l2_h264_reflist_builder reflist_builder;
 	struct rkvdec_dev *rkvdec = ctx->dev;
 	struct rkvdec_h264_ctx *h264_ctx = ctx->priv;
 	struct rkvdec_h264_run run;
+	struct rkvdec_h264_priv_tbl *tbl = h264_ctx->priv_tbl.cpu;
 
 	rkvdec_h264_run_preamble(ctx, &run);
 
@@ -727,10 +425,10 @@ static int rkvdec_h264_run(struct rkvdec_ctx *ctx)
 	v4l2_h264_build_b_ref_lists(&reflist_builder, h264_ctx->reflists.b0,
 				    h264_ctx->reflists.b1);
 
-	assemble_hw_scaling_list(ctx, &run);
+	assemble_hw_scaling_list(&run, &tbl->scaling_list);
 	assemble_hw_pps(ctx, &run);
 	lookup_ref_buf_idx(ctx, &run);
-	assemble_hw_rps(ctx, &reflist_builder, &run);
+	assemble_hw_rps(&reflist_builder, &run, &h264_ctx->reflists, &tbl->rps);
 	config_registers(ctx, &run);
 
 	rkvdec_run_postamble(ctx, &run.base);
-- 
2.52.0


