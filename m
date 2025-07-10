Return-Path: <linux-media+bounces-37441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ABEDB00F6A
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 01:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E4141CA3349
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:21:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C3AF29E0EB;
	Thu, 10 Jul 2025 23:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="e8fruSa+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8099F3208;
	Thu, 10 Jul 2025 23:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752189676; cv=none; b=dvdxQ/XN0p9xWFBhjoxW2e+NALwBtQ4zq9lBNpHWKcfZnSL8mIgBhCpWlvve2r70Auh5KDj1p+oNB9PRnl5ycNQXdJ984n/CGCpBavGgC7LDppY9RuJGuv1PqKYXkfx2gkCU5V2YhkobCVET7BBG/Sd9yEtOKNx5666/MAbtFx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752189676; c=relaxed/simple;
	bh=jJtxqelfBHatdAXsyeGLP/RqlG1sfNvTzqggt1AXu90=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DcLMrUFbD/YPvj2SMfQyCRc3jcoMfm3WEWXnUxV4jr0yuBMG2Ey6BTqtYK0KSi+c0j0IiRPD0r+1IMnDSdyBPG9q/kAEgE8EFlxOGJY4nHCa+ggMv9sDIG1X8kcejP0JiO8VuGvUCM12mihr+4GderciT3RPHjiQmAnjOyacBdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=e8fruSa+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 517CC10D4;
	Fri, 11 Jul 2025 01:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752189643;
	bh=jJtxqelfBHatdAXsyeGLP/RqlG1sfNvTzqggt1AXu90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e8fruSa+B84PHUbjMm50XzdxlUxWw9pkh9XRfSEJGfrURUYec+8NiGujNxhWBUvQG
	 2YieuMzy/I8TWjO4UECNCsjQhN11ANy9tYGG6yf6H7XynRQuEj1jhhCRL0Z34Ums8Z
	 jNOex8Chc8or0sGv+nOoafeVbjhGEE72yCn0d4Pk=
Date: Fri, 11 Jul 2025 02:20:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] media: renesas: ceu: Convert to RUNTIME_PM_OPS()
Message-ID: <20250710232042.GD27674@pendragon.ideasonboard.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <7073c5a5a4c89b9244a2e39829cfff585380d1c6.1752088108.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7073c5a5a4c89b9244a2e39829cfff585380d1c6.1752088108.git.geert+renesas@glider.be>

On Wed, Jul 09, 2025 at 09:16:10PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Capture Engine Unit driver from SET_RUNTIME_PM_OPS()
> to RUNTIME_PM_OPS() and pm_ptr().  This lets us drop the __maybe_unused
> annotations from its runtime suspend and resume callbacks, and reduces
> kernel size in case CONFIG_PM is disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/renesas-ceu.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
> index 8cceafe491b1bec6..deed49d0fb10e0d7 100644
> --- a/drivers/media/platform/renesas/renesas-ceu.c
> +++ b/drivers/media/platform/renesas/renesas-ceu.c
> @@ -1048,7 +1048,7 @@ static int ceu_init_mbus_fmt(struct ceu_device *ceudev)
>  /*
>   * ceu_runtime_resume() - soft-reset the interface and turn sensor power on.
>   */
> -static int __maybe_unused ceu_runtime_resume(struct device *dev)
> +static int ceu_runtime_resume(struct device *dev)
>  {
>  	struct ceu_device *ceudev = dev_get_drvdata(dev);
>  	struct v4l2_subdev *v4l2_sd = ceudev->sd->v4l2_sd;
> @@ -1064,7 +1064,7 @@ static int __maybe_unused ceu_runtime_resume(struct device *dev)
>   * ceu_runtime_suspend() - disable capture and interrupts and soft-reset.
>   *			   Turn sensor power off.
>   */
> -static int __maybe_unused ceu_runtime_suspend(struct device *dev)
> +static int ceu_runtime_suspend(struct device *dev)
>  {
>  	struct ceu_device *ceudev = dev_get_drvdata(dev);
>  	struct v4l2_subdev *v4l2_sd = ceudev->sd->v4l2_sd;
> @@ -1709,15 +1709,13 @@ static void ceu_remove(struct platform_device *pdev)
>  }
>  
>  static const struct dev_pm_ops ceu_pm_ops = {
> -	SET_RUNTIME_PM_OPS(ceu_runtime_suspend,
> -			   ceu_runtime_resume,
> -			   NULL)
> +	RUNTIME_PM_OPS(ceu_runtime_suspend, ceu_runtime_resume, NULL)
>  };
>  
>  static struct platform_driver ceu_driver = {
>  	.driver		= {
>  		.name	= DRIVER_NAME,
> -		.pm	= &ceu_pm_ops,
> +		.pm	= pm_ptr(&ceu_pm_ops),
>  		.of_match_table = of_match_ptr(ceu_of_match),
>  	},
>  	.probe		= ceu_probe,

-- 
Regards,

Laurent Pinchart

