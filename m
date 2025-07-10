Return-Path: <linux-media+bounces-37438-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C23B00F59
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 01:11:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E6C45C4E8D
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548A42BEC52;
	Thu, 10 Jul 2025 23:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OCP9fHbZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246FB2BE65E;
	Thu, 10 Jul 2025 23:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752189090; cv=none; b=S2jsEJr2t5ygvtW07+Ehm9wQidZFowPpkX6y96HRAnmLlApr7ezd9s82zIDhgNi+y0/4tEBqs50mfNjXJ1vzSQGS7j3Zp4suRWudrAdypnG02krCRccKMjIr5l7hcWe2DzQww2oavl2rd0rS+vr0KZu6+6x6Xa81Bjln/SaIr7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752189090; c=relaxed/simple;
	bh=UkGqYgJk2mh88ttZ6IuiR88cziSCfLKADhAbHVqXX08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W/+hUKncousHV5ij23cwvEIqF6x+YlyFBlSeuSZEKaSnGYSwAcNorGjRGwPbj+p3Zcgr+47cl52eKKsx1sGCaPzMVnrbJ8fdXfW+f+4eZyLIx3H/dCpxZ5dU0ir7K2Qyj6aSTdlda0zuO7HiSJyN/10q+J5+TG2bJO/VqnUd31w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OCP9fHbZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CFFC3E45;
	Fri, 11 Jul 2025 01:10:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752189058;
	bh=UkGqYgJk2mh88ttZ6IuiR88cziSCfLKADhAbHVqXX08=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OCP9fHbZYxY2dBwUmY9FQYg0VRHQjwa/9zZ1u6PRx+Jgj2O2dxR6aZMb5N69z62O0
	 acQv6gDpe6iWl0edwRCm131FGB4DTyFwY3xUH7kKo4qysfKpe+YDJvIZv2UQ6b83Xw
	 l1fe0GdBviF16+CYBqGlm0NicJDjGj3/jorAGmfU=
Date: Fri, 11 Jul 2025 02:10:56 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] media: renesas: rcar-vin: Convert to
 DEFINE_SIMPLE_DEV_PM_OPS()
Message-ID: <20250710231056.GB27674@pendragon.ideasonboard.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <21c38e1fc0c8383d8d723b61f00f37d4003e0de9.1752088108.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <21c38e1fc0c8383d8d723b61f00f37d4003e0de9.1752088108.git.geert+renesas@glider.be>

Hi Geert,

Thank you for the patch.

On Wed, Jul 09, 2025 at 09:16:08PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas R-Car Video Input driver from SIMPLE_DEV_PM_OPS() to
> DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
> __maybe_unused annotations from its suspend and resume callbacks, and
> reduces kernel size in case CONFIG_PM or CONFIG_PM_SLEEP is disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar-vin/rcar-core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar-vin/rcar-core.c b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> index f73729f59671be20..100105b620e31e58 100644
> --- a/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/renesas/rcar-vin/rcar-core.c
> @@ -849,7 +849,7 @@ static int rvin_isp_init(struct rvin_dev *vin)
>   * Suspend / Resume
>   */
>  
> -static int __maybe_unused rvin_suspend(struct device *dev)
> +static int rvin_suspend(struct device *dev)
>  {
>  	struct rvin_dev *vin = dev_get_drvdata(dev);
>  
> @@ -861,7 +861,7 @@ static int __maybe_unused rvin_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused rvin_resume(struct device *dev)
> +static int rvin_resume(struct device *dev)
>  {
>  	struct rvin_dev *vin = dev_get_drvdata(dev);
>  
> @@ -1276,13 +1276,13 @@ static void rcar_vin_remove(struct platform_device *pdev)
>  	rvin_dma_unregister(vin);
>  }
>  
> -static SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(rvin_pm_ops, rvin_suspend, rvin_resume);
>  
>  static struct platform_driver rcar_vin_driver = {
>  	.driver = {
>  		.name = "rcar-vin",
>  		.suppress_bind_attrs = true,
> -		.pm = &rvin_pm_ops,
> +		.pm = pm_sleep_ptr(&rvin_pm_ops),
>  		.of_match_table = rvin_of_id_table,
>  	},
>  	.probe = rcar_vin_probe,

-- 
Regards,

Laurent Pinchart

