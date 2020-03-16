Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E577F186AD7
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2020 13:28:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730942AbgCPM2K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 16 Mar 2020 08:28:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35692 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730896AbgCPM2J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 16 Mar 2020 08:28:09 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5B5A7A3B;
        Mon, 16 Mar 2020 13:28:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1584361688;
        bh=gCVzrBKB4bQmEPa765vBkIGK3gKRbNgpXjSJst9cufI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t4xsFPNRWt191loXFc/XgDsbJl3kQN/m0clbeRXAuCPradX5xn2G7hHDSrPljTfEj
         Hc4fJdU2SbpM7G0RUKIlok7PqPnU58JWqbzPSZTde3FUJL/FgjIcRl42Rzw9TPFqxt
         Zq2hrjaDAYw03TFVvYw5qtOfUGIRMXmIVv5AW2Og=
Date:   Mon, 16 Mar 2020 14:28:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     linux-media@vger.kernel.org, Benoit Parrot <bparrot@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH 02/16] media: ti-vpe: cal: use runtime_resume for errata
 handling
Message-ID: <20200316122803.GX4732@pendragon.ideasonboard.com>
References: <20200313114121.32182-1-tomi.valkeinen@ti.com>
 <20200313114121.32182-2-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200313114121.32182-2-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 01:41:07PM +0200, Tomi Valkeinen wrote:
> We need to do errata handling every time CAL is being enabled. The code
> is currently in cal_runtime_get(), which is not the correct place for
> it.
> 
> Move the code to cal_runtime_resume, which is called every time CAL is
> enabled.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/media/platform/ti-vpe/cal.c | 36 ++++++++++++++++++-----------
>  1 file changed, 22 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
> index 4b584c419e98..b4a9f4d16ce4 100644
> --- a/drivers/media/platform/ti-vpe/cal.c
> +++ b/drivers/media/platform/ti-vpe/cal.c
> @@ -653,20 +653,7 @@ static void i913_errata(struct cal_dev *dev, unsigned int port)
>  
>  static int cal_runtime_get(struct cal_dev *dev)
>  {
> -	int r;
> -
> -	r = pm_runtime_get_sync(&dev->pdev->dev);
> -
> -	if (dev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
> -		/*
> -		 * Apply errata on both port eveytime we (re-)enable
> -		 * the clock
> -		 */
> -		i913_errata(dev, 0);
> -		i913_errata(dev, 1);
> -	}
> -
> -	return r;
> +	return pm_runtime_get_sync(&dev->pdev->dev);
>  }
>  
>  static inline void cal_runtime_put(struct cal_dev *dev)
> @@ -2397,11 +2384,32 @@ static const struct of_device_id cal_of_match[] = {
>  MODULE_DEVICE_TABLE(of, cal_of_match);
>  #endif
>  
> +static int cal_runtime_resume(struct device *dev)
> +{
> +	struct cal_dev *caldev = dev_get_drvdata(dev);
> +
> +	if (caldev->flags & DRA72_CAL_PRE_ES2_LDO_DISABLE) {
> +		/*
> +		 * Apply errata on both port eveytime we (re-)enable

s/eveytime/everytime/

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Now that cal_runtime_get() and cal_runtime_put() are just wrappers
around pm_runtime_get_sync() and pm_runtime_put_sync(), how about
dropping the wrappers ?

> +		 * the clock
> +		 */
> +		i913_errata(caldev, 0);
> +		i913_errata(caldev, 1);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops cal_pm_ops = {
> +	.runtime_resume = cal_runtime_resume,
> +};
> +
>  static struct platform_driver cal_pdrv = {
>  	.probe		= cal_probe,
>  	.remove		= cal_remove,
>  	.driver		= {
>  		.name	= CAL_MODULE_NAME,
> +		.pm	= &cal_pm_ops,
>  		.of_match_table = of_match_ptr(cal_of_match),
>  	},
>  };

-- 
Regards,

Laurent Pinchart
