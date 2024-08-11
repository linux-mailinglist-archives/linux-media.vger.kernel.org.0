Return-Path: <linux-media+bounces-16084-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D53F94E2B9
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2024 20:49:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB7431F2133B
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2024 18:49:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 116A81547F4;
	Sun, 11 Aug 2024 18:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Mmf2FDPK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADB82837F
	for <linux-media@vger.kernel.org>; Sun, 11 Aug 2024 18:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723402173; cv=none; b=Rm07XUdaFu49Jg7lIqxKhNt2v6x8fuH8Ii2UrfbFlRY6DoTIixeNccuYCLYtAjFyh/WvtVuv2dnZfvOv+ZTN9ID/TvdjKH/JumlpwkT/qR3xymYBtI/9oSEibMo6oBze7WJTsZCz+ScR95vwoxtNvqQAlIaHQLiLbAI7hosxRHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723402173; c=relaxed/simple;
	bh=YxvMQO4LwcFGwi3zhYc4N2CQvC/Oc8t2rBsU8/paMHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q5tiUHwJZ2gIYWVjxtF9e8bo4I2oecdPtSh1N8SSYUagbXQsTg+r+wZJXUc2zNMsijEUcJmxEqU6DZ4nWdXAY6A9wZTrdJHkRdebSe6V3NhvVakUSsHXkD2ckE2k6UQ/GL0VTGf/Ah7NdceemEtIJcdmRnbQ197LViE5ZniIxfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Mmf2FDPK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B949C596;
	Sun, 11 Aug 2024 20:48:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723402114;
	bh=YxvMQO4LwcFGwi3zhYc4N2CQvC/Oc8t2rBsU8/paMHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mmf2FDPKsaIA8rwdndIgPVI5umfvGCjUFEuPTPVviQpZia8yLFjmX4DnCvSBHBot9
	 ItGeDCcoGTrAgZM8zh6JpC/4PlgBb4GGcYldknzSnGD6JHcRf/avCLMfb5PFSzZkmO
	 Bl7s/QIdIJg2bhUq1jMvKojol1C6JJtL4q14zLA8=
Date: Sun, 11 Aug 2024 21:49:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: rmfrfs@gmail.com, martink@posteo.de, linux-media@vger.kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] media: imx-mipi-csis: Switch to RUNTIME_PM_OPS()
Message-ID: <20240811184905.GC9403@pendragon.ideasonboard.com>
References: <20240807182610.81244-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240807182610.81244-1-festevam@gmail.com>

Hi Fabio,

Thank you for the patch.

On Wed, Aug 07, 2024 at 03:26:09PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> Replace SET_RUNTIME_PM_OPS() with its modern RUNTIME_PM_OPS()
> alternative.
> 
> The combined usage of pm_ptr() and RUNTIME_PM_OPS() allows the
> compiler to evaluate if the runtime suspend/resume() functions
> are used at build time or are simply dead code.
> 
> This allows removing the __maybe_unused notation from the runtime
> suspend/resume() functions.
> 
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index b9729a8883d6..08d8850399b6 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1344,7 +1344,7 @@ static int mipi_csis_async_register(struct mipi_csis_device *csis)
>   * Suspend/resume
>   */
>  
> -static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
> +static int mipi_csis_runtime_suspend(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> @@ -1359,7 +1359,7 @@ static int __maybe_unused mipi_csis_runtime_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
> +static int mipi_csis_runtime_resume(struct device *dev)
>  {
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct mipi_csis_device *csis = sd_to_mipi_csis_device(sd);
> @@ -1379,8 +1379,8 @@ static int __maybe_unused mipi_csis_runtime_resume(struct device *dev)
>  }
>  
>  static const struct dev_pm_ops mipi_csis_pm_ops = {
> -	SET_RUNTIME_PM_OPS(mipi_csis_runtime_suspend, mipi_csis_runtime_resume,
> -			   NULL)
> +	RUNTIME_PM_OPS(mipi_csis_runtime_suspend, mipi_csis_runtime_resume,
> +		       NULL)
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -1571,7 +1571,7 @@ static struct platform_driver mipi_csis_driver = {
>  	.driver		= {
>  		.of_match_table = mipi_csis_of_match,
>  		.name		= CSIS_DRIVER_NAME,
> -		.pm		= &mipi_csis_pm_ops,
> +		.pm		= pm_ptr(&mipi_csis_pm_ops),
>  	},
>  };
>  

-- 
Regards,

Laurent Pinchart

