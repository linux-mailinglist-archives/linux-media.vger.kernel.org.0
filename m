Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D7C93F4E5C
	for <lists+linux-media@lfdr.de>; Mon, 23 Aug 2021 18:29:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhHWQaN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Aug 2021 12:30:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhHWQaM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Aug 2021 12:30:12 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64952C061575;
        Mon, 23 Aug 2021 09:29:29 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a01:e0a:4cb:a870:648a:6e9d:d5af:13ed])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: benjamin.gaignard)
        by bhuna.collabora.co.uk (Postfix) with ESMTPSA id F36DD1F42C19;
        Mon, 23 Aug 2021 17:29:24 +0100 (BST)
From:   Benjamin Gaignard <benjamin.gaignard@collabora.com>
To:     mchehab@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, cphealy@gmail.com
Cc:     linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH] media: hantro: Add support of compressed reference buffers
Date:   Mon, 23 Aug 2021 18:29:16 +0200
Message-Id: <20210823162916.824336-1-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reference frame compression is a feature added in G2 decoder to compress
frame buffers so that the bandwidth of storing/loading reference frames
can be reduced, especially when the resolution of decoded stream is of
high definition.

Compressed help to increase the performance of the whole stack, it could
be up to 50 fps (against 45 fps) on IMX8MQ.
The impact of compressed frames is confirmed when using perf to monitor
the number of memory accesses with or without compression feature.
The following command
perf stat -a -e imx8_ddr0/cycles/,imx8_ddr0/read-cycles/,imx8_ddr0/write-cycles/ gst-launch-1.0 filesrc location=Jockey_3840x2160_120fps_420_8bit_HEVC_RAW.hevc ! queue ! h265parse ! v4l2slh265dec ! fakesink

give us these results
without compression feature:
 Performance counter stats for 'system wide':

       14965816743      imx8_ddr0/cycles/
         889197312      imx8_ddr0/read-cycles/
        1819348862      imx8_ddr0/write-cycles/

      18.707373001 seconds time elapsed

with compression feature:
Performance counter stats for 'system wide':

       13750218243      imx8_ddr0/cycles/
         402428744      imx8_ddr0/read-cycles/
        1255676693      imx8_ddr0/write-cycles/

      17.188320061 seconds time elapsed

As expected the number of read/write cycles are really lower when compression
is used.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 31 ++++++++++++--
 drivers/staging/media/hantro/hantro_g2_regs.h |  4 ++
 drivers/staging/media/hantro/hantro_hevc.c    | 41 ++++++++++++++++++-
 drivers/staging/media/hantro/hantro_hw.h      |  2 +
 4 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 340efb57fd18..da90acd922f7 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -366,10 +366,12 @@ static int set_ref(struct hantro_ctx *ctx)
 	const struct v4l2_ctrl_hevc_pps *pps = ctrls->pps;
 	const struct v4l2_ctrl_hevc_decode_params *decode_params = ctrls->decode_params;
 	const struct v4l2_hevc_dpb_entry *dpb = decode_params->dpb;
-	dma_addr_t luma_addr, chroma_addr, mv_addr = 0;
+	dma_addr_t luma_addr, chroma_addr, mv_addr, compress_luma_addr, compress_chroma_addr = 0;
 	struct hantro_dev *vpu = ctx->dev;
 	size_t cr_offset = hantro_hevc_chroma_offset(sps);
 	size_t mv_offset = hantro_hevc_motion_vectors_offset(sps);
+	size_t compress_luma_offset = hantro_hevc_luma_compress_offset(sps);
+	size_t compress_chroma_offset = hantro_hevc_chroma_compress_offset(sps);
 	u32 max_ref_frames;
 	u16 dpb_longterm_e;
 	static const struct hantro_reg cur_poc[] = {
@@ -442,15 +444,28 @@ static int set_ref(struct hantro_ctx *ctx)
 		if (!luma_addr)
 			return -ENOMEM;
 
+		/*
+		 * An allocated frame stores Y and UV planes, motion vectors and
+		 * compressed Y and UV planes. Compute all these offsets given
+		 * the frame resolution and the pixel format.
+		 */
 		chroma_addr = luma_addr + cr_offset;
 		mv_addr = luma_addr + mv_offset;
+		compress_luma_addr = luma_addr + compress_luma_offset;
+		compress_chroma_addr = luma_addr + compress_chroma_offset;
 
 		if (dpb[i].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
 			dpb_longterm_e |= BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
 
+		/*
+		 * For each reference frame Y, UV, motion vector and
+		 * compressed Y, UV buffers addresses must be set.
+		 */
 		hantro_write_addr(vpu, G2_REG_ADDR_REF(i), luma_addr);
 		hantro_write_addr(vpu, G2_REG_CHR_REF(i), chroma_addr);
 		hantro_write_addr(vpu, G2_REG_DMV_REF(i), mv_addr);
+		hantro_write_addr(vpu, G2_COMP_ADDR_REF(i), compress_luma_addr);
+		hantro_write_addr(vpu, G2_COMP_CHR_REF(i), compress_chroma_addr);
 	}
 
 	luma_addr = hantro_hevc_get_ref_buf(ctx, decode_params->pic_order_cnt_val);
@@ -459,7 +474,12 @@ static int set_ref(struct hantro_ctx *ctx)
 
 	chroma_addr = luma_addr + cr_offset;
 	mv_addr = luma_addr + mv_offset;
+	compress_luma_addr = luma_addr + compress_luma_offset;
+	compress_chroma_addr = luma_addr + compress_chroma_offset;
 
+	/* The next decoded frame as to be put as the last reference frame entry */
+	hantro_write_addr(vpu, G2_COMP_ADDR_REF(i), compress_luma_addr);
+	hantro_write_addr(vpu, G2_COMP_CHR_REF(i), compress_chroma_addr);
 	hantro_write_addr(vpu, G2_REG_ADDR_REF(i), luma_addr);
 	hantro_write_addr(vpu, G2_REG_CHR_REF(i), chroma_addr);
 	hantro_write_addr(vpu, G2_REG_DMV_REF(i++), mv_addr);
@@ -467,13 +487,18 @@ static int set_ref(struct hantro_ctx *ctx)
 	hantro_write_addr(vpu, G2_ADDR_DST, luma_addr);
 	hantro_write_addr(vpu, G2_ADDR_DST_CHR, chroma_addr);
 	hantro_write_addr(vpu, G2_ADDR_DST_MV, mv_addr);
+	hantro_write_addr(vpu, G2_COMP_ADDR_DST, compress_luma_addr);
+	hantro_write_addr(vpu, G2_COMP_CHR, compress_chroma_addr);
 
 	hantro_hevc_ref_remove_unused(ctx);
 
+	/* Unused reference frames entries most be cleared */
 	for (; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
 		hantro_write_addr(vpu, G2_REG_ADDR_REF(i), 0);
 		hantro_write_addr(vpu, G2_REG_CHR_REF(i), 0);
 		hantro_write_addr(vpu, G2_REG_DMV_REF(i), 0);
+		hantro_write_addr(vpu, G2_COMP_ADDR_REF(i), 0);
+		hantro_write_addr(vpu, G2_COMP_CHR_REF(i), 0);
 	}
 
 	hantro_reg_write(vpu, &g2_refer_lterm_e, dpb_longterm_e);
@@ -564,8 +589,8 @@ int hantro_g2_hevc_dec_run(struct hantro_ctx *ctx)
 	/* Don't disable output */
 	hantro_reg_write(vpu, &g2_out_dis, 0);
 
-	/* Don't compress buffers */
-	hantro_reg_write(vpu, &g2_ref_compress_bypass, 1);
+	/* Compress buffers */
+	hantro_reg_write(vpu, &g2_ref_compress_bypass, 0);
 
 	/* use NV12 as output format */
 	hantro_reg_write(vpu, &g2_out_rs_e, 1);
diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
index bb22fa921914..2a23e8657db1 100644
--- a/drivers/staging/media/hantro/hantro_g2_regs.h
+++ b/drivers/staging/media/hantro/hantro_g2_regs.h
@@ -191,6 +191,10 @@
 #define G2_TILE_FILTER		(G2_SWREG(179))
 #define G2_TILE_SAO		(G2_SWREG(181))
 #define G2_TILE_BSD		(G2_SWREG(183))
+#define G2_COMP_ADDR_DST	(G2_SWREG(190))
+#define G2_COMP_ADDR_REF(i)	(G2_SWREG(192) + ((i) * 0x8))
+#define G2_COMP_CHR		(G2_SWREG(224))
+#define G2_COMP_CHR_REF(i)	(G2_SWREG(226) + ((i) * 0x8))
 
 #define g2_strm_buffer_len	G2_DEC_REG(258, 0, 0xffffffff)
 #define g2_strm_start_offset	G2_DEC_REG(259, 0, 0xffffffff)
diff --git a/drivers/staging/media/hantro/hantro_hevc.c b/drivers/staging/media/hantro/hantro_hevc.c
index 5347f5a41c2a..78e5ceda520c 100644
--- a/drivers/staging/media/hantro/hantro_hevc.c
+++ b/drivers/staging/media/hantro/hantro_hevc.c
@@ -27,6 +27,13 @@
 
 #define G2_ALIGN		16
 
+#define CBS_SIZE	16	/* compression table size in bytes */
+#define CBS_LUMA 	8	/* luminance CBS is composed of 1 8x8 coded block */
+#define CBS_CHROMA_W	(8 * 2)	/* chrominance CBS is composed of two 8x4 coded
+				 * blocks, with Cb CB first then Cr CB following
+				 */
+#define CBS_CHROMA_H	4
+
 size_t hantro_hevc_chroma_offset(const struct v4l2_ctrl_hevc_sps *sps)
 {
 	int bytes_per_pixel = sps->bit_depth_luma_minus8 == 0 ? 1 : 2;
@@ -61,12 +68,44 @@ static size_t hantro_hevc_mv_size(const struct v4l2_ctrl_hevc_sps *sps)
 	return mv_size;
 }
 
+size_t hantro_hevc_luma_compress_offset(const struct v4l2_ctrl_hevc_sps *sps)
+{
+	return hantro_hevc_motion_vectors_offset(sps) + hantro_hevc_mv_size(sps);
+}
+
+static size_t hantro_hevc_luma_compress_size(const struct v4l2_ctrl_hevc_sps *sps)
+{
+	u32 pic_width_in_cbsy =
+		round_up((sps->pic_width_in_luma_samples + CBS_LUMA - 1) / CBS_LUMA, CBS_SIZE);
+	u32 pic_height_in_cbsy = (sps->pic_height_in_luma_samples + CBS_LUMA - 1) / CBS_LUMA;
+
+	return round_up(pic_width_in_cbsy * pic_height_in_cbsy, CBS_SIZE);
+}
+
+size_t hantro_hevc_chroma_compress_offset(const struct v4l2_ctrl_hevc_sps *sps)
+{
+	return hantro_hevc_luma_compress_offset(sps) + hantro_hevc_luma_compress_size(sps);
+}
+
+static size_t hantro_hevc_chroma_compress_size(const struct v4l2_ctrl_hevc_sps *sps)
+{
+	u32 pic_width_in_cbsc =
+		round_up((sps->pic_width_in_luma_samples + CBS_CHROMA_W - 1)
+			 / CBS_CHROMA_W, CBS_SIZE);
+	u32 pic_height_in_cbsc = (sps->pic_height_in_luma_samples / 2 + CBS_CHROMA_H - 1)
+				 / CBS_CHROMA_H;
+
+	return round_up(pic_width_in_cbsc * pic_height_in_cbsc, CBS_SIZE);
+}
+
 static size_t hantro_hevc_ref_size(struct hantro_ctx *ctx)
 {
 	const struct hantro_hevc_dec_ctrls *ctrls = &ctx->hevc_dec.ctrls;
 	const struct v4l2_ctrl_hevc_sps *sps = ctrls->sps;
 
-	return hantro_hevc_motion_vectors_offset(sps) + hantro_hevc_mv_size(sps);
+	return hantro_hevc_motion_vectors_offset(sps) + hantro_hevc_mv_size(sps) +
+	       hantro_hevc_luma_compress_size(sps) +
+	       hantro_hevc_chroma_compress_size(sps);
 }
 
 static void hantro_hevc_ref_free(struct hantro_ctx *ctx)
diff --git a/drivers/staging/media/hantro/hantro_hw.h b/drivers/staging/media/hantro/hantro_hw.h
index df7b5e3a57b9..d5c002d0e765 100644
--- a/drivers/staging/media/hantro/hantro_hw.h
+++ b/drivers/staging/media/hantro/hantro_hw.h
@@ -255,6 +255,8 @@ dma_addr_t hantro_hevc_get_ref_buf(struct hantro_ctx *ctx, int poc);
 void hantro_hevc_ref_remove_unused(struct hantro_ctx *ctx);
 size_t hantro_hevc_chroma_offset(const struct v4l2_ctrl_hevc_sps *sps);
 size_t hantro_hevc_motion_vectors_offset(const struct v4l2_ctrl_hevc_sps *sps);
+size_t hantro_hevc_luma_compress_offset(const struct v4l2_ctrl_hevc_sps *sps);
+size_t hantro_hevc_chroma_compress_offset(const struct v4l2_ctrl_hevc_sps *sps);
 
 static inline size_t
 hantro_h264_mv_size(unsigned int width, unsigned int height)
-- 
2.25.1

