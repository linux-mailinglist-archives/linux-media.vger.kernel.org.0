Return-Path: <linux-media+bounces-26707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F080A410BA
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:15:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B3BE41893021
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:15:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E621D166F32;
	Sun, 23 Feb 2025 18:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="f64Y/OVi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF16F8634A;
	Sun, 23 Feb 2025 18:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740334512; cv=none; b=QKI1qy6vzJ+LyoLlRhf9/oS8CqFE8xftpoWSiE1wL83bjHk4D5yEvuecatR2NcOXtTgQjDKplJkst0k0b21tx3UXNwPC/+hdAwAwnfHwM6erJuZ9RXei2H7wGqnl9jl18obIX574sUrmHLuvXiwQGo+/hQZYrwWni4OXLB7qvaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740334512; c=relaxed/simple;
	bh=PnF6/Hv+6SOAYs2MZ61GPbDzauOYemsrVFRur1aB2xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lmrL9G8iEJyUJ2R08jV35X9VIh6WPh60Hpo/6uym1c6XOazCqWS/oXFztAEsLmom7cmMQfBpBZQtE9ICnxzJCRWCuYuwhbWMrxHVoRk+mAVFpwUtRkB6Ler/oWecCRGDFpjlYejel5yRkfx5bGmUiva+Czrwnsgxn+9+t5ln9oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=f64Y/OVi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A583496;
	Sun, 23 Feb 2025 19:13:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740334423;
	bh=PnF6/Hv+6SOAYs2MZ61GPbDzauOYemsrVFRur1aB2xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f64Y/OViNmPLx7QeXYvFaEOqzhoy1EZ2wb4KmY7POMRo5t5u+1sj73CGV+qFoPgbj
	 YRW7sa+VXH3cXx8hziEMEfJoDuyYGndvctvV4SO9SdkEvVakatngfrqXj/naKwE7x7
	 UvhLcduPWRmaZ2I4AOQWxr7KOgX2lS6/ufEFSx0g=
Date: Sun, 23 Feb 2025 20:14:52 +0200
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
Subject: Re: [PATCH v2 07/18] media: rzg2l-cru: rzg2l-core: Use
 devm_pm_runtime_enable()
Message-ID: <20250223181452.GB8330@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-8-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-8-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:21PM +0100, Tommaso Merciai wrote:
> Use newly added devm_pm_runtime_enable() into rzg2l_cru_probe() and
> drop unnecessary pm_runtime_disable() from rzg2l_cru_probe() and
> rzg2l_csi2_remove().
> 
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Changes since v1:
>  - Fixed DMA leak as suggested by LPinchart
>  - Collected tags
> 
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> index 70fed0ce45ea..eed9d2bd0841 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
> @@ -287,7 +287,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
>  
>  	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
>  	pm_suspend_ignore_children(dev, true);
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		goto error_dma_unregister;
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

