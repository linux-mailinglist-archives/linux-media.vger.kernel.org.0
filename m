Return-Path: <linux-media+bounces-15676-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B3C94418C
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 05:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 27DA9281AA6
	for <lists+linux-media@lfdr.de>; Thu,  1 Aug 2024 03:10:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DF5C13D283;
	Thu,  1 Aug 2024 03:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i/kv7Si6"
X-Original-To: linux-media@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4CD132111;
	Thu,  1 Aug 2024 03:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722481845; cv=none; b=jOTI6R+tTiUtvv0XDwryJK46EziKKdTVdbFcKDxZX3zpMFhHp9GGUJt+siBS9/j/wSbyEVT5tkma80iFwdrse1TkpplVDOrg7BTjuFtunHnWaLpIeGnrWLsFgESkO6axHIb+qjMHCTKP2mr/kPbxXN3/PnfIhxTxt+7cg0cha5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722481845; c=relaxed/simple;
	bh=H9ZV6Vj54z6QDl6jgcyJxa/qG3rpoQNr7wixd91UCnA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t2irHeecsWWDCRn2wkoTlgK5SsMnS343GoQUhBcC68eRQ3ynSHhT1N+m2WERI7HXMrBCd+mAz9UUrkqAS01coPrVNo22559M3wxXkiPEtXNQEank2FAbO0+7rY6wIYmuFvF1dx3nqCHMcMx4XQcaQUtcBLYZXLzLxKOgEcVlDy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=i/kv7Si6; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 9e825cc04fb311ef87684b57767b52b1-20240801
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=rUlGPLmCqHAHnNYXB3JiJo08/VA6d3pSJTqfMI9I+Ts=;
	b=i/kv7Si6XnQ3e83aTpCW4Z5uOwIFH+6U1KGM5a18gxAAkzu/AP8Y4rhxORJhter6/l3qlEbipHn9r1nCc6dQb/yTVYXxDk2RVFbNlGiwWldYHzUl80nQIpxRgkE7DeeNILNLWd5ompeOHbLJDwYOGz1WZyBM314RxjmXFKko9gI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41,REQID:eb134ab3-74d2-47e5-853e-867f346cb5bf,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6dc6a47,CLOUDID:15ff25d2-436f-4604-ad9d-558fa44a3bbe,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 9e825cc04fb311ef87684b57767b52b1-20240801
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <jianhua.lin@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 730738732; Thu, 01 Aug 2024 11:10:34 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 31 Jul 2024 20:10:35 -0700
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 1 Aug 2024 11:10:34 +0800
From: Jianhua Lin <jianhua.lin@mediatek.com>
To: <daniel.almeida@collabora.com>, <mchehab@kernel.org>,
	<angelogioacchino.delregno@collabora.com>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jianhua Lin
	<jianhua.lin@mediatek.com>
Subject: [PATCH v4 1/1] media: mediatek: jpeg: support 34bits
Date: Thu, 1 Aug 2024 11:10:12 +0800
Message-ID: <20240801031012.31053-1-jianhua.lin@mediatek.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

the iommu HW supported 34bits iova space(16GB),
but mediatek jpeg enc/dec driver still is 32bit,
then need to set the bit32/bit33 iova to jpeg HW.

Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
---
Changes compared with v3:
- remove of_property_read_bool() for 34bit supporting check.
- move the support_34bit into the platform data(mtk_jpeg_variant)
  for the specific SoC supporting.
- add mtk8188 SoC to compatible list.

 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 55 ++++++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  4 ++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 59 +++++++++++++++----
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  1 +
 .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |  8 +++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 44 ++++++++++++--
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  7 ++-
 7 files changed, 158 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index ac48658e2de4..101c509ab2ab 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1030,6 +1030,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
 	spin_lock_irqsave(&jpeg->hw_lock, flags);
 	mtk_jpeg_dec_reset(jpeg->reg_base);
 	mtk_jpeg_dec_set_config(jpeg->reg_base,
+				jpeg->variant->support_34bit,
 				&jpeg_src_buf->dec_param,
 				jpeg_src_buf->bs_size,
 				&bs,
@@ -1564,7 +1565,8 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
-	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
+	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
+			jpeg->variant->support_34bit);
 	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
 
 	buf_state = VB2_BUF_STATE_DONE;
@@ -1764,6 +1766,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
 	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
+				jpeg->variant->support_34bit,
 				&jpeg_src_buf->dec_param,
 				jpeg_src_buf->bs_size,
 				&bs,
@@ -1860,6 +1863,10 @@ static struct clk_bulk_data mtk_jpeg_clocks[] = {
 	{ .id = "jpgenc" },
 };
 
+static struct clk_bulk_data mtk_jpeg_dec_clocks[] = {
+	{ .id = "jpgdec" },
+};
+
 static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
 	{ .id = "jpgdec-smi" },
 	{ .id = "jpgdec" },
@@ -1878,6 +1885,7 @@ static const struct mtk_jpeg_variant mt8173_jpeg_drvdata = {
 	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
 	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.support_34bit = false,
 };
 
 static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
@@ -1894,6 +1902,7 @@ static const struct mtk_jpeg_variant mtk_jpeg_drvdata = {
 	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.multi_core = false,
+	.support_34bit = false,
 };
 
 static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
@@ -1907,6 +1916,7 @@ static struct mtk_jpeg_variant mtk8195_jpegenc_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegenc_worker,
+	.support_34bit = false,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -1920,6 +1930,41 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegdec_worker,
+	.support_34bit = false,
+};
+
+static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
+	.clks = mtk_jpeg_clocks,
+	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
+	.formats = mtk_jpeg_enc_formats,
+	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
+	.qops = &mtk_jpeg_enc_qops,
+	.irq_handler = mtk_jpeg_enc_irq,
+	.hw_reset = mtk_jpeg_enc_reset,
+	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
+	.dev_name = "mtk-jpeg-enc",
+	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.multi_core = false,
+	.support_34bit = true,
+};
+
+static const struct mtk_jpeg_variant mtk8188_jpegdec_drvdata = {
+	.clks = mtk_jpeg_dec_clocks,
+	.num_clks = ARRAY_SIZE(mtk_jpeg_dec_clocks),
+	.formats = mtk_jpeg_dec_formats,
+	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
+	.qops = &mtk_jpeg_dec_qops,
+	.irq_handler = mtk_jpeg_dec_irq,
+	.hw_reset = mtk_jpeg_dec_reset,
+	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
+	.dev_name = "mtk-jpeg-dec",
+	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
+	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
+	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
+	.multi_core = false,
+	.support_34bit = true,
 };
 
 static const struct of_device_id mtk_jpeg_match[] = {
@@ -1943,6 +1988,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
 		.compatible = "mediatek,mt8195-jpgdec",
 		.data = &mtk8195_jpegdec_drvdata,
 	},
+	{
+		.compatible = "mediatek,mt8188-jpgenc",
+		.data = &mtk8188_jpegenc_drvdata,
+	},
+	{
+		.compatible = "mediatek,mt8188-jpgdec",
+		.data = &mtk8188_jpegdec_drvdata,
+	},
 	{},
 };
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 8ba6e757e11a..a908d52f7e94 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -34,6 +34,8 @@
 
 #define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
 
+#define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
+
 /**
  * enum mtk_jpeg_ctx_state - states of the context state machine
  * @MTK_JPEG_INIT:		current state is initialized
@@ -62,6 +64,7 @@ enum mtk_jpeg_ctx_state {
  * @cap_q_default_fourcc:	capture queue default fourcc
  * @multi_core:		mark jpeg hw is multi_core or not
  * @jpeg_worker:		jpeg dec or enc worker
+ * @support_34bit:	flag to check if support dma_address 34bit
  */
 struct mtk_jpeg_variant {
 	struct clk_bulk_data *clks;
@@ -78,6 +81,7 @@ struct mtk_jpeg_variant {
 	u32 cap_q_default_fourcc;
 	bool multi_core;
 	void (*jpeg_worker)(struct work_struct *work);
+	bool support_34bit;
 };
 
 struct mtk_jpeg_src_buf {
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index 4a6ee211e18f..9b89761c9857 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -270,7 +270,7 @@ void mtk_jpeg_dec_reset(void __iomem *base)
 EXPORT_SYMBOL_GPL(mtk_jpeg_dec_reset);
 
 static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
-					u8 yscale_h, u8 uvscale_w, u8 uvscale_h)
+				u8 yscale_h, u8 uvscale_w, u8 uvscale_h)
 {
 	u32 val;
 
@@ -279,23 +279,43 @@ static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
 	writel(val, base + JPGDEC_REG_BRZ_FACTOR);
 }
 
-static void mtk_jpeg_dec_set_dst_bank0(void __iomem *base, u32 addr_y,
-				       u32 addr_u, u32 addr_v)
+static void mtk_jpeg_dec_set_dst_bank0(void __iomem *base, bool support_34bit,
+		dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)
 {
+	u32 val;
+
 	mtk_jpeg_verify_align(addr_y, 16, JPGDEC_REG_DEST_ADDR0_Y);
 	writel(addr_y, base + JPGDEC_REG_DEST_ADDR0_Y);
 	mtk_jpeg_verify_align(addr_u, 16, JPGDEC_REG_DEST_ADDR0_U);
 	writel(addr_u, base + JPGDEC_REG_DEST_ADDR0_U);
 	mtk_jpeg_verify_align(addr_v, 16, JPGDEC_REG_DEST_ADDR0_V);
 	writel(addr_v, base + JPGDEC_REG_DEST_ADDR0_V);
+	if (support_34bit) {
+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
+		writel(val, base + JPGDEC_REG_DEST_ADDR0_Y_EXT);
+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_u));
+		writel(val, base + JPGDEC_REG_DEST_ADDR0_U_EXT);
+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_v));
+		writel(val, base + JPGDEC_REG_DEST_ADDR0_V_EXT);
+	}
 }
 
-static void mtk_jpeg_dec_set_dst_bank1(void __iomem *base, u32 addr_y,
-				       u32 addr_u, u32 addr_v)
+static void mtk_jpeg_dec_set_dst_bank1(void __iomem *base, bool support_34bit,
+		dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)
 {
+	u32 val;
+
 	writel(addr_y, base + JPGDEC_REG_DEST_ADDR1_Y);
 	writel(addr_u, base + JPGDEC_REG_DEST_ADDR1_U);
 	writel(addr_v, base + JPGDEC_REG_DEST_ADDR1_V);
+	if (support_34bit) {
+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
+		writel(val, base + JPGDEC_REG_DEST_ADDR1_Y_EXT);
+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_u));
+		writel(val, base + JPGDEC_REG_DEST_ADDR1_U_EXT);
+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_v));
+		writel(val, base + JPGDEC_REG_DEST_ADDR1_V_EXT);
+	}
 }
 
 static void mtk_jpeg_dec_set_mem_stride(void __iomem *base, u32 stride_y,
@@ -322,18 +342,31 @@ static void mtk_jpeg_dec_set_dec_mode(void __iomem *base, u32 mode)
 	writel(mode & 0x03, base + JPGDEC_REG_OPERATION_MODE);
 }
 
-static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base, u32 ptr)
+static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base,
+				bool support_34bit, dma_addr_t ptr)
 {
+	u32 val;
+
 	mtk_jpeg_verify_align(ptr, 16, JPGDEC_REG_FILE_BRP);
 	writel(ptr, base + JPGDEC_REG_FILE_BRP);
+	if (support_34bit) {
+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(ptr));
+		writel(val, base + JPGDEC_REG_FILE_BRP_EXT);
+	}
 }
 
-static void mtk_jpeg_dec_set_bs_info(void __iomem *base, u32 addr, u32 size,
-				     u32 bitstream_size)
+static void mtk_jpeg_dec_set_bs_info(void __iomem *base, bool support_34bit,
+		dma_addr_t addr, u32 size, u32 bitstream_size)
 {
+	u32 val;
+
 	mtk_jpeg_verify_align(addr, 16, JPGDEC_REG_FILE_ADDR);
 	mtk_jpeg_verify_align(size, 128, JPGDEC_REG_FILE_TOTAL_SIZE);
 	writel(addr, base + JPGDEC_REG_FILE_ADDR);
+	if (support_34bit) {
+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr));
+		writel(val, base + JPGDEC_REG_FILE_ADDR_EXT);
+	}
 	writel(size, base + JPGDEC_REG_FILE_TOTAL_SIZE);
 	writel(bitstream_size, base + JPGDEC_REG_BIT_STREAM_SIZE);
 }
@@ -404,6 +437,7 @@ static void mtk_jpeg_dec_set_sampling_factor(void __iomem *base, u32 comp_num,
 }
 
 void mtk_jpeg_dec_set_config(void __iomem *base,
+			     bool support_34bits,
 			     struct mtk_jpeg_dec_param *cfg,
 			     u32 bitstream_size,
 			     struct mtk_jpeg_bs *bs,
@@ -413,8 +447,9 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
 	mtk_jpeg_dec_set_dec_mode(base, 0);
 	mtk_jpeg_dec_set_comp0_du(base, cfg->unit_num);
 	mtk_jpeg_dec_set_total_mcu(base, cfg->total_mcu);
-	mtk_jpeg_dec_set_bs_info(base, bs->str_addr, bs->size, bitstream_size);
-	mtk_jpeg_dec_set_bs_write_ptr(base, bs->end_addr);
+	mtk_jpeg_dec_set_bs_info(base, support_34bits, bs->str_addr,
+				       bs->size, bitstream_size);
+	mtk_jpeg_dec_set_bs_write_ptr(base, support_34bits, bs->end_addr);
 	mtk_jpeg_dec_set_du_membership(base, cfg->membership, 1,
 				       (cfg->comp_num == 1) ? 1 : 0);
 	mtk_jpeg_dec_set_comp_id(base, cfg->comp_id[0], cfg->comp_id[1],
@@ -432,9 +467,9 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
 				    cfg->mem_stride[1]);
 	mtk_jpeg_dec_set_img_stride(base, cfg->img_stride[0],
 				    cfg->img_stride[1]);
-	mtk_jpeg_dec_set_dst_bank0(base, fb->plane_addr[0],
+	mtk_jpeg_dec_set_dst_bank0(base, support_34bits, fb->plane_addr[0],
 				   fb->plane_addr[1], fb->plane_addr[2]);
-	mtk_jpeg_dec_set_dst_bank1(base, 0, 0, 0);
+	mtk_jpeg_dec_set_dst_bank1(base, support_34bits, 0, 0, 0);
 	mtk_jpeg_dec_set_dma_group(base, cfg->dma_mcu, cfg->dma_group,
 				   cfg->dma_last_mcu);
 	mtk_jpeg_dec_set_pause_mcu_idx(base, cfg->total_mcu);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
index 8c31c6b12417..2948c9c300a4 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
@@ -71,6 +71,7 @@ int mtk_jpeg_dec_fill_param(struct mtk_jpeg_dec_param *param);
 u32 mtk_jpeg_dec_get_int_status(void __iomem *dec_reg_base);
 u32 mtk_jpeg_dec_enum_result(u32 irq_result);
 void mtk_jpeg_dec_set_config(void __iomem *base,
+			     bool support_34bits,
 			     struct mtk_jpeg_dec_param *cfg,
 			     u32 bitstream_size,
 			     struct mtk_jpeg_bs *bs,
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
index 27b7711ca341..e94f52de7c69 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
@@ -46,5 +46,13 @@
 #define JPGDEC_REG_INTERRUPT_STATUS	0x0274
 #define JPGDEC_REG_STATUS		0x0278
 #define JPGDEC_REG_BIT_STREAM_SIZE	0x0344
+#define JPGDEC_REG_DEST_ADDR0_Y_EXT	0x0360
+#define JPGDEC_REG_DEST_ADDR0_U_EXT	0x0364
+#define JPGDEC_REG_DEST_ADDR0_V_EXT	0x0368
+#define JPGDEC_REG_DEST_ADDR1_Y_EXT	0x036c
+#define JPGDEC_REG_DEST_ADDR1_U_EXT	0x0370
+#define JPGDEC_REG_DEST_ADDR1_V_EXT	0x0374
+#define JPGDEC_REG_FILE_ADDR_EXT	0x0378
+#define JPGDEC_REG_FILE_BRP_EXT		0x037c
 
 #endif /* _MTK_JPEG_REG_H */
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index f8fa3b841ccf..d34652636bbe 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -62,9 +62,15 @@ void mtk_jpeg_enc_reset(void __iomem *base)
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_enc_reset);
 
-u32 mtk_jpeg_enc_get_file_size(void __iomem *base)
+u32 mtk_jpeg_enc_get_file_size(void __iomem *base, bool support_34bit)
 {
-	return readl(base + JPEG_ENC_DMA_ADDR0) -
+	/*
+	 * The dma addr0 to be shifted left by 2 bits
+	 * for support greater than 4G address.
+	 */
+	u8 shift = (support_34bit) ? 2 : 0;
+
+	return (readl(base + JPEG_ENC_DMA_ADDR0) << shift) -
 	       readl(base + JPEG_ENC_DST_ADDR0);
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_enc_get_file_size);
@@ -84,14 +90,28 @@ void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
 {
 	int i;
 	dma_addr_t dma_addr;
+	u32 val;
+	u32 upper;
+	bool support_34bit = ctx->jpeg->variant->support_34bit;
 
 	for (i = 0; i < src_buf->num_planes; i++) {
 		dma_addr = vb2_dma_contig_plane_dma_addr(src_buf, i) +
 			   src_buf->planes[i].data_offset;
-		if (!i)
+		if (!i) {
 			writel(dma_addr, base + JPEG_ENC_SRC_LUMA_ADDR);
-		else
+			if (support_34bit) {
+				upper = upper_32_bits(dma_addr);
+				val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
+				writel(val, base + JPEG_ENC_SRC_LUMA_ADDR_EXT);
+			}
+		} else {
 			writel(dma_addr, base + JPEG_ENC_SRC_CHROMA_ADDR);
+			if (support_34bit) {
+				upper = upper_32_bits(dma_addr);
+				val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
+				writel(val, base + JPEG_ENC_SRC_CHRO_ADDR_EXT);
+			}
+		}
 	}
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_src);
@@ -103,6 +123,8 @@ void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
 	size_t size;
 	u32 dma_addr_offset;
 	u32 dma_addr_offsetmask;
+	u32 val;
+	bool support_34bit = ctx->jpeg->variant->support_34bit;
 
 	dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
 	dma_addr_offset = ctx->enable_exif ? MTK_JPEG_MAX_EXIF_SIZE : 0;
@@ -112,7 +134,16 @@ void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
 	writel(dma_addr_offset & ~0xf, base + JPEG_ENC_OFFSET_ADDR);
 	writel(dma_addr_offsetmask & 0xf, base + JPEG_ENC_BYTE_OFFSET_MASK);
 	writel(dma_addr & ~0xf, base + JPEG_ENC_DST_ADDR0);
-	writel((dma_addr + size) & ~0xf, base + JPEG_ENC_STALL_ADDR0);
+	if (support_34bit) {
+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
+		writel(val, base + JPEG_ENC_DEST_ADDR0_EXT);
+	}
+	dma_addr += size;
+	writel(dma_addr & ~0xf, base + JPEG_ENC_STALL_ADDR0);
+	if (support_34bit) {
+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
+		writel(val, base + JPEG_ENC_STALL_ADDR0_EXT);
+	}
 }
 EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_dst);
 
@@ -278,7 +309,8 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
 		dev_warn(jpeg->dev, "Jpg Enc occurs unknown Err.");
 
-	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
+	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
+			ctx->jpeg->variant->support_34bit);
 	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
index 61c60e4e58ea..31ec9030ae88 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
@@ -68,6 +68,11 @@
 #define JPEG_ENC_DCM_CTRL		0x300
 #define JPEG_ENC_CODEC_SEL		0x314
 #define JPEG_ENC_ULTRA_THRES		0x318
+#define JPEG_ENC_SRC_LUMA_ADDR_EXT      0x584
+#define JPEG_ENC_SRC_CHRO_ADDR_EXT      0x588
+#define JPEG_ENC_Q_TBL_ADDR_EXT         0x58C
+#define JPEG_ENC_DEST_ADDR0_EXT         0x590
+#define JPEG_ENC_STALL_ADDR0_EXT        0x594
 
 /**
  * struct mtk_jpeg_enc_qlt - JPEG encoder quality data
@@ -80,7 +85,7 @@ struct mtk_jpeg_enc_qlt {
 };
 
 void mtk_jpeg_enc_reset(void __iomem *base);
-u32 mtk_jpeg_enc_get_file_size(void __iomem *base);
+u32 mtk_jpeg_enc_get_file_size(void __iomem *base, bool support_34bit);
 void mtk_jpeg_enc_start(void __iomem *enc_reg_base);
 void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
 			  struct vb2_buffer *src_buf);
-- 
2.18.0


