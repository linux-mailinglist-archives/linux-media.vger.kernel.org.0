Return-Path: <linux-media+bounces-58817-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SHQxF52c32kEWwAAu9opvQ
	(envelope-from <linux-media+bounces-58817-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:11:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9876D4052AD
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 16:11:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E78E03117E7B
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2026 14:04:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 512113D2FE5;
	Wed, 15 Apr 2026 14:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="nRUV7TLx"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D9B331A65;
	Wed, 15 Apr 2026 14:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776261875; cv=none; b=EY1Er7bJlfKiX6yJrNxj94jjs70nYhoDRtTA1q2wyMYlqgwdZutnVet0H59Ea95qDEJp1dLgH0SSRrDRfscuLTozuHFn9tPB5zHdrX12sKmGaucwwsNEaV4ZsfeozEI76YX7IKb8ohhcXP3PTs1uqQti0QyVu8kT7g7+FJlIH58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776261875; c=relaxed/simple;
	bh=b5fjOwEBSIWZcALpUV/eqnaYNOTXdtYyqyc59anKa/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fe8ZuOPY2cgqf+bMofMvAJ5Dx+s6BtOz5N74gZF25r1tHSqTSHBFIQz0XD+94K4MoSDxn1e7I8sLm0tNqVeOYF8ovvKGWjWmG5JLNGGPN+sw6yfF08/k2cWDLpCrnaFtn4gZSmA4QZpWy2g7lOrnvwlOnw/R3zEBsndBeT+8Xvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=nRUV7TLx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776261871;
	bh=b5fjOwEBSIWZcALpUV/eqnaYNOTXdtYyqyc59anKa/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRUV7TLxSBZM5vysGHLhxG7lxxX2OAEGi+bWSOc3lzr93seYlG+gHATwQYEe6+nQj
	 XUnjY9bZu/Lcf/2xKqbqMxrv84Kfv2z1tfQv6BKtMZWQsyB0FMrC+oKyQGbtKL7IBB
	 tQmnk5WfwviJ6MUImnma5vbzFqVZv7Og9Gs65MsZeASr8cUoO/Ke9OW/y6QgmjrMKd
	 douMiaR8T7+86vZYVXlh7pU3yPs1msbGbScwv4FZCorPa7U5Lrx0blNvMcMGpCXgKi
	 XfAZ9Rh59mNawv387QjH86mN84VydGCTQPtSeMv5NT2CGAv70JtQ2xRiLNreblzoAh
	 LLmGJo/EFuSBw==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1EE0A17E1356;
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
Subject: [PATCH v3 1/2] media: verisilicon: Simplify motion vectors and rfc buffers allocation
Date: Wed, 15 Apr 2026 16:04:19 +0200
Message-ID: <20260415140420.282084-2-benjamin.gaignard@collabora.com>
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
	TAGGED_FROM(0.00)[bounces-58817-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 9876D4052AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Until now we reserve the space needed for motion vectors and reference
frame compression at the end of the frame buffer.
Disentanglement mv and rfc from frame buffers by allocating
distinct buffers for each purpose.
That simplify the code by removing lot of offset computation.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/verisilicon/hantro.h   |  17 +-
 .../media/platform/verisilicon/hantro_av1.c   |   7 -
 .../media/platform/verisilicon/hantro_av1.h   |  14 +-
 .../media/platform/verisilicon/hantro_g2.c    |  36 ---
 .../platform/verisilicon/hantro_g2_hevc_dec.c |  24 +-
 .../platform/verisilicon/hantro_g2_vp9_dec.c  |  12 +-
 .../media/platform/verisilicon/hantro_h264.h  |  33 +++
 .../media/platform/verisilicon/hantro_hevc.c  |  35 ++-
 .../media/platform/verisilicon/hantro_hevc.h  |  16 ++
 .../media/platform/verisilicon/hantro_hw.h    | 104 +------
 .../platform/verisilicon/hantro_postproc.c    |  29 +-
 .../media/platform/verisilicon/hantro_v4l2.c  | 255 ++++++++++++++++--
 .../media/platform/verisilicon/hantro_vp9.h   |  18 ++
 .../verisilicon/rockchip_vpu981_hw_av1_dec.c  |  16 +-
 14 files changed, 388 insertions(+), 228 deletions(-)
 create mode 100644 drivers/media/platform/verisilicon/hantro_h264.h
 create mode 100644 drivers/media/platform/verisilicon/hantro_hevc.h

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..c4ceb9c99016 100644
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
@@ -334,14 +343,14 @@ struct hantro_vp9_decoded_buffer_info {
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
@@ -507,4 +516,8 @@ void hantro_postproc_free(struct hantro_ctx *ctx);
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
index 4e2122b95cdd..bc4a0887f8e7 100644
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
@@ -59,4 +58,17 @@ void hantro_av1_set_prob(struct hantro_ctx *ctx);
 int hantro_av1_get_hardware_mcomp_filt_type(int interpolation_filter);
 int hantro_av1_get_hardware_tx_mode(enum v4l2_av1_tx_mode tx_mode);
 
+static inline unsigned short hantro_av1_num_sbs(unsigned short dimension)
+{
+	return DIV_ROUND_UP(dimension, 64);
+}
+
+static inline size_t
+hantro_av1_mv_size(unsigned int width, unsigned int height)
+{
+	size_t num_sbs = hantro_av1_num_sbs(width) * hantro_av1_num_sbs(height);
+
+	return ALIGN(num_sbs * 384, 16) * 2 + 512;
+}
+
 #endif
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
index e8c2e83379de..d0af9fb882ba 100644
--- a/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
+++ b/drivers/media/platform/verisilicon/hantro_g2_hevc_dec.c
@@ -383,9 +383,6 @@ static int set_ref(struct hantro_ctx *ctx)
 	struct vb2_v4l2_buffer *vb2_dst;
 	struct hantro_decoded_buffer *dst;
 	size_t cr_offset = hantro_g2_chroma_offset(ctx);
-	size_t mv_offset = hantro_g2_motion_vectors_offset(ctx);
-	size_t compress_luma_offset = hantro_g2_luma_compress_offset(ctx);
-	size_t compress_chroma_offset = hantro_g2_chroma_compress_offset(ctx);
 	u32 max_ref_frames;
 	u16 dpb_longterm_e;
 	static const struct hantro_reg cur_poc[] = {
@@ -453,14 +450,17 @@ static int set_ref(struct hantro_ctx *ctx)
 	dpb_longterm_e = 0;
 	for (i = 0; i < decode_params->num_active_dpb_entries &&
 	     i < (V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1); i++) {
+		int index = hantro_hevc_get_ref_buf_index(ctx, dpb[i].pic_order_cnt_val);
 		luma_addr = hantro_hevc_get_ref_buf(ctx, dpb[i].pic_order_cnt_val);
 		if (!luma_addr)
 			return -ENOMEM;
 
 		chroma_addr = luma_addr + cr_offset;
-		mv_addr = luma_addr + mv_offset;
-		compress_luma_addr = luma_addr + compress_luma_offset;
-		compress_chroma_addr = luma_addr + compress_chroma_offset;
+		mv_addr = hantro_mv_get_buf_addr(ctx, index);
+		if (ctx->hevc_dec.use_compression) {
+			compress_luma_addr = hantro_rfc_get_luma_buf_addr(ctx, index);
+			compress_chroma_addr = hantro_rfc_get_chroma_buf_addr(ctx, index);
+		}
 
 		if (dpb[i].flags & V4L2_HEVC_DPB_ENTRY_LONG_TERM_REFERENCE)
 			dpb_longterm_e |= BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
@@ -478,13 +478,17 @@ static int set_ref(struct hantro_ctx *ctx)
 	if (!luma_addr)
 		return -ENOMEM;
 
-	if (hantro_hevc_add_ref_buf(ctx, decode_params->pic_order_cnt_val, luma_addr))
+	if (hantro_hevc_add_ref_buf(ctx, decode_params->pic_order_cnt_val, luma_addr, vb2_dst))
 		return -EINVAL;
 
 	chroma_addr = luma_addr + cr_offset;
-	mv_addr = luma_addr + mv_offset;
-	compress_luma_addr = luma_addr + compress_luma_offset;
-	compress_chroma_addr = luma_addr + compress_chroma_offset;
+	mv_addr = hantro_mv_get_buf_addr(ctx, dst->base.vb.vb2_buf.index);
+	if (ctx->hevc_dec.use_compression) {
+		compress_luma_addr =
+			hantro_rfc_get_luma_buf_addr(ctx, dst->base.vb.vb2_buf.index);
+		compress_chroma_addr =
+			hantro_rfc_get_chroma_buf_addr(ctx, dst->base.vb.vb2_buf.index);
+	}
 
 	hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), luma_addr);
 	hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), chroma_addr);
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
diff --git a/drivers/media/platform/verisilicon/hantro_h264.h b/drivers/media/platform/verisilicon/hantro_h264.h
new file mode 100644
index 000000000000..89348203a712
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_h264.h
@@ -0,0 +1,33 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hantro H264 codec driver
+ *
+ * Copyright (C) 2026 Collabora Ltd.
+ */
+
+static inline size_t
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
diff --git a/drivers/media/platform/verisilicon/hantro_hevc.c b/drivers/media/platform/verisilicon/hantro_hevc.c
index 83cd12b0ddd6..eea4d9e6fde0 100644
--- a/drivers/media/platform/verisilicon/hantro_hevc.c
+++ b/drivers/media/platform/verisilicon/hantro_hevc.c
@@ -44,30 +44,49 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx,
 	int i;
 
 	/* Find the reference buffer in already known ones */
-	for (i = 0;  i < NUM_REF_PICTURES; i++) {
+	for (i = 0; i < NUM_REF_PICTURES; i++) {
 		if (hevc_dec->ref_bufs_poc[i] == poc) {
 			hevc_dec->ref_bufs_used |= 1 << i;
 			return hevc_dec->ref_bufs[i].dma;
 		}
 	}
-
 	return 0;
 }
 
-int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr)
+int hantro_hevc_get_ref_buf_index(struct hantro_ctx *ctx, s32 poc)
 {
 	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
 	int i;
 
-	/* Add a new reference buffer */
+	/* Find the reference buffer in already known ones */
 	for (i = 0; i < NUM_REF_PICTURES; i++) {
-		if (!(hevc_dec->ref_bufs_used & 1 << i)) {
+		if (hevc_dec->ref_bufs_poc[i] == poc) {
 			hevc_dec->ref_bufs_used |= 1 << i;
-			hevc_dec->ref_bufs_poc[i] = poc;
-			hevc_dec->ref_bufs[i].dma = addr;
-			return 0;
+			return hevc_dec->ref_vb2[i]->vb2_buf.index;
 		}
 	}
+	return 0;
+}
+
+int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx,
+			    int poc,
+			    dma_addr_t addr,
+			    struct vb2_v4l2_buffer *vb2)
+{
+	struct hantro_hevc_dec_hw_ctx *hevc_dec = &ctx->hevc_dec;
+	int i;
+
+	/* Add a new reference buffer */
+	for (i = 0; i < NUM_REF_PICTURES; i++) {
+		if (hevc_dec->ref_bufs_used & (1 << i))
+			continue;
+
+		hevc_dec->ref_bufs_used |= 1 << i;
+		hevc_dec->ref_bufs_poc[i] = poc;
+		hevc_dec->ref_bufs[i].dma = addr;
+		hevc_dec->ref_vb2[i] = vb2;
+		return 0;
+	}
 
 	return -EINVAL;
 }
diff --git a/drivers/media/platform/verisilicon/hantro_hevc.h b/drivers/media/platform/verisilicon/hantro_hevc.h
new file mode 100644
index 000000000000..cfaeb8662473
--- /dev/null
+++ b/drivers/media/platform/verisilicon/hantro_hevc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Hantro H264 codec driver
+ *
+ * Copyright (C) 2026 Collabora Ltd.
+ */
+
+static inline size_t
+hantro_hevc_mv_size(unsigned int width, unsigned int height, int depth)
+{
+	/*
+	 * A CTB can be 64x64, 32x32 or 16x16.
+	 * Allocated memory for the "worse" case: 16x16
+	 */
+	return DIV_ROUND_UP(width * height * depth / 8, 16);
+}
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index d1d39d1df5d2..6903af119345 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -162,6 +162,7 @@ struct hantro_hevc_dec_hw_ctx {
 	struct hantro_aux_buf scaling_lists;
 	s32 ref_bufs_poc[NUM_REF_PICTURES];
 	u32 ref_bufs_used;
+	struct vb2_v4l2_buffer *ref_vb2[NUM_REF_PICTURES];
 	struct hantro_hevc_dec_ctrls ctrls;
 	unsigned int num_tile_cols_allocated;
 	bool use_compression;
@@ -457,109 +458,14 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx);
 int hantro_hevc_dec_prepare_run(struct hantro_ctx *ctx);
 void hantro_hevc_ref_init(struct hantro_ctx *ctx);
 dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, s32 poc);
-int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc, dma_addr_t addr);
+int hantro_hevc_add_ref_buf(struct hantro_ctx *ctx, int poc,
+			    dma_addr_t addr,
+			    struct vb2_v4l2_buffer *vb2);
+int hantro_hevc_get_ref_buf_index(struct hantro_ctx *ctx, s32 poc);
 
 int rockchip_vpu981_av1_dec_run(struct hantro_ctx *ctx);
 
-static inline unsigned short hantro_vp9_num_sbs(unsigned short dimension)
-{
-	return (dimension + 63) / 64;
-}
-
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
index fcf3bd9bcda2..bbc1e9e2840e 100644
--- a/drivers/media/platform/verisilicon/hantro_v4l2.c
+++ b/drivers/media/platform/verisilicon/hantro_v4l2.c
@@ -25,8 +25,12 @@
 #include <media/v4l2-mem2mem.h>
 
 #include "hantro.h"
+#include "hantro_av1.h"
 #include "hantro_hw.h"
+#include "hantro_h264.h"
+#include "hantro_hevc.h"
 #include "hantro_v4l2.h"
+#include "hantro_vp9.h"
 
 #define  HANTRO_DEFAULT_BIT_DEPTH 8
 
@@ -36,6 +40,9 @@ static int hantro_set_fmt_out(struct hantro_ctx *ctx,
 static int hantro_set_fmt_cap(struct hantro_ctx *ctx,
 			      struct v4l2_pix_format_mplane *pix_mp);
 
+static void hantro_mv_free(struct hantro_ctx *ctx);
+static void hantro_rfc_free(struct hantro_ctx *ctx);
+
 static const struct hantro_fmt *
 hantro_get_formats(const struct hantro_ctx *ctx, unsigned int *num_fmts, bool need_postproc)
 {
@@ -362,26 +369,6 @@ static int hantro_try_fmt(const struct hantro_ctx *ctx,
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
@@ -984,6 +971,9 @@ static void hantro_stop_streaming(struct vb2_queue *q)
 			ctx->codec_ops->exit(ctx);
 	}
 
+	hantro_mv_free(ctx);
+	hantro_rfc_free(ctx);
+
 	/*
 	 * The mem2mem framework calls v4l2_m2m_cancel_job before
 	 * .stop_streaming, so there isn't any job running and
@@ -1025,3 +1015,228 @@ const struct vb2_ops hantro_queue_ops = {
 	.start_streaming = hantro_start_streaming,
 	.stop_streaming = hantro_stop_streaming,
 };
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
+	for (i = 0; i < MAX_RFC_BUFFERS; i++) {
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
diff --git a/drivers/media/platform/verisilicon/hantro_vp9.h b/drivers/media/platform/verisilicon/hantro_vp9.h
index 26b69275f098..fcdad2242f78 100644
--- a/drivers/media/platform/verisilicon/hantro_vp9.h
+++ b/drivers/media/platform/verisilicon/hantro_vp9.h
@@ -100,3 +100,21 @@ struct symbol_counts {
 
 	u32 count_eobs[4][2][2][6][6];
 };
+
+static inline unsigned short hantro_vp9_num_sbs(unsigned short dimension)
+{
+	return (dimension + 63) / 64;
+}
+
+static inline size_t
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
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c b/drivers/media/platform/verisilicon/rockchip_vpu981_hw_av1_dec.c
index 990a5e6b5531..2cf4233d6888 100644
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
@@ -1345,22 +1343,20 @@ rockchip_vpu981_av1_dec_set_output_buffer(struct hantro_ctx *ctx)
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


