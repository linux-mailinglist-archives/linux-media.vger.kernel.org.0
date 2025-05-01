Return-Path: <linux-media+bounces-31508-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4F9AA623D
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 19:21:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0E8F17AB95D
	for <lists+linux-media@lfdr.de>; Thu,  1 May 2025 17:20:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11733215193;
	Thu,  1 May 2025 17:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="OQLL+rn/"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969C41D63C2;
	Thu,  1 May 2025 17:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746120057; cv=none; b=cRpy9NKq1+hz1wbmxe0eoCABWICaTwIW21i26FDyFxzGtNOo9SIOTZ0uEFzuPy6SWnRX2tZqzstKOzZjkTpimd54MhR04UGUyFS+350q+BgsA6l6CPwDZzFIg8+Axq4xqNZgMU6M8uCy+Jga1im8vC6NGRcsQ7+V+t6ugm0MW0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746120057; c=relaxed/simple;
	bh=KDlbAe6ClaUusq94G3gsqpReNddeH8O6kD0IhSlBfTs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JoilHj2JnlG5B6LeYEZgdUFgzMiZY6oK3FJUQ1UTyflp3IBURK15zQroQ3XmZrLDqPCnQHphGNZ/pjV3N89YOtRArQUwK+Obzb4BXd5aTj4R+IVW5OOcrguao0TcacxroKp0EnmtXzdSaGRdv8HToW0l5xM/k8oXFC04gFbRwdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=OQLL+rn/; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746120046;
	bh=KDlbAe6ClaUusq94G3gsqpReNddeH8O6kD0IhSlBfTs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=OQLL+rn/35GpSeQg7kpibu3y19JknjanXrDzH+r6b84ln3DSYkbp4ebnC2IxStyDJ
	 I+s0FrM/FYackqkRE9NPO+dUAsrG3EGzcAXdCb0/iSJJfZ2O0++ZexnG37Ou/+sD1z
	 F4TE/9lo+Wxvh4LFh2cJ3/w20guv9bXL/5CoTj5gAm09sFWHGmNGQONlpMNbdE4aev
	 sF5wSB6PAVVZIiVWGsp3tyLdXL6CWGS7uSqaHLPG8uRDSTotfuLfx+HVXX54zFVOd9
	 OItKGGzqwoMEeNsRYIdlib8nra5TLwjXRaB1eWGv3qJoVHmLIT2cej++WbWBznQaIu
	 vdAy+yx6NBJ6g==
Received: from [IPv6:2606:6d00:17:8242::5ac] (unknown [IPv6:2606:6d00:17:8242::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 93F8F17E1249;
	Thu,  1 May 2025 19:20:45 +0200 (CEST)
Message-ID: <b3ae9171a07b1af86160cc5094c24f7a05572be6.camel@collabora.com>
Subject: Re: [PATCH v8 1/1] media: mediatek: jpeg: support 34bits
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jianhua Lin <jianhua.lin@mediatek.com>, 
	angelogioacchino.delregno@collabora.com, sebastian.fricke@collabora.com, 
	daniel.almeida@collabora.com, mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Thu, 01 May 2025 13:20:44 -0400
In-Reply-To: <20250424090824.5309-1-jianhua.lin@mediatek.com>
References: <20250424090824.5309-1-jianhua.lin@mediatek.com>
Organization: Collabora Canada
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le jeudi 24 avril 2025 à 17:08 +0800, Jianhua Lin a écrit :
> The HW iommu is able to support a 34-bit iova address-space (16GB),
> enable this feature for the encoder/decoder driver by shifting the
> address by two bits and setting the extended address registers.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> Changes compared with v7:
> - Fix reviewer's comments
> 	- Add lower_32_bits() to explicity write the lower 32bits address
> 
>  .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  5 +-
>  .../platform/mediatek/jpeg/mtk_jpeg_core.h    |  4 +
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 73 ++++++++++++++-----
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  1 +
>  .../platform/mediatek/jpeg/mtk_jpeg_dec_reg.h |  8 ++
>  .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 33 +++++++--
>  .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  7 +-
>  7 files changed, 104 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index 7dd652e5b6d4..23692cd91e2c 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1026,6 +1026,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
>  	spin_lock_irqsave(&jpeg->hw_lock, flags);
>  	mtk_jpeg_dec_reset(jpeg->reg_base);
>  	mtk_jpeg_dec_set_config(jpeg->reg_base,
> +				jpeg->variant->support_34bit,
>  				&jpeg_src_buf->dec_param,
>  				jpeg_src_buf->bs_size,
>  				&bs,
> @@ -1570,7 +1571,8 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
>  	src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
>  	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
>  
> -	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
> +	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
> +						 jpeg->variant->support_34bit);
>  	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
>  
>  	buf_state = VB2_BUF_STATE_DONE;
> @@ -1770,6 +1772,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
>  	ctx->total_frame_num++;
>  	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
>  	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
> +				jpeg->variant->support_34bit,
>  				&jpeg_src_buf->dec_param,
>  				jpeg_src_buf->bs_size,
>  				&bs,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 8877eb39e807..02ed0ed5b736 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -34,6 +34,8 @@
>  
>  #define MTK_JPEG_MAX_EXIF_SIZE	(64 * 1024)
>  
> +#define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
> +
>  /**
>   * enum mtk_jpeg_ctx_state - states of the context state machine
>   * @MTK_JPEG_INIT:		current state is initialized
> @@ -62,6 +64,7 @@ enum mtk_jpeg_ctx_state {
>   * @cap_q_default_fourcc:	capture queue default fourcc
>   * @multi_core:		mark jpeg hw is multi_core or not
>   * @jpeg_worker:		jpeg dec or enc worker
> + * @support_34bit:	flag to check support for 34-bit DMA address
>   */
>  struct mtk_jpeg_variant {
>  	struct clk_bulk_data *clks;
> @@ -78,6 +81,7 @@ struct mtk_jpeg_variant {
>  	u32 cap_q_default_fourcc;
>  	bool multi_core;
>  	void (*jpeg_worker)(struct work_struct *work);
> +	bool support_34bit;
>  };
>  
>  struct mtk_jpeg_src_buf {
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index 2c5d74939d0a..e78e1d11093c 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -5,6 +5,8 @@
>   *         Rick Chang <rick.chang@mediatek.com>
>   */
>  
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> @@ -279,23 +281,43 @@ static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
>  	writel(val, base + JPGDEC_REG_BRZ_FACTOR);
>  }
>  
> -static void mtk_jpeg_dec_set_dst_bank0(void __iomem *base, u32 addr_y,
> -				       u32 addr_u, u32 addr_v)
> +static void mtk_jpeg_dec_set_dst_bank0(void __iomem *base, bool support_34bit,
> +				       dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)
>  {
> +	u32 val;
> +
>  	mtk_jpeg_verify_align(addr_y, 16, JPGDEC_REG_DEST_ADDR0_Y);
> -	writel(addr_y, base + JPGDEC_REG_DEST_ADDR0_Y);
> +	writel(lower_32_bits(addr_y), base + JPGDEC_REG_DEST_ADDR0_Y);
>  	mtk_jpeg_verify_align(addr_u, 16, JPGDEC_REG_DEST_ADDR0_U);
> -	writel(addr_u, base + JPGDEC_REG_DEST_ADDR0_U);
> +	writel(lower_32_bits(addr_u), base + JPGDEC_REG_DEST_ADDR0_U);
>  	mtk_jpeg_verify_align(addr_v, 16, JPGDEC_REG_DEST_ADDR0_V);
> -	writel(addr_v, base + JPGDEC_REG_DEST_ADDR0_V);
> +	writel(lower_32_bits(addr_v), base + JPGDEC_REG_DEST_ADDR0_V);
> +	if (support_34bit) {
> +		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
> +		writel(val, base + JPGDEC_REG_DEST_ADDR0_Y_EXT);
> +		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_u));
> +		writel(val, base + JPGDEC_REG_DEST_ADDR0_U_EXT);
> +		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_v));
> +		writel(val, base + JPGDEC_REG_DEST_ADDR0_V_EXT);
> +	}
>  }
>  
> -static void mtk_jpeg_dec_set_dst_bank1(void __iomem *base, u32 addr_y,
> -				       u32 addr_u, u32 addr_v)
> +static void mtk_jpeg_dec_set_dst_bank1(void __iomem *base, bool support_34bit,
> +				       dma_addr_t addr_y, dma_addr_t addr_u, dma_addr_t addr_v)
>  {
> -	writel(addr_y, base + JPGDEC_REG_DEST_ADDR1_Y);
> -	writel(addr_u, base + JPGDEC_REG_DEST_ADDR1_U);
> -	writel(addr_v, base + JPGDEC_REG_DEST_ADDR1_V);
> +	u32 val;
> +
> +	writel(lower_32_bits(addr_y), base + JPGDEC_REG_DEST_ADDR1_Y);
> +	writel(lower_32_bits(addr_u), base + JPGDEC_REG_DEST_ADDR1_U);
> +	writel(lower_32_bits(addr_v), base + JPGDEC_REG_DEST_ADDR1_V);
> +	if (support_34bit) {
> +		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_y));
> +		writel(val, base + JPGDEC_REG_DEST_ADDR1_Y_EXT);
> +		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_u));
> +		writel(val, base + JPGDEC_REG_DEST_ADDR1_U_EXT);
> +		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr_v));
> +		writel(val, base + JPGDEC_REG_DEST_ADDR1_V_EXT);
> +	}
>  }
>  
>  static void mtk_jpeg_dec_set_mem_stride(void __iomem *base, u32 stride_y,
> @@ -322,18 +344,30 @@ static void mtk_jpeg_dec_set_dec_mode(void __iomem *base, u32 mode)
>  	writel(mode & 0x03, base + JPGDEC_REG_OPERATION_MODE);
>  }
>  
> -static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base, u32 ptr)
> +static void mtk_jpeg_dec_set_bs_write_ptr(void __iomem *base, bool support_34bit, dma_addr_t ptr)
>  {
> +	u32 val;
> +
>  	mtk_jpeg_verify_align(ptr, 16, JPGDEC_REG_FILE_BRP);
> -	writel(ptr, base + JPGDEC_REG_FILE_BRP);
> +	writel(lower_32_bits(ptr), base + JPGDEC_REG_FILE_BRP);
> +	if (support_34bit) {
> +		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(ptr));
> +		writel(val, base + JPGDEC_REG_FILE_BRP_EXT);
> +	}
>  }
>  
> -static void mtk_jpeg_dec_set_bs_info(void __iomem *base, u32 addr, u32 size,
> -				     u32 bitstream_size)
> +static void mtk_jpeg_dec_set_bs_info(void __iomem *base, bool support_34bit,
> +				     dma_addr_t addr, u32 size, u32 bitstream_size)
>  {
> +	u32 val;
> +
>  	mtk_jpeg_verify_align(addr, 16, JPGDEC_REG_FILE_ADDR);
>  	mtk_jpeg_verify_align(size, 128, JPGDEC_REG_FILE_TOTAL_SIZE);
> -	writel(addr, base + JPGDEC_REG_FILE_ADDR);
> +	writel(lower_32_bits(addr), base + JPGDEC_REG_FILE_ADDR);
> +	if (support_34bit) {
> +		val = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(addr));
> +		writel(val, base + JPGDEC_REG_FILE_ADDR_EXT);
> +	}
>  	writel(size, base + JPGDEC_REG_FILE_TOTAL_SIZE);
>  	writel(bitstream_size, base + JPGDEC_REG_BIT_STREAM_SIZE);
>  }
> @@ -404,6 +438,7 @@ static void mtk_jpeg_dec_set_sampling_factor(void __iomem *base, u32 comp_num,
>  }
>  
>  void mtk_jpeg_dec_set_config(void __iomem *base,
> +			     bool support_34bits,
>  			     struct mtk_jpeg_dec_param *cfg,
>  			     u32 bitstream_size,
>  			     struct mtk_jpeg_bs *bs,
> @@ -413,8 +448,8 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
>  	mtk_jpeg_dec_set_dec_mode(base, 0);
>  	mtk_jpeg_dec_set_comp0_du(base, cfg->unit_num);
>  	mtk_jpeg_dec_set_total_mcu(base, cfg->total_mcu);
> -	mtk_jpeg_dec_set_bs_info(base, bs->str_addr, bs->size, bitstream_size);
> -	mtk_jpeg_dec_set_bs_write_ptr(base, bs->end_addr);
> +	mtk_jpeg_dec_set_bs_info(base, support_34bits, bs->str_addr, bs->size, bitstream_size);
> +	mtk_jpeg_dec_set_bs_write_ptr(base, support_34bits, bs->end_addr);
>  	mtk_jpeg_dec_set_du_membership(base, cfg->membership, 1,
>  				       (cfg->comp_num == 1) ? 1 : 0);
>  	mtk_jpeg_dec_set_comp_id(base, cfg->comp_id[0], cfg->comp_id[1],
> @@ -432,9 +467,9 @@ void mtk_jpeg_dec_set_config(void __iomem *base,
>  				    cfg->mem_stride[1]);
>  	mtk_jpeg_dec_set_img_stride(base, cfg->img_stride[0],
>  				    cfg->img_stride[1]);
> -	mtk_jpeg_dec_set_dst_bank0(base, fb->plane_addr[0],
> +	mtk_jpeg_dec_set_dst_bank0(base, support_34bits, fb->plane_addr[0],
>  				   fb->plane_addr[1], fb->plane_addr[2]);
> -	mtk_jpeg_dec_set_dst_bank1(base, 0, 0, 0);
> +	mtk_jpeg_dec_set_dst_bank1(base, support_34bits, 0, 0, 0);
>  	mtk_jpeg_dec_set_dma_group(base, cfg->dma_mcu, cfg->dma_group,
>  				   cfg->dma_last_mcu);
>  	mtk_jpeg_dec_set_pause_mcu_idx(base, cfg->total_mcu);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
> index 8c31c6b12417..2948c9c300a4 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.h
> @@ -71,6 +71,7 @@ int mtk_jpeg_dec_fill_param(struct mtk_jpeg_dec_param *param);
>  u32 mtk_jpeg_dec_get_int_status(void __iomem *dec_reg_base);
>  u32 mtk_jpeg_dec_enum_result(u32 irq_result);
>  void mtk_jpeg_dec_set_config(void __iomem *base,
> +			     bool support_34bits,
>  			     struct mtk_jpeg_dec_param *cfg,
>  			     u32 bitstream_size,
>  			     struct mtk_jpeg_bs *bs,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
> index 27b7711ca341..e94f52de7c69 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_reg.h
> @@ -46,5 +46,13 @@
>  #define JPGDEC_REG_INTERRUPT_STATUS	0x0274
>  #define JPGDEC_REG_STATUS		0x0278
>  #define JPGDEC_REG_BIT_STREAM_SIZE	0x0344
> +#define JPGDEC_REG_DEST_ADDR0_Y_EXT	0x0360
> +#define JPGDEC_REG_DEST_ADDR0_U_EXT	0x0364
> +#define JPGDEC_REG_DEST_ADDR0_V_EXT	0x0368
> +#define JPGDEC_REG_DEST_ADDR1_Y_EXT	0x036c
> +#define JPGDEC_REG_DEST_ADDR1_U_EXT	0x0370
> +#define JPGDEC_REG_DEST_ADDR1_V_EXT	0x0374
> +#define JPGDEC_REG_FILE_ADDR_EXT	0x0378
> +#define JPGDEC_REG_FILE_BRP_EXT		0x037c
>  
>  #endif /* _MTK_JPEG_REG_H */
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> index f8fa3b841ccf..9ab27aee302a 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
> @@ -5,6 +5,8 @@
>   *
>   */
>  
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
>  #include <linux/clk.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> @@ -62,9 +64,9 @@ void mtk_jpeg_enc_reset(void __iomem *base)
>  }
>  EXPORT_SYMBOL_GPL(mtk_jpeg_enc_reset);
>  
> -u32 mtk_jpeg_enc_get_file_size(void __iomem *base)
> +u32 mtk_jpeg_enc_get_file_size(void __iomem *base, bool support_34bit)
>  {
> -	return readl(base + JPEG_ENC_DMA_ADDR0) -
> +	return (readl(base + JPEG_ENC_DMA_ADDR0) << ((support_34bit) ? 2 : 0)) -
>  	       readl(base + JPEG_ENC_DST_ADDR0);
>  }
>  EXPORT_SYMBOL_GPL(mtk_jpeg_enc_get_file_size);
> @@ -84,14 +86,24 @@ void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
>  {
>  	int i;
>  	dma_addr_t dma_addr;
> +	u32 addr_ext;
> +	bool support_34bit = ctx->jpeg->variant->support_34bit;
>  
>  	for (i = 0; i < src_buf->num_planes; i++) {
>  		dma_addr = vb2_dma_contig_plane_dma_addr(src_buf, i) +
>  			   src_buf->planes[i].data_offset;
> -		if (!i)
> -			writel(dma_addr, base + JPEG_ENC_SRC_LUMA_ADDR);
> +		if (i == 0)
> +			writel(lower_32_bits(dma_addr), base + JPEG_ENC_SRC_LUMA_ADDR);
>  		else
> -			writel(dma_addr, base + JPEG_ENC_SRC_CHROMA_ADDR);
> +			writel(lower_32_bits(dma_addr), base + JPEG_ENC_SRC_CHROMA_ADDR);
> +
> +		if (support_34bit) {
> +			addr_ext = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
> +			if (i == 0)
> +				writel(addr_ext, base + JPEG_ENC_SRC_LUMA_ADDR_EXT);
> +			else
> +				writel(addr_ext, base + JPEG_ENC_SRC_CHRO_ADDR_EXT);
> +		}
>  	}
>  }
>  EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_src);
> @@ -103,6 +115,8 @@ void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
>  	size_t size;
>  	u32 dma_addr_offset;
>  	u32 dma_addr_offsetmask;
> +	u32 addr_ext;
> +	bool support_34bit = ctx->jpeg->variant->support_34bit;
>  
>  	dma_addr = vb2_dma_contig_plane_dma_addr(dst_buf, 0);
>  	dma_addr_offset = ctx->enable_exif ? MTK_JPEG_MAX_EXIF_SIZE : 0;
> @@ -113,6 +127,12 @@ void mtk_jpeg_set_enc_dst(struct mtk_jpeg_ctx *ctx, void __iomem *base,
>  	writel(dma_addr_offsetmask & 0xf, base + JPEG_ENC_BYTE_OFFSET_MASK);
>  	writel(dma_addr & ~0xf, base + JPEG_ENC_DST_ADDR0);
>  	writel((dma_addr + size) & ~0xf, base + JPEG_ENC_STALL_ADDR0);
> +
> +	if (support_34bit) {
> +		addr_ext = FIELD_PREP(MTK_JPEG_ADDR_MASK, upper_32_bits(dma_addr));
> +		writel(addr_ext, base + JPEG_ENC_DEST_ADDR0_EXT);
> +		writel(addr_ext + size, base + JPEG_ENC_STALL_ADDR0_EXT);
> +	}
>  }
>  EXPORT_SYMBOL_GPL(mtk_jpeg_set_enc_dst);
>  
> @@ -278,7 +298,8 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
>  	if (!(irq_status & JPEG_ENC_INT_STATUS_DONE))
>  		dev_warn(jpeg->dev, "Jpg Enc occurs unknown Err.");
>  
> -	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base);
> +	result_size = mtk_jpeg_enc_get_file_size(jpeg->reg_base,
> +						 ctx->jpeg->variant->support_34bit);
>  	vb2_set_plane_payload(&dst_buf->vb2_buf, 0, result_size);
>  	buf_state = VB2_BUF_STATE_DONE;
>  	v4l2_m2m_buf_done(src_buf, buf_state);
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
> b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
> index 61c60e4e58ea..31ec9030ae88 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.h
> @@ -68,6 +68,11 @@
>  #define JPEG_ENC_DCM_CTRL		0x300
>  #define JPEG_ENC_CODEC_SEL		0x314
>  #define JPEG_ENC_ULTRA_THRES		0x318
> +#define JPEG_ENC_SRC_LUMA_ADDR_EXT      0x584
> +#define JPEG_ENC_SRC_CHRO_ADDR_EXT      0x588
> +#define JPEG_ENC_Q_TBL_ADDR_EXT         0x58C
> +#define JPEG_ENC_DEST_ADDR0_EXT         0x590
> +#define JPEG_ENC_STALL_ADDR0_EXT        0x594
>  
>  /**
>   * struct mtk_jpeg_enc_qlt - JPEG encoder quality data
> @@ -80,7 +85,7 @@ struct mtk_jpeg_enc_qlt {
>  };
>  
>  void mtk_jpeg_enc_reset(void __iomem *base);
> -u32 mtk_jpeg_enc_get_file_size(void __iomem *base);
> +u32 mtk_jpeg_enc_get_file_size(void __iomem *base, bool support_34bit);
>  void mtk_jpeg_enc_start(void __iomem *enc_reg_base);
>  void mtk_jpeg_set_enc_src(struct mtk_jpeg_ctx *ctx,  void __iomem *base,
>  			  struct vb2_buffer *src_buf);

