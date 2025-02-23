Return-Path: <linux-media+bounces-26739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B48C6A4116F
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 21:01:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7870174CA8
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63482222569;
	Sun, 23 Feb 2025 20:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="M7swKxxM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408B22222BF;
	Sun, 23 Feb 2025 20:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740340863; cv=none; b=TuKFdDp1j2RDecM2ggn7SdxlQav2MhqDHGFVro95f/paxYOuaAjRUo7rHkuYoGqBDFE9RyIXhBr3NDInU7b/pEtGxSBF2Hqbeou6jdvHBZIEV05KyImGArD0w1g4P3iH/BTudKVcbfCUUH4o7MDIaE8L+CeZTJteTYy7LuWOgsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740340863; c=relaxed/simple;
	bh=wJ4iEEPxMJPudUA3pTY/xd7xjFvEGcoP5g8/wN4ThRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rb6vUObKGUUbdU9sDrLAnympn6sxBWi7usx8JhUuUCPh63Tu/lyeXmqGWxLUaWN1QGImVErhHGO/NtDplW6E1ZKm0oXQVEOqjWGPwZQkUKz7a2FoY7o0drpeVQGVcFSlhRfiqMgryTJULcuBrBalctLOBcu7Puk68DwwPoJZBU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=M7swKxxM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A0C4E4DC;
	Sun, 23 Feb 2025 20:59:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740340774;
	bh=wJ4iEEPxMJPudUA3pTY/xd7xjFvEGcoP5g8/wN4ThRM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7swKxxMyLvyJ41N9l1U/7kCSWdhxsJu4qg5T/fJbZud/NR8nIO2W1fe6TRPBjTSF
	 vcfinxbRQM7smWmTTOP2E8OrPIlfgSIL1waqDRRbmXQr8v0DDIkaLAXyvt3OuXim4J
	 2abNInDz3aYwTWnSEzTrnld/kFFpDvljxwfdg8+A=
Date: Sun, 23 Feb 2025 22:00:43 +0200
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
Subject: Re: [PATCH v2 16/18] media: rzg2l-cru: Add function pointer to check
 if FIFO is empty
Message-ID: <20250223200043.GC15344@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-17-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-17-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:30PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a `fifo_empty` function pointer to the `rzg2l_cru_info` structure and
> pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, checking if
> the FIFO is empty requires a different register configuration.
> 
> Implement `rzg2l_fifo_empty()` and update the code to use it from the
> function pointer.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  1 +
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 +++
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 23 +++++++++++++------
>  3 files changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 302f792cb415..e4fb3e12d6bf 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -362,6 +362,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
>  	.irq_handler = rzg2l_cru_irq,
>  	.enable_interrupts = rzg2l_cru_enable_interrupts,
>  	.disable_interrupts = rzg2l_cru_disable_interrupts,
> +	.fifo_empty = rzg2l_fifo_empty,
>  };
>  
>  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 3f694044d8cd..2e17bfef43ce 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -88,6 +88,7 @@ struct rzg2l_cru_info {
>  	irqreturn_t (*irq_handler)(int irq, void *data);
>  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
>  	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
> +	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
>  };
>  
>  /**
> @@ -185,4 +186,6 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
>  void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
>  
> +bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
> +
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 5ffa3173af62..7cc83486ce03 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -244,9 +244,23 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	return 0;
>  }
>  
> -void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
> +bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
>  {
>  	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
> +
> +	amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
> +
> +	amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
> +	amnfifopntr_r_y =
> +		(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> +	if (amnfifopntr_w == amnfifopntr_r_y)
> +		return true;
> +
> +	return false;

Maybe

	return amnfifopntr_w == amnfifopntr_r_y;

> +}

I wonder if this function, along with rzg2l_cru_enable_interrupts() and
rzg2l_cru_disable_interrupts(), should be moved to rzg2l-core.c. Either
way,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +
> +void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
> +{
>  	unsigned int retries = 0;
>  	unsigned long flags;
>  	u32 icnms;
> @@ -274,12 +288,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
>  
>  	/* Wait until the FIFO becomes empty */
>  	for (retries = 5; retries > 0; retries--) {
> -		amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
> -
> -		amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
> -		amnfifopntr_r_y =
> -			(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> -		if (amnfifopntr_w == amnfifopntr_r_y)
> +		if (cru->info->fifo_empty(cru))
>  			break;
>  
>  		usleep_range(10, 20);

-- 
Regards,

Laurent Pinchart

