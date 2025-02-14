Return-Path: <linux-media+bounces-26136-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 837D1A35339
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 01:48:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EE251890099
	for <lists+linux-media@lfdr.de>; Fri, 14 Feb 2025 00:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35E2212B63;
	Fri, 14 Feb 2025 00:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Zowa30gA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047DEBE4E;
	Fri, 14 Feb 2025 00:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739494126; cv=none; b=PhtT+cswj8p7KQdEWajqR4fTIAljSPfYpdYlAmPK/+cMB0eeGt9Yto4gtQ4dwwKVDMIWeheIvMxcuGsCXIzXlPN/6PUMb5/l1emqR/WrUYbnbdtfxyyFeLBkjlRrdkXIvkgOxLVEnaV0+u7Rqj+k0aKqxHu4I2cB9Z18S5ez/hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739494126; c=relaxed/simple;
	bh=1b6oyV/lNrhpBqmCDwXCZ4UdmZ6g6j7KKXWMttWKEJU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mNTdTPa1fvAO/ztogaK6Udo87XtiCxLZAOl2wn3h0IjcOg1WBoy6g0yZwkFWTOlaI+QRokEcGb/0du1+C1C6+7C0mJzjRBWmYuAPqjcx2ZcvPJJ/8kw+d5aCKeKk0KlWHw/UjGGfd73b+SxZQxYM84TN90S70PQJpdEQd/FkA4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Zowa30gA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AAB8D6B5;
	Fri, 14 Feb 2025 01:47:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739494044;
	bh=1b6oyV/lNrhpBqmCDwXCZ4UdmZ6g6j7KKXWMttWKEJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zowa30gAITBauLzwsEzDShfWfTdRi0ML5SwXaJc45zcaHI4Sw7O/BVG/1moVli8e3
	 ROgKVXYJzyQWo4W9W9SCbsjimGi28tWQhUxCNRkqSL4NaM7OL1nJVl0+9gHktwi+l9
	 jMfhC0CBAUciXFKBki8XUK+tFscdsJq7Bg+jzV0U=
Date: Fri, 14 Feb 2025 02:48:31 +0200
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
Subject: Re: [PATCH 6/8] media: rzg2l-cru: csi2: Use devm_pm_runtime_enable()
Message-ID: <20250214004831.GE8393@pendragon.ideasonboard.com>
References: <20250210114540.524790-1-tommaso.merciai.xr@bp.renesas.com>
 <20250210114540.524790-7-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210114540.524790-7-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Mon, Feb 10, 2025 at 12:45:38PM +0100, Tommaso Merciai wrote:
> Use newly added devm_pm_runtime_enable() into rzg2l_csi2_probe() and
> drop error path accordingly. Drop also unnecessary pm_runtime_disable()
> from rzg2l_csi2_remove().
> 
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 948f1917b830..4ccf7c5ea58b 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -805,11 +805,13 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	pm_runtime_enable(dev);
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
>  
>  	ret = rzg2l_validate_csi2_lanes(csi2);
>  	if (ret)
> -		goto error_pm;
> +		return ret;
>  
>  	csi2->subdev.dev = dev;
>  	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
> @@ -834,7 +836,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	ret = media_entity_pads_init(&csi2->subdev.entity, ARRAY_SIZE(csi2->pads),
>  				     csi2->pads);
>  	if (ret)
> -		goto error_pm;
> +		return ret;
>  
>  	ret = v4l2_subdev_init_finalize(&csi2->subdev);
>  	if (ret < 0)
> @@ -852,8 +854,6 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	v4l2_async_nf_unregister(&csi2->notifier);
>  	v4l2_async_nf_cleanup(&csi2->notifier);
>  	media_entity_cleanup(&csi2->subdev.entity);
> -error_pm:
> -	pm_runtime_disable(dev);
>  
>  	return ret;
>  }
> @@ -867,7 +867,6 @@ static void rzg2l_csi2_remove(struct platform_device *pdev)
>  	v4l2_async_unregister_subdev(&csi2->subdev);
>  	v4l2_subdev_cleanup(&csi2->subdev);
>  	media_entity_cleanup(&csi2->subdev.entity);
> -	pm_runtime_disable(&pdev->dev);
>  }
>  
>  static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)

-- 
Regards,

Laurent Pinchart

