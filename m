Return-Path: <linux-media+bounces-13651-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7796590E158
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 03:36:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5B4191C21293
	for <lists+linux-media@lfdr.de>; Wed, 19 Jun 2024 01:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBA5BB653;
	Wed, 19 Jun 2024 01:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IWFm4qBS"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C03461878;
	Wed, 19 Jun 2024 01:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718760962; cv=none; b=B9KXBL9+reCPztl2Ui12rsRwcoM8fOgg03JgV4V/4xUBUcHf4szpvcSk1nKx0aVBvMhmIwILOEyhhjwf20/noB2Q+PhS9PFEgDo7h+dswl719IABj6Vsyxx0pLbivcZoPEKsNVGUDP5UzkSm/NVBoLa6CuZBU31DIokkUtAkW6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718760962; c=relaxed/simple;
	bh=hRatZ+p2pwXfVavlZb0czCqdixefjbssRPfj5eNN2y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PENVTPwzSnXHvSDDYaJ4y/2xf+LRhElgKH4AhhlF3ulUtHfMZ8O6bClb3TkMW7MNnkoBJ+b7a+erU/oEidXPc9lBvPZ0Xv227gGNRl74iNu0YdtaZOfgdQgvov48iqUP/MxaQ7N9xdX5eJjinK2fuQK1lT82EHsBbtHRPSGiE7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IWFm4qBS; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C921289;
	Wed, 19 Jun 2024 03:35:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718760941;
	bh=hRatZ+p2pwXfVavlZb0czCqdixefjbssRPfj5eNN2y4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWFm4qBSoU7BofQ8pFLRtW8UXiI9bnTCqHMtL2dKnyGwY972v60j+wuKpJblZEy4H
	 1cFlLHz1eXoMbC8BpY2Buph4+MyZCq3KLEN8j8TRG+YjnfEb5pBdeRqSe2LIFeo5fT
	 t8WZENbN7CcJScNb3YYsUiLwCHiL1fXwcTRVQEOQ=
Date: Wed, 19 Jun 2024 04:35:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: rcar-vin: Add support for R-Car V4M
Message-ID: <20240619013536.GI32669@pendragon.ideasonboard.com>
References: <20240610113124.2396688-1-niklas.soderlund+renesas@ragnatech.se>
 <20240610113124.2396688-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240610113124.2396688-3-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Mon, Jun 10, 2024 at 01:31:24PM +0200, Niklas Söderlund wrote:
> Add support for R-Car V4M. The V4M is similar to V4H and uses the ISP
> Channel Selector as its only possible video input source. Reuse and
> rename the info structure from V4H to cover all current Gen4 SoCs.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

I would normally take this in my tree and send a pull request, but a
decision on the DT bindings is needed first. I may miss the outcome if I
don't get CC'ed on v2, but I'm sure Hans or Sakari can also take the
patches.

> ---
> * Changes since v1
> - Create a shared Gen4 info strucutre.
> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index 809c3a38cc4a..6992b61f0d48 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -1283,7 +1283,7 @@ static const struct rvin_info rcar_info_r8a779a0 = {
>  	.max_height = 4096,
>  };
>  
> -static const struct rvin_info rcar_info_r8a779g0 = {
> +static const struct rvin_info rcar_info_gen4 = {
>  	.model = RCAR_GEN3,
>  	.use_mc = true,
>  	.use_isp = true,
> @@ -1359,7 +1359,11 @@ static const struct of_device_id rvin_of_id_table[] = {
>  	},
>  	{
>  		.compatible = "renesas,vin-r8a779g0",
> -		.data = &rcar_info_r8a779g0,
> +		.data = &rcar_info_gen4,
> +	},
> +	{
> +		.compatible = "renesas,vin-r8a779h0",
> +		.data = &rcar_info_gen4,
>  	},
>  	{ /* Sentinel */ },
>  };

-- 
Regards,

Laurent Pinchart

