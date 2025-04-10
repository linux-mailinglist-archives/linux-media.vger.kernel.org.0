Return-Path: <linux-media+bounces-29912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A4FA841DA
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 13:37:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF5E9E2096
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 11:36:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8984D2836B0;
	Thu, 10 Apr 2025 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pP9TFprF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50AD281523;
	Thu, 10 Apr 2025 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744285022; cv=none; b=MO/WegKqaF9/3iDU4ksDKbdemk1gHXRgQn4VgP3u9XRg5bs8nbj72FZFH0lGj+zHFXf83ES/Ksc67CVFB2dIbR0gbCERdmwXsNrXr0dJBBXeHYHUcxER5e199rQGvZh1AWBRRZPyEpY94ufiFprcLWzgD2axEeibkDorjiOIB0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744285022; c=relaxed/simple;
	bh=cMwDniS001MwHeFeZ+qYQphPT6AO2HwDJtgQkAAU+6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BGmNn0gCIMoebDBRSmyuWqcBqscuF34yenFfYjZCl8kRJCekFaSct7w6PG+LT8yxKTDAj5+sgDRQWDzA7whS4YTNMVrqX28xhZgQykD94ICty2xnpGXBAereQ+Wze7JCGHvslLfVXeKFiGj3/KIbaXLdYV9tzpFIdl5fIkkAFTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pP9TFprF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 565ED496;
	Thu, 10 Apr 2025 13:34:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744284893;
	bh=cMwDniS001MwHeFeZ+qYQphPT6AO2HwDJtgQkAAU+6w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pP9TFprFImpo0yUC4gDwASSIgaGAghMmnCxo8qZiKaoRyZ21yK/7B5prWC4wEeU4/
	 aU7NwQFSlP6sKfnmix+wV5RWbF7enaWFPyW1hdVMHR+Bh49rmRcQcvd+c7/CrGa+FU
	 +RDophucsxxpcpO+xH30LsKRkIB7zuX+v3fYO8b4=
Date: Thu, 10 Apr 2025 14:36:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 11/17] media: rzg2l-cru: Add register mapping support
Message-ID: <20250410113625.GB27797@pendragon.ideasonboard.com>
References: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
 <20250410081300.3133959-12-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410081300.3133959-12-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Thu, Apr 10, 2025 at 10:12:15AM +0200, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a
> CRU-IP that is mostly identical to RZ/G2L but with different register
> offsets and additional registers. Introduce a flexible register mapping
> mechanism to handle these variations.
> 
> Define the `rzg2l_cru_info` structure to store register mappings and
> pass it as part of the OF match data. Update the read/write functions
> to check out-of-bound accesses and use indexed register offsets from
> `rzg2l_cru_info`, ensuring compatibility across different SoC variants.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> Changes since v2:
>  - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
>    accesses as suggested by LPinchart.
>  - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
>  - Update commit body
> 
> Changes since v4:
>  - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
>    as __always_inline
> 
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
>  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
>  4 files changed, 139 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index eed9d2bd08414..abc2a979833aa 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -22,6 +22,7 @@
>  #include <media/v4l2-mc.h>
>  
>  #include "rzg2l-cru.h"
> +#include "rzg2l-cru-regs.h"
>  
>  static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)
>  {
> @@ -269,6 +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  
>  	cru->dev = dev;
>  	cru->info = of_device_get_match_data(dev);
> +	if (!cru->info)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Failed to get OF match data\n");

Can this happen ?

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0)
> @@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
>  	rzg2l_cru_dma_unregister(cru);
>  }
>  
> +static const u16 rzg2l_cru_regs[] = {
> +	[CRUnCTRL] = 0x0,
> +	[CRUnIE] = 0x4,
> +	[CRUnINTS] = 0x8,
> +	[CRUnRST] = 0xc,
> +	[AMnMB1ADDRL] = 0x100,
> +	[AMnMB1ADDRH] = 0x104,
> +	[AMnMB2ADDRL] = 0x108,
> +	[AMnMB2ADDRH] = 0x10c,
> +	[AMnMB3ADDRL] = 0x110,
> +	[AMnMB3ADDRH] = 0x114,
> +	[AMnMB4ADDRL] = 0x118,
> +	[AMnMB4ADDRH] = 0x11c,
> +	[AMnMB5ADDRL] = 0x120,
> +	[AMnMB5ADDRH] = 0x124,
> +	[AMnMB6ADDRL] = 0x128,
> +	[AMnMB6ADDRH] = 0x12c,
> +	[AMnMB7ADDRL] = 0x130,
> +	[AMnMB7ADDRH] = 0x134,
> +	[AMnMB8ADDRL] = 0x138,
> +	[AMnMB8ADDRH] = 0x13c,
> +	[AMnMBVALID] = 0x148,
> +	[AMnMBS] = 0x14c,
> +	[AMnAXIATTR] = 0x158,
> +	[AMnFIFOPNTR] = 0x168,
> +	[AMnAXISTP] = 0x174,
> +	[AMnAXISTPACK] = 0x178,
> +	[ICnEN] = 0x200,
> +	[ICnMC] = 0x208,
> +	[ICnMS] = 0x254,
> +	[ICnDMR] = 0x26c,
> +};
> +
> +static const struct rzg2l_cru_info rzgl2_cru_info = {
> +	.regs = rzg2l_cru_regs,
> +};
> +
>  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> -	{ .compatible = "renesas,rzg2l-cru", },
> +	{
> +		.compatible = "renesas,rzg2l-cru",
> +		.data = &rzgl2_cru_info,
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table);
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> index 1c9f22118a5d9..86c3202862465 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> @@ -10,71 +10,77 @@
>  
>  /* HW CRU Registers Definition */
>  
> -/* CRU Control Register */
> -#define CRUnCTRL			0x0
>  #define CRUnCTRL_VINSEL(x)		((x) << 0)
>  
> -/* CRU Interrupt Enable Register */
> -#define CRUnIE				0x4
>  #define CRUnIE_EFE			BIT(17)
>  
> -/* CRU Interrupt Status Register */
> -#define CRUnINTS			0x8
>  #define CRUnINTS_SFS			BIT(16)
>  
> -/* CRU Reset Register */
> -#define CRUnRST				0xc
>  #define CRUnRST_VRESETN			BIT(0)
>  
>  /* Memory Bank Base Address (Lower) Register for CRU Image Data */
> -#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
> +#define AMnMBxADDRL(x)			(AMnMB1ADDRL + (x) * 2)
>  
>  /* Memory Bank Base Address (Higher) Register for CRU Image Data */
> -#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> +#define AMnMBxADDRH(x)			(AMnMB1ADDRH + (x) * 2)
>  
> -/* Memory Bank Enable Register for CRU Image Data */
> -#define AMnMBVALID			0x148
>  #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
>  
> -/* Memory Bank Status Register for CRU Image Data */
> -#define AMnMBS				0x14c
>  #define AMnMBS_MBSTS			0x7
>  
> -/* AXI Master Transfer Setting Register for CRU Image Data */
> -#define AMnAXIATTR			0x158
>  #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
>  #define AMnAXIATTR_AXILEN		(0xf)
>  
> -/* AXI Master FIFO Pointer Register for CRU Image Data */
> -#define AMnFIFOPNTR			0x168
>  #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
>  #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
>  
> -/* AXI Master Transfer Stop Register for CRU Image Data */
> -#define AMnAXISTP			0x174
>  #define AMnAXISTP_AXI_STOP		BIT(0)
>  
> -/* AXI Master Transfer Stop Status Register for CRU Image Data */
> -#define AMnAXISTPACK			0x178
>  #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
>  
> -/* CRU Image Processing Enable Register */
> -#define ICnEN				0x200
>  #define ICnEN_ICEN			BIT(0)
>  
> -/* CRU Image Processing Main Control Register */
> -#define ICnMC				0x208
>  #define ICnMC_CSCTHR			BIT(5)
>  #define ICnMC_INF(x)			((x) << 16)
>  #define ICnMC_VCSEL(x)			((x) << 22)
>  #define ICnMC_INF_MASK			GENMASK(21, 16)
>  
> -/* CRU Module Status Register */
> -#define ICnMS				0x254
>  #define ICnMS_IA			BIT(2)
>  
> -/* CRU Data Output Mode Register */
> -#define ICnDMR				0x26c
>  #define ICnDMR_YCMODE_UYVY		(1 << 4)
>  
> +enum rzg2l_cru_common_regs {
> +	CRUnCTRL,	/* CRU Control */
> +	CRUnIE,		/* CRU Interrupt Enable */
> +	CRUnINTS,	/* CRU Interrupt Status */
> +	CRUnRST, 	/* CRU Reset */
> +	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
> +	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
> +	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
> +	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
> +	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
> +	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
> +	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
> +	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
> +	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
> +	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
> +	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
> +	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
> +	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
> +	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
> +	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
> +	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
> +	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
> +	AMnMBS,		/* Memory Bank Status for CRU Image Data */
> +	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
> +	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
> +	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
> +	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
> +	ICnEN,		/* CRU Image Processing Enable */
> +	ICnMC,		/* CRU Image Processing Main Control */
> +	ICnMS,		/* CRU Module Status */
> +	ICnDMR,		/* CRU Data Output Mode */
> +	RZG2L_CRU_MAX_REG,
> +};
> +
>  #endif /* __RZG2L_CRU_REGS_H__ */
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 8b898ce05b847..00c3f7458e20a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
>  	bool yuv;
>  };
>  
> +struct rzg2l_cru_info {
> +	const u16 *regs;
> +};
> +
>  /**
>   * struct rzg2l_cru_dev - Renesas CRU device structure
>   * @dev:		(OF) device
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index cd69c8a686d35..c82db80c33552 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -42,16 +42,66 @@ struct rzg2l_cru_buffer {
>  /* -----------------------------------------------------------------------------
>   * DMA operations
>   */
> -static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
> +static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
>  {
> -	iowrite32(value, cru->base + offset);
> +	const u16 *regs = cru->info->regs;
> +
> +	/*
> +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> +	 * rest of the registers have valid offset being set in cru->info->regs.
> +	 */
> +	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> +	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> +		return;
> +
> +	iowrite32(value, cru->base + regs[offset]);
> +}
> +
> +static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> +{
> +	const u16 *regs = cru->info->regs;
> +
> +	/*
> +	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
> +	 * rest of the registers have valid offset being set in cru->info->regs.
> +	 */
> +	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
> +	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
> +		return 0;
> +
> +	return ioread32(cru->base + regs[offset]);
>  }
>  
> -static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
> +static __always_inline void
> +__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
>  {
> -	return ioread32(cru->base + offset);
> +	const u16 *regs = cru->info->regs;
> +
> +	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> +
> +	iowrite32(value, cru->base + regs[offset]);
>  }
>  
> +static __always_inline u32
> +__rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
> +{
> +	const u16 *regs = cru->info->regs;
> +
> +	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
> +
> +	return ioread32(cru->base + regs[offset]);
> +}
> +
> +#define rzg2l_cru_write(cru, offset, value) \
> +	(__builtin_constant_p(offset) ? \
> +	 __rzg2l_cru_write_constant(cru, offset, value) : \
> +	 __rzg2l_cru_write(cru, offset, value))
> +
> +#define rzg2l_cru_read(cru, offset) \
> +	(__builtin_constant_p(offset) ? \
> +	 __rzg2l_cru_read_constant(cru, offset) : \
> +	 __rzg2l_cru_read(cru, offset))
> +
>  /* Need to hold qlock before calling */
>  static void return_unused_buffers(struct rzg2l_cru_dev *cru,
>  				  enum vb2_buffer_state state)

-- 
Regards,

Laurent Pinchart

