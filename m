Return-Path: <linux-media+bounces-26740-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C99AA41174
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 21:04:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 932F97A73BD
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 20:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A7EB22ACF7;
	Sun, 23 Feb 2025 20:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KOE6epTp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A74822A7F5;
	Sun, 23 Feb 2025 20:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740341055; cv=none; b=IwB3Dw0SNHu31UkayMQvVno8swmEqzm2tHHltnQ6dpAB1KqZXpe9qqAvLo8xw1SPWS3OAYKWElT9Vpxalrfh8zmBH9cUcadwSlQDjBK6x/YEWM+7vFFk/X8+6146GeQwuPjiVbwKfLLE6Umcq/Q+FRXXx2/iau6j2xbyd0qlIGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740341055; c=relaxed/simple;
	bh=zpf0tBdXTeMW1R4pys91UaViyq4y5LjGDKJOSlqcqDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYFeOX8FHkRRNkvYHIyJhkAu7XHLlbXLuyCanjYf4lfKWdYjeE4AgMdo2UafUuqsTHAsaMNJ/WTl7DZB0cx2bNvC3LPCE8zKfoZXyWPkgJ6WFAphOeQ3FeVfnfmdQy1NKn900WcizZsuA3lP1cnXutnyQ+ts2SCoLJHTKotwpe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KOE6epTp; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BC8F496;
	Sun, 23 Feb 2025 21:02:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740340966;
	bh=zpf0tBdXTeMW1R4pys91UaViyq4y5LjGDKJOSlqcqDM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOE6epTph+3U666epEEZA+l0GCNUDslIgpZOVNV6oVJgGkUBPYHa9OgLA6bSO7YH1
	 mhKdOEcXWe/y/RBd+uc8JQGxR9p65NBNksqHvsN7/ONw2z6BAfP3wJCWSDIDeojyTo
	 avI7k9LT1xZiZK4tGKYnun2lNqm7zxFH0rOo+zp4=
Date: Sun, 23 Feb 2025 22:03:55 +0200
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
Subject: Re: [PATCH v2 17/18] media: rzg2l-cru: Add function pointer to
 configure CSI
Message-ID: <20250223200355.GD15344@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-18-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-18-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:31PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add a `csi_setup` function pointer to the `rzg2l_cru_info` structure and
> pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, additional
> register configurations are required compared to the RZ/G2L SoC.
> 
> Modify `rzg2l_cru_csi2_setup()` to be referenced through this function
> pointer and update the code to use it accordingly.
> 
> This change is in preparation for adding support for RZ/G3E and RZ/V2H(P)
> SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 1 +
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 6 ++++++
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++++----
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index e4fb3e12d6bf..3ae0cd83af16 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -363,6 +363,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
>  	.enable_interrupts = rzg2l_cru_enable_interrupts,
>  	.disable_interrupts = rzg2l_cru_disable_interrupts,
>  	.fifo_empty = rzg2l_fifo_empty,
> +	.csi_setup = rzg2l_cru_csi2_setup,
>  };
>  
>  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 2e17bfef43ce..ccaba5220f1c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -89,6 +89,9 @@ struct rzg2l_cru_info {
>  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
>  	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
>  	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
> +	void (*csi_setup)(struct rzg2l_cru_dev *cru,
> +			  const struct rzg2l_cru_ip_format *ip_fmt,
> +			  u8 csi_vc);
>  };
>  
>  /**
> @@ -187,5 +190,8 @@ void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
>  void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
>  
>  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
> +void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> +			  const struct rzg2l_cru_ip_format *ip_fmt,
> +			  u8 csi_vc);
>  
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 7cc83486ce03..637c9c9f9ba8 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -196,9 +196,9 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
>  }
>  
> -static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -				 const struct rzg2l_cru_ip_format *ip_fmt,
> -				 u8 csi_vc)
> +void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> +			  const struct rzg2l_cru_ip_format *ip_fmt,
> +			  u8 csi_vc)
>  {
>  	const struct rzg2l_cru_info *info = cru->info;
>  	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
> @@ -220,7 +220,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	const struct rzg2l_cru_ip_format *cru_ip_fmt;
>  
>  	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
> -	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
> +	info->csi_setup(cru, cru_ip_fmt, csi_vc);
>  
>  	/* Output format */
>  	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);

-- 
Regards,

Laurent Pinchart

