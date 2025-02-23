Return-Path: <linux-media+bounces-26738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2F5A4116A
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:57:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52EC0166912
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:57:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC27920F081;
	Sun, 23 Feb 2025 19:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="PaZJcPlX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4CE20E70E;
	Sun, 23 Feb 2025 19:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740340623; cv=none; b=WO34zuox3DA0IsY9ZYYeQ53010FvaMEfg/BiYXhVNxhtd44BjEB5miKZ1DyKMzw5nhTv0RxGuK5/HNuWB8f0p6JKbxBwlsMVIpNy+hYGqcc0dONqbEZBXAqqGGsNxww1qivWCpQHl/hFFvwVHKTm16FyaCeb4EWbCdFijH8I3T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740340623; c=relaxed/simple;
	bh=eOeD3yELlaDOwQP1Q7va5VIvK0G87Gy+E691YBWV1l4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ix8Xn23QZAfLBHff1AziiqFXE54406nIE6cSPNy4MarHyZ8uPweN3eIw1MySkyYUTgTT/6Rs9RlBpjhI2zFvvGWxHPomd2qZosuC6TQVe2Oh/wxW1KU9NRDplsDw5TDLiUiWt2LkIg7Ijn9PF5cyOplJ3asRE5zF5OE6d9fPLAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=PaZJcPlX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F2414DC;
	Sun, 23 Feb 2025 20:55:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740340534;
	bh=eOeD3yELlaDOwQP1Q7va5VIvK0G87Gy+E691YBWV1l4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PaZJcPlXs7FzK4zCn5vw68a4tbFSG/mNVb8gTHVajx1JwMujx7Bq3ye0H5tJvdZRw
	 MmTHSMHB2zO/r+X7qDXgbJH7wG8TfxqmWkAGbTSEDKrgaFK+UkLM0tNglGQ+L1i3mO
	 u0XZj/6KpeVDZ2n2Q9TMgSulXZAwYoMopySM9MAk=
Date: Sun, 23 Feb 2025 21:56:43 +0200
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
Subject: Re: [PATCH v2 15/18] media: rzg2l-cru: Add function pointers to
 enable and disable interrupts
Message-ID: <20250223195643.GB15344@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-16-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-16-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:29PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add `enable_interrupts` and `disable_interrupts` function pointers to the
> `rzg2l_cru_info` structure and pass them as part of the OF data. This
> prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which require different
> interrupt configurations.
> 
> Implement `rzg2l_cru_enable_interrupts()` and
> `rzg2l_cru_disable_interrupts()` functions and update the code to use them
> instead of directly writing to interrupt registers.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

You could squash this with 14/18 though.

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 ++
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  7 +++++++
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 19 ++++++++++++++-----
>  3 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 510e55496e8e..302f792cb415 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -360,6 +360,8 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
>  	.image_conv = ICnMC,
>  	.regs = rzg2l_cru_regs,
>  	.irq_handler = rzg2l_cru_irq,
> +	.enable_interrupts = rzg2l_cru_enable_interrupts,
> +	.disable_interrupts = rzg2l_cru_disable_interrupts,
>  };
>  
>  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 32bea35c8c1f..3f694044d8cd 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -34,6 +34,8 @@ enum rzg2l_csi2_pads {
>  	RZG2L_CRU_IP_SOURCE,
>  };
>  
> +struct rzg2l_cru_dev;
> +
>  /**
>   * enum rzg2l_cru_dma_state - DMA states
>   * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
> @@ -84,6 +86,8 @@ struct rzg2l_cru_info {
>  	u16 image_conv;
>  	const u16 *regs;
>  	irqreturn_t (*irq_handler)(int irq, void *data);
> +	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
> +	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
>  };
>  
>  /**
> @@ -178,4 +182,7 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
>  const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
>  
> +void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
> +void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
> +
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 022da19dd88a..5ffa3173af62 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -254,8 +254,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>  	spin_lock_irqsave(&cru->qlock, flags);
>  
>  	/* Disable and clear the interrupt */
> -	rzg2l_cru_write(cru, CRUnIE, 0);
> -	rzg2l_cru_write(cru, CRUnINTS, 0x001F0F0F);
> +	cru->info->disable_interrupts(cru);
>  
>  	/* Stop the operation of image conversion */
>  	rzg2l_cru_write(cru, ICnEN, 0);
> @@ -347,6 +346,17 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
>  	return fd.entry[0].bus.csi2.vc;
>  }
>  
> +void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
> +{
> +	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
> +}
> +
> +void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
> +{
> +	rzg2l_cru_write(cru, CRUnIE, 0);
> +	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
> +}
> +
>  int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  {
>  	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
> @@ -368,8 +378,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	rzg2l_cru_write(cru, CRUnRST, CRUnRST_VRESETN);
>  
>  	/* Disable and clear the interrupt before using */
> -	rzg2l_cru_write(cru, CRUnIE, 0);
> -	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
> +	cru->info->disable_interrupts(cru);
>  
>  	/* Initialize the AXI master */
>  	rzg2l_cru_initialize_axi(cru);
> @@ -382,7 +391,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
>  	}
>  
>  	/* Enable interrupt */
> -	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
> +	cru->info->enable_interrupts(cru);
>  
>  	/* Enable image processing reception */
>  	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);

-- 
Regards,

Laurent Pinchart

