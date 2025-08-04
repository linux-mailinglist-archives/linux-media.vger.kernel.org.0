Return-Path: <linux-media+bounces-38876-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F74B1AA80
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 23:44:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19FB0177FB5
	for <lists+linux-media@lfdr.de>; Mon,  4 Aug 2025 21:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8D823BD04;
	Mon,  4 Aug 2025 21:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="rr0lT31f"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9575239E92;
	Mon,  4 Aug 2025 21:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754343830; cv=none; b=Mvbg1yG2wPYGVU6Hsx5HURN7dgSn/ATwh7+7SHN3ue4qCcTC09WTJO6Ts2U84FN2ZkqkwC7S5SgUY5hpRTQK3SSSsPWHko5BoF69Fa7nxjAUpLp0AycNX9aoHNx2zNWUIBOvl1+br0+2aSrNFpErnT2X1RHwrFdVkMEzN1HRR64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754343830; c=relaxed/simple;
	bh=B+SaZI06oSJyMlQ7Xu1qgZ9Eh1frt62lJ3XhCYR1zGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Afk1mDsO4EGWV9U3iQABAjZMD5hdEb/ty3EE7JjaYGNJVnYbNQVqtsyB2cXrtIvOArvMYHmO0T+Sj1stMD/GlwvwJY0QQ08ET1yjHwzsyvlAwSGGpr+bHRYj5Bz0vpzhHG/+WoJTswzxnq6H6rWSMP5zGYVMR2VPCzKn0UM1Im0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=rr0lT31f; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5ABE59CE;
	Mon,  4 Aug 2025 23:43:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1754343780;
	bh=B+SaZI06oSJyMlQ7Xu1qgZ9Eh1frt62lJ3XhCYR1zGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rr0lT31fwwUwFnV8y/LyfSauIcUSUKtSyqIwXUnQ5mAYB8QOUe+Tyn8NlB3/e8Hd3
	 +yzJOtnBUa3FxCeGNQ2StqKUo2Tg97N3/A32MWT9FX242wKVJxNOWFKwchBh65X4xA
	 HnSkGRrMnWx3uBMcKkcehIHrasmFrlqCh6qyonS4=
Date: Tue, 5 Aug 2025 00:43:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju <biju.das.au@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: Drop function pointer to configure CSI
Message-ID: <20250804214334.GJ30355@pendragon.ideasonboard.com>
References: <20250801053426.4273-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250801053426.4273-1-biju.das.jz@bp.renesas.com>

On Fri, Aug 01, 2025 at 06:34:22AM +0100, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
> 
> Drop function pointer to configure CSI to avoid code duplication
> by checking the presence of vc select register in rzg2l_cru_info.
> After this change, limit the scope of the rzg2l_cru_csi2_setup()
> to static.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 --
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  9 ------
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 30 ++++++-------------
>  3 files changed, 9 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 806acc8f9728..3c5fbd857371 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -367,7 +367,6 @@ static const struct rzg2l_cru_info rzg3e_cru_info = {
>  	.enable_interrupts = rzg3e_cru_enable_interrupts,
>  	.disable_interrupts = rzg3e_cru_disable_interrupts,
>  	.fifo_empty = rzg3e_fifo_empty,
> -	.csi_setup = rzg3e_cru_csi2_setup,
>  };
>  
>  static const u16 rzg2l_cru_regs[] = {
> @@ -412,7 +411,6 @@ static const struct rzg2l_cru_info rzg2l_cru_info = {
>  	.enable_interrupts = rzg2l_cru_enable_interrupts,
>  	.disable_interrupts = rzg2l_cru_disable_interrupts,
>  	.fifo_empty = rzg2l_fifo_empty,
> -	.csi_setup = rzg2l_cru_csi2_setup,
>  };
>  
>  static const struct of_device_id rzg2l_cru_of_id_table[] = {
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index be95b41c37df..3a200db15730 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -92,9 +92,6 @@ struct rzg2l_cru_info {
>  	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
>  	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
>  	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
> -	void (*csi_setup)(struct rzg2l_cru_dev *cru,
> -			  const struct rzg2l_cru_ip_format *ip_fmt,
> -			  u8 csi_vc);
>  };
>  
>  /**
> @@ -204,11 +201,5 @@ void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
>  
>  bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
>  bool rzg3e_fifo_empty(struct rzg2l_cru_dev *cru);
> -void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -			  const struct rzg2l_cru_ip_format *ip_fmt,
> -			  u8 csi_vc);
> -void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -			  const struct rzg2l_cru_ip_format *ip_fmt,
> -			  u8 csi_vc);
>  
>  #endif
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index a8817a7066b2..d75cd5fa9f7c 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -257,30 +257,18 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
>  	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
>  }
>  
> -void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -			  const struct rzg2l_cru_ip_format *ip_fmt,
> -			  u8 csi_vc)
> +static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> +				 const struct rzg2l_cru_ip_format *ip_fmt,
> +				 u8 csi_vc)
>  {
>  	const struct rzg2l_cru_info *info = cru->info;
>  	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
>  
> -	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
> -
> -	/* Set virtual channel CSI2 */
> -	icnmc |= ICnMC_VCSEL(csi_vc);
> -
> -	rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
> -	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
> -			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> -	rzg2l_cru_write(cru, info->image_conv, icnmc);
> -}
> -
> -void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
> -			  const struct rzg2l_cru_ip_format *ip_fmt,
> -			  u8 csi_vc)
> -{
> -	const struct rzg2l_cru_info *info = cru->info;
> -	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
> +	if (cru->info->regs[ICnSVC]) {
> +		rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
> +		rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
> +				ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
> +	}
>  
>  	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
>  
> @@ -299,7 +287,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  	const struct rzg2l_cru_ip_format *cru_ip_fmt;
>  
>  	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
> -	info->csi_setup(cru, cru_ip_fmt, csi_vc);
> +	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
>  
>  	/* Output format */
>  	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);

-- 
Regards,

Laurent Pinchart

