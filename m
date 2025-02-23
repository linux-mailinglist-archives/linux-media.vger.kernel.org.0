Return-Path: <linux-media+bounces-26735-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 480FEA4115D
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B700B164548
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 746F11DA617;
	Sun, 23 Feb 2025 19:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ojYrZgzS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F17FE18E362;
	Sun, 23 Feb 2025 19:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740340372; cv=none; b=SPRpwwo8cZ4cUaWZhuDQBFT3tcKppOzzocZE0+v4ADNh8dKd0V4WOkmLH62H1wEgRRFYEtyy5nMfbtsojwbSburKQOI7gHNSyxPQ8xhBP3J0Pv+rdmM+0UnrKamAlfM/VmkYyfsYEuvK7IMy8ZvqLYZPEFQfaewe4TPJMsGWxqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740340372; c=relaxed/simple;
	bh=5w359TFKUHppBtewoOBQmlEO7muyTT9vA1okmFelfOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nyhlYlRA0oPVUEdV0MwGqSGLYieSYTfA+F4autpP1QLaeqN6lDaAWODn/wcNcFwmEBi+FEIG4ojjRGgzMnrjGz0XGW38/ig2KXqhWXwhI4RggMVk6YQOJEc3FdMBEjKmnu9vwzn6srGS5/svK9XPzN+njzTMxUC79DZvNJTuozo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ojYrZgzS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1BFDA4DC;
	Sun, 23 Feb 2025 20:51:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740340283;
	bh=5w359TFKUHppBtewoOBQmlEO7muyTT9vA1okmFelfOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ojYrZgzSYkYvpp1yi9+kcZhEhbca6Ou/CxjFhMGHLUz7t4T52khjp68JiVAN/PEDm
	 Y7DxK2MtFpvj+aWNo7RSY/WCWFlQNh2I5btpDOxrwsqtah8iwXD6EgCo4uoPnF63Bm
	 jlq8NBCR2K69/i7oriEJ+5VsDRYI7ABAwtYCPeas=
Date: Sun, 23 Feb 2025 21:52:32 +0200
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
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/18] media: rzg2l-cru: Add register mapping support
Message-ID: <20250223195232.GF8330@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-12-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-12-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:25PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a
> CRU-IP that is mostly identical to RZ/G2L but with different register
> offsets and additional registers. Introduce a flexible register mapping
> mechanism to handle these variations.
> 
> Define the `rzg2l_cru_info` structure to store register mappings and
> pass it as part of the OF match data. Update the read/write functions
> to use indexed register offsets from `rzg2l_cru_info`, ensuring
> compatibility across different SoC variants.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
>  .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 65 ++++++++++---------
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 12 ++--
>  4 files changed, 92 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index eed9d2bd0841..abc2a979833a 100644
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
> index 1c9f22118a5d..82920db7134e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
> @@ -10,71 +10,76 @@
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
> +#define AMnMBxADDRL(base, x)		((base) + (x) * 2)
>  
>  /* Memory Bank Base Address (Higher) Register for CRU Image Data */
> -#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
> +#define AMnMBxADDRH(base, x)		AMnMBxADDRL(base, x)
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
> +};
> +
>  #endif /* __RZG2L_CRU_REGS_H__ */
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 8b898ce05b84..00c3f7458e20 100644
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
> index cd69c8a686d3..f25fd9b35c55 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -44,12 +44,16 @@ struct rzg2l_cru_buffer {
>   */
>  static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
>  {
> -	iowrite32(value, cru->base + offset);
> +	const u16 *regs = cru->info->regs;
> +
> +	iowrite32(value, cru->base + regs[offset]);

Should out-of-bound accesses be checked ? Ideally that should be done at
build time, but in some cases that may be hard. Maybe rzg2l_cru_write()
and rzg2l_cru_read() could implement compile-time checks, and
__rzg2l_cru_write() and __rzg2l_cru_read() could be used for the cases
where checks are not possible at compile time (for AMnMBxADDRL and
AMnMBxADDRH as far as I can see).

>  }
>  
>  static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
>  {
> -	return ioread32(cru->base + offset);
> +	const u16 *regs = cru->info->regs;
> +
> +	return ioread32(cru->base + regs[offset]);
>  }
>  
>  /* Need to hold qlock before calling */
> @@ -132,8 +136,8 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
>  		return;
>  
>  	/* Currently, we just use the buffer in 32 bits address */
> -	rzg2l_cru_write(cru, AMnMBxADDRL(slot), addr);
> -	rzg2l_cru_write(cru, AMnMBxADDRH(slot), 0);
> +	rzg2l_cru_write(cru, AMnMBxADDRL(AMnMB1ADDRL, slot), addr);
> +	rzg2l_cru_write(cru, AMnMBxADDRH(AMnMB1ADDRH, slot), 0);

This seems fairly error-prone. The first argument doesn't seem to be
needed.

>  }
>  
>  /*

-- 
Regards,

Laurent Pinchart

