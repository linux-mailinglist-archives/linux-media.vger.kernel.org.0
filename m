Return-Path: <linux-media+bounces-24600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AD283A08C68
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 10:41:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DFB931885073
	for <lists+linux-media@lfdr.de>; Fri, 10 Jan 2025 09:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66CBC20B1F7;
	Fri, 10 Jan 2025 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iNXFVmOI"
X-Original-To: linux-media@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5EF209F3F;
	Fri, 10 Jan 2025 09:39:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736501989; cv=none; b=p9MvhunzewsFmFQ6cz7H6RXfP6LyVtbsJXN9W9ivy5s8MCju3ccAdcSPNNGhD8NyaOsiAf8EFADnb5ymzEO7ti11I091f4At+CMLjjecuBruanDmF9ln3DIltNhMatcryUPNJDzQ5AETO7Vjgpzkzm8Ch9LFGZDH+FwykghdR1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736501989; c=relaxed/simple;
	bh=mAGSSYgPDghIBQGBzXCxEaknVfzgfmOXuOBboqhcRAw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EyQi4OFzm80UrXQsfn+gmIxECIVlq6uNMtgto13/794uH+H8B/o5MRbu62uBdHibf0qDgqGAKAYqKuksJh19wS1JqjtWFOt+rNFWUbUCSJXYr1uhMYWn+an66NaDc3aDGwSvSMy0q53yHNX2I3o3NpYlNt9HYVDfLnSQLvJ/wuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iNXFVmOI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736501980;
	bh=mAGSSYgPDghIBQGBzXCxEaknVfzgfmOXuOBboqhcRAw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iNXFVmOI18fsXMXKHE5f5cxJPB6Cker365AsEnhJuV9zXoRL+nQIwpkGiqcjQMF79
	 PVii5OVXLcXwPmOB0Tl6tp8D8rWQSiOPzITKI0vtiHQWph1MCx/E1gAk0u5GRq6TC1
	 VAJr2acJYyJdyjIRHojbyp7bKnoLkccMLx9dlFJpF1vCBVnDOc2Rt2jQAFEcVCdjw7
	 3/OEySXJqDQsjwvKsa80L4tx7fLbIA2zCy8ET0yAVMiIH+ysZ069IyUOxQHPwqrEvY
	 bqPdKRpZJWhgQEHJms2AqfJLgMqq2JB6Swt/YGkhFjQ7UNx2bAOhxkYiozlsIzoLM8
	 4PPaBYQaW12+A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2BD4317E0AE5;
	Fri, 10 Jan 2025 10:39:39 +0100 (CET)
Message-ID: <73144187-7f7f-4f68-aa5a-5fc019e646ec@collabora.com>
Date: Fri, 10 Jan 2025 10:39:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [V1,04/12] media: mediatek: jpeg: add jpeg smmu sid setting
To: "kyrie.wu" <kyrie.wu@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250109133513.20151-1-kyrie.wu@mediatek.com>
 <20250109133513.20151-5-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250109133513.20151-5-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/01/25 14:35, kyrie.wu ha scritto:
> Add a configuration to set jpeg dec & enc smmu sid
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
> ---
>   .../platform/mediatek/jpeg/mtk_jpeg_core.c    |  6 ++++
>   .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 11 +++++++
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 30 +++++++++++++++++--
>   .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.h  |  4 +++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 26 ++++++++++++++++
>   .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.h  |  4 +++
>   6 files changed, 78 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> index c3ccc525d9fd..77b3bd6c4d3f 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
> @@ -1655,6 +1655,9 @@ static void mtk_jpegenc_worker(struct work_struct *work)
>   	jpeg_dst_buf->frame_num = ctx->total_frame_num;
>   	ctx->total_frame_num++;
>   	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
> +	mtk_jpeg_enc_set_smmu_sid(hw_id);
> +#endif
>   	mtk_jpeg_set_enc_dst(ctx,
>   			     comp_jpeg[hw_id]->reg_base,
>   			     &dst_buf->vb2_buf);
> @@ -1771,6 +1774,9 @@ static void mtk_jpegdec_worker(struct work_struct *work)
>   	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
>   	ctx->total_frame_num++;
>   	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3)

You can avoid using preprocessor conditionals - and then, this doesn't look like an
ARM SMMUv3 configuration, but rather a JPEG dec/enc HW config, so in that case the
enclosing of this in the proposed config option would even be wrong.

Use platform data for that.

> +	mtk_jpeg_dec_set_smmu_sid(hw_id);
> +#endif
>   	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
>   				jpeg->variant->support_34bit,
>   				&jpeg_src_buf->dec_param,
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> index 8fddc133c46c..d3aba1e6cae8 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
> @@ -36,6 +36,17 @@
>   
>   #define MTK_JPEG_ADDR_MASK GENMASK(1, 0)
>   
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
> +#define JPG_REG_CORE0_GUSER_ID                          0x380d0000
> +#define JPG_REG_CORE1_GUSER_ID                          0x388d0000

At least these two definitions shall go in the devicetree reg node.

> +#define JPG_REG_GUSER_ID_MASK                           0x7
> +#define JPG_REG_GUSER_ID_DEC_SID                        0x4
> +#define JPG_REG_GUSER_ID_ENC_SID                        0x5
> +#define JPG_REG_DEC_GUSER_ID_SHIFT                      8
> +#define JPG_REG_ENC_GUSER_ID_SHIFT                      4

If this is setting an IOMMU SID, then you can just use the "iommus" property
to pass a handle to the IOMMU that this device is using plus the streamid,
which you can retrieve and write to the guser_id_{dec,enc}_sid register.

There's no reason to hardcode that in this header, and actually hardcoding
will give you a number of issues (example: unpowered/unclocked access to the
IOMMU, and many others).

> +#define GUSER_ID_MAPRANGE                               4
> +#endif
> +
>   /**
>    * enum mtk_jpeg_ctx_state - states of the context state machine
>    * @MTK_JPEG_INIT:		current state is initialized
> diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> index d868e46aaf37..fadfc4b5e366 100644
> --- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> +++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
> @@ -274,6 +274,32 @@ void mtk_jpeg_dec_reset(void __iomem *base)
>   }
>   EXPORT_SYMBOL_GPL(mtk_jpeg_dec_reset);
>   
> +#if IS_ENABLED(CONFIG_ARM_SMMU_V3)
> +void mtk_jpeg_dec_set_smmu_sid(int hwid)
> +{
> +	void __iomem *dec_reg_base;
> +	u32 val, mask;
> +
> +	if (hwid)
> +		dec_reg_base = ioremap(JPG_REG_CORE1_GUSER_ID, GUSER_ID_MAPRANGE);
> +	else
> +		dec_reg_base = ioremap(JPG_REG_CORE0_GUSER_ID, GUSER_ID_MAPRANGE);
> +	if (!dec_reg_base) {
> +		dev_err(jpeg->dev, "Failed to map jpgdec JPG_REG_GUSER_ID\n");
> +		return;
> +	}
> +
> +	val = ioread32(dec_reg_base);
> +	mask = ~(JPG_REG_GUSER_ID_MASK << JPG_REG_DEC_GUSER_ID_SHIFT);
> +	val &= mask;
> +	val |= (JPG_REG_GUSER_ID_DEC_SID << JPG_REG_DEC_GUSER_ID_SHIFT);
> +
> +	iowrite32(val, dec_reg_base);
> +	iounmap(dec_reg_base);
> +}
> +EXPORT_SYMBOL_GPL(mtk_jpeg_dec_set_smmu_sid);
> +#endif
> +
>   static void mtk_jpeg_dec_set_brz_factor(void __iomem *base, u8 yscale_w,
>   				u8 yscale_h, u8 uvscale_w, u8 uvscale_h)
>   {
> @@ -552,7 +578,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
>   	struct vb2_v4l2_buffer *src_buf, *dst_buf;
>   	struct mtk_jpeg_src_buf *jpeg_src_buf;
>   	enum vb2_buffer_state buf_state;
> -	struct mtk_jpeg_ctx *ctx;
>   	u32 dec_irq_ret;
>   	u32 irq_status;
>   	int i;
> @@ -562,7 +587,6 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
>   
>   	cancel_delayed_work(&jpeg->job_timeout_work);
>   
> -	ctx = jpeg->hw_param.curr_ctx;
>   	src_buf = jpeg->hw_param.src_buffer;
>   	dst_buf = jpeg->hw_param.dst_buffer;
>   	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
> @@ -585,7 +609,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
>   	buf_state = VB2_BUF_STATE_DONE;
>   	v4l2_m2m_buf_done(src_buf, buf_state);
>   	mtk_jpegdec_put_buf(jpeg);
> -	pm_runtime_put(ctx->jpeg->dev);
> +	pm_runtime_put(jpeg->dev);

You're doing more than what you're describing in the commit title and description.

If this change was intentional, please move it to a diffrent commit.

Regards,
Angelo


