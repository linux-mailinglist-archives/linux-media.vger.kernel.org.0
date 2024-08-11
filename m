Return-Path: <linux-media+bounces-16085-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC8B94E2BC
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2024 20:50:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BE1141F21521
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2024 18:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7628414B95B;
	Sun, 11 Aug 2024 18:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="sqsjPG+C"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCE7158541
	for <linux-media@vger.kernel.org>; Sun, 11 Aug 2024 18:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723402216; cv=none; b=D4Xi/f2Tzzz5sD67WW5xHZh9qHXvf73pcdQy9zT7mxifbcBjxitaHAmwHeL04p92fWieKIItXlwB1oyLj2lPqmQZTPQmOopNUcz1CaWDsZqyDwZIyi7WlE0VWjeg3qHI7BMK1rFUf2fC411tvoZIA7ccDzt/KYS+t0Bo5cGaIJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723402216; c=relaxed/simple;
	bh=qBTxBN4ff1d86USvGj+U5Rw6wLU+O1o/IKFFj1njMtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5r7UTgK8gjjmsCbVEhNT+hhgcBNethpNIaVMLUMiRporjoBU5+QOQCSHW0fo7Mt+jXIgTHRWydVMGtgyzhXjeKy4jPjBYviqbM26ta2ToEXw9MpZVYmMwIBTNpGR4xEprAir+Ja5GaHWjGB2a3tXHLLRfAz8I97405AyOadZgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=sqsjPG+C; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7B67C596;
	Sun, 11 Aug 2024 20:49:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723402157;
	bh=qBTxBN4ff1d86USvGj+U5Rw6wLU+O1o/IKFFj1njMtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sqsjPG+CDyVSeUf4tQqutAKYL949V6spNzzW46unPPUSCW39XFgQBzGdsXfq9PJ1e
	 ZhkxgSDUvifoR8tY66elWSWqH593eHqmHCuOB8C6QIAvS5NUO2ymq2P1EVOo5IYyze
	 agXFS73gEcys5lP0PickdrAop8eCh4S+tqPI9WB8=
Date: Sun, 11 Aug 2024 21:49:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: rmfrfs@gmail.com, martink@posteo.de, linux-media@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 2/2] media: imx8mq-mipi-csi2: Switch to
 RUNTIME/SYSTEM_SLEEP_PM_OPS()
Message-ID: <20240811184949.GD9403@pendragon.ideasonboard.com>
References: <20240807182610.81244-1-festevam@gmail.com>
 <20240807182610.81244-2-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240807182610.81244-2-festevam@gmail.com>

Hi Fabio,

Thank you for the patch.

On Wed, Aug 07, 2024 at 03:26:10PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Replace SET_RUNTIME_PM_OPS()/SET SYSTEM_SLEEP_PM_OPS() with their modern
> RUNTIME_PM_OPS() and SYSTEM_SLEEP_PM_OPS() alternatives.
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS/SYSTEM_SLEEP_PM_OPS()
> allows the compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions..
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> index ba2e81f24965..d4a6c5532969 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -693,7 +693,7 @@ static int imx8mq_mipi_csi_pm_resume(struct device *dev)
>  	return ret ? -EAGAIN : 0;
>  }
>  
> -static int __maybe_unused imx8mq_mipi_csi_suspend(struct device *dev)
> +static int imx8mq_mipi_csi_suspend(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> @@ -705,7 +705,7 @@ static int __maybe_unused imx8mq_mipi_csi_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused imx8mq_mipi_csi_resume(struct device *dev)
> +static int imx8mq_mipi_csi_resume(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> @@ -716,7 +716,7 @@ static int __maybe_unused imx8mq_mipi_csi_resume(struct device *dev)
>  	return imx8mq_mipi_csi_pm_resume(dev);
>  }
>  
> -static int __maybe_unused imx8mq_mipi_csi_runtime_suspend(struct device *dev)
> +static int imx8mq_mipi_csi_runtime_suspend(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> @@ -731,7 +731,7 @@ static int __maybe_unused imx8mq_mipi_csi_runtime_suspend(struct device *dev)
>  	return ret;
>  }
>  
> -static int __maybe_unused imx8mq_mipi_csi_runtime_resume(struct device *dev)
> +static int imx8mq_mipi_csi_runtime_resume(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct csi_state *state = mipi_sd_to_csi2_state(sd);
> @@ -747,10 +747,9 @@ static int __maybe_unused imx8mq_mipi_csi_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops imx8mq_mipi_csi_pm_ops = {
> -	SET_RUNTIME_PM_OPS(imx8mq_mipi_csi_runtime_suspend,
> -			   imx8mq_mipi_csi_runtime_resume,
> -			   NULL)
> -	SET_SYSTEM_SLEEP_PM_OPS(imx8mq_mipi_csi_suspend, imx8mq_mipi_csi_resume)
> +	RUNTIME_PM_OPS(imx8mq_mipi_csi_runtime_suspend,
> +		       imx8mq_mipi_csi_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(imx8mq_mipi_csi_suspend, imx8mq_mipi_csi_resume)
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -958,7 +957,7 @@ static struct platform_driver imx8mq_mipi_csi_driver = {
>  	.driver		= {
>  		.of_match_table = imx8mq_mipi_csi_of_match,
>  		.name		= MIPI_CSI2_DRIVER_NAME,
> -		.pm		= &imx8mq_mipi_csi_pm_ops,
> +		.pm		= pm_ptr(&imx8mq_mipi_csi_pm_ops),
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart

