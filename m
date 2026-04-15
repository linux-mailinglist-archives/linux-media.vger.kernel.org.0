Return-Path: <linux-media+bounces-58818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEGNGrGc32kEWwAAu9opvQ
	(envelope-from <linux-media+bounces-58818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:12:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2CB4052B4
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:12:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7636731212CD
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 14:04:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 764A03D349D;
	Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kVC1+s3P"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1008F5CDF1;
	Wed, 15 Apr 2026 14:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261876; cv=none; b=iY2Z2Gkpbd/yuZPcGvYgGpWdA4Q7gU3oq6rz3CwvgVXeUEast6FehgwK2JwIQHaUyzdD9uPt1aIHLvhoKtdrVO0jfiwBWRK8kRPX4ybFyQYAqR1txwcU8ae4SKWLnv7CfJ1lrYkAKnL3LIfqqEtqnuAmaaCQrCfj3t5RZCS+2bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261876; c=relaxed/simple;
	bh=JMFGsq6wkG7d06wrBymDGs/SYjjTwc7qvNBL7Nb2+4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NNHR3R0v7RfHjbrOfUJW49DT+bR/MNQtT0qLJdYYmD/lBXBrBsHDOF1arKOFf5/GZqCSQO13KeQX2CDK5sCQ/h22cghJPAnvhygh+t9UcDo5DZg9cxucB4Xlq7AQzRFQ7fHDufIdjpMnd3G09unuPZjVD2TiAOaXygT3/3/gLiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kVC1+s3P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776261872;
	bh=JMFGsq6wkG7d06wrBymDGs/SYjjTwc7qvNBL7Nb2+4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kVC1+s3PxQZezEvmCbL51enHJAonbzBc5cp8cKQ5PjFwqum5sf2/5zsehKZ4TDaeM
	 pf1CA6NafYPFPjPwXXam843vU1R2EKShf9ch6tNEZ/ZjNUU9ReKujb078RhB9a21wA
	 cGYbkvG/p0qkK1B3f4onAkZU0EfoqGvtIPKGYzFzjQSQbAvCXznpxLNyxy8R4eeuuz
	 QLe/Fdftj9qpYYA9I+YC5VRKcs/4WyY/WLCzof+OB3bJzWmMtvFy1RIpJTUObxFFx+
	 oLXSqx4gnniN0znjd6YYbldEOvnMuh+zOn0RI0/RNqame2nfWYUB0ocyl7aa/X5ACJ
	 wKwedm9xB1APQ==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DAB4017E1380;
	Wed, 15 Apr 2026 16:04:31 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	heiko@sntech.de,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v3 2/2] media: verisilicon: Clean up messy include
Date: Wed, 15 Apr 2026 16:04:20 +0200
Message-ID: <20260415140420.282084-3-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
References: <20260415140420.282084-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[collabora.com,pengutronix.de,kernel.org,nxp.com,gmail.com,sntech.de,foss.st.com,sholland.org];
	TAGGED_FROM(0.00)[bounces-58818-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 8B2CB4052B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Over time all codecs specific functions and structures have been
added in hantro_hw.h file.
Moving them into dedicated files clean up hantro_hw.h where only
hardware specific functions should remain and, while at it, reorder
them.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h   |  14 +-
 .../media/platform/verisilicon/hantro_av1.h   |  86 +++++
 .../platform/verisilicon/hantro_g1_h264_dec.c |   1 +
 .../verisilicon/hantro_g1_mpeg2_dec.c         |   2 +-
 .../platform/verisilicon/hantro_g1_vp8_dec.c  |   2 +-
 .../platform/verisilicon/hantro_g2_hevc_dec.c |   2 +-
 .../media/platform/verisilicon/hantro_h264.c  |   2 +-
 .../media/platform/verisilicon/hantro_h264.h  |  65 ++++
 .../media/platform/verisilicon/hantro_hevc.c  |   2 +-
 .../media/platform/verisilicon/hantro_hevc.h  |  66 ++++
 .../media/platform/verisilicon/hantro_hw.h    | 352 +-----------------
 .../media/platform/verisilicon/hantro_mpeg2.c |   1 +
 .../media/platform/verisilicon/hantro_mpeg2.h |  27 ++
 .../media/platform/verisilicon/hantro_v4l2.c  |   7 +-
 .../media/platform/verisilicon/hantro_vp8.c   |   1 +
 .../media/platform/verisilicon/hantro_vp8.h   |  29 ++
 .../media/platform/verisilicon/hantro_vp9.h   |  86 +++++
 .../media/platform/verisilicon/imx8m_vpu_hw.c |   5 +
 .../verisilicon/rockchip_vpu2_hw_h264_dec.c   |   2 +-
 .../verisilicon/rockchip_vpu2_hw_mpeg2_dec.c  |   2 +-
 .../verisilicon/rockchip_vpu2_hw_vp8_dec.c    |   2 +-
 .../platform/verisilicon/rockchip_vpu_hw.c    |   3 +
 .../platform/verisilicon/stm32mp25_vpu_hw.c   |   2 +
 .../media/platform/verisilicon/sunxi_vpu_hw.c |   1 +
 24 files changed, 413 insertions(+), 349 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_mpeg2.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_vp8.h

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index c4ceb9c99016..91e04df6463e 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -25,7 +25,12 @@
 #include <media/videobuf2-core.h>
 #include <media/videobuf2-dma-contig.h>
 
-#include "hantro_hw.h"
+#include "hantro_av1.h"
+#include "hantro_h264.h"
+#include "hantro_hevc.h"
+#include "hantro_mpeg2.h"
+#include "hantro_vp8.h"
+#include "hantro_vp9.h"
 
 struct hantro_ctx;
 struct hantro_codec_ops;
@@ -520,4 +525,11 @@ dma_addr_t hantro_mv_get_buf_addr(struct hantro_ctx *ctx, int index);
 dma_addr_t hantro_rfc_get_luma_buf_addr(struct hantro_ctx *ctx, int index);
 dma_addr_t hantro_rfc_get_chroma_buf_addr(struct hantro_ctx *ctx, int index);
 
+void hantro_watchdog(struct work_struct *work);
+void hantro_run(struct hantro_ctx *ctx);
+void hantro_irq_done(struct hantro_dev *vpu,
+		     enum vb2_buffer_state result);
+void hantro_start_prepare_run(struct hantro_ctx *ctx);
+void hantro_end_prepare_run(struct hantro_ctx *ctx);
+
 #endif /* HANTRO_H_ */
diff --git a/drivers/media/platform/verisilicon/hantro_av1.h b/drivers/media/platform/verisilicon/hantro_av1.h
index bc4a0887f8e7..8f0a001b9750 100644
--- a/drivers/media/platform/verisilicon/hantro_av1.h
+++ b/drivers/media/platform/verisilicon/hantro_av1.h
@@ -3,6 +3,10 @@
 #ifndef _HANTRO_AV1_H_
 #define _HANTRO_AV1_H_
 
+#include "hantro_av1_entropymode.h"
+#include "hantro_av1_filmgrain.h"
+#include "hantro_hw.h"
+
 #define AV1_PRIMARY_REF_NONE	7
 #define AV1_REF_SCALE_SHIFT	14
 #define MAX_FRAME_DISTANCE	31
@@ -36,6 +40,88 @@
 #define ALT2_BUF_IDX (V4L2_AV1_REF_ALTREF2_FRAME - V4L2_AV1_REF_LAST_FRAME)
 #define ALT_BUF_IDX (V4L2_AV1_REF_ALTREF_FRAME - V4L2_AV1_REF_LAST_FRAME)
 
+#define AV1_MAX_FRAME_BUF_COUNT	(V4L2_AV1_TOTAL_REFS_PER_FRAME + 1)
+
+
+/**
+ * struct hantro_av1_dec_ctrls
+ * @sequence:		AV1 Sequence
+ * @tile_group_entry:	AV1 Tile Group entry
+ * @frame:		AV1 Frame Header OBU
+ * @film_grain:		AV1 Film Grain
+ */
+struct hantro_av1_dec_ctrls {
+	const struct v4l2_ctrl_av1_sequence *sequence;
+	const struct v4l2_ctrl_av1_tile_group_entry *tile_group_entry;
+	const struct v4l2_ctrl_av1_frame *frame;
+	const struct v4l2_ctrl_av1_film_grain *film_grain;
+};
+
+struct hantro_av1_frame_ref {
+	int width;
+	int height;
+	int mi_cols;
+	int mi_rows;
+	u64 timestamp;
+	enum v4l2_av1_frame_type frame_type;
+	bool used;
+	u32 order_hint;
+	u32 order_hints[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	struct vb2_v4l2_buffer *vb2_ref;
+};
+
+/**
+ * struct hantro_av1_dec_hw_ctx
+ * @db_data_col:	db tile col data buffer
+ * @db_ctrl_col:	db tile col ctrl buffer
+ * @cdef_col:		cdef tile col buffer
+ * @sr_col:		sr tile col buffer
+ * @lr_col:		lr tile col buffer
+ * @global_model:	global model buffer
+ * @tile_info:		tile info buffer
+ * @segment:		segmentation info buffer
+ * @film_grain:		film grain buffer
+ * @prob_tbl:		probability table
+ * @prob_tbl_out:	probability table output
+ * @tile_buf:		tile buffer
+ * @ctrls:		V4L2 controls attached to a run
+ * @frame_refs:		reference frames info slots
+ * @ref_frame_sign_bias: array of sign bias
+ * @num_tile_cols_allocated: number of allocated tiles
+ * @cdfs:		current probabilities structure
+ * @cdfs_ndvc:		current mv probabilities structure
+ * @default_cdfs:	default probabilities structure
+ * @default_cdfs_ndvc:	default mv probabilties structure
+ * @cdfs_last:		stored probabilities structures
+ * @cdfs_last_ndvc:	stored mv probabilities structures
+ * @current_frame_index: index of the current in frame_refs array
+ */
+struct hantro_av1_dec_hw_ctx {
+	struct hantro_aux_buf db_data_col;
+	struct hantro_aux_buf db_ctrl_col;
+	struct hantro_aux_buf cdef_col;
+	struct hantro_aux_buf sr_col;
+	struct hantro_aux_buf lr_col;
+	struct hantro_aux_buf global_model;
+	struct hantro_aux_buf tile_info;
+	struct hantro_aux_buf segment;
+	struct hantro_aux_buf film_grain;
+	struct hantro_aux_buf prob_tbl;
+	struct hantro_aux_buf prob_tbl_out;
+	struct hantro_aux_buf tile_buf;
+	struct hantro_av1_dec_ctrls ctrls;
+	struct hantro_av1_frame_ref frame_refs[AV1_MAX_FRAME_BUF_COUNT];
+	u32 ref_frame_sign_bias[V4L2_AV1_TOTAL_REFS_PER_FRAME];
+	unsigned int num_tile_cols_allocated;
+	struct av1cdfs *cdfs;
+	struct mvcdfs  *cdfs_ndvc;
+	struct av1cdfs default_cdfs;
+	struct mvcdfs  default_cdfs_ndvc;
+	struct av1cdfs cdfs_last[NUM_REF_FRAMES];
+	struct mvcdfs  cdfs_last_ndvc[NUM_REF_FRAMES];
+	int current_frame_index;
+};
+
 int hantro_av1_get_frame_index(struct hantro_ctx *ctx, int ref);
 int hantro_av1_get_order_hint(struct hantro_ctx *ctx, int ref);
 int hantro_av1_frame_ref(struct hantro_ctx *ctx, u64 timestamp);
diff --git a/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c b/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
index ad5c1a6634f5..a1da2adda5eb 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_h264_dec.c
@@ -16,6 +16,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "hantro_g1_regs.h"
+#include "hantro_h264.h"
 #include "hantro_hw.h"
 #include "hantro_v4l2.h"
 
diff --git a/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c b/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
index e0d6bd0a6e44..7c2f0697295d 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_mpeg2_dec.c
@@ -9,8 +9,8 @@
 #include <linux/bitfield.h>
 #include <media/v4l2-mem2mem.h>
 #include "hantro.h"
-#include "hantro_hw.h"
 #include "hantro_g1_regs.h"
+#include "hantro_mpeg2.h"
 
 #define G1_SWREG(nr)			((nr) * 4)
 
diff --git a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
index 851eb67f19f5..e155d9868b32 100644
--- a/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g1_vp8_dec.c
@@ -11,9 +11,9 @@
 
 #include <media/v4l2-mem2mem.h>
 
-#include "hantro_hw.h"
 #include "hantro.h"
 #include "hantro_g1_regs.h"
+#include "hantro_vp8.h"
 
 /* DCT partition base address regs */
 static const struct hantro_reg vp8_dec_dct_base[8] = {
diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index d0af9fb882ba..39f271e570f7 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -5,7 +5,7 @@
  * Copyright (C) 2020 Safran Passenger Innovations LLC
  */
 
-#include "hantro_hw.h"
+#include "hantro_hevc.h"
 #include "hantro_g2_regs.h"
 
 static void prepare_tile_info_buffer(struct hantro_ctx *ctx)
diff --git a/drivers/media/platform/verisilicon/hantro_h264.c b/drivers/media/platform/verisilicon/hantro_h264.c
index 2414782f1eb6..5e684389f04f 100644
--- a/drivers/media/platform/verisilicon/hantro_h264.c
+++ b/drivers/media/platform/verisilicon/hantro_h264.c
@@ -15,7 +15,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "hantro.h"
-#include "hantro_hw.h"
+#include "hantro_h264.h"
 
 /* Size with u32 units. */
 #define CABAC_INIT_BUFFER_SIZE		(460 * 2)
diff --git a/drivers/media/platform/verisilicon/hantro_h264.h b/drivers/media/platform/verisilicon/hantro_h264.h
index 89348203a712..d94e4b21d991 100644
--- a/drivers/media/platform/verisilicon/hantro_h264.h
+++ b/drivers/media/platform/verisilicon/hantro_h264.h
@@ -5,6 +5,63 @@
  * Copyright (C) 2026 Collabora Ltd.
  */
 
+#ifndef _HANTRO_H264_H_
+#define _HANTRO_H264_H_
+
+#include "hantro_hw.h"
+
+/* Max. number of entries in the DPB (HW limitation). */
+#define HANTRO_H264_DPB_SIZE		16
+
+/**
+ * struct hantro_h264_dec_ctrls
+ *
+ * @decode:	Decode params
+ * @scaling:	Scaling info
+ * @sps:	SPS info
+ * @pps:	PPS info
+ */
+struct hantro_h264_dec_ctrls {
+	const struct v4l2_ctrl_h264_decode_params *decode;
+	const struct v4l2_ctrl_h264_scaling_matrix *scaling;
+	const struct v4l2_ctrl_h264_sps *sps;
+	const struct v4l2_ctrl_h264_pps *pps;
+};
+
+/**
+ * struct hantro_h264_dec_reflists
+ *
+ * @p:		P reflist
+ * @b0:		B0 reflist
+ * @b1:		B1 reflist
+ */
+struct hantro_h264_dec_reflists {
+	struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
+	struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
+	struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
+};
+
+/**
+ * struct hantro_h264_dec_hw_ctx
+ *
+ * @priv:	Private auxiliary buffer for hardware.
+ * @dpb:	DPB
+ * @reflists:	P/B0/B1 reflists
+ * @ctrls:	V4L2 controls attached to a run
+ * @dpb_longterm: DPB long-term
+ * @dpb_valid:	  DPB valid
+ * @cur_poc:	Current picture order count
+ */
+struct hantro_h264_dec_hw_ctx {
+	struct hantro_aux_buf priv;
+	struct v4l2_h264_dpb_entry dpb[HANTRO_H264_DPB_SIZE];
+	struct hantro_h264_dec_reflists reflists;
+	struct hantro_h264_dec_ctrls ctrls;
+	u32 dpb_longterm;
+	u32 dpb_valid;
+	s32 cur_poc;
+};
+
 static inline size_t
 hantro_h264_mv_size(unsigned int width, unsigned int height)
 {
@@ -31,3 +88,11 @@ hantro_h264_mv_size(unsigned int width, unsigned int height)
 	 */
 	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
 }
+
+dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx, unsigned int dpb_idx);
+u16 hantro_h264_get_ref_nbr(struct hantro_ctx *ctx, unsigned int dpb_idx);
+int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx);
+int hantro_h264_dec_init(struct hantro_ctx *ctx);
+void hantro_h264_dec_exit(struct hantro_ctx *ctx);
+
+#endif
diff --git a/drivers/media/platform/verisilicon/hantro_hevc.c b/drivers/media/platform/verisilicon/hantro_hevc.c
index eea4d9e6fde0..04a694cd19f9 100644
--- a/drivers/media/platform/verisilicon/hantro_hevc.c
+++ b/drivers/media/platform/verisilicon/hantro_hevc.c
@@ -9,7 +9,7 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "hantro.h"
-#include "hantro_hw.h"
+#include "hantro_hevc.h"
 
 #define VERT_FILTER_RAM_SIZE 8 /* bytes per pixel row */
 /*
diff --git a/drivers/media/platform/verisilicon/hantro_hevc.h b/drivers/media/platform/verisilicon/hantro_hevc.h
index cfaeb8662473..71e17054743d 100644
--- a/drivers/media/platform/verisilicon/hantro_hevc.h
+++ b/drivers/media/platform/verisilicon/hantro_hevc.h
@@ -5,6 +5,60 @@
  * Copyright (C) 2026 Collabora Ltd.
  */
 
+#ifndef _HANTRO_HEVC_H_
+#define _HANTRO_HEVC_H_
+
+#include "hantro_hw.h"
+
+#define NUM_REF_PICTURES	(V4L2_HEVC_DPB_ENTRIES_NUM_MAX + 1)
+
+/**
+ * struct hantro_hevc_dec_ctrls
+ * @decode_params: Decode params
+ * @scaling:	Scaling matrix
+ * @sps:	SPS info
+ * @pps:	PPS info
+ * @hevc_hdr_skip_length: the number of data (in bits) to skip in the
+ *			  slice segment header syntax after 'slice type'
+ *			  token
+ */
+struct hantro_hevc_dec_ctrls {
+	const struct v4l2_ctrl_hevc_decode_params *decode_params;
+	const struct v4l2_ctrl_hevc_scaling_matrix *scaling;
+	const struct v4l2_ctrl_hevc_sps *sps;
+	const struct v4l2_ctrl_hevc_pps *pps;
+	u32 hevc_hdr_skip_length;
+};
+
+/**
+ * struct hantro_hevc_dec_hw_ctx
+ * @tile_sizes:		Tile sizes buffer
+ * @tile_filter:	Tile vertical filter buffer
+ * @tile_sao:		Tile SAO buffer
+ * @tile_bsd:		Tile BSD control buffer
+ * @ref_bufs:		Internal reference buffers
+ * @scaling_lists:	Scaling lists buffer
+ * @ref_bufs_poc:	Internal reference buffers picture order count
+ * @ref_bufs_used:	Bitfield of used reference buffers
+ * @ctrls:		V4L2 controls attached to a run
+ * @num_tile_cols_allocated: number of allocated tiles
+ * @use_compression:	use reference buffer compression
+ */
+struct hantro_hevc_dec_hw_ctx {
+	struct hantro_aux_buf tile_sizes;
+	struct hantro_aux_buf tile_filter;
+	struct hantro_aux_buf tile_sao;
+	struct hantro_aux_buf tile_bsd;
+	struct hantro_aux_buf ref_bufs[NUM_REF_PICTURES];
+	struct hantro_aux_buf scaling_lists;
+	s32 ref_bufs_poc[NUM_REF_PICTURES];
+	u32 ref_bufs_used;
+	struct vb2_v4l2_buffer *ref_vb2[NUM_REF_PICTURES];
+	struct hantro_hevc_dec_ctrls ctrls;
+	unsigned int num_tile_cols_allocated;
+	bool use_compression;
+};
+
 static inline size_t
 hantro_hevc_mv_size(unsigned int width, unsigned int height, int depth)
 {
@@ -14,3 +68,15 @@ hantro_hevc_mv_size(unsigned int width, unsigned int height, int depth)
 	 */
 	return DIV_ROUND_UP(width * height * depth / 8, 16);
 }
+
+int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
+void hantro_hevc_ref_init(struct hantro_ctx *ctx);
+dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, s32 poc);
+int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc,
+			    dma_addr_t addr,
+			    struct vb2_v4l2_buffer *vb2);
+int hantro_hevc_get_ref_buf_index(struct hantro_ctx *ctx, s32 poc);
+int hantro_hevc_dec_init(struct hantro_ctx *ctx);
+void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
+
+#endif
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 6903af119345..6d6944088c8e 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -15,9 +15,6 @@
 #include <media/v4l2-vp9.h>
 #include <media/videobuf2-core.h>
 
-#include "hantro_av1_entropymode.h"
-#include "hantro_av1_filmgrain.h"
-
 #define DEC_8190_ALIGN_MASK	0x07U
 
 #define MB_DIM			16
@@ -36,19 +33,8 @@
 #define FMT_4K_WIDTH		4096
 #define FMT_4K_HEIGHT		2304
 
-#define NUM_REF_PICTURES	(V4L2_HEVC_DPB_ENTRIES_NUM_MAX + 1)
-
-#define AV1_MAX_FRAME_BUF_COUNT	(V4L2_AV1_TOTAL_REFS_PER_FRAME + 1)
-
 #define MAX_POSTPROC_BUFFERS	64
 
-#define CBS_SIZE	16	/* compression table size in bytes */
-#define CBS_LUMA	8	/* luminance CBS is composed of 1 8x8 coded block */
-#define CBS_CHROMA_W	(8 * 2)	/* chrominance CBS is composed of two 8x4 coded
-				 * blocks, with Cb CB first then Cr CB following
-				 */
-#define CBS_CHROMA_H	4
-
 struct hantro_dev;
 struct hantro_ctx;
 struct hantro_buf;
@@ -69,279 +55,6 @@ struct hantro_aux_buf {
 	unsigned long attrs;
 };
 
-/* Max. number of entries in the DPB (HW limitation). */
-#define HANTRO_H264_DPB_SIZE		16
-
-/**
- * struct hantro_h264_dec_ctrls
- *
- * @decode:	Decode params
- * @scaling:	Scaling info
- * @sps:	SPS info
- * @pps:	PPS info
- */
-struct hantro_h264_dec_ctrls {
-	const struct v4l2_ctrl_h264_decode_params *decode;
-	const struct v4l2_ctrl_h264_scaling_matrix *scaling;
-	const struct v4l2_ctrl_h264_sps *sps;
-	const struct v4l2_ctrl_h264_pps *pps;
-};
-
-/**
- * struct hantro_h264_dec_reflists
- *
- * @p:		P reflist
- * @b0:		B0 reflist
- * @b1:		B1 reflist
- */
-struct hantro_h264_dec_reflists {
-	struct v4l2_h264_reference p[V4L2_H264_REF_LIST_LEN];
-	struct v4l2_h264_reference b0[V4L2_H264_REF_LIST_LEN];
-	struct v4l2_h264_reference b1[V4L2_H264_REF_LIST_LEN];
-};
-
-/**
- * struct hantro_h264_dec_hw_ctx
- *
- * @priv:	Private auxiliary buffer for hardware.
- * @dpb:	DPB
- * @reflists:	P/B0/B1 reflists
- * @ctrls:	V4L2 controls attached to a run
- * @dpb_longterm: DPB long-term
- * @dpb_valid:	  DPB valid
- * @cur_poc:	Current picture order count
- */
-struct hantro_h264_dec_hw_ctx {
-	struct hantro_aux_buf priv;
-	struct v4l2_h264_dpb_entry dpb[HANTRO_H264_DPB_SIZE];
-	struct hantro_h264_dec_reflists reflists;
-	struct hantro_h264_dec_ctrls ctrls;
-	u32 dpb_longterm;
-	u32 dpb_valid;
-	s32 cur_poc;
-};
-
-/**
- * struct hantro_hevc_dec_ctrls
- * @decode_params: Decode params
- * @scaling:	Scaling matrix
- * @sps:	SPS info
- * @pps:	PPS info
- * @hevc_hdr_skip_length: the number of data (in bits) to skip in the
- *			  slice segment header syntax after 'slice type'
- *			  token
- */
-struct hantro_hevc_dec_ctrls {
-	const struct v4l2_ctrl_hevc_decode_params *decode_params;
-	const struct v4l2_ctrl_hevc_scaling_matrix *scaling;
-	const struct v4l2_ctrl_hevc_sps *sps;
-	const struct v4l2_ctrl_hevc_pps *pps;
-	u32 hevc_hdr_skip_length;
-};
-
-/**
- * struct hantro_hevc_dec_hw_ctx
- * @tile_sizes:		Tile sizes buffer
- * @tile_filter:	Tile vertical filter buffer
- * @tile_sao:		Tile SAO buffer
- * @tile_bsd:		Tile BSD control buffer
- * @ref_bufs:		Internal reference buffers
- * @scaling_lists:	Scaling lists buffer
- * @ref_bufs_poc:	Internal reference buffers picture order count
- * @ref_bufs_used:	Bitfield of used reference buffers
- * @ctrls:		V4L2 controls attached to a run
- * @num_tile_cols_allocated: number of allocated tiles
- * @use_compression:	use reference buffer compression
- */
-struct hantro_hevc_dec_hw_ctx {
-	struct hantro_aux_buf tile_sizes;
-	struct hantro_aux_buf tile_filter;
-	struct hantro_aux_buf tile_sao;
-	struct hantro_aux_buf tile_bsd;
-	struct hantro_aux_buf ref_bufs[NUM_REF_PICTURES];
-	struct hantro_aux_buf scaling_lists;
-	s32 ref_bufs_poc[NUM_REF_PICTURES];
-	u32 ref_bufs_used;
-	struct vb2_v4l2_buffer *ref_vb2[NUM_REF_PICTURES];
-	struct hantro_hevc_dec_ctrls ctrls;
-	unsigned int num_tile_cols_allocated;
-	bool use_compression;
-};
-
-/**
- * struct hantro_mpeg2_dec_hw_ctx
- *
- * @qtable:		Quantization table
- */
-struct hantro_mpeg2_dec_hw_ctx {
-	struct hantro_aux_buf qtable;
-};
-
-/**
- * struct hantro_vp8_dec_hw_ctx
- *
- * @segment_map:	Segment map buffer.
- * @prob_tbl:		Probability table buffer.
- */
-struct hantro_vp8_dec_hw_ctx {
-	struct hantro_aux_buf segment_map;
-	struct hantro_aux_buf prob_tbl;
-};
-
-/**
- * struct hantro_vp9_frame_info
- *
- * @valid: frame info valid flag
- * @frame_context_idx: index of frame context
- * @reference_mode: inter prediction type
- * @tx_mode: transform mode
- * @interpolation_filter: filter selection for inter prediction
- * @flags: frame flags
- * @timestamp: frame timestamp
- */
-struct hantro_vp9_frame_info {
-	u32 valid : 1;
-	u32 frame_context_idx : 2;
-	u32 reference_mode : 2;
-	u32 tx_mode : 3;
-	u32 interpolation_filter : 3;
-	u32 flags;
-	u64 timestamp;
-};
-
-#define MAX_SB_COLS	64
-#define MAX_SB_ROWS	34
-
-/**
- * struct hantro_vp9_dec_hw_ctx
- *
- * @tile_edge: auxiliary DMA buffer for tile edge processing
- * @segment_map: auxiliary DMA buffer for segment map
- * @misc: auxiliary DMA buffer for tile info, probabilities and hw counters
- * @cnts: vp9 library struct for abstracting hw counters access
- * @probability_tables: VP9 probability tables implied by the spec
- * @frame_context: VP9 frame contexts
- * @cur: current frame information
- * @last: last frame information
- * @bsd_ctrl_offset: bsd offset into tile_edge
- * @segment_map_size: size of segment map
- * @ctx_counters_offset: hw counters offset into misc
- * @tile_info_offset: tile info offset into misc
- * @tile_r_info: per-tile information array
- * @tile_c_info: per-tile information array
- * @last_tile_r: last number of tile rows
- * @last_tile_c: last number of tile cols
- * @last_sbs_r: last number of superblock rows
- * @last_sbs_c: last number of superblock cols
- * @active_segment: number of active segment (alternating between 0 and 1)
- * @feature_enabled: segmentation feature enabled flags
- * @feature_data: segmentation feature data
- */
-struct hantro_vp9_dec_hw_ctx {
-	struct hantro_aux_buf tile_edge;
-	struct hantro_aux_buf segment_map;
-	struct hantro_aux_buf misc;
-	struct v4l2_vp9_frame_symbol_counts cnts;
-	struct v4l2_vp9_frame_context probability_tables;
-	struct v4l2_vp9_frame_context frame_context[4];
-	struct hantro_vp9_frame_info cur;
-	struct hantro_vp9_frame_info last;
-
-	unsigned int bsd_ctrl_offset;
-	unsigned int segment_map_size;
-	unsigned int ctx_counters_offset;
-	unsigned int tile_info_offset;
-
-	unsigned short tile_r_info[MAX_SB_ROWS];
-	unsigned short tile_c_info[MAX_SB_COLS];
-	unsigned int last_tile_r;
-	unsigned int last_tile_c;
-	unsigned int last_sbs_r;
-	unsigned int last_sbs_c;
-
-	unsigned int active_segment;
-	u8 feature_enabled[8];
-	s16 feature_data[8][4];
-};
-
-/**
- * struct hantro_av1_dec_ctrls
- * @sequence:		AV1 Sequence
- * @tile_group_entry:	AV1 Tile Group entry
- * @frame:		AV1 Frame Header OBU
- * @film_grain:		AV1 Film Grain
- */
-struct hantro_av1_dec_ctrls {
-	const struct v4l2_ctrl_av1_sequence *sequence;
-	const struct v4l2_ctrl_av1_tile_group_entry *tile_group_entry;
-	const struct v4l2_ctrl_av1_frame *frame;
-	const struct v4l2_ctrl_av1_film_grain *film_grain;
-};
-
-struct hantro_av1_frame_ref {
-	int width;
-	int height;
-	int mi_cols;
-	int mi_rows;
-	u64 timestamp;
-	enum v4l2_av1_frame_type frame_type;
-	bool used;
-	u32 order_hint;
-	u32 order_hints[V4L2_AV1_TOTAL_REFS_PER_FRAME];
-	struct vb2_v4l2_buffer *vb2_ref;
-};
-
-/**
- * struct hantro_av1_dec_hw_ctx
- * @db_data_col:	db tile col data buffer
- * @db_ctrl_col:	db tile col ctrl buffer
- * @cdef_col:		cdef tile col buffer
- * @sr_col:		sr tile col buffer
- * @lr_col:		lr tile col buffer
- * @global_model:	global model buffer
- * @tile_info:		tile info buffer
- * @segment:		segmentation info buffer
- * @film_grain:		film grain buffer
- * @prob_tbl:		probability table
- * @prob_tbl_out:	probability table output
- * @tile_buf:		tile buffer
- * @ctrls:		V4L2 controls attached to a run
- * @frame_refs:		reference frames info slots
- * @ref_frame_sign_bias: array of sign bias
- * @num_tile_cols_allocated: number of allocated tiles
- * @cdfs:		current probabilities structure
- * @cdfs_ndvc:		current mv probabilities structure
- * @default_cdfs:	default probabilities structure
- * @default_cdfs_ndvc:	default mv probabilties structure
- * @cdfs_last:		stored probabilities structures
- * @cdfs_last_ndvc:	stored mv probabilities structures
- * @current_frame_index: index of the current in frame_refs array
- */
-struct hantro_av1_dec_hw_ctx {
-	struct hantro_aux_buf db_data_col;
-	struct hantro_aux_buf db_ctrl_col;
-	struct hantro_aux_buf cdef_col;
-	struct hantro_aux_buf sr_col;
-	struct hantro_aux_buf lr_col;
-	struct hantro_aux_buf global_model;
-	struct hantro_aux_buf tile_info;
-	struct hantro_aux_buf segment;
-	struct hantro_aux_buf film_grain;
-	struct hantro_aux_buf prob_tbl;
-	struct hantro_aux_buf prob_tbl_out;
-	struct hantro_aux_buf tile_buf;
-	struct hantro_av1_dec_ctrls ctrls;
-	struct hantro_av1_frame_ref frame_refs[AV1_MAX_FRAME_BUF_COUNT];
-	u32 ref_frame_sign_bias[V4L2_AV1_TOTAL_REFS_PER_FRAME];
-	unsigned int num_tile_cols_allocated;
-	struct av1cdfs *cdfs;
-	struct mvcdfs  *cdfs_ndvc;
-	struct av1cdfs default_cdfs;
-	struct mvcdfs  default_cdfs_ndvc;
-	struct av1cdfs cdfs_last[NUM_REF_FRAMES];
-	struct mvcdfs  cdfs_last_ndvc[NUM_REF_FRAMES];
-	int current_frame_index;
-};
 /**
  * struct hantro_postproc_ctx
  *
@@ -425,68 +138,29 @@ extern const struct hantro_postproc_ops hantro_g1_postproc_ops;
 extern const struct hantro_postproc_ops hantro_g2_postproc_ops;
 extern const struct hantro_postproc_ops rockchip_vpu981_postproc_ops;
 
-extern const u32 hantro_vp8_dec_mc_filter[8][6];
-
-void hantro_watchdog(struct work_struct *work);
-void hantro_run(struct hantro_ctx *ctx);
-void hantro_irq_done(struct hantro_dev *vpu,
-		     enum vb2_buffer_state result);
-void hantro_start_prepare_run(struct hantro_ctx *ctx);
-void hantro_end_prepare_run(struct hantro_ctx *ctx);
-
 irqreturn_t hantro_g1_irq(int irq, void *dev_id);
 void hantro_g1_reset(struct hantro_ctx *ctx);
-
-int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
-int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx);
-void hantro_h1_jpeg_enc_done(struct hantro_ctx *ctx);
-void rockchip_vpu2_jpeg_enc_done(struct hantro_ctx *ctx);
-
-dma_addr_t hantro_h264_get_ref_buf(struct hantro_ctx *ctx,
-				   unsigned int dpb_idx);
-u16 hantro_h264_get_ref_nbr(struct hantro_ctx *ctx,
-			    unsigned int dpb_idx);
-int hantro_h264_dec_prepare_run(struct hantro_ctx *ctx);
-int rockchip_vpu2_h264_dec_run(struct hantro_ctx *ctx);
 int hantro_g1_h264_dec_run(struct hantro_ctx *ctx);
-int hantro_h264_dec_init(struct hantro_ctx *ctx);
-void hantro_h264_dec_exit(struct hantro_ctx *ctx);
-
-int hantro_hevc_dec_init(struct hantro_ctx *ctx);
-void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
-int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
-int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
-void hantro_hevc_ref_init(struct hantro_ctx *ctx);
-dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, s32 poc);
-int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc,
-			    dma_addr_t addr,
-			    struct vb2_v4l2_buffer *vb2);
-int hantro_hevc_get_ref_buf_index(struct hantro_ctx *ctx, s32 poc);
-
-int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx);
-
-size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx);
-
 int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
-int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
-void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
-				  const struct v4l2_ctrl_mpeg2_quantisation *ctrl);
-int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
-void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
-
 int hantro_g1_vp8_dec_run(struct hantro_ctx *ctx);
-int rockchip_vpu2_vp8_dec_run(struct hantro_ctx *ctx);
-int hantro_vp8_dec_init(struct hantro_ctx *ctx);
-void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
-void hantro_vp8_prob_update(struct hantro_ctx *ctx,
-			    const struct v4l2_ctrl_vp8_frame *hdr);
 
+int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
+size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx);
 int hantro_g2_vp9_dec_run(struct hantro_ctx *ctx);
 void hantro_g2_vp9_dec_done(struct hantro_ctx *ctx);
-int hantro_vp9_dec_init(struct hantro_ctx *ctx);
-void hantro_vp9_dec_exit(struct hantro_ctx *ctx);
 void hantro_g2_check_idle(struct hantro_dev *vpu);
 void hantro_g2_reset(struct hantro_ctx *ctx);
 irqreturn_t hantro_g2_irq(int irq, void *dev_id);
 
+int hantro_h1_jpeg_enc_run(struct hantro_ctx *ctx);
+void hantro_h1_jpeg_enc_done(struct hantro_ctx *ctx);
+
+int rockchip_vpu2_jpeg_enc_run(struct hantro_ctx *ctx);
+void rockchip_vpu2_jpeg_enc_done(struct hantro_ctx *ctx);
+int rockchip_vpu2_h264_dec_run(struct hantro_ctx *ctx);
+int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
+int rockchip_vpu2_vp8_dec_run(struct hantro_ctx *ctx);
+
+int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx);
+
 #endif /* HANTRO_HW_H_ */
diff --git a/drivers/media/platform/verisilicon/hantro_mpeg2.c b/drivers/media/platform/verisilicon/hantro_mpeg2.c
index 04e545eb0a83..e6ad39a2d18c 100644
--- a/drivers/media/platform/verisilicon/hantro_mpeg2.c
+++ b/drivers/media/platform/verisilicon/hantro_mpeg2.c
@@ -6,6 +6,7 @@
  */
 
 #include "hantro.h"
+#include "hantro_mpeg2.h"
 
 static const u8 zigzag[64] = {
 	0,   1,  8, 16,  9,  2,  3, 10,
diff --git a/drivers/media/platform/verisilicon/hantro_mpeg2.h b/drivers/media/platform/verisilicon/hantro_mpeg2.h
new file mode 100644
index 000000000000..df86f5be3152
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_mpeg2.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hantro MPEG2 codec driver
+ *
+ * Copyright (C) 2026 Collabora Ltd.
+ */
+
+#ifndef _HANTRO_MPEG2_H_
+#define _HANTRO_MPEG2_H_
+
+#include "hantro_hw.h"
+
+/**
+ * struct hantro_mpeg2_dec_hw_ctx
+ *
+ * @qtable:		Quantization table
+ */
+struct hantro_mpeg2_dec_hw_ctx {
+	struct hantro_aux_buf qtable;
+};
+
+void hantro_mpeg2_dec_copy_qtable(u8 *qtable,
+				  const struct v4l2_ctrl_mpeg2_quantisation *ctrl);
+int hantro_mpeg2_dec_init(struct hantro_ctx *ctx);
+void hantro_mpeg2_dec_exit(struct hantro_ctx *ctx);
+
+#endif
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index bbc1e9e2840e..fdb15a8a85f2 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -26,13 +26,18 @@
 
 #include "hantro.h"
 #include "hantro_av1.h"
-#include "hantro_hw.h"
 #include "hantro_h264.h"
 #include "hantro_hevc.h"
 #include "hantro_v4l2.h"
 #include "hantro_vp9.h"
 
 #define  HANTRO_DEFAULT_BIT_DEPTH 8
+#define CBS_SIZE	16	/* compression table size in bytes */
+#define CBS_LUMA	8	/* luminance CBS is composed of 1 8x8 coded block */
+#define CBS_CHROMA_W	(8 * 2)	/* chrominance CBS is composed of two 8x4 coded
+				 * blocks, with Cb CB first then Cr CB following
+				 */
+#define CBS_CHROMA_H	4
 
 static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 			      struct v4l2_pix_format_mplane *pix_mp,
diff --git a/drivers/media/platform/verisilicon/hantro_vp8.c b/drivers/media/platform/verisilicon/hantro_vp8.c
index 381bc1d3bfda..e03ab933c9a3 100644
--- a/drivers/media/platform/verisilicon/hantro_vp8.c
+++ b/drivers/media/platform/verisilicon/hantro_vp8.c
@@ -6,6 +6,7 @@
  */
 
 #include "hantro.h"
+#include "hantro_vp8.h"
 
 /*
  * probs table with packed
diff --git a/drivers/media/platform/verisilicon/hantro_vp8.h b/drivers/media/platform/verisilicon/hantro_vp8.h
new file mode 100644
index 000000000000..0307d78380d2
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_vp8.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hantro VP8 codec driver
+ *
+ * Copyright (C) 2026 Collabora Ltd.
+ */
+#ifndef _HANTRO_VP8_H_
+#define _HANTRO_VP8_H_
+
+#include "hantro_hw.h"
+
+extern const u32 hantro_vp8_dec_mc_filter[8][6];
+
+/**
+ * struct hantro_vp8_dec_hw_ctx
+ *
+ * @segment_map:	Segment map buffer.
+ * @prob_tbl:		Probability table buffer.
+ */
+struct hantro_vp8_dec_hw_ctx {
+	struct hantro_aux_buf segment_map;
+	struct hantro_aux_buf prob_tbl;
+};
+
+int hantro_vp8_dec_init(struct hantro_ctx *ctx);
+void hantro_vp8_dec_exit(struct hantro_ctx *ctx);
+void hantro_vp8_prob_update(struct hantro_ctx *ctx,
+			    const struct v4l2_ctrl_vp8_frame *hdr);
+#endif
diff --git a/drivers/media/platform/verisilicon/hantro_vp9.h b/drivers/media/platform/verisilicon/hantro_vp9.h
index fcdad2242f78..85633987d86e 100644
--- a/drivers/media/platform/verisilicon/hantro_vp9.h
+++ b/drivers/media/platform/verisilicon/hantro_vp9.h
@@ -5,6 +5,11 @@
  * Copyright (C) 2021 Collabora Ltd.
  */
 
+#ifndef _HANTRO_VP9_H_
+#define _HANTRO_VP9_H_
+
+#include "hantro_hw.h"
+
 struct hantro_g2_mv_probs {
 	u8 joint[3];
 	u8 sign[2];
@@ -101,6 +106,82 @@ struct symbol_counts {
 	u32 count_eobs[4][2][2][6][6];
 };
 
+/**
+ * struct hantro_vp9_frame_info
+ *
+ * @valid: frame info valid flag
+ * @frame_context_idx: index of frame context
+ * @reference_mode: inter prediction type
+ * @tx_mode: transform mode
+ * @interpolation_filter: filter selection for inter prediction
+ * @flags: frame flags
+ * @timestamp: frame timestamp
+ */
+struct hantro_vp9_frame_info {
+	u32 valid : 1;
+	u32 frame_context_idx : 2;
+	u32 reference_mode : 2;
+	u32 tx_mode : 3;
+	u32 interpolation_filter : 3;
+	u32 flags;
+	u64 timestamp;
+};
+
+#define MAX_SB_COLS	64
+#define MAX_SB_ROWS	34
+
+/**
+ * struct hantro_vp9_dec_hw_ctx
+ *
+ * @tile_edge: auxiliary DMA buffer for tile edge processing
+ * @segment_map: auxiliary DMA buffer for segment map
+ * @misc: auxiliary DMA buffer for tile info, probabilities and hw counters
+ * @cnts: vp9 library struct for abstracting hw counters access
+ * @probability_tables: VP9 probability tables implied by the spec
+ * @frame_context: VP9 frame contexts
+ * @cur: current frame information
+ * @last: last frame information
+ * @bsd_ctrl_offset: bsd offset into tile_edge
+ * @segment_map_size: size of segment map
+ * @ctx_counters_offset: hw counters offset into misc
+ * @tile_info_offset: tile info offset into misc
+ * @tile_r_info: per-tile information array
+ * @tile_c_info: per-tile information array
+ * @last_tile_r: last number of tile rows
+ * @last_tile_c: last number of tile cols
+ * @last_sbs_r: last number of superblock rows
+ * @last_sbs_c: last number of superblock cols
+ * @active_segment: number of active segment (alternating between 0 and 1)
+ * @feature_enabled: segmentation feature enabled flags
+ * @feature_data: segmentation feature data
+ */
+struct hantro_vp9_dec_hw_ctx {
+	struct hantro_aux_buf tile_edge;
+	struct hantro_aux_buf segment_map;
+	struct hantro_aux_buf misc;
+	struct v4l2_vp9_frame_symbol_counts cnts;
+	struct v4l2_vp9_frame_context probability_tables;
+	struct v4l2_vp9_frame_context frame_context[4];
+	struct hantro_vp9_frame_info cur;
+	struct hantro_vp9_frame_info last;
+
+	unsigned int bsd_ctrl_offset;
+	unsigned int segment_map_size;
+	unsigned int ctx_counters_offset;
+	unsigned int tile_info_offset;
+
+	unsigned short tile_r_info[MAX_SB_ROWS];
+	unsigned short tile_c_info[MAX_SB_COLS];
+	unsigned int last_tile_r;
+	unsigned int last_tile_c;
+	unsigned int last_sbs_r;
+	unsigned int last_sbs_c;
+
+	unsigned int active_segment;
+	u8 feature_enabled[8];
+	s16 feature_data[8][4];
+};
+
 static inline unsigned short hantro_vp9_num_sbs(unsigned short dimension)
 {
 	return (dimension + 63) / 64;
@@ -118,3 +199,8 @@ hantro_vp9_mv_size(unsigned int width, unsigned int height)
 	num_ctbs = hantro_vp9_num_sbs(width) * hantro_vp9_num_sbs(height);
 	return (num_ctbs * 64) * 16;
 }
+
+int hantro_vp9_dec_init(struct hantro_ctx *ctx);
+void hantro_vp9_dec_exit(struct hantro_ctx *ctx);
+
+#endif
diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
index fa4224de4b99..406a755634bc 100644
--- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
@@ -12,6 +12,11 @@
 #include "hantro_jpeg.h"
 #include "hantro_g1_regs.h"
 #include "hantro_g2_regs.h"
+#include "hantro_h264.h"
+#include "hantro_hevc.h"
+#include "hantro_mpeg2.h"
+#include "hantro_vp8.h"
+#include "hantro_vp9.h"
 
 #define CTRL_SOFT_RESET		0x00
 #define RESET_G1		BIT(1)
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
index 6da87f5184bc..0d86490a3a6e 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_h264_dec.c
@@ -15,7 +15,7 @@
 
 #include <media/v4l2-mem2mem.h>
 
-#include "hantro_hw.h"
+#include "hantro_h264.h"
 #include "hantro_v4l2.h"
 
 #define VDPU_SWREG(nr)			((nr) * 4)
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_mpeg2_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_mpeg2_dec.c
index 50a3a3eeaa00..355c4d7697a3 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_mpeg2_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_mpeg2_dec.c
@@ -9,7 +9,7 @@
 #include <linux/bitfield.h>
 #include <media/v4l2-mem2mem.h>
 #include "hantro.h"
-#include "hantro_hw.h"
+#include "hantro_mpeg2.h"
 
 #define VDPU_SWREG(nr)			((nr) * 4)
 
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
index d079075448c9..819967de8e96 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu2_hw_vp8_dec.c
@@ -14,9 +14,9 @@
 
 #include <media/v4l2-mem2mem.h>
 
-#include "hantro_hw.h"
 #include "hantro.h"
 #include "hantro_g1_regs.h"
+#include "hantro_vp8.h"
 
 #define VDPU_REG_DEC_CTRL0			0x0c8
 #define VDPU_REG_STREAM_LEN			0x0cc
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index f50a3e38097e..42176b0fd83c 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -13,6 +13,9 @@
 #include "hantro_jpeg.h"
 #include "hantro_g1_regs.h"
 #include "hantro_h1_regs.h"
+#include "hantro_h264.h"
+#include "hantro_mpeg2.h"
+#include "hantro_vp8.h"
 #include "rockchip_vpu2_regs.h"
 #include "rockchip_vpu981_regs.h"
 
diff --git a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
index 833821120b20..1d317942daa5 100644
--- a/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/stm32mp25_vpu_hw.c
@@ -11,6 +11,8 @@
 #include "hantro.h"
 #include "hantro_jpeg.h"
 #include "hantro_h1_regs.h"
+#include "hantro_h264.h"
+#include "hantro_vp8.h"
 
 /*
  * Supported formats.
diff --git a/drivers/media/platform/verisilicon/sunxi_vpu_hw.c b/drivers/media/platform/verisilicon/sunxi_vpu_hw.c
index 02ce8b064a8f..2f95f9a681ee 100644
--- a/drivers/media/platform/verisilicon/sunxi_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/sunxi_vpu_hw.c
@@ -8,6 +8,7 @@
 #include <linux/clk.h>
 
 #include "hantro.h"
+#include "hantro_vp9.h"
 
 static const struct hantro_fmt sunxi_vpu_postproc_fmts[] = {
 	{
-- 
2.43.0


