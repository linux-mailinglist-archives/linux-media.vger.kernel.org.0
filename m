Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DCFA453465
	for <lists+linux-media@lfdr.de>; Tue, 16 Nov 2021 15:39:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237543AbhKPOmC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 16 Nov 2021 09:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237492AbhKPOlx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 16 Nov 2021 09:41:53 -0500
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A60EFC061764;
        Tue, 16 Nov 2021 06:38:56 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id D7AD71F45833
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
        t=1637073535; bh=RQVo539qp9iXNmEyDFS0l7nTXu60RvN92hP7trq2Pe8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=pxRLtrjO8HBgdt5IjCk3AT7KfFVV50o463S0PErk7mk8zNX6kOYVd//UHl7kFNQ7M
         BbZcxUmgHfwUM5bTZ/vfiDlq9avBRiosf2yXy7enHPbxvK72KTK3D/fWs4ShiyK7Bn
         XhWSdo4X0kuC/ti/DbhVmhbJDgEl87S3eYj+4N+cPE0/fOelxIB59GFUeGTFNU3sgr
         a1K1vjfrHinb8e1P5NOAoFRbAmgOGIpq6Nsr/XVjkNvyGKjCAxdnM2XXCjxlkzfqCi
         SUxnUW+BYPe0JWTvCONtDU8EVbnUv2z4tG2CB10vC3geAWFVuj/5nGkQwY05KHYT66
         PjmPJRdoYWpyQ==
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-staging@lists.linux.dev
Cc:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Heiko Stuebner <heiko@sntech.de>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, kernel@collabora.com
Subject: [PATCH v8 08/12] media: hantro: Rename registers
Date:   Tue, 16 Nov 2021 15:38:38 +0100
Message-Id: <20211116143842.75896-9-andrzej.p@collabora.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211116143842.75896-1-andrzej.p@collabora.com>
References: <20211116143842.75896-1-andrzej.p@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Add more consistency in the way registers are named.

Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
---
 .../staging/media/hantro/hantro_g2_hevc_dec.c | 40 +++++++++----------
 drivers/staging/media/hantro/hantro_g2_regs.h | 28 ++++++-------
 2 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
index 76a921163b9a..abae36f9b418 100644
--- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
+++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
@@ -448,9 +448,9 @@ static int set_ref(struct hantro_ctx *ctx)
 		if (dpb[i].rps == V4L2_HEVC_DPB_ENTRY_RPS_LT_CURR)
 			dpb_longterm_e |= BIT(V4L2_HEVC_DPB_ENTRIES_NUM_MAX - 1 - i);
 
-		hantro_write_addr(vpu, G2_REG_ADDR_REF(i), luma_addr);
-		hantro_write_addr(vpu, G2_REG_CHR_REF(i), chroma_addr);
-		hantro_write_addr(vpu, G2_REG_DMV_REF(i), mv_addr);
+		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), luma_addr);
+		hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), chroma_addr);
+		hantro_write_addr(vpu, G2_REF_MV_ADDR(i), mv_addr);
 	}
 
 	luma_addr = hantro_hevc_get_ref_buf(ctx, decode_params->pic_order_cnt_val);
@@ -460,20 +460,20 @@ static int set_ref(struct hantro_ctx *ctx)
 	chroma_addr = luma_addr + cr_offset;
 	mv_addr = luma_addr + mv_offset;
 
-	hantro_write_addr(vpu, G2_REG_ADDR_REF(i), luma_addr);
-	hantro_write_addr(vpu, G2_REG_CHR_REF(i), chroma_addr);
-	hantro_write_addr(vpu, G2_REG_DMV_REF(i++), mv_addr);
+	hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), luma_addr);
+	hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), chroma_addr);
+	hantro_write_addr(vpu, G2_REF_MV_ADDR(i++), mv_addr);
 
-	hantro_write_addr(vpu, G2_ADDR_DST, luma_addr);
-	hantro_write_addr(vpu, G2_ADDR_DST_CHR, chroma_addr);
-	hantro_write_addr(vpu, G2_ADDR_DST_MV, mv_addr);
+	hantro_write_addr(vpu, G2_OUT_LUMA_ADDR, luma_addr);
+	hantro_write_addr(vpu, G2_OUT_CHROMA_ADDR, chroma_addr);
+	hantro_write_addr(vpu, G2_OUT_MV_ADDR, mv_addr);
 
 	hantro_hevc_ref_remove_unused(ctx);
 
 	for (; i < V4L2_HEVC_DPB_ENTRIES_NUM_MAX; i++) {
-		hantro_write_addr(vpu, G2_REG_ADDR_REF(i), 0);
-		hantro_write_addr(vpu, G2_REG_CHR_REF(i), 0);
-		hantro_write_addr(vpu, G2_REG_DMV_REF(i), 0);
+		hantro_write_addr(vpu, G2_REF_LUMA_ADDR(i), 0);
+		hantro_write_addr(vpu, G2_REF_CHROMA_ADDR(i), 0);
+		hantro_write_addr(vpu, G2_REF_MV_ADDR(i), 0);
 	}
 
 	hantro_reg_write(vpu, &g2_refer_lterm_e, dpb_longterm_e);
@@ -499,7 +499,7 @@ static void set_buffers(struct hantro_ctx *ctx)
 	src_len = vb2_get_plane_payload(&src_buf->vb2_buf, 0);
 	src_buf_len = vb2_plane_size(&src_buf->vb2_buf, 0);
 
-	hantro_write_addr(vpu, G2_ADDR_STR, src_dma);
+	hantro_write_addr(vpu, G2_STREAM_ADDR, src_dma);
 	hantro_reg_write(vpu, &g2_stream_len, src_len);
 	hantro_reg_write(vpu, &g2_strm_buffer_len, src_buf_len);
 	hantro_reg_write(vpu, &g2_strm_start_offset, 0);
@@ -508,12 +508,12 @@ static void set_buffers(struct hantro_ctx *ctx)
 	/* Destination (decoded frame) buffer. */
 	dst_dma = hantro_get_dec_buf_addr(ctx, &dst_buf->vb2_buf);
 
-	hantro_write_addr(vpu, G2_RASTER_SCAN, dst_dma);
-	hantro_write_addr(vpu, G2_RASTER_SCAN_CHR, dst_dma + cr_offset);
-	hantro_write_addr(vpu, G2_ADDR_TILE_SIZE, ctx->hevc_dec.tile_sizes.dma);
-	hantro_write_addr(vpu, G2_TILE_FILTER, ctx->hevc_dec.tile_filter.dma);
-	hantro_write_addr(vpu, G2_TILE_SAO, ctx->hevc_dec.tile_sao.dma);
-	hantro_write_addr(vpu, G2_TILE_BSD, ctx->hevc_dec.tile_bsd.dma);
+	hantro_write_addr(vpu, G2_RS_OUT_LUMA_ADDR, dst_dma);
+	hantro_write_addr(vpu, G2_RS_OUT_CHROMA_ADDR, dst_dma + cr_offset);
+	hantro_write_addr(vpu, G2_TILE_SIZES_ADDR, ctx->hevc_dec.tile_sizes.dma);
+	hantro_write_addr(vpu, G2_TILE_FILTER_ADDR, ctx->hevc_dec.tile_filter.dma);
+	hantro_write_addr(vpu, G2_TILE_SAO_ADDR, ctx->hevc_dec.tile_sao.dma);
+	hantro_write_addr(vpu, G2_TILE_BSD_ADDR, ctx->hevc_dec.tile_bsd.dma);
 }
 
 static void prepare_scaling_list_buffer(struct hantro_ctx *ctx)
@@ -563,7 +563,7 @@ static void prepare_scaling_list_buffer(struct hantro_ctx *ctx)
 			for (k = 0; k < 8; k++)
 				*p++ = sc->scaling_list_32x32[i][8 * k + j];
 
-	hantro_write_addr(vpu, HEVC_SCALING_LIST, ctx->hevc_dec.scaling_lists.dma);
+	hantro_write_addr(vpu, G2_HEVC_SCALING_LIST_ADDR, ctx->hevc_dec.scaling_lists.dma);
 }
 
 static void hantro_g2_check_idle(struct hantro_dev *vpu)
diff --git a/drivers/staging/media/hantro/hantro_g2_regs.h b/drivers/staging/media/hantro/hantro_g2_regs.h
index bb22fa921914..24b18f839ff8 100644
--- a/drivers/staging/media/hantro/hantro_g2_regs.h
+++ b/drivers/staging/media/hantro/hantro_g2_regs.h
@@ -177,20 +177,20 @@
 #define G2_REG_CONFIG_DEC_CLK_GATE_E		BIT(16)
 #define G2_REG_CONFIG_DEC_CLK_GATE_IDLE_E	BIT(17)
 
-#define G2_ADDR_DST		(G2_SWREG(65))
-#define G2_REG_ADDR_REF(i)	(G2_SWREG(67)  + ((i) * 0x8))
-#define G2_ADDR_DST_CHR		(G2_SWREG(99))
-#define G2_REG_CHR_REF(i)	(G2_SWREG(101) + ((i) * 0x8))
-#define G2_ADDR_DST_MV		(G2_SWREG(133))
-#define G2_REG_DMV_REF(i)	(G2_SWREG(135) + ((i) * 0x8))
-#define G2_ADDR_TILE_SIZE	(G2_SWREG(167))
-#define G2_ADDR_STR		(G2_SWREG(169))
-#define HEVC_SCALING_LIST	(G2_SWREG(171))
-#define G2_RASTER_SCAN		(G2_SWREG(175))
-#define G2_RASTER_SCAN_CHR	(G2_SWREG(177))
-#define G2_TILE_FILTER		(G2_SWREG(179))
-#define G2_TILE_SAO		(G2_SWREG(181))
-#define G2_TILE_BSD		(G2_SWREG(183))
+#define G2_OUT_LUMA_ADDR		(G2_SWREG(65))
+#define G2_REF_LUMA_ADDR(i)		(G2_SWREG(67)  + ((i) * 0x8))
+#define G2_OUT_CHROMA_ADDR		(G2_SWREG(99))
+#define G2_REF_CHROMA_ADDR(i)		(G2_SWREG(101) + ((i) * 0x8))
+#define G2_OUT_MV_ADDR			(G2_SWREG(133))
+#define G2_REF_MV_ADDR(i)		(G2_SWREG(135) + ((i) * 0x8))
+#define G2_TILE_SIZES_ADDR		(G2_SWREG(167))
+#define G2_STREAM_ADDR			(G2_SWREG(169))
+#define G2_HEVC_SCALING_LIST_ADDR	(G2_SWREG(171))
+#define G2_RS_OUT_LUMA_ADDR		(G2_SWREG(175))
+#define G2_RS_OUT_CHROMA_ADDR		(G2_SWREG(177))
+#define G2_TILE_FILTER_ADDR		(G2_SWREG(179))
+#define G2_TILE_SAO_ADDR		(G2_SWREG(181))
+#define G2_TILE_BSD_ADDR		(G2_SWREG(183))
 
 #define g2_strm_buffer_len	G2_DEC_REG(258, 0, 0xffffffff)
 #define g2_strm_start_offset	G2_DEC_REG(259, 0, 0xffffffff)
-- 
2.25.1

