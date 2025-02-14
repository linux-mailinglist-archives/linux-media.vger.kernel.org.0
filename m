Return-Path: <linux-media+bounces-26138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCC7A35341
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 01:51:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34F1A7A320E
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 00:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51B312B63;
	Fri, 14 Feb 2025 00:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JTmTR0aH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6C327540A;
	Fri, 14 Feb 2025 00:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739494274; cv=none; b=uAmAcGB7e14myFtm49Ms7F4GIqg5Yn1wU0GoSdOOhjmZG1/skpevAoie0r4J5I741z+sAaR8kCWDjVxsGpSsrhl5E5uAEPP9yzGrYXchA4Pitrz1e5CjOX8ZSgCDeZ6yRN2Z274OuLvruqSL54qE7flKhBABn87hX05Z84W2yqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739494274; c=relaxed/simple;
	bh=K1X3DkMA19cWyDleWkjNb4apbrF799/8Rd4lXd6Vu4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q4qqlJaECPIA9E6e3V1C2g/wL9A6Hv19hqi9+v10g30puftb1Ou/KrHxma/3hn0VqM13wxWvEgHZdPURKeeW2glZ/Aki16gqsrixx9FbAiFxJBAq/EoYmydILH4iRGGPzMcTQV5F+55RvgJMSvAz0ltnyk8AhNd7VQoIh19Zoik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JTmTR0aH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B6C66B5;
	Fri, 14 Feb 2025 01:49:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739494192;
	bh=K1X3DkMA19cWyDleWkjNb4apbrF799/8Rd4lXd6Vu4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JTmTR0aH678vx6L/vJbGLBrTp1zzAnti2LexjtdF10LNDar4VDGfdsOsj2kDlzQ6h
	 A10OM6fdXPzmwz199K+TSrfVo9MZGPN1mSwvuX7LzaUncLOsrshbkm+KXTOiANHuJj
	 /8dR5U1FYNVTtLRlgMoTGJQE8AVu4KPBb8e5seIE=
Date: Fri, 14 Feb 2025 02:50:59 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tomm.merciai@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] media: rzg2l-cru: rzg2l-core: Use
 devm_pm_runtime_enable()
Message-ID: <20250214005059.GG8393@pendragon.ideasonboard.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-9-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210114540.524790-9-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Mon, Feb 10, 2025 at 12:45:40PM +0100, Tommaso Merciai wrote:
> Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
> drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
> rzg2l_csi2_remove().
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 70fed0ce45ea..5548b328d970 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  
>  	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
>  	pm_suspend_ignore_children(dev, true);
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;

Leaking DMA.

>  
>  	ret = rzg2l_cru_media_init(cru);
>  	if (ret)
> @@ -297,7 +299,6 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  
>  error_dma_unregister:
>  	rzg2l_cru_dma_unregister(cru);
> -	pm_runtime_disable(dev);
>  
>  	return ret;
>  }
> @@ -306,8 +307,6 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
>  {
>  	struct rzg2l_cru_dev *cru = platform_get_drvdata(pdev);
>  
> -	pm_runtime_disable(&pdev->dev);
> -
>  	v4l2_async_nf_unregister(&cru->notifier);
>  	v4l2_async_nf_cleanup(&cru->notifier);
>  

-- 
Regards,

Laurent Pinchart

