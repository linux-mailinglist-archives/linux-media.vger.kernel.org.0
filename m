Return-Path: <linux-media+bounces-28489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D55E0A690B4
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 15:50:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 580331B835AE
	for <lists+linux-media@lfdr.de>; Wed, 19 Mar 2025 14:28:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 331671B4153;
	Wed, 19 Mar 2025 14:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DvJ0KM8n"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1206479C4;
	Wed, 19 Mar 2025 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742394504; cv=none; b=n3B4B7EeAYYxiMpMPF2SbTVZbfyGdifvoMcHhHthmfhBJIImRdsXeVBRAglsdT2NimksrwAFsBz3S5kDR62WzrmhpSDUyBTo+CT8B9i+5aQlD1ZGec54chEe+JLf16zLM4yuORZZuw6aRanRFz+fXX8cI9DmkBeco5xfTmcO5XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742394504; c=relaxed/simple;
	bh=q6wy5SGwoGLSA4iar296bkoRdWcDA2+PvljZbl9XmZg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l5k0TWtPV/5AuOMU6DEy5h+ao3nKd6aQRLTVQjBp/scfrM18JoZYtA3UMdpOC+SlWqWSRRMOJvOpvf5rRJaZcUhOd0+LVq75oCJZBJLc7uBX+JZrKH0g4i+GeLVgsH7P6GEElXchdpB+53H1coRRV5S2CynDE90KTI2dHLVUReM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DvJ0KM8n; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A015855A;
	Wed, 19 Mar 2025 15:26:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742394398;
	bh=q6wy5SGwoGLSA4iar296bkoRdWcDA2+PvljZbl9XmZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DvJ0KM8nNs/3l1Crk7OJoF/ZrurzuCZ2jG2y5YkK/fUgj7I7lK/bUJGYlbD/yqc/p
	 lmIAfShqvpvivPm9wHXnDMkcb15cbM4dUjBfYKus+HYOEm7jXTH/7USlMftkszuMnX
	 qYUMriUVs+FJC7ZAgn9npzYIjogQIDHjyZx9/PPI=
Date: Wed, 19 Mar 2025 15:28:18 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 7/7] media: rcar-isp: Parse named cs memory region
Message-ID: <6zcr4v3sv5zyxmhol34wmgwj5ukbljh43yqgybra7zziqutqkm@ce2gqshuzsue>
References: <20250315152708.328036-1-niklas.soderlund+renesas@ragnatech.se>
 <20250315152708.328036-8-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315152708.328036-8-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas

On Sat, Mar 15, 2025 at 04:27:08PM +0100, Niklas Söderlund wrote:
> Extend the device tree parsing to optionally parse the cs memory region
> by name. The change is backward compatible with the device tree model
> where a single unnamed region describing only the ISP channel select
> function.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/renesas/rcar-isp/csisp.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/renesas/rcar-isp/csisp.c b/drivers/media/platform/renesas/rcar-isp/csisp.c
> index a86d2a9a4915..931c8e3a22be 100644
> --- a/drivers/media/platform/renesas/rcar-isp/csisp.c
> +++ b/drivers/media/platform/renesas/rcar-isp/csisp.c
> @@ -419,7 +419,17 @@ static const struct media_entity_operations risp_entity_ops = {
>  static int risp_probe_resources(struct rcar_isp *isp,
>  				struct platform_device *pdev)
>  {
> -	isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	struct resource *res;
> +
> +	/* For backward compatibility allow cs base to be the only reg if no
> +	 * reg-names are set in DT.
> +	 */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cs");
> +	if (!res)
> +		isp->csbase = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
> +	else
> +		isp->csbase = devm_ioremap_resource(&pdev->dev, res);
> +
>  	if (IS_ERR(isp->csbase))
>  		return PTR_ERR(isp->csbase);
>
> --
> 2.48.1
>
>

