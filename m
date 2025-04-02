Return-Path: <linux-media+bounces-29181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B3BA785D4
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 02:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4BCFB7A1BE0
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 00:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDB4514F98;
	Wed,  2 Apr 2025 00:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="UmEN6TA9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACFD5B667;
	Wed,  2 Apr 2025 00:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743554853; cv=none; b=MYMUBHQtb/aqnKxiNx1IzbNMRwOg3VXB+xAyZFcYM/QGuhyQPHoGC5/ZCfCUJ+ZaxFT9KffGCyzrhZ7Fwk0lkc6KQy24qr48jmI65i/wmXdaWoKFy5VjuiopHJIWyD3epqMfC8n5aXBxwOr5GmMRlprMucKoSBupOqchUv0o1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743554853; c=relaxed/simple;
	bh=RDNr9Hsb1XfzaAhPQbNZFZt0taatMC1TNb3OEsf9mEI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUsHcCuF2uT9gQYYRzke5y6kppURKdF2FEuLpr14wuIZGRKlEbcog2HKvFX1orHgBBIXdNu2sPUgF+GL1REXf1IDf50wh69MIcAhdm2zP5adytKiNDvNRX/zAS3tPLjCcBLUnSsN5lUEbKIr6CZYiMARIyziz4XKEctuCcIb4s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=UmEN6TA9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 467BF6A2;
	Wed,  2 Apr 2025 02:45:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743554737;
	bh=RDNr9Hsb1XfzaAhPQbNZFZt0taatMC1TNb3OEsf9mEI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UmEN6TA9fz0IlPCdxNwMeJEdrdSuy6+oXp0MFnA5D29e9tkbF0aUEDFnh6vjIP4oh
	 Y9pRXtn2CJHZodR5D8is6Ru6DWPO0GiF16KDqyE8oxQCmK2tXjEbbdnKJwdZLusvxq
	 wt4DqWBQ64QZfHm2EwUDnlKQRwYBq6M4RTDsddIQ=
Date: Wed, 2 Apr 2025 03:47:06 +0300
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
Subject: Re: [PATCH v5 13/17] media: rzg2l-cru: Add image_conv offset to OF
 data
Message-ID: <20250402004706.GE4845@pendragon.ideasonboard.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
 <20250328173032.423322-14-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250328173032.423322-14-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Mar 28, 2025 at 06:29:49PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add `image_conv` field to the `rzg2l_cru_info` structure to store the
> register offset for image conversion control. RZ/G2L uses `ICnMC`, while
> RZ/G3E and RZ/V2H(P) use `ICnIPMC_C0`.
> 
> Update `rzg2l_cru_initialize_image_conv()` and `rzg2l_cru_csi2_setup()`
> to use this `image_conv` offset from the OF data, facilitating future
> support for RZ/G3E and RZ/V2H(P) SoCs.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 +
>  .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 +
>  .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
>  3 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 19f93b7fe6fb9..7e94ae8039677 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -357,6 +357,7 @@ static const u16 rzg2l_cru_regs[] = {
>  static const struct rzg2l_cru_info rzgl2_cru_info = {
>  	.max_width = 2800,
>  	.max_height = 4095,
> +	.image_conv = ICnMC,
>  	.regs = rzg2l_cru_regs,
>  };
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> index 6a621073948aa..ca156772b949b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
> @@ -81,6 +81,7 @@ struct rzg2l_cru_ip_format {
>  struct rzg2l_cru_info {
>  	unsigned int max_width;
>  	unsigned int max_height;
> +	u16 image_conv;
>  	const u16 *regs;
>  };
>  
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 395c4d3d0f0fa..e13f633a687b2 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -246,20 +246,22 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
>  				 const struct rzg2l_cru_ip_format *ip_fmt,
>  				 u8 csi_vc)
>  {
> +	const struct rzg2l_cru_info *info = cru->info;
>  	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
>  
> -	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
> +	icnmc |= (rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK);

While at it you can drop the outer parentheses.

>  
>  	/* Set virtual channel CSI2 */
>  	icnmc |= ICnMC_VCSEL(csi_vc);
>  
> -	rzg2l_cru_write(cru, ICnMC, icnmc);
> +	rzg2l_cru_write(cru, info->image_conv, icnmc);
>  }
>  
>  static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  					   struct v4l2_mbus_framefmt *ip_sd_fmt,
>  					   u8 csi_vc)
>  {
> +	const struct rzg2l_cru_info *info = cru->info;
>  	const struct rzg2l_cru_ip_format *cru_video_fmt;
>  	const struct rzg2l_cru_ip_format *cru_ip_fmt;
>  
> @@ -276,11 +278,11 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
>  
>  	/* If input and output use same colorspace, do bypass mode */
>  	if (cru_ip_fmt->yuv == cru_video_fmt->yuv)
> -		rzg2l_cru_write(cru, ICnMC,
> -				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
> +		rzg2l_cru_write(cru, info->image_conv,
> +				rzg2l_cru_read(cru, info->image_conv) | ICnMC_CSCTHR);
>  	else
> -		rzg2l_cru_write(cru, ICnMC,
> -				rzg2l_cru_read(cru, ICnMC) & (~ICnMC_CSCTHR));
> +		rzg2l_cru_write(cru, info->image_conv,
> +				rzg2l_cru_read(cru, info->image_conv) & (~ICnMC_CSCTHR));

And here you can drop the parentheses around ~ICnMC_CSCTHR.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  
>  	/* Set output data format */
>  	rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);

-- 
Regards,

Laurent Pinchart

