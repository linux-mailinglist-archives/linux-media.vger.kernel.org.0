Return-Path: <linux-media+bounces-37440-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14975B00F64
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 01:17:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A9045A35EA
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 23:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDFA28CF40;
	Thu, 10 Jul 2025 23:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="L2EalKTr"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B424E3208;
	Thu, 10 Jul 2025 23:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752189429; cv=none; b=G/KaoAepsICnLzw2SP0//LRb0wNkp+fd2ilkffoB6bOjT7TtH76Cs6yNkk/J3zGAEnCvocABEwcR49Ve4S6b+V3G0VKafgEFmK8OV8B50E8dLWi2UDqCl+UvhGHQ3aQRBKp5PKAgSeVmv/+lh5Cm2J0Lxk09iGkQSs5vk4cVPbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752189429; c=relaxed/simple;
	bh=ACXEyRXR9JN1IW/K390jkF0Qsmv90BtoS3nxwqMI6g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glytIW9W3dzYzcrOQrpeeNrGv1Gj4npz5pNQEt8HHYVo/dsfs/ZVeLdDBSFeFaHRLPvS5Y89ILxyS6j6uhY1IQZH9CZYlydKVjzijAl+Rbw0PXRS48necnU6o4EsxtpWl9sJ7jj8imxnImLmL0fjTK5QwFJHkleW8foDSUM/Xhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=L2EalKTr; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 9E3CD129;
	Fri, 11 Jul 2025 01:16:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1752189396;
	bh=ACXEyRXR9JN1IW/K390jkF0Qsmv90BtoS3nxwqMI6g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L2EalKTrWlRdSa389dsCobjZ+sb77oQ5CrLMd6/PD/yST7g4BFoNCfpzrNP5KSOsU
	 7hSkk1VrK/Z10EaceMm+1REl44wBdja9OqAcI6jIPwP4wcRejbtG9ESqaC6nyUUDl4
	 ispgFsc/I/5dkAVBvvxGd17ue6Y1E5vJ8YQvvZfU=
Date: Fri, 11 Jul 2025 02:16:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/5] media: renesas: fdp1: Convert to RUNTIME_PM_OPS()
Message-ID: <20250710231635.GC27674@pendragon.ideasonboard.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <4402553df11f87a53cd70c95e35966963a4132df.1752088108.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4402553df11f87a53cd70c95e35966963a4132df.1752088108.git.geert+renesas@glider.be>

Hi Geert,

On Wed, Jul 09, 2025 at 09:16:09PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Fine Display Processor driver from
> SET_RUNTIME_PM_OPS() to RUNTIME_PM_OPS() and pm_ptr().  This lets us
> drop the __maybe_unused annotations from its runtime suspend and resume
> callbacks, and reduces kernel size in case CONFIG_PM is disabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/renesas/rcar_fdp1.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rcar_fdp1.c b/drivers/media/platform/renesas/rcar_fdp1.c
> index 5d453a7a89889fa3..a40e48a7078f11b6 100644
> --- a/drivers/media/platform/renesas/rcar_fdp1.c
> +++ b/drivers/media/platform/renesas/rcar_fdp1.c
> @@ -2409,7 +2409,7 @@ static void fdp1_remove(struct platform_device *pdev)
>  	rcar_fcp_put(fdp1->fcp);
>  }
>  
> -static int __maybe_unused fdp1_pm_runtime_suspend(struct device *dev)
> +static int fdp1_pm_runtime_suspend(struct device *dev)
>  {
>  	struct fdp1_dev *fdp1 = dev_get_drvdata(dev);
>  
> @@ -2418,7 +2418,7 @@ static int __maybe_unused fdp1_pm_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused fdp1_pm_runtime_resume(struct device *dev)
> +static int fdp1_pm_runtime_resume(struct device *dev)
>  {
>  	struct fdp1_dev *fdp1 = dev_get_drvdata(dev);
>  
> @@ -2429,9 +2429,7 @@ static int __maybe_unused fdp1_pm_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops fdp1_pm_ops = {
> -	SET_RUNTIME_PM_OPS(fdp1_pm_runtime_suspend,
> -			   fdp1_pm_runtime_resume,
> -			   NULL)
> +	RUNTIME_PM_OPS(fdp1_pm_runtime_suspend, fdp1_pm_runtime_resume, NULL)
>  };
>  
>  static const struct of_device_id fdp1_dt_ids[] = {
> @@ -2446,7 +2444,7 @@ static struct platform_driver fdp1_pdrv = {
>  	.driver		= {
>  		.name	= DRIVER_NAME,
>  		.of_match_table = fdp1_dt_ids,
> -		.pm	= &fdp1_pm_ops,
> +		.pm	= pm_ptr(&fdp1_pm_ops),
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart

