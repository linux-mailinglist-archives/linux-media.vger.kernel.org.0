Return-Path: <linux-media+bounces-4095-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EAF38392B1
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 16:29:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A103C1C2329C
	for <lists+linux-media@lfdr.de>; Tue, 23 Jan 2024 15:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12E3E5FDD7;
	Tue, 23 Jan 2024 15:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VtsPnN4J"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5725FDB9;
	Tue, 23 Jan 2024 15:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706023751; cv=none; b=jwZa+um/m98ZXNe0jt0/UVSqzQmn3cv0AFL+S80Bn78JyGcrxPc8X0q9Z7D2RVv8C9j8jMbqCNzqSE/8aqp4FTKAISqYmv7lDmlGG2zr6aYWxslPL74N08+YvnqyeXQ2Ek8xBCoTj7md7V3gLCo06PjLiG3Lqbt73jK/mRo5Prs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706023751; c=relaxed/simple;
	bh=xh5IhXaQsZgEEFeCiyAnXxHLI/g+WTeDn47y67RFGmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FxuhWnzMBE+UzMrNN1GM//sp/25xJHPCPVTlStO5RTfTQmbjB1QNEQLIwmSO0LxO7/X54GHXbTQF9JiENbUWUnkYiglg2lvFXN5HUgCkt5HvlF8/AezqcBwAbwrdk6ormKqVzeqdf2amtM26w8OTfjC/4afPvPOOfBOHAzVRQ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VtsPnN4J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92C961B9A;
	Tue, 23 Jan 2024 16:27:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1706023674;
	bh=xh5IhXaQsZgEEFeCiyAnXxHLI/g+WTeDn47y67RFGmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VtsPnN4JYu0/OPlIwn6cN2DPaJmmeQ36LRzzTYz7Ca5DtmcS4TEA/oRjnUtBlYdE/
	 oE/ZypGVrZ/ogR6JONaxjxUy3aPmSvlSaBBHeLA+F5sewGq4wew2HXwikHBYjSyvXC
	 IB7bZzAY4WqXhYM9ZHM1XQ/PCRCQoMexOq2KhorU=
Date: Tue, 23 Jan 2024 17:29:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-media@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] media: platform: rzg2l-cru: rzg2l-csi2: Switch to
 RUNTIME_PM_OPS()
Message-ID: <20240123152906.GP10679@pendragon.ideasonboard.com>
References: <20240123115821.292787-1-biju.das.jz@bp.renesas.com>
 <20240123115821.292787-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240123115821.292787-2-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Tue, Jan 23, 2024 at 11:58:18AM +0000, Biju Das wrote:
> SET_RUNTIME_PM_OPS() are deprecated

Not that I particularly care about SET_RUNTIME_PM_OPS, but I'm not aware
of it being deprecated. Has that been announced somewhere ?

> and require __maybe_unused
> protection against unused function warnings. The usage of pm_ptr() and
> RUNTIME_PM_OPS() allows the compiler to see the functions, thus
> suppressing the warning. Thus drop the __maybe_unused markings.

Have you tried to compile this with CONFIG_PM disabled, and confirmed
the compiler doesn't generate any warning ?

> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index d20f4eff93a4..c4609da9bf1a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -834,7 +834,7 @@ static void rzg2l_csi2_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> -static int __maybe_unused rzg2l_csi2_pm_runtime_suspend(struct device *dev)
> +static int rzg2l_csi2_pm_runtime_suspend(struct device *dev)
>  {
>  	struct rzg2l_csi2 *csi2 = dev_get_drvdata(dev);
>  
> @@ -843,7 +843,7 @@ static int __maybe_unused rzg2l_csi2_pm_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused rzg2l_csi2_pm_runtime_resume(struct device *dev)
> +static int rzg2l_csi2_pm_runtime_resume(struct device *dev)
>  {
>  	struct rzg2l_csi2 *csi2 = dev_get_drvdata(dev);
>  
> @@ -851,7 +851,7 @@ static int __maybe_unused rzg2l_csi2_pm_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
> -	SET_RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend, rzg2l_csi2_pm_runtime_resume, NULL)
> +	RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend, rzg2l_csi2_pm_runtime_resume, NULL)

While at it, I would wrap the line to

	RUNTIME_PM_OPS(rzg2l_csi2_pm_runtime_suspend,
		       rzg2l_csi2_pm_runtime_resume, NULL)

Up to you.

>  };
>  
>  static const struct of_device_id rzg2l_csi2_of_table[] = {
> @@ -865,7 +865,7 @@ static struct platform_driver rzg2l_csi2_pdrv = {
>  	.driver	= {
>  		.name = "rzg2l-csi2",
>  		.of_match_table = rzg2l_csi2_of_table,
> -		.pm = &rzg2l_csi2_pm_ops,
> +		.pm = pm_ptr(&rzg2l_csi2_pm_ops),
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart

