Return-Path: <linux-media+bounces-37435-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D16BB00F52
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 01:11:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03E521CC0130
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30EE12397A4;
	Thu, 10 Jul 2025 23:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="d9vUVbIO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC772C1596;
	Thu, 10 Jul 2025 23:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752188993; cv=none; b=UO1fGS+i7Y3Zo356q7Urwlx5WpEkK0br0kPzh6qVvxpXPBrNeKrwUYAblXdPi1mLojPpJtJsAOjbHVGtYntufxM00aalkLr7ju3cIHjO1chdnOvo/GIgji9Nqkua9NwIA4m/xSgMY0xsMXuEad4YLYba14wmwIvaW5/EQC5RlpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752188993; c=relaxed/simple;
	bh=oUF2dEkUNOGHHj2aTHBd7djDVX7cxprxXzXPBCHmszg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WjaUW+qRMxluOEhGhFQwbiIM+L6Qk1f22+0qEnyzLhvLUHB83GHbf+vMzAyAcOdcmmB5Mi9uv0vspr7zTlA+zHuYayFlH1DsW6EH9BjB6vpMVSkZ1bJN4sE9PAoAbuUlxKnqnPADVzC9cAx/8HSccCXvVNcGasI2QIzoRKZf3L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=d9vUVbIO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 903A9E45;
	Fri, 11 Jul 2025 01:09:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752188960;
	bh=oUF2dEkUNOGHHj2aTHBd7djDVX7cxprxXzXPBCHmszg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d9vUVbIOiXnuLzrUHKMQu2heTdYqVngKh5pbo0ghkqgPz5y8K9zLhI/rQis2D2y4b
	 JCfiWmLfirdefJsbg+d7zcfCa/esEpTOl2Hqn5ZyzRT+Ppj+liBNPRUodW2uMNuFdh
	 982OBzqvFoD3mL/tJLNUFmvagpSUJEfJoJ5E27oc=
Date: Fri, 11 Jul 2025 02:09:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] media: renesas: rcar_drif: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20250710230919.GA27674@pendragon.ideasonboard.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <ad032c66fc32dddf3a5590a5939792c1139a554c.1752088108.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ad032c66fc32dddf3a5590a5939792c1139a554c.1752088108.git.geert+renesas@glider.be>

On Wed, Jul 09, 2025 at 09:16:07PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Digital Radio Interface driver from
> SIMPLE_DEV_PM_OPS() to DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().
> This lets us drop the __maybe_unused annotations from its suspend and
> resume callbacks, and reduces kernel size in case CONFIG_PM or
> CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/media/platform/renesas/rcar_drif.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar_drif.c b/drivers/media/platform/renesas/rcar_drif.c
> index fc8b6bbef793c64e..0f0c5844e22ea86c 100644
> --- a/drivers/media/platform/renesas/rcar_drif.c
> +++ b/drivers/media/platform/renesas/rcar_drif.c
> @@ -1446,18 +1446,18 @@ static void rcar_drif_remove(struct platform_device *pdev)
>  }
>  
>  /* FIXME: Implement suspend/resume support */
> -static int __maybe_unused rcar_drif_suspend(struct device *dev)
> +static int rcar_drif_suspend(struct device *dev)
>  {
>  	return 0;
>  }
>  
> -static int __maybe_unused rcar_drif_resume(struct device *dev)
> +static int rcar_drif_resume(struct device *dev)
>  {
>  	return 0;
>  }
>  
> -static SIMPLE_DEV_PM_OPS(rcar_drif_pm_ops, rcar_drif_suspend,
> -			 rcar_drif_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(rcar_drif_pm_ops, rcar_drif_suspend,
> +				rcar_drif_resume);
>  
>  static const struct of_device_id rcar_drif_of_table[] = {
>  	{ .compatible = "renesas,rcar-gen3-drif" },
> @@ -1470,7 +1470,7 @@ static struct platform_driver rcar_drif_driver = {
>  	.driver = {
>  		.name = RCAR_DRIF_DRV_NAME,
>  		.of_match_table = rcar_drif_of_table,
> -		.pm = &rcar_drif_pm_ops,
> +		.pm = pm_sleep_ptr(&rcar_drif_pm_ops),
>  		},

While at it, let's fix the indentation issue here. I can do so when
applying, no need to resend just for this.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>


>  	.probe = rcar_drif_probe,
>  	.remove = rcar_drif_remove,

-- 
Regards,

Laurent Pinchart

