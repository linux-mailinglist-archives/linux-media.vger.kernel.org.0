Return-Path: <linux-media+bounces-16120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5621994E826
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 10:00:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBC461F22E43
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2024 08:00:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0209D16132B;
	Mon, 12 Aug 2024 08:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="Jioh3+3/"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FA155896;
	Mon, 12 Aug 2024 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723449622; cv=pass; b=apXubMRVesAHmWyIYQiJKBVBvLEWBwCHIbUTToFWNTydBhh0SLwtXuYAaIS/az9p1ii0HjdrqVCWbWUdoXZOiSFadYAnbfWcyBS50ZXFoWb1r05Ji6ZbN9rPPXe2AC49Q4vCOrkp+MkVq4hXdFSidmL7iM4FvS1DmDBkNko2ekY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723449622; c=relaxed/simple;
	bh=ujyH5eP47OtlOXslhyEgbhXwTJAXsskEm8TqVZaPh9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i39E9CKxLBdCSE5rCHU0bezdnXIZ/Top8TjaInzSnPAnAxEKW5hDoXy5vxH3CIfRilLXmuBhomIR4VuMMya13bC7YaApSueDehr6Cw0AqkG9EyHTsGZseJBwZKyNDjOZQiatB8h1hbadPT8Yc+aJP6zV6gmP1uANeTS/yEVUbL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=Jioh3+3/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: daniel.almeida@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723449606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NFbaRUhlrQELvF2AFZ6PYFYpixZBLumpBwbu83TbSuSk8RVrAaaFLKXaFihrWMPl9/uo9GRnU1xwC3PRHwnh4JAATEZsLtDmjGdSlh7rGnMAaXSIb57D3FYfBBl6g7DfiEH+qOSNqkOfFU1GWXyuc30Hidzw01ieQpFLPNVIMPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723449606; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DFd87A9N9ScraEtACsJK8XztXiQuTP9FHfYGL32WfeE=; 
	b=hdt2xel4JHk+G9j+EV7QhMeDVdTgMhO+M9xDJpH9iu6a41qB0zu1yF/TY6mzBVhHMG1UfKIm1uOtpZVmk2R+DdpTnYBBKknyIm236l3C1VIbKAgzdvi3pxi3C01yX0FjXLHsS3dTm7qX14NPPTjf2AJDJg0NfqQGsI8YbxtqY38=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723449606;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=DFd87A9N9ScraEtACsJK8XztXiQuTP9FHfYGL32WfeE=;
	b=Jioh3+3/AdwMwt5DuGn04OaHTFUv+w7HZXx/Tf5yg+PErzpUFdks3Z6EQYK8lqdL
	hJIsMom7swHpyOti26g52JpxLYympYa1yWNJfSLZsyGtfWKLcnfK+ETZqeil6VEMQLX
	5OllQg9nutbnccoeYYuwgei1jZuKWIzBEZH5w2Vo=
Received: by mx.zohomail.com with SMTPS id 1723449605239468.707258250921;
	Mon, 12 Aug 2024 01:00:05 -0700 (PDT)
Date: Mon, 12 Aug 2024 10:00:00 +0200
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: daniel.almeida@collabora.com, mchehab@kernel.org,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6 1/1] media: mediatek: jpeg: support 34bits
Message-ID: <20240812080000.mwnmjkpfsy7uyo52@basti-XPS-13-9310>
References: <20240808092555.12999-1-jianhua.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20240808092555.12999-1-jianhua.lin@mediatek.com>
X-ZohoMailClient: External

Hey Jianhua,

On 08.08.2024 17:25, Jianhua Lin wrote:
>the iommu HW supported 34bits iova space(16GB),

s/the iommu HW supported 34bits/The HW iommu supports 34-bit/

>but mediatek jpeg enc/dec driver still is 32bit,

This is obvious by the mere fact that you send a patch so this part can
be omitted.

>then need to set the bit32/bit33 iova to jpeg HW.

My suggestion for the whole commit message:

The HW iommu is able to support a 34-bit iova address-space (16GB),
enable this feature for the encoder/decoder driver by shifting the
address by two bits and setting the extended address registers.

----

further comments below ...

>
>Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
>---
>Changes compared with v5:
>- include header file 'linux/bitfield.h' to fix build error,
>  error: implicit declaration of function 'FIELD_PREP'
>  under allyesconfig.m68k,allmodconfig.sparc64,allmodconfig.m68k
>
> .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 49 ++++++++++++++-
> .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  4 ++
> .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 61 +++++++++++++++----
> .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  1 +
> .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |  8 +++
> .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 46 ++++++++++++--
> .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  7 ++-
> 7 files changed, 156 insertions(+), 20 deletions(-)
>
>diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>index ac48658e2de4..f4e3b90195cf 100644
>--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
>@@ -1030,6 +1030,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
> 	spin_lock_irqsave(&jpeg->hw_lock, flags);
> 	mtk_jpeg_dec_reset(jpeg->reg_base);
> 	mtk_jpeg_dec_set_config(jpeg->reg_base,
>+				jpeg->variant->support_34bit,
> 				&jpeg_src_buf->dec_param,
> 				jpeg_src_buf->bs_size,
> 				&bs,
>@@ -1564,7 +1565,8 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
> 	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
> 	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>
>-	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
>+	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
>+			jpeg->variant->support_34bit);
> 	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
>
> 	buf_state = VB2_BUF_STATE_DONE;
>@@ -1764,6 +1766,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
> 	ctx->total_frame_num++;
> 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
> 	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
>+				jpeg->variant->support_34bit,
> 				&jpeg_src_buf->dec_param,
> 				jpeg_src_buf->bs_size,
> 				&bs,
>@@ -1860,6 +1863,10 @@ static struct clk_bulk_data mtk_jpeg_clocks[] = {
> 	{ .id = "jpgenc" },
> };
>
>+static struct clk_bulk_data mtk_jpeg_dec_clocks[] = {
>+	{ .id = "jpgdec" },
>+};
>+
> static struct clk_bulk_data mt8173_jpeg_dec_clocks[] = {
> 	{ .id = "jpgdec-smi" },
> 	{ .id = "jpgdec" },
>@@ -1922,6 +1929,38 @@ static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
> 	.jpeg_worker = mtk_jpegdec_worker,
> };
>
>+static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
>+	.clks = mtk_jpeg_clocks,
>+	.num_clks = ARRAY_SIZE(mtk_jpeg_clocks),
>+	.formats = mtk_jpeg_enc_formats,
>+	.num_formats = MTK_JPEG_ENC_NUM_FORMATS,
>+	.qops = &mtk_jpeg_enc_qops,
>+	.irq_handler = mtk_jpeg_enc_irq,
>+	.hw_reset = mtk_jpeg_enc_reset,
>+	.m2m_ops = &mtk_jpeg_enc_m2m_ops,
>+	.dev_name = "mtk-jpeg-enc",
>+	.ioctl_ops = &mtk_jpeg_enc_ioctl_ops,
>+	.out_q_default_fourcc = V4L2_PIX_FMT_YUYV,
>+	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>+	.support_34bit = true,
>+};

No, I don't like mixing a new feature to the core of the driver with
adding support for a new variant, do that in a different patch series.
(Meaning do not add it as an extra patch either, send a separate series
with that change as it is totally unrelated to the change you do here)

>+
>+static const struct mtk_jpeg_variant mtk8188_jpegdec_drvdata = {
>+	.clks = mtk_jpeg_dec_clocks,
>+	.num_clks = ARRAY_SIZE(mtk_jpeg_dec_clocks),
>+	.formats = mtk_jpeg_dec_formats,
>+	.num_formats = MTK_JPEG_DEC_NUM_FORMATS,
>+	.qops = &mtk_jpeg_dec_qops,
>+	.irq_handler = mtk_jpeg_dec_irq,
>+	.hw_reset = mtk_jpeg_dec_reset,
>+	.m2m_ops = &mtk_jpeg_dec_m2m_ops,
>+	.dev_name = "mtk-jpeg-dec",
>+	.ioctl_ops = &mtk_jpeg_dec_ioctl_ops,
>+	.out_q_default_fourcc = V4L2_PIX_FMT_JPEG,
>+	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
>+	.support_34bit = true,
>+};

Same here.

>+
> static const struct of_device_id mtk_jpeg_match[] = {
> 	{
> 		.compatible = "mediatek,mt8173-jpgdec",
>@@ -1943,6 +1982,14 @@ static const struct of_device_id mtk_jpeg_match[] = {
> 		.compatible = "mediatek,mt8195-jpgdec",
> 		.data = &mtk8195_jpegdec_drvdata,
> 	},
>+	{
>+		.compatible = "mediatek,mt8188-jpgenc",
>+		.data = &mtk8188_jpegenc_drvdata,
>+	},
>+	{
>+		.compatible = "mediatek,mt8188-jpgdec",
>+		.data = &mtk8188_jpegdec_drvdata,
>+	},

Same here.

> 	{},
> };
>
>diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
>index 8ba6e757e11a..a908d52f7e94 100644
>--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
>+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
>@@ -34,6 +34,8 @@
>
> #define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
>
>+#define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
>+
> /**
>  * enum mtk_jpeg_ctx_state - states of the context state machine
>  * @MTK_JPEG_INIT:		current state is initialized
>@@ -62,6 +64,7 @@ enum mtk_jpeg_ctx_state {
>  * @cap_q_default_fourcc:	capture queue default fourcc
>  * @multi_core:		mark jpeg hw is multi_core or not
>  * @jpeg_worker:		jpeg dec or enc worker
>+ * @support_34bit:	flag to check if support dma_address 34bit

s/flag to check if support dma_address 34bit/
   flag to check support for 34-bit DMA addresses/

>  */
> struct mtk_jpeg_variant {
> 	struct clk_bulk_data *clks;
>@@ -78,6 +81,7 @@ struct mtk_jpeg_variant {
> 	u32 cap_q_default_fourcc;
> 	bool multi_core;
> 	void (*jpeg_worker)(struct work_struct *work);
>+	bool support_34bit;
> };
>
> struct mtk_jpeg_src_buf {
>diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
>index 4a6ee211e18f..e2b05d04f20f 100644
>--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
>+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
>@@ -5,6 +5,8 @@
>  *         Rick Chang <rick.chang@mediatek.com>
>  */
>
>+#include <linux/bitfield.h>
>+#include <linux/bits.h>
> #include <linux/clk.h>
> #include <linux/interrupt.h>
> #include <linux/irq.h>
>@@ -270,7 +272,7 @@ void mtk_jpeg_dec_reset(void __iomem *base)
> EXPORT_SYMBOL_GPL(mtk_jpeg_dec_reset);
>
> static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
>-					u8 yscale_h, u8 uvscale_w, u8 uvscale_h)
>+				u8 yscale_h, u8 uvscale_w, u8 uvscale_h)

Hmmm the previous alignment was corectly aligned to the opening bracket in the line above, why did you change this?

> {
> 	u32 val;
>
>@@ -279,23 +281,43 @@ static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
> 	writel(val, base + JPGDEC_REG_BRZ_FACTOR);
> }
>
>-static void mtk_jpeg_dec_set_dst_bank0(void __iomem *base, u32 addr_y,
>-				       u32 addr_u, u32 addr_v)
>+static void mtk_jpeg_dec_set_dst_bank0(void __iomem *base, bool support_34bit,
>+		dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)

This should be the correct alignment:

static void mtk_jpeg_dec_set_dst_bank0(void __iomem *base, bool support_34bit,
				       dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)

> {
>+	u32 val;
>+
> 	mtk_jpeg_verify_align(addr_y, 16, JPGDEC_REG_DEST_ADDR0_Y);
> 	writel(addr_y, base + JPGDEC_REG_DEST_ADDR0_Y);
> 	mtk_jpeg_verify_align(addr_u, 16, JPGDEC_REG_DEST_ADDR0_U);
> 	writel(addr_u, base + JPGDEC_REG_DEST_ADDR0_U);
> 	mtk_jpeg_verify_align(addr_v, 16, JPGDEC_REG_DEST_ADDR0_V);
> 	writel(addr_v, base + JPGDEC_REG_DEST_ADDR0_V);
>+	if (support_34bit) {
>+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
>+		writel(val, base + JPGDEC_REG_DEST_ADDR0_Y_EXT);
>+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_u));
>+		writel(val, base + JPGDEC_REG_DEST_ADDR0_U_EXT);
>+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_v));
>+		writel(val, base + JPGDEC_REG_DEST_ADDR0_V_EXT);
>+	}
> }
>
>-static void mtk_jpeg_dec_set_dst_bank1(void __iomem *base, u32 addr_y,
>-				       u32 addr_u, u32 addr_v)
>+static void mtk_jpeg_dec_set_dst_bank1(void __iomem *base, bool support_34bit,
>+		dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)
> {
>+	u32 val;
>+
> 	writel(addr_y, base + JPGDEC_REG_DEST_ADDR1_Y);
> 	writel(addr_u, base + JPGDEC_REG_DEST_ADDR1_U);
> 	writel(addr_v, base + JPGDEC_REG_DEST_ADDR1_V);
>+	if (support_34bit) {
>+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
>+		writel(val, base + JPGDEC_REG_DEST_ADDR1_Y_EXT);
>+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_u));
>+		writel(val, base + JPGDEC_REG_DEST_ADDR1_U_EXT);
>+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_v));
>+		writel(val, base + JPGDEC_REG_DEST_ADDR1_V_EXT);
>+	}
> }
>
> static void mtk_jpeg_dec_set_mem_stride(void __iomem *base, u32 stride_y,
>@@ -322,18 +344,31 @@ static void mtk_jpeg_dec_set_dec_mode(void __iomem *base, u32 mode)
> 	writel(mode & 0x03, base + JPGDEC_REG_OPERATION_MODE);
> }
>
>-static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base, u32 ptr)
>+static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base,
>+				bool support_34bit, dma_addr_t ptr)

This fits within the 100 character limit:

static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base, bool support_34bit, dma_addr_t ptr)

> {
>+	u32 val;
>+
> 	mtk_jpeg_verify_align(ptr, 16, JPGDEC_REG_FILE_BRP);
> 	writel(ptr, base + JPGDEC_REG_FILE_BRP);
>+	if (support_34bit) {
>+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(ptr));
>+		writel(val, base + JPGDEC_REG_FILE_BRP_EXT);
>+	}
> }
>
>-static void mtk_jpeg_dec_set_bs_info(void __iomem *base, u32 addr, u32 size,
>-				     u32 bitstream_size)
>+static void mtk_jpeg_dec_set_bs_info(void __iomem *base, bool support_34bit,
>+		dma_addr_t addr, u32 size, u32 bitstream_size)
> {
>+	u32 val;
>+
> 	mtk_jpeg_verify_align(addr, 16, JPGDEC_REG_FILE_ADDR);
> 	mtk_jpeg_verify_align(size, 128, JPGDEC_REG_FILE_TOTAL_SIZE);
> 	writel(addr, base + JPGDEC_REG_FILE_ADDR);
>+	if (support_34bit) {
>+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr));
>+		writel(val, base + JPGDEC_REG_FILE_ADDR_EXT);
>+	}
> 	writel(size, base + JPGDEC_REG_FILE_TOTAL_SIZE);
> 	writel(bitstream_size, base + JPGDEC_REG_BIT_STREAM_SIZE);
> }
>@@ -404,6 +439,7 @@ static void mtk_jpeg_dec_set_sampling_factor(void __iomem *base, u32 comp_num,
> }
>
> void mtk_jpeg_dec_set_config(void __iomem *base,
>+			     bool support_34bits,
> 			     struct mtk_jpeg_dec_param *cfg,
> 			     u32 bitstream_size,
> 			     struct mtk_jpeg_bs *bs,
>@@ -413,8 +449,9 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
> 	mtk_jpeg_dec_set_dec_mode(base, 0);
> 	mtk_jpeg_dec_set_comp0_du(base, cfg->unit_num);
> 	mtk_jpeg_dec_set_total_mcu(base, cfg->total_mcu);
>-	mtk_jpeg_dec_set_bs_info(base, bs->str_addr, bs->size, bitstream_size);
>-	mtk_jpeg_dec_set_bs_write_ptr(base, bs->end_addr);
>+	mtk_jpeg_dec_set_bs_info(base, support_34bits, bs->str_addr,
>+				       bs->size, bitstream_size);

This fits within the 100 character limit:

	mtk_jpeg_dec_set_bs_info(base, support_34bits, bs->str_addr, bs->size, bitstream_size);

>+	mtk_jpeg_dec_set_bs_write_ptr(base, support_34bits, bs->end_addr);
> 	mtk_jpeg_dec_set_du_membership(base, cfg->membership, 1,
> 				       (cfg->comp_num == 1) ? 1 : 0);
> 	mtk_jpeg_dec_set_comp_id(base, cfg->comp_id[0], cfg->comp_id[1],
>@@ -432,9 +469,9 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
> 				    cfg->mem_stride[1]);
> 	mtk_jpeg_dec_set_img_stride(base, cfg->img_stride[0],
> 				    cfg->img_stride[1]);
>-	mtk_jpeg_dec_set_dst_bank0(base, fb->plane_addr[0],
>+	mtk_jpeg_dec_set_dst_bank0(base, support_34bits, fb->plane_addr[0],
> 				   fb->plane_addr[1], fb->plane_addr[2]);
>-	mtk_jpeg_dec_set_dst_bank1(base, 0, 0, 0);
>+	mtk_jpeg_dec_set_dst_bank1(base, support_34bits, 0, 0, 0);
> 	mtk_jpeg_dec_set_dma_group(base, cfg->dma_mcu, cfg->dma_group,
> 				   cfg->dma_last_mcu);
> 	mtk_jpeg_dec_set_pause_mcu_idx(base, cfg->total_mcu);
>diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
>index 8c31c6b12417..2948c9c300a4 100644
>--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
>+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
>@@ -71,6 +71,7 @@ int mtk_jpeg_dec_fill_param(struct mtk_jpeg_dec_param *param);
> u32 mtk_jpeg_dec_get_int_status(void __iomem *dec_reg_base);
> u32 mtk_jpeg_dec_enum_result(u32 irq_result);
> void mtk_jpeg_dec_set_config(void __iomem *base,
>+			     bool support_34bits,
> 			     struct mtk_jpeg_dec_param *cfg,
> 			     u32 bitstream_size,
> 			     struct mtk_jpeg_bs *bs,
>diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
>index 27b7711ca341..e94f52de7c69 100644
>--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
>+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
>@@ -46,5 +46,13 @@
> #define JPGDEC_REG_INTERRUPT_STATUS	0x0274
> #define JPGDEC_REG_STATUS		0x0278
> #define JPGDEC_REG_BIT_STREAM_SIZE	0x0344
>+#define JPGDEC_REG_DEST_ADDR0_Y_EXT	0x0360
>+#define JPGDEC_REG_DEST_ADDR0_U_EXT	0x0364
>+#define JPGDEC_REG_DEST_ADDR0_V_EXT	0x0368
>+#define JPGDEC_REG_DEST_ADDR1_Y_EXT	0x036c
>+#define JPGDEC_REG_DEST_ADDR1_U_EXT	0x0370
>+#define JPGDEC_REG_DEST_ADDR1_V_EXT	0x0374
>+#define JPGDEC_REG_FILE_ADDR_EXT	0x0378
>+#define JPGDEC_REG_FILE_BRP_EXT		0x037c
>
> #endif /* _MTK_JPEG_REG_H */
>diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
>index f8fa3b841ccf..87fe1f324f23 100644
>--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
>+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
>@@ -5,6 +5,8 @@
>  *
>  */
>
>+#include <linux/bitfield.h>
>+#include <linux/bits.h>
> #include <linux/clk.h>
> #include <linux/interrupt.h>
> #include <linux/irq.h>
>@@ -62,9 +64,15 @@ void mtk_jpeg_enc_reset(void __iomem *base)
> }
> EXPORT_SYMBOL_GPL(mtk_jpeg_enc_reset);
>
>-u32 mtk_jpeg_enc_get_file_size(void __iomem *base)
>+u32 mtk_jpeg_enc_get_file_size(void __iomem *base, bool support_34bit)
> {
>-	return readl(base + JPEG_ENC_DMA_ADDR0) -
>+	/*
>+	 * The dma addr0 to be shifted left by 2 bits
>+	 * for support greater than 4G address.

4G address? Do you mean 4MB address?

Also the grammar is wrong, please word it like this instead:

   * The DMA address has to be shifted by 2 bits
   * to support addresses larger than 4 MB

>+	 */
>+	u8 shift = (support_34bit) ? 2 : 0;
>+
>+	return (readl(base + JPEG_ENC_DMA_ADDR0) << shift) -
> 	       readl(base + JPEG_ENC_DST_ADDR0);

I don't think that variable is required as it is obvious by the << operation
that we are doing a shift here and it doesn't exceed the line length.

	return (readl(base + JPEG_ENC_DMA_ADDR0) << ((support_34bit) ? 2 : 0)) -

> }
> EXPORT_SYMBOL_GPL(mtk_jpeg_enc_get_file_size);
>@@ -84,14 +92,28 @@ void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
> {
> 	int i;
> 	dma_addr_t dma_addr;
>+	u32 val;
>+	u32 upper;

As described below we can exchange the val and upper variables with an addr_ext variable.

>+	bool support_34bit = ctx->jpeg->variant->support_34bit;
>
> 	for (i = 0; i < src_buf->num_planes; i++) {
> 		dma_addr = vb2_dma_contig_plane_dma_addr(src_buf, i) +
> 			   src_buf->planes[i].data_offset;

As we do the same field preparation for both conditions, I'd suggest that we do that here:

			if (support_34bit) {
				addr_ext = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));

>-		if (!i)
>+		if (!i) {

Just a nit-pick ..
 From my perspective, I'd prefer if we ask for the specific plane here, e.g.:

if (i == 0) {

> 			writel(dma_addr, base + JPEG_ENC_SRC_LUMA_ADDR);
>-		else
>+			if (support_34bit) {
>+				upper = upper_32_bits(dma_addr);
>+				val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
>+				writel(val, base + JPEG_ENC_SRC_LUMA_ADDR_EXT);

As described above, we can do the field preparation ones and then down here we just say:

			if (support_34bit)
				writel(addr_ext, base + JPEG_ENC_SRC_LUMA_ADDR_EXT);

>+			}
>+		} else {
> 			writel(dma_addr, base + JPEG_ENC_SRC_CHROMA_ADDR);
>+			if (support_34bit) {
>+				upper = upper_32_bits(dma_addr);
>+				val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper);
>+				writel(val, base + JPEG_ENC_SRC_CHRO_ADDR_EXT);

and ...

			if (support_34bit)
				writel(addr_ext, base + JPEG_ENC_SRC_CHRO_ADDR_EXT);

>+			}
>+		}
> 	}
> }
> EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_src);
>@@ -103,6 +125,8 @@ void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
> 	size_t size;
> 	u32 dma_addr_offset;
> 	u32 dma_addr_offsetmask;
>+	u32 val;

I'd add a variable here for the upper 32 bits of the JPEG address:
   u32 addr_ext;

>+	bool support_34bit = ctx->jpeg->variant->support_34bit;
>
> 	dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
> 	dma_addr_offset = ctx->enable_exif ? MTK_JPEG_MAX_EXIF_SIZE : 0;

   if (support_34bits)
     addr_ext = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));

>@@ -112,7 +136,16 @@ void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
> 	writel(dma_addr_offset & ~0xf, base + JPEG_ENC_OFFSET_ADDR);
> 	writel(dma_addr_offsetmask & 0xf, base + JPEG_ENC_BYTE_OFFSET_MASK);
> 	writel(dma_addr & ~0xf, base + JPEG_ENC_DST_ADDR0);
>-	writel((dma_addr + size) & ~0xf, base + JPEG_ENC_STALL_ADDR0);
>+	if (support_34bit) {
>+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
>+		writel(val, base + JPEG_ENC_DEST_ADDR0_EXT);

And then ...

	if (support_34bit)
		writel(addr_ext, base + JPEG_ENC_DEST_ADDR0_EXT);

>+	}
>+	dma_addr += size;
>+	writel(dma_addr & ~0xf, base + JPEG_ENC_STALL_ADDR0);
>+	if (support_34bit) {
>+		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
>+		writel(val, base + JPEG_ENC_STALL_ADDR0_EXT);

And ...

	if (support_34bit)
		writel(addr_ext, base + JPEG_ENC_STALL_ADDR0_EXT);

Also please notice all these checkpatch warnings:

CHECK: Alignment should match open parenthesis
#39: FILE: drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c:1569:
+	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
+			jpeg->variant->support_34bit);

CHECK: Alignment should match open parenthesis
#174: FILE: drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:285:
+static void mtk_jpeg_dec_set_dst_bank0(void __iomem *base, bool support_34bit,
+		dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)

CHECK: Alignment should match open parenthesis
#197: FILE: drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:306:
+static void mtk_jpeg_dec_set_dst_bank1(void __iomem *base, bool support_34bit,
+		dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)

CHECK: Alignment should match open parenthesis
#221: FILE: drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:348:
+static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base,
+				bool support_34bit, dma_addr_t ptr)

CHECK: Alignment should match open parenthesis
#236: FILE: drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:361:
+static void mtk_jpeg_dec_set_bs_info(void __iomem *base, bool support_34bit,
+		dma_addr_t addr, u32 size, u32 bitstream_size)

CHECK: Alignment should match open parenthesis
#265: FILE: drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c:453:
+	mtk_jpeg_dec_set_bs_info(base, support_34bits, bs->str_addr,
+				       bs->size, bitstream_size);

CHECK: Alignment should match open parenthesis
#407: FILE: drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c:315:
+	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
+			ctx->jpeg->variant->support_34bit);

Regards,
Sebastian Fricke
Consultant Software Engineer

Collabora Ltd
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales no 5513718.

>+	}
> }
> EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_dst);
>
>@@ -278,7 +311,8 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
> 	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
> 		dev_warn(jpeg->dev, "Jpg Enc occurs unknown Err.");
>
>-	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
>+	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
>+			ctx->jpeg->variant->support_34bit);
> 	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
> 	buf_state = VB2_BUF_STATE_DONE;
> 	v4l2_m2m_buf_done(src_buf, buf_state);
>diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
>index 61c60e4e58ea..31ec9030ae88 100644
>--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
>+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
>@@ -68,6 +68,11 @@
> #define JPEG_ENC_DCM_CTRL		0x300
> #define JPEG_ENC_CODEC_SEL		0x314
> #define JPEG_ENC_ULTRA_THRES		0x318
>+#define JPEG_ENC_SRC_LUMA_ADDR_EXT      0x584
>+#define JPEG_ENC_SRC_CHRO_ADDR_EXT      0x588
>+#define JPEG_ENC_Q_TBL_ADDR_EXT         0x58C
>+#define JPEG_ENC_DEST_ADDR0_EXT         0x590
>+#define JPEG_ENC_STALL_ADDR0_EXT        0x594
>
> /**
>  * struct mtk_jpeg_enc_qlt - JPEG encoder quality data
>@@ -80,7 +85,7 @@ struct mtk_jpeg_enc_qlt {
> };
>
> void mtk_jpeg_enc_reset(void __iomem *base);
>-u32 mtk_jpeg_enc_get_file_size(void __iomem *base);
>+u32 mtk_jpeg_enc_get_file_size(void __iomem *base, bool support_34bit);
> void mtk_jpeg_enc_start(void __iomem *enc_reg_base);
> void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
> 			  struct vb2_buffer *src_buf);
>-- 
>2.46.0
>
>

