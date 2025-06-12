Return-Path: <linux-media+bounces-34554-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F94AD647C
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 02:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC4A23AC475
	for <lists+linux-media@lfdr.de>; Thu, 12 Jun 2025 00:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D9811CA9;
	Thu, 12 Jun 2025 00:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FJ3gAEqF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6181BA34;
	Thu, 12 Jun 2025 00:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749687952; cv=none; b=C+TQ9R0PXixRmhYois1TQdMNyEI0wzIXGjnlV4eVpM8O3f8a375ZG2ZOlnZLAspWMqBczBrpQJHShj7rAY1oCHfjc/eKZ6ti0LEEr8gy1iweTqyjQ1MjxvWauxkq3QUAqepN1vGw0gFBb1+uc9EnLdvNJrKtPB9J2koxOdY00bM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749687952; c=relaxed/simple;
	bh=CtNiAUz7IIHaThmJf4XpA0zHj1sB5mfSCFku73YZz6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LQK6xxqWqY1LBisvlkCxf8rxgckG9dmrHUhAKhdzhTD0bB17r0q7HPxh8Qi/DxCMJsYkEyiVLiD/8qI2Qaft2KooBaGaXL9eMdUdzMpL6oHHlzjKoJ2BE+vrEZU3bo+n2AENCFpOxcI2tSpAP579wAnyCWGvEFgCCm7ACJH3QZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FJ3gAEqF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9EA52EA0;
	Thu, 12 Jun 2025 02:25:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749687940;
	bh=CtNiAUz7IIHaThmJf4XpA0zHj1sB5mfSCFku73YZz6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FJ3gAEqFKRUntIrKy7uvM/6XFXCUk0v1iTchR5fxp03p9vvgy/vZMxuYO5oKGxGpJ
	 QRQ45KZieTVZ7dOZ/5cvtr84okHW5zKfWDhFmlz5pMuhTAEDl8Sg0YF6jia5FqCeuS
	 S5npQNOn6/O/rM63ATSG5CucydwMief58h+wUrD4=
Date: Thu, 12 Jun 2025 03:25:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 08/12] media: rcar-vin: Always create a media pad
Message-ID: <20250612002536.GC22977@pendragon.ideasonboard.com>
References: <20250606182606.3984508-1-niklas.soderlund+renesas@ragnatech.se>
 <20250606182606.3984508-9-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606182606.3984508-9-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Fri, Jun 06, 2025 at 08:26:02PM +0200, Niklas Söderlund wrote:
> Prepare for Gen2 media graph support by always initializing a media pad
> for the VIN device.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> * Changes since v4
> - New in v5, broken out from a larger patch in v4.
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index c5510e3b258f..8cb3d0a3520f 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -895,10 +895,6 @@ static int rvin_csi2_init(struct rvin_dev *vin)
>  {
>  	int ret;
>  
> -	vin->pad.flags = MEDIA_PAD_FL_SINK;
> -	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
> -	if (ret)
> -		return ret;
>  
>  	ret = rvin_create_controls(vin, NULL);
>  	if (ret < 0)
> @@ -980,10 +976,6 @@ static int rvin_isp_init(struct rvin_dev *vin)
>  {
>  	int ret;
>  
> -	vin->pad.flags = MEDIA_PAD_FL_SINK;
> -	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
> -	if (ret)
> -		return ret;
>  
>  	ret = rvin_create_controls(vin, NULL);
>  	if (ret < 0)
> @@ -1375,6 +1367,11 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  	if (rvin_id_get(vin))
>  		return -EINVAL;
>  
> +	vin->pad.flags = MEDIA_PAD_FL_SINK;
> +	ret = media_entity_pads_init(&vin->vdev.entity, 1, &vin->pad);
> +	if (ret)
> +		return ret;
> +
>  	if (vin->info->use_isp) {
>  		ret = rvin_isp_init(vin);
>  	} else if (vin->info->use_mc) {

-- 
Regards,

Laurent Pinchart

