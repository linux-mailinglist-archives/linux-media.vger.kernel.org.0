Return-Path: <linux-media+bounces-55522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SMobO4L5smmLRAAAu9opvQ
	(envelope-from <linux-media+bounces-55522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:36:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D62769D0
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 18:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D80263031F37
	for <lists+linux-media@lfdr.de>; Thu, 12 Mar 2026 17:35:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07BC3FE358;
	Thu, 12 Mar 2026 17:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="huuQLpcU"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DA53FE341;
	Thu, 12 Mar 2026 17:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773336954; cv=none; b=KUctlCH2AgyYkkLsL8XMNwwF2d8hBAFIEPLQBwmLoQhX+b9Z+AZ2FKmTsLaLope8icywPcIP79ozaRu+lT/u3b2FBiAz8VPdZzuwGUrP9aieA+DlXU2LIVwnH3NvcEsxNBJgQ7GeVk4RafCdzkpSvqLBZWuQDhsJ4PC8B1Ha9B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773336954; c=relaxed/simple;
	bh=NneXaGTjSWzDPAhc2PfbEfHl46ohOzNqAdDzXnAAgB8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XsLEI6gHu/pjdz9wLGUu+sirUz6SxZ7ZQk8XaEwAE6gvcFLRadXJANpB0YUgdOPrhMNsTqMATGS3iwG+uge/uzP7acrME8K+2xWUaZrBSvu21qqI1m+aJao6j9HCuD3tM4mgFbsNOElFUDv02eX9HM2cavFhcX/wgE6z5hUJHyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=huuQLpcU; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773336950;
	bh=NneXaGTjSWzDPAhc2PfbEfHl46ohOzNqAdDzXnAAgB8=;
	h=From:To:Cc:Subject:Date:From;
	b=huuQLpcUvvGzrIBCuYGswvKu+Sw7dd2JQYLvNLITUzofzzU7n1R8ZzTuBWoF3D4PS
	 qWOzOpEjE/iMbvqW+ahy/8X25YWPFC8fXDKNINRPjLjRarJ0BpHGaJipdKED8c+OQR
	 WE+Byw4byQbF8MGngd9yeoyQP+KWaSXs8TO8zxp18lIowT9/qAI0xk2oVVAZ8LEAMC
	 sHCp7n1C+BIjoXln7RrPuppjEcoQbFJHTCI6+Z2AFr7PPBc+b2mc3+HzmOgBaX8paN
	 Y7Eb8S+ZvfiAgYNt262+r2MjJVNtRboqBQPB1ZziSaIHWtQCUz7m/jMA6wOfjmncta
	 Kfrws3R2EWWdQ==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:bc6:8179:b44d:8e5f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA18F17E0D98;
	Thu, 12 Mar 2026 18:35:49 +0100 (CET)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	heiko@sntech.de
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: verisilicon: Stop allocate mv and rfc buffers inside frame buffers
Date: Thu, 12 Mar 2026 18:35:45 +0100
Message-ID: <20260312173545.223021-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55522-lists,linux-media=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[benjamin.gaignard@collabora.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[collabora.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 757D62769D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Until now we reserve the space needed for motion vectors and reference
frame compression at the end of the frame buffer.
This method was convenient but won't fit when we will introduce secure
data path because we will want to protect YUV data but not motion vectors
or compression data.

This patch disentanglement mv and rfc from frame buffers by allocating
distinct buffers for each purpose.

Tested on imx8mq for VP8, VP9, H264 and H265 codecs.
Tested on rk3588 for AV1.
All fluster scores are remain the sames.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
Note: This patch depends on "media: verisilicon: Create AV1 helper library"
version 2

 drivers/media/platform/verisilicon/hantro.h   |  28 +-
 .../media/platform/verisilicon/hantro_av1.c   |   7 -
 .../media/platform/verisilicon/hantro_av1.h   |   1 -
 .../media/platform/verisilicon/hantro_g2.c    |  36 --
 .../platform/verisilicon/hantro_g2_hevc_dec.c |  65 ++--
 .../platform/verisilicon/hantro_g2_vp9_dec.c  |  12 +-
 .../media/platform/verisilicon/hantro_hevc.c  |  38 ++-
 .../media/platform/verisilicon/hantro_hw.h    | 103 +-----
 .../platform/verisilicon/hantro_postproc.c    |  29 +-
 .../media/platform/verisilicon/hantro_v4l2.c  | 314 ++++++++++++++++--
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  16 +-
 11 files changed, 388 insertions(+), 261 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..daee5b95480c 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -31,6 +31,9 @@ struct hantro_ctx;
 struct hantro_codec_ops;
 struct hantro_postproc_ops;
 
+#define MAX_MV_BUFFERS	MAX_POSTPROC_BUFFERS
+#define MAX_RFC_BUFFERS	MAX_POSTPROC_BUFFERS
+
 #define HANTRO_JPEG_ENCODER	BIT(0)
 #define HANTRO_ENCODERS		0x0000ffff
 #define HANTRO_MPEG2_DECODER	BIT(16)
@@ -237,6 +240,9 @@ struct hantro_dev {
  * @need_postproc:	Set to true if the bitstream features require to
  *			use the post-processor.
  *
+ * @dec_mv:		motion vectors buffers for the context.
+ * @dec_rfc:		reference frame compression buffers for the context.
+ *
  * @codec_ops:		Set of operations related to codec mode.
  * @postproc:		Post-processing context.
  * @h264_dec:		H.264-decoding context.
@@ -264,6 +270,9 @@ struct hantro_ctx {
 	int jpeg_quality;
 	int bit_depth;
 
+	struct hantro_aux_buf dec_mv[MAX_MV_BUFFERS];
+	struct hantro_aux_buf dec_rfc[MAX_RFC_BUFFERS];
+
 	const struct hantro_codec_ops *codec_ops;
 	struct hantro_postproc_ctx postproc;
 	bool need_postproc;
@@ -329,19 +338,29 @@ struct hantro_postproc_regs {
 	struct hantro_reg input_height_ext;
 };
 
+struct hantro_hevc_decoded_buffer_info {
+	/* Info needed when the decoded frame serves as a reference frame. */
+	s32 poc;
+	dma_addr_t luma_addr;
+	dma_addr_t chroma_addr;
+	dma_addr_t mv_addr;
+	dma_addr_t rfc_luma_addr;
+	dma_addr_t rfc_chroma_addr;
+};
+
 struct hantro_vp9_decoded_buffer_info {
 	/* Info needed when the decoded frame serves as a reference frame. */
 	unsigned short width;
 	unsigned short height;
 	size_t chroma_offset;
-	size_t mv_offset;
+	dma_addr_t mv_addr;
 	u32 bit_depth : 4;
 };
 
 struct hantro_av1_decoded_buffer_info {
 	/* Info needed when the decoded frame serves as a reference frame. */
 	size_t chroma_offset;
-	size_t mv_offset;
+	dma_addr_t mv_addr;
 };
 
 struct hantro_decoded_buffer {
@@ -351,6 +370,7 @@ struct hantro_decoded_buffer {
 	union {
 		struct hantro_vp9_decoded_buffer_info vp9;
 		struct hantro_av1_decoded_buffer_info av1;
+		struct hantro_hevc_decoded_buffer_info hevc;
 	};
 };
 
@@ -507,4 +527,8 @@ void hantro_postproc_free(struct hantro_ctx *ctx);
 int hanto_postproc_enum_framesizes(struct hantro_ctx *ctx,
 				   struct v4l2_frmsizeenum *fsize);
 
+dma_addr_t hantro_mv_get_buf_addr(struct hantro_ctx *ctx, int index);
+dma_addr_t hantro_rfc_get_luma_buf_addr(struct hantro_ctx *ctx, int index);
+dma_addr_t hantro_rfc_get_chroma_buf_addr(struct hantro_ctx *ctx, int index);
+
 #endif /* HANTRO_H_ */
diff --git a/drivers/media/platform/verisilicon/hantro_av1.c b/drivers/media/platform/verisilicon/hantro_av1.c
index 5a51ac877c9c..3a80a7994f67 100644
--- a/drivers/media/platform/verisilicon/hantro_av1.c
+++ b/drivers/media/platform/verisilicon/hantro_av1.c
@@ -222,13 +222,6 @@ size_t hantro_av1_luma_size(struct hantro_ctx *ctx)
 	return ctx->ref_fmt.plane_fmt[0].bytesperline * ctx->ref_fmt.height;
 }
 
-size_t hantro_av1_chroma_size(struct hantro_ctx *ctx)
-{
-	size_t cr_offset = hantro_av1_luma_size(ctx);
-
-	return ALIGN((cr_offset * 3) / 2, 64);
-}
-
 static void hantro_av1_tiles_free(struct hantro_ctx *ctx)
 {
 	struct hantro_dev *vpu = ctx->dev;
diff --git a/drivers/media/platform/verisilicon/hantro_av1.h b/drivers/media/platform/verisilicon/hantro_av1.h
index 4e2122b95cdd..330f7938d097 100644
--- a/drivers/media/platform/verisilicon/hantro_av1.h
+++ b/drivers/media/platform/verisilicon/hantro_av1.h
@@ -41,7 +41,6 @@ int hantro_av1_get_order_hint(struct hantro_ctx *ctx, int ref);
 int hantro_av1_frame_ref(struct hantro_ctx *ctx, u64 timestamp);
 void hantro_av1_clean_refs(struct hantro_ctx *ctx);
 size_t hantro_av1_luma_size(struct hantro_ctx *ctx);
-size_t hantro_av1_chroma_size(struct hantro_ctx *ctx);
 void hantro_av1_exit(struct hantro_ctx *ctx);
 int hantro_av1_init(struct hantro_ctx *ctx);
 int hantro_av1_prepare_run(struct hantro_ctx *ctx);
diff --git a/drivers/media/platform/verisilicon/hantro_g2.c b/drivers/media/platform/verisilicon/hantro_g2.c
index 318673b66da8..4ae7df53dcb1 100644
--- a/drivers/media/platform/verisilicon/hantro_g2.c
+++ b/drivers/media/platform/verisilicon/hantro_g2.c
@@ -99,39 +99,3 @@ size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx)
 {
 	return ctx->ref_fmt.plane_fmt[0].bytesperline *	ctx->ref_fmt.height;
 }
-
-size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx)
-{
-	size_t cr_offset = hantro_g2_chroma_offset(ctx);
-
-	return ALIGN((cr_offset * 3) / 2, G2_ALIGN);
-}
-
-static size_t hantro_g2_mv_size(struct hantro_ctx *ctx)
-{
-	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
-	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
-	unsigned int pic_width_in_ctbs, pic_height_in_ctbs;
-	unsigned int max_log2_ctb_size;
-
-	max_log2_ctb_size = sps->log2_min_luma_coding_block_size_minus3 + 3 +
-			    sps->log2_diff_max_min_luma_coding_block_size;
-	pic_width_in_ctbs = (sps->pic_width_in_luma_samples +
-			    (1 << max_log2_ctb_size) - 1) >> max_log2_ctb_size;
-	pic_height_in_ctbs = (sps->pic_height_in_luma_samples + (1 << max_log2_ctb_size) - 1)
-			     >> max_log2_ctb_size;
-
-	return pic_width_in_ctbs * pic_height_in_ctbs * (1 << (2 * (max_log2_ctb_size - 4))) * 16;
-}
-
-size_t hantro_g2_luma_compress_offset(struct hantro_ctx *ctx)
-{
-	return hantro_g2_motion_vectors_offset(ctx) +
-	       hantro_g2_mv_size(ctx);
-}
-
-size_t hantro_g2_chroma_compress_offset(struct hantro_ctx *ctx)
-{
-	return hantro_g2_luma_compress_offset(ctx) +
-	       hantro_hevc_luma_compressed_size(ctx->dst_fmt.width, ctx->dst_fmt.height);
-}
diff --git a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
index e8c2e83379de..5240cf9b5f58 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -377,15 +377,9 @@ static int set_ref(struct hantro_ctx *ctx)
 	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
 	const struct v4l2_ctrl_hevc_decode_params *decode_params = ctrls->decode_params;
 	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
-	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
-	dma_addr_t compress_luma_addr, compress_chroma_addr = 0;
 	struct hantro_dev *vpu = ctx->dev;
 	struct vb2_v4l2_buffer *vb2_dst;
-	struct hantro_decoded_buffer *dst;
-	size_t cr_offset = hantro_g2_chroma_offset(ctx);
-	size_t mv_offset = hantro_g2_motion_vectors_offset(ctx);
-	size_t compress_luma_offset = hantro_g2_luma_compress_offset(ctx);
-	size_t compress_chroma_offset = hantro_g2_chroma_compress_offset(ctx);
+	struct hantro_decoded_buffer *ref;
 	u32 max_ref_frames;
 	u16 dpb_longterm_e;
 	static const struct hantro_reg cur_poc[] = {
@@ -453,50 +447,37 @@ static int set_ref(struct hantro_ctx *ctx)
 	dpb_longterm_e = 0;
 	for (i = 0; i < decode_params->num_active_dpb_entries &&
 	     i < (V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1); i++) {
-		luma_addr = hantro_hevc_get_ref_buf(ctx, dpb[i].pic_order_cnt_val);
-		if (!luma_addr)
+		vb2_dst = hantro_hevc_get_ref_buf(ctx, dpb[i].pic_order_cnt_val);
+		if (!vb2_dst)
 			return -ENOMEM;
 
-		chroma_addr = luma_addr + cr_offset;
-		mv_addr = luma_addr + mv_offset;
-		compress_luma_addr = luma_addr + compress_luma_offset;
-		compress_chroma_addr = luma_addr + compress_chroma_offset;
-
 		if (dpb[i].flags & V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
 			dpb_longterm_e |= BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
 
-		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), luma_addr);
-		hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), chroma_addr);
-		hantro_write_addr(vpu, G2_REF_MV_ADDR(i), mv_addr);
-		hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i), compress_luma_addr);
-		hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i), compress_chroma_addr);
+		ref = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
+		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), ref->hevc.luma_addr);
+		hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), ref->hevc.chroma_addr);
+		hantro_write_addr(vpu, G2_REF_MV_ADDR(i), ref->hevc.mv_addr);
+		hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i), ref->hevc.rfc_luma_addr);
+		hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i), ref->hevc.rfc_chroma_addr);
 	}
 
-	vb2_dst = hantro_get_dst_buf(ctx);
-	dst = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
-	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
-	if (!luma_addr)
-		return -ENOMEM;
-
-	if (hantro_hevc_add_ref_buf(ctx, decode_params->pic_order_cnt_val, luma_addr))
+	vb2_dst = hantro_hevc_add_ref_buf(ctx, decode_params->pic_order_cnt_val);
+	if (!vb2_dst)
 		return -EINVAL;
 
-	chroma_addr = luma_addr + cr_offset;
-	mv_addr = luma_addr + mv_offset;
-	compress_luma_addr = luma_addr + compress_luma_offset;
-	compress_chroma_addr = luma_addr + compress_chroma_offset;
-
-	hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), luma_addr);
-	hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), chroma_addr);
-	hantro_write_addr(vpu, G2_REF_MV_ADDR(i), mv_addr);
-	hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i), compress_luma_addr);
-	hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i++), compress_chroma_addr);
-
-	hantro_write_addr(vpu, G2_OUT_LUMA_ADDR, luma_addr);
-	hantro_write_addr(vpu, G2_OUT_CHROMA_ADDR, chroma_addr);
-	hantro_write_addr(vpu, G2_OUT_MV_ADDR, mv_addr);
-	hantro_write_addr(vpu, G2_OUT_COMP_LUMA_ADDR, compress_luma_addr);
-	hantro_write_addr(vpu, G2_OUT_COMP_CHROMA_ADDR, compress_chroma_addr);
+	ref = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
+	hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), ref->hevc.luma_addr);
+	hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), ref->hevc.chroma_addr);
+	hantro_write_addr(vpu, G2_REF_MV_ADDR(i), ref->hevc.mv_addr);
+	hantro_write_addr(vpu, G2_REF_COMP_LUMA_ADDR(i), ref->hevc.rfc_luma_addr);
+	hantro_write_addr(vpu, G2_REF_COMP_CHROMA_ADDR(i++), ref->hevc.rfc_chroma_addr);
+
+	hantro_write_addr(vpu, G2_OUT_LUMA_ADDR, ref->hevc.luma_addr);
+	hantro_write_addr(vpu, G2_OUT_CHROMA_ADDR, ref->hevc.chroma_addr);
+	hantro_write_addr(vpu, G2_OUT_MV_ADDR, ref->hevc.mv_addr);
+	hantro_write_addr(vpu, G2_OUT_COMP_LUMA_ADDR, ref->hevc.rfc_luma_addr);
+	hantro_write_addr(vpu, G2_OUT_COMP_CHROMA_ADDR, ref->hevc.rfc_chroma_addr);
 
 	for (; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
 		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), 0);
diff --git a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
index 56c79e339030..1e96d0fce72a 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_vp9_dec.c
@@ -129,7 +129,7 @@ static void config_output(struct hantro_ctx *ctx,
 			  struct hantro_decoded_buffer *dst,
 			  const struct v4l2_ctrl_vp9_frame *dec_params)
 {
-	dma_addr_t luma_addr, chroma_addr, mv_addr;
+	dma_addr_t luma_addr, chroma_addr;
 
 	hantro_reg_write(ctx->dev, &g2_out_dis, 0);
 	if (!ctx->dev->variant->legacy_regs)
@@ -142,9 +142,8 @@ static void config_output(struct hantro_ctx *ctx,
 	hantro_write_addr(ctx->dev, G2_OUT_CHROMA_ADDR, chroma_addr);
 	dst->vp9.chroma_offset = hantro_g2_chroma_offset(ctx);
 
-	mv_addr = luma_addr + hantro_g2_motion_vectors_offset(ctx);
-	hantro_write_addr(ctx->dev, G2_OUT_MV_ADDR, mv_addr);
-	dst->vp9.mv_offset = hantro_g2_motion_vectors_offset(ctx);
+	dst->vp9.mv_addr = hantro_mv_get_buf_addr(ctx, dst->base.vb.vb2_buf.index);
+	hantro_write_addr(ctx->dev, G2_OUT_MV_ADDR, dst->vp9.mv_addr);
 }
 
 struct hantro_vp9_ref_reg {
@@ -215,15 +214,12 @@ static void config_ref_registers(struct hantro_ctx *ctx,
 			.c_base = G2_REF_CHROMA_ADDR(5),
 		},
 	};
-	dma_addr_t mv_addr;
 
 	config_ref(ctx, dst, &ref_regs[0], dec_params, dec_params->last_frame_ts);
 	config_ref(ctx, dst, &ref_regs[1], dec_params, dec_params->golden_frame_ts);
 	config_ref(ctx, dst, &ref_regs[2], dec_params, dec_params->alt_frame_ts);
 
-	mv_addr = hantro_get_dec_buf_addr(ctx, &mv_ref->base.vb.vb2_buf) +
-		  mv_ref->vp9.mv_offset;
-	hantro_write_addr(ctx->dev, G2_REF_MV_ADDR(0), mv_addr);
+	hantro_write_addr(ctx->dev, G2_REF_MV_ADDR(0), mv_ref->vp9.mv_addr);
 
 	hantro_reg_write(ctx->dev, &vp9_last_sign_bias,
 			 dec_params->ref_frame_sign_bias & V4L2_VP9_SIGN_BIAS_LAST ? 1 : 0);
diff --git a/drivers/media/platform/verisilicon/hantro_hevc.c b/drivers/media/platform/verisilicon/hantro_hevc.c
index 83cd12b0ddd6..7ea1dc57a639 100644
--- a/drivers/media/platform/verisilicon/hantro_hevc.c
+++ b/drivers/media/platform/verisilicon/hantro_hevc.c
@@ -37,39 +37,57 @@ void hantro_hevc_ref_init(struct hantro_ctx *ctx)
 	hevc_dec->ref_bufs_used = 0;
 }
 
-dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx,
-				   s32 poc)
+struct vb2_v4l2_buffer *hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, s32 poc)
 {
 	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
+	struct hantro_decoded_buffer *ref;
 	int i;
 
 	/* Find the reference buffer in already known ones */
 	for (i = 0;  i < NUM_REF_PICTURES; i++) {
-		if (hevc_dec->ref_bufs_poc[i] == poc) {
+		ref = vb2_to_hantro_decoded_buf(&hevc_dec->vb2_ref[i]->vb2_buf);
+		if (ref->hevc.poc == poc) {
 			hevc_dec->ref_bufs_used |= 1 << i;
-			return hevc_dec->ref_bufs[i].dma;
+			return hevc_dec->vb2_ref[i];
 		}
 	}
 
-	return 0;
+	return NULL;
 }
 
-int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr)
+struct vb2_v4l2_buffer *hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc)
 {
 	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
+	struct hantro_decoded_buffer *dst;
 	int i;
 
 	/* Add a new reference buffer */
 	for (i = 0; i < NUM_REF_PICTURES; i++) {
 		if (!(hevc_dec->ref_bufs_used & 1 << i)) {
 			hevc_dec->ref_bufs_used |= 1 << i;
-			hevc_dec->ref_bufs_poc[i] = poc;
-			hevc_dec->ref_bufs[i].dma = addr;
-			return 0;
+			hevc_dec->vb2_ref[i] = hantro_get_dst_buf(ctx);
+			dst = vb2_to_hantro_decoded_buf(&hevc_dec->vb2_ref[i]->vb2_buf);
+			dst->hevc.poc = poc;
+			dst->hevc.luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
+			dst->hevc.chroma_addr = dst->hevc.luma_addr + hantro_g2_chroma_offset(ctx);
+			dst->hevc.mv_addr = hantro_mv_get_buf_addr(ctx, dst->base.vb.vb2_buf.index);
+			if (ctx->hevc_dec.use_compression) {
+				dst->hevc.rfc_luma_addr =
+					hantro_rfc_get_luma_buf_addr(ctx,
+								     dst->base.vb.vb2_buf.index);
+				dst->hevc.rfc_chroma_addr =
+					hantro_rfc_get_chroma_buf_addr(ctx,
+								       dst->base.vb.vb2_buf.index);
+			} else {
+				dst->hevc.rfc_luma_addr = 0;
+				dst->hevc.rfc_chroma_addr = 0;
+			}
+
+			return hevc_dec->vb2_ref[i];
 		}
 	}
 
-	return -EINVAL;
+	return NULL;
 }
 
 static int tile_buffer_reallocate(struct hantro_ctx *ctx)
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index f0e4bca4b2b2..74e20fc82630 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -147,8 +147,8 @@ struct hantro_hevc_dec_ctrls {
  * @tile_bsd:		Tile BSD control buffer
  * @ref_bufs:		Internal reference buffers
  * @scaling_lists:	Scaling lists buffer
- * @ref_bufs_poc:	Internal reference buffers picture order count
  * @ref_bufs_used:	Bitfield of used reference buffers
+ * @vb2_ref:		Reference buffers
  * @ctrls:		V4L2 controls attached to a run
  * @num_tile_cols_allocated: number of allocated tiles
  * @use_compression:	use reference buffer compression
@@ -158,10 +158,9 @@ struct hantro_hevc_dec_hw_ctx {
 	struct hantro_aux_buf tile_filter;
 	struct hantro_aux_buf tile_sao;
 	struct hantro_aux_buf tile_bsd;
-	struct hantro_aux_buf ref_bufs[NUM_REF_PICTURES];
 	struct hantro_aux_buf scaling_lists;
-	s32 ref_bufs_poc[NUM_REF_PICTURES];
 	u32 ref_bufs_used;
+	struct vb2_v4l2_buffer *vb2_ref[NUM_REF_PICTURES];
 	struct hantro_hevc_dec_ctrls ctrls;
 	unsigned int num_tile_cols_allocated;
 	bool use_compression;
@@ -456,8 +455,9 @@ void hantro_hevc_dec_exit(struct hantro_ctx *ctx);
 int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
 int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
 void hantro_hevc_ref_init(struct hantro_ctx *ctx);
-dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, s32 poc);
-int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr);
+struct vb2_v4l2_buffer *hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, s32 poc);
+struct vb2_v4l2_buffer *hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc);
+int hantro_hevc_get_ref_buf_index(struct hantro_ctx *ctx, s32 poc);
 
 int rockchip_vpu981_av1_dec_init(struct hantro_ctx *ctx);
 void rockchip_vpu981_av1_dec_exit(struct hantro_ctx *ctx);
@@ -469,100 +469,7 @@ static inline unsigned short hantro_vp9_num_sbs(unsigned short dimension)
 	return (dimension + 63) / 64;
 }
 
-static inline size_t
-hantro_vp9_mv_size(unsigned int width, unsigned int height)
-{
-	int num_ctbs;
-
-	/*
-	 * There can be up to (CTBs x 64) number of blocks,
-	 * and the motion vector for each block needs 16 bytes.
-	 */
-	num_ctbs = hantro_vp9_num_sbs(width) * hantro_vp9_num_sbs(height);
-	return (num_ctbs * 64) * 16;
-}
-
-static inline size_t
-hantro_h264_mv_size(unsigned int width, unsigned int height)
-{
-	/*
-	 * A decoded 8-bit 4:2:0 NV12 frame may need memory for up to
-	 * 448 bytes per macroblock with additional 32 bytes on
-	 * multi-core variants.
-	 *
-	 * The H264 decoder needs extra space on the output buffers
-	 * to store motion vectors. This is needed for reference
-	 * frames and only if the format is non-post-processed NV12.
-	 *
-	 * Memory layout is as follow:
-	 *
-	 * +---------------------------+
-	 * | Y-plane   256 bytes x MBs |
-	 * +---------------------------+
-	 * | UV-plane  128 bytes x MBs |
-	 * +---------------------------+
-	 * | MV buffer  64 bytes x MBs |
-	 * +---------------------------+
-	 * | MC sync          32 bytes |
-	 * +---------------------------+
-	 */
-	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
-}
-
-static inline size_t
-hantro_hevc_mv_size(unsigned int width, unsigned int height)
-{
-	/*
-	 * A CTB can be 64x64, 32x32 or 16x16.
-	 * Allocated memory for the "worse" case: 16x16
-	 */
-	return width * height / 16;
-}
-
-static inline size_t
-hantro_hevc_luma_compressed_size(unsigned int width, unsigned int height)
-{
-	u32 pic_width_in_cbsy =
-		round_up((width + CBS_LUMA - 1) / CBS_LUMA, CBS_SIZE);
-	u32 pic_height_in_cbsy = (height + CBS_LUMA - 1) / CBS_LUMA;
-
-	return round_up(pic_width_in_cbsy * pic_height_in_cbsy, CBS_SIZE);
-}
-
-static inline size_t
-hantro_hevc_chroma_compressed_size(unsigned int width, unsigned int height)
-{
-	u32 pic_width_in_cbsc =
-		round_up((width + CBS_CHROMA_W - 1) / CBS_CHROMA_W, CBS_SIZE);
-	u32 pic_height_in_cbsc = (height / 2 + CBS_CHROMA_H - 1) / CBS_CHROMA_H;
-
-	return round_up(pic_width_in_cbsc * pic_height_in_cbsc, CBS_SIZE);
-}
-
-static inline size_t
-hantro_hevc_compressed_size(unsigned int width, unsigned int height)
-{
-	return hantro_hevc_luma_compressed_size(width, height) +
-	       hantro_hevc_chroma_compressed_size(width, height);
-}
-
-static inline unsigned short hantro_av1_num_sbs(unsigned short dimension)
-{
-	return DIV_ROUND_UP(dimension, 64);
-}
-
-static inline size_t
-hantro_av1_mv_size(unsigned int width, unsigned int height)
-{
-	size_t num_sbs = hantro_av1_num_sbs(width) * hantro_av1_num_sbs(height);
-
-	return ALIGN(num_sbs * 384, 16) * 2 + 512;
-}
-
 size_t hantro_g2_chroma_offset(struct hantro_ctx *ctx);
-size_t hantro_g2_motion_vectors_offset(struct hantro_ctx *ctx);
-size_t hantro_g2_luma_compress_offset(struct hantro_ctx *ctx);
-size_t hantro_g2_chroma_compress_offset(struct hantro_ctx *ctx);
 
 int hantro_g1_mpeg2_dec_run(struct hantro_ctx *ctx);
 int rockchip_vpu2_mpeg2_dec_run(struct hantro_ctx *ctx);
diff --git a/drivers/media/platform/verisilicon/hantro_postproc.c b/drivers/media/platform/verisilicon/hantro_postproc.c
index e94d1ba5ef10..2409353c16e4 100644
--- a/drivers/media/platform/verisilicon/hantro_postproc.c
+++ b/drivers/media/platform/verisilicon/hantro_postproc.c
@@ -196,36 +196,11 @@ void hantro_postproc_free(struct hantro_ctx *ctx)
 	}
 }
 
-static unsigned int hantro_postproc_buffer_size(struct hantro_ctx *ctx)
-{
-	unsigned int buf_size;
-
-	buf_size = ctx->ref_fmt.plane_fmt[0].sizeimage;
-	if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE)
-		buf_size += hantro_h264_mv_size(ctx->ref_fmt.width,
-						ctx->ref_fmt.height);
-	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME)
-		buf_size += hantro_vp9_mv_size(ctx->ref_fmt.width,
-					       ctx->ref_fmt.height);
-	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE) {
-		buf_size += hantro_hevc_mv_size(ctx->ref_fmt.width,
-						ctx->ref_fmt.height);
-		if (ctx->hevc_dec.use_compression)
-			buf_size += hantro_hevc_compressed_size(ctx->ref_fmt.width,
-								ctx->ref_fmt.height);
-	}
-	else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_AV1_FRAME)
-		buf_size += hantro_av1_mv_size(ctx->ref_fmt.width,
-					       ctx->ref_fmt.height);
-
-	return buf_size;
-}
-
 static int hantro_postproc_alloc(struct hantro_ctx *ctx, int index)
 {
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
-	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
+	unsigned int buf_size = ctx->ref_fmt.plane_fmt[0].sizeimage;
 
 	if (!buf_size)
 		return -EINVAL;
@@ -267,7 +242,7 @@ dma_addr_t
 hantro_postproc_get_dec_buf_addr(struct hantro_ctx *ctx, int index)
 {
 	struct hantro_aux_buf *priv = &ctx->postproc.dec_q[index];
-	unsigned int buf_size = hantro_postproc_buffer_size(ctx);
+	unsigned int buf_size = ctx->ref_fmt.plane_fmt[0].sizeimage;
 	struct hantro_dev *vpu = ctx->dev;
 	int ret;
 
diff --git a/drivers/media/platform/verisilicon/hantro_v4l2.c b/drivers/media/platform/verisilicon/hantro_v4l2.c
index fcf3bd9bcda2..6a876142c224 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -36,6 +36,9 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 			      struct v4l2_pix_format_mplane *pix_mp);
 
+static void hantro_mv_free(struct hantro_ctx *ctx);
+static void hantro_rfc_free(struct hantro_ctx *ctx);
+
 static const struct hantro_fmt *
 hantro_get_formats(const struct hantro_ctx *ctx, unsigned int *num_fmts, bool need_postproc)
 {
@@ -362,26 +365,6 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
 		/* Fill remaining fields */
 		v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, pix_mp->width,
 				    pix_mp->height);
-		if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_H264_SLICE &&
-		    !hantro_needs_postproc(ctx, fmt))
-			pix_mp->plane_fmt[0].sizeimage +=
-				hantro_h264_mv_size(pix_mp->width,
-						    pix_mp->height);
-		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_VP9_FRAME &&
-			 !hantro_needs_postproc(ctx, fmt))
-			pix_mp->plane_fmt[0].sizeimage +=
-				hantro_vp9_mv_size(pix_mp->width,
-						   pix_mp->height);
-		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_HEVC_SLICE &&
-			 !hantro_needs_postproc(ctx, fmt))
-			pix_mp->plane_fmt[0].sizeimage +=
-				hantro_hevc_mv_size(pix_mp->width,
-						    pix_mp->height);
-		else if (ctx->vpu_src_fmt->fourcc == V4L2_PIX_FMT_AV1_FRAME &&
-			 !hantro_needs_postproc(ctx, fmt))
-			pix_mp->plane_fmt[0].sizeimage +=
-				hantro_av1_mv_size(pix_mp->width,
-						   pix_mp->height);
 	} else if (!pix_mp->plane_fmt[0].sizeimage) {
 		/*
 		 * For coded formats the application can specify
@@ -999,6 +982,9 @@ static void hantro_stop_streaming(struct vb2_queue *q)
 	if (V4L2_TYPE_IS_OUTPUT(q->type) &&
 	    v4l2_m2m_has_stopped(ctx->fh.m2m_ctx))
 		v4l2_event_queue_fh(&ctx->fh, &hantro_eos_event);
+
+	hantro_mv_free(ctx);
+	hantro_rfc_free(ctx);
 }
 
 static void hantro_buf_request_complete(struct vb2_buffer *vb)
@@ -1025,3 +1011,291 @@ const struct vb2_ops hantro_queue_ops = {
 	.start_streaming = hantro_start_streaming,
 	.stop_streaming = hantro_stop_streaming,
 };
+
+static size_t
+hantro_vp9_mv_size(unsigned int width, unsigned int height)
+{
+	int num_ctbs;
+
+	/*
+	 * There can be up to (CTBs x 64) number of blocks,
+	 * and the motion vector for each block needs 16 bytes.
+	 */
+	num_ctbs = hantro_vp9_num_sbs(width) * hantro_vp9_num_sbs(height);
+	return (num_ctbs * 64) * 16;
+}
+
+static size_t
+hantro_h264_mv_size(unsigned int width, unsigned int height)
+{
+	/*
+	 * A decoded 8-bit 4:2:0 NV12 frame may need memory for up to
+	 * 448 bytes per macroblock with additional 32 bytes on
+	 * multi-core variants.
+	 *
+	 * The H264 decoder needs extra space on the output buffers
+	 * to store motion vectors. This is needed for reference
+	 * frames and only if the format is non-post-processed NV12.
+	 *
+	 * Memory layout is as follow:
+	 *
+	 * +---------------------------+
+	 * | Y-plane   256 bytes x MBs |
+	 * +---------------------------+
+	 * | UV-plane  128 bytes x MBs |
+	 * +---------------------------+
+	 * | MV buffer  64 bytes x MBs |
+	 * +---------------------------+
+	 * | MC sync          32 bytes |
+	 * +---------------------------+
+	 */
+	return 64 * MB_WIDTH(width) * MB_WIDTH(height) + 32;
+}
+
+static size_t
+hantro_hevc_mv_size(unsigned int width, unsigned int height, int depth)
+{
+	/*
+	 * A CTB can be 64x64, 32x32 or 16x16.
+	 * Allocated memory for the "worse" case: 16x16
+	 */
+	return DIV_ROUND_UP(width * height * depth / 8, 16);
+}
+
+static inline unsigned short hantro_av1_num_sbs(unsigned short dimension)
+{
+	return DIV_ROUND_UP(dimension, 64);
+}
+
+static size_t
+hantro_av1_mv_size(unsigned int width, unsigned int height)
+{
+	size_t num_sbs = hantro_av1_num_sbs(width) * hantro_av1_num_sbs(height);
+
+	return ALIGN(num_sbs * 384, 16) * 2 + 512;
+}
+
+static void hantro_mv_free(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	int i;
+
+	for (i = 0; i < MAX_MV_BUFFERS; i++) {
+		struct hantro_aux_buf *mv = &ctx->dec_mv[i];
+
+		if (!mv->cpu)
+			continue;
+
+		dma_free_attrs(vpu->dev, mv->size, mv->cpu,
+			       mv->dma, mv->attrs);
+		mv->cpu = NULL;
+	}
+}
+
+static unsigned int hantro_mv_buffer_size(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	int fourcc = ctx->vpu_src_fmt->fourcc;
+	int width = ctx->ref_fmt.width;
+	int height = ctx->ref_fmt.height;
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_H264_SLICE:
+		return hantro_h264_mv_size(width, height);
+	case V4L2_PIX_FMT_VP9_FRAME:
+		return hantro_vp9_mv_size(width, height);
+	case V4L2_PIX_FMT_HEVC_SLICE:
+		return hantro_hevc_mv_size(width, height, ctx->bit_depth);
+	case V4L2_PIX_FMT_AV1_FRAME:
+		return hantro_av1_mv_size(width, height);
+	}
+
+	/* Should not happen */
+	dev_warn(vpu->dev, "Invalid motion vectors size\n");
+	return 0;
+}
+
+static int hantro_mv_buffer_alloc(struct hantro_ctx *ctx, int index)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_aux_buf *mv = &ctx->dec_mv[index];
+	unsigned int buf_size = hantro_mv_buffer_size(ctx);
+
+	if (!buf_size)
+		return -EINVAL;
+
+	/*
+	 * Motion vectors buffers are only read and write by the
+	 * hardware so no mapping is needed.
+	 */
+	mv->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+	mv->cpu = dma_alloc_attrs(vpu->dev, buf_size, &mv->dma,
+				  GFP_KERNEL, mv->attrs);
+	if (!mv->cpu)
+		return -ENOMEM;
+	mv->size = buf_size;
+
+	return 0;
+}
+
+dma_addr_t
+hantro_mv_get_buf_addr(struct hantro_ctx *ctx, int index)
+{
+	struct hantro_aux_buf *mv = &ctx->dec_mv[index];
+	unsigned int buf_size = hantro_mv_buffer_size(ctx);
+	struct hantro_dev *vpu = ctx->dev;
+	int ret;
+
+	if (mv->size < buf_size && mv->cpu) {
+		/* buffer is too small, release it */
+		dma_free_attrs(vpu->dev, mv->size, mv->cpu,
+			       mv->dma, mv->attrs);
+		mv->cpu = NULL;
+	}
+
+	if (!mv->cpu) {
+		/* buffer not already allocated, try getting a new one */
+		ret = hantro_mv_buffer_alloc(ctx, index);
+		if (ret)
+			return 0;
+	}
+
+	if (!mv->cpu)
+		return 0;
+
+	return mv->dma;
+}
+
+static inline size_t
+hantro_hevc_luma_compressed_size(unsigned int width, unsigned int height)
+{
+	u32 pic_width_in_cbsy =
+		round_up((width + CBS_LUMA - 1) / CBS_LUMA, CBS_SIZE);
+	u32 pic_height_in_cbsy = (height + CBS_LUMA - 1) / CBS_LUMA;
+
+	return round_up(pic_width_in_cbsy * pic_height_in_cbsy, CBS_SIZE);
+}
+
+static inline size_t
+hantro_hevc_chroma_compressed_size(unsigned int width, unsigned int height)
+{
+	u32 pic_width_in_cbsc =
+		round_up((width + CBS_CHROMA_W - 1) / CBS_CHROMA_W, CBS_SIZE);
+	u32 pic_height_in_cbsc = (height / 2 + CBS_CHROMA_H - 1) / CBS_CHROMA_H;
+
+	return round_up(pic_width_in_cbsc * pic_height_in_cbsc, CBS_SIZE);
+}
+
+static inline size_t
+hantro_hevc_compressed_size(unsigned int width, unsigned int height)
+{
+	return hantro_hevc_luma_compressed_size(width, height) +
+	       hantro_hevc_chroma_compressed_size(width, height);
+}
+
+static void hantro_rfc_free(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	int i;
+
+	for (i = 0; i < MAX_MV_BUFFERS; i++) {
+		struct hantro_aux_buf *rfc = &ctx->dec_rfc[i];
+
+		if (!rfc->cpu)
+			continue;
+
+		dma_free_attrs(vpu->dev, rfc->size, rfc->cpu,
+			       rfc->dma, rfc->attrs);
+		rfc->cpu = NULL;
+	}
+}
+
+static unsigned int hantro_rfc_buffer_size(struct hantro_ctx *ctx)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	int fourcc = ctx->vpu_src_fmt->fourcc;
+	int width = ctx->ref_fmt.width;
+	int height = ctx->ref_fmt.height;
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_HEVC_SLICE:
+		return hantro_hevc_compressed_size(width, height);
+	}
+
+	/* Should not happen */
+	dev_warn(vpu->dev, "Invalid rfc size\n");
+	return 0;
+}
+
+static int hantro_rfc_buffer_alloc(struct hantro_ctx *ctx, int index)
+{
+	struct hantro_dev *vpu = ctx->dev;
+	struct hantro_aux_buf *rfc = &ctx->dec_rfc[index];
+	unsigned int buf_size = hantro_rfc_buffer_size(ctx);
+
+	if (!buf_size)
+		return -EINVAL;
+
+	/*
+	 * RFC buffers are only read and write by the
+	 * hardware so no mapping is needed.
+	 */
+	rfc->attrs = DMA_ATTR_NO_KERNEL_MAPPING;
+	rfc->cpu = dma_alloc_attrs(vpu->dev, buf_size, &rfc->dma,
+				   GFP_KERNEL, rfc->attrs);
+	if (!rfc->cpu)
+		return -ENOMEM;
+	rfc->size = buf_size;
+
+	return 0;
+}
+
+dma_addr_t
+hantro_rfc_get_luma_buf_addr(struct hantro_ctx *ctx, int index)
+{
+	struct hantro_aux_buf *rfc = &ctx->dec_rfc[index];
+	unsigned int buf_size = hantro_rfc_buffer_size(ctx);
+	struct hantro_dev *vpu = ctx->dev;
+	int ret;
+
+	if (rfc->size < buf_size && rfc->cpu) {
+		/* buffer is too small, release it */
+		dma_free_attrs(vpu->dev, rfc->size, rfc->cpu,
+			       rfc->dma, rfc->attrs);
+		rfc->cpu = NULL;
+	}
+
+	if (!rfc->cpu) {
+		/* buffer not already allocated, try getting a new one */
+		ret = hantro_rfc_buffer_alloc(ctx, index);
+		if (ret)
+			return 0;
+	}
+
+	if (!rfc->cpu)
+		return 0;
+
+	return rfc->dma;
+}
+
+dma_addr_t
+hantro_rfc_get_chroma_buf_addr(struct hantro_ctx *ctx, int index)
+{
+	dma_addr_t luma_addr = hantro_rfc_get_luma_buf_addr(ctx, index);
+	struct hantro_dev *vpu = ctx->dev;
+	int fourcc = ctx->vpu_src_fmt->fourcc;
+	int width = ctx->ref_fmt.width;
+	int height = ctx->ref_fmt.height;
+
+	if (!luma_addr)
+		return -EINVAL;
+
+	switch (fourcc) {
+	case V4L2_PIX_FMT_HEVC_SLICE:
+		return luma_addr + hantro_hevc_luma_compressed_size(width, height);
+	}
+
+	/* Should not happen */
+	dev_warn(vpu->dev, "Invalid rfc chroma address\n");
+	return 0;
+}
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index c1ada14df4c3..21da8ddfc4b3 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
@@ -62,7 +62,7 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
 	const struct v4l2_ctrl_av1_frame *frame = ctrls->frame;
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_decoded_buffer *dst;
-	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
+	dma_addr_t luma_addr, chroma_addr = 0;
 	int cur_width = frame->frame_width_minus_1 + 1;
 	int cur_height = frame->frame_height_minus_1 + 1;
 	int scale_width =
@@ -120,11 +120,10 @@ rockchip_vpu981_av1_dec_set_ref(struct hantro_ctx *ctx, int ref, int idx,
 	dst = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
 	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
 	chroma_addr = luma_addr + dst->av1.chroma_offset;
-	mv_addr = luma_addr + dst->av1.mv_offset;
 
 	hantro_write_addr(vpu, AV1_REFERENCE_Y(ref), luma_addr);
 	hantro_write_addr(vpu, AV1_REFERENCE_CB(ref), chroma_addr);
-	hantro_write_addr(vpu, AV1_REFERENCE_MV(ref), mv_addr);
+	hantro_write_addr(vpu, AV1_REFERENCE_MV(ref), dst->av1.mv_addr);
 
 	return (scale_width != (1 << AV1_REF_SCALE_SHIFT)) ||
 		(scale_height != (1 << AV1_REF_SCALE_SHIFT));
@@ -180,11 +179,10 @@ static void rockchip_vpu981_av1_dec_set_segmentation(struct hantro_ctx *ctx)
 		if (idx >= 0) {
 			dma_addr_t luma_addr, mv_addr = 0;
 			struct hantro_decoded_buffer *seg;
-			size_t mv_offset = hantro_av1_chroma_size(ctx);
 
 			seg = vb2_to_hantro_decoded_buf(&av1_dec->frame_refs[idx].vb2_ref->vb2_buf);
 			luma_addr = hantro_get_dec_buf_addr(ctx, &seg->base.vb.vb2_buf);
-			mv_addr = luma_addr + mv_offset;
+			mv_addr = hantro_mv_get_buf_addr(ctx, seg->base.vb.vb2_buf.index);
 
 			hantro_write_addr(vpu, AV1_SEGMENTATION, mv_addr);
 			hantro_reg_write(vpu, &av1_use_temporal3_mvs, 1);
@@ -1350,22 +1348,20 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
 	struct hantro_dev *vpu = ctx->dev;
 	struct hantro_decoded_buffer *dst;
 	struct vb2_v4l2_buffer *vb2_dst;
-	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
+	dma_addr_t luma_addr, chroma_addr = 0;
 	size_t cr_offset = hantro_av1_luma_size(ctx);
-	size_t mv_offset = hantro_av1_chroma_size(ctx);
 
 	vb2_dst = av1_dec->frame_refs[av1_dec->current_frame_index].vb2_ref;
 	dst = vb2_to_hantro_decoded_buf(&vb2_dst->vb2_buf);
 	luma_addr = hantro_get_dec_buf_addr(ctx, &dst->base.vb.vb2_buf);
 	chroma_addr = luma_addr + cr_offset;
-	mv_addr = luma_addr + mv_offset;
 
 	dst->av1.chroma_offset = cr_offset;
-	dst->av1.mv_offset = mv_offset;
+	dst->av1.mv_addr = hantro_mv_get_buf_addr(ctx, dst->base.vb.vb2_buf.index);
 
 	hantro_write_addr(vpu, AV1_TILE_OUT_LU, luma_addr);
 	hantro_write_addr(vpu, AV1_TILE_OUT_CH, chroma_addr);
-	hantro_write_addr(vpu, AV1_TILE_OUT_MV, mv_addr);
+	hantro_write_addr(vpu, AV1_TILE_OUT_MV, dst->av1.mv_addr);
 }
 
 int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx)
-- 
2.43.0


