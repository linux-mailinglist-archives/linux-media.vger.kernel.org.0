Return-Path: <linux-media+bounces-30669-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A96DA959A1
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 00:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D4471895986
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 22:55:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B28622AE49;
	Mon, 21 Apr 2025 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NsYX2taX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C6D22A802;
	Mon, 21 Apr 2025 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745276139; cv=none; b=k8GKaiW0OauhNFKNvNAsLaqoRzJWwwvmVQufjtMkiQJeWD/mGRd0gUFsvQHjqbnQsj9mFLVFxETz+sKv1x4THp9TvlBYNPXjW56urlL03kLmZofzixAesOHtiX1wl6oGGQQq9KMvFYumvkfZPkSgqJfAixvoblm5QrYYWx6kmk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745276139; c=relaxed/simple;
	bh=R55XjO0x4QXuL/ovrcz4k+xwcQ75lY1lv2CJ3zXVshg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Va/804D0tcEgxTIpIhLRizJaFhzbLFqwFXEB2TolCH4nhvFJpMTTvdPNUJYA5msiW8ZcAUHJykRSoyuQ43z0rA8mZfV8SVdQX2i1eXwoid551YQhZwYbd4buE5++1W33mnIis5A2WjDayWnXnN6Om+ejU09hr7tuimJQf6RSt+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=NsYX2taX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36D68606;
	Tue, 22 Apr 2025 00:53:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745276009;
	bh=R55XjO0x4QXuL/ovrcz4k+xwcQ75lY1lv2CJ3zXVshg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NsYX2taXcndVcM6g3b8USdGXvt8lr05TQsLCrz3m98oUzWAEZVQBLlv+bKDxzmDsz
	 yKKGAPn4yPWfcduocfwYYW6rPj9uQjfDaNQ+xDwfkyf7Hn/YtMzeS/Eah5qbQ2UCK2
	 3peVllZcY8vX/Dl4gT/cNlsbXHMETi4OxURjCFh8=
Date: Tue, 22 Apr 2025 01:55:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 7/7] media: rcar-isp: Parse named cs memory region
Message-ID: <20250421225534.GD17813@pendragon.ideasonboard.com>
References: <20250421111240.789510-1-niklas.soderlund+renesas@ragnatech.se>
 <20250421111240.789510-8-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250421111240.789510-8-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

On Mon, Apr 21, 2025 at 01:12:40PM +0200, Niklas Söderlund wrote:
> Extend the device tree parsing to optionally parse the cs memory region
> by name. The change is backward compatible with the device tree model
> where a single unnamed region describing only the ISP channel select

s/decribing/describes/

> function.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index f36d43c2e0a2..0b6fa62467e4 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -465,7 +465,17 @@ static const struct media_entity_operations risp_entity_ops = {
>  static int risp_probe_resources(struct rcar_isp *isp,
>  				struct platform_device *pdev)
>  {
> -	isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	struct resource *res;
> +
> +	/* For backward compatibility allow cs base to be the only reg if no

	/*
	 * For backward compatibility allow cs base to be the only reg if no

> +	 * reg-names are set in DT.
> +	 */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cs");
> +	if (!res)
> +		isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);

You can call devm_platform_ioremap_resource().

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +	else
> +		isp->csbase = devm_ioremap_resource(&pdev->dev, res);
> +
>  	if (IS_ERR(isp->csbase))
>  		return PTR_ERR(isp->csbase);
>  

-- 
Regards,

Laurent Pinchart

