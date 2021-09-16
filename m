Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5756A40D084
	for <lists+linux-media@lfdr.de>; Thu, 16 Sep 2021 02:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232987AbhIPADg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Sep 2021 20:03:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232465AbhIPADg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Sep 2021 20:03:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93DC0C061574;
        Wed, 15 Sep 2021 17:02:16 -0700 (PDT)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C01362A5;
        Thu, 16 Sep 2021 02:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1631750535;
        bh=RfFniubyWZPhhg6ehr3wEJJ1/o0/lx+gBWXgX0qFigU=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=vFAlp7W+M/tESAss8Y5Z+mmUL+2M+A/kjxu07sGGSA2UPRS/sqXaz+rnarJa+s/os
         zONSk4x5VojjeXrO+N29X5ztSVvXniFo0Yd0tnpje/f/ZAxP+1NAIQR8yV2ylzQNHp
         WzrdAohfHX8EBEnchV+i4x64I6ogmA7TNXl6y7sk=
Subject: Re: [PATCH v2 1/2] media: rcar-csi2: Cleanup mutex on remove and fail
To:     =?UTF-8?Q?Niklas_S=c3=b6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>
References: <20210915015013.3169934-1-niklas.soderlund+renesas@ragnatech.se>
 <20210915015013.3169934-2-niklas.soderlund+renesas@ragnatech.se>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <aea92f89-907e-a359-5c3a-128a21fa7fd5@ideasonboard.com>
Date:   Thu, 16 Sep 2021 01:02:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210915015013.3169934-2-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 15/09/2021 02:50, Niklas Söderlund wrote:
> The mutex was not destroyed on remove or failed probe, fix this.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index e28eff0396888f2d..a02573dbd5da4f62 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -1245,14 +1245,14 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	ret = rcsi2_probe_resources(priv, pdev);
>  	if (ret) {
>  		dev_err(priv->dev, "Failed to get resources\n");
> -		return ret;
> +		goto error_mutex;
>  	}
>  
>  	platform_set_drvdata(pdev, priv);
>  
>  	ret = rcsi2_parse_dt(priv);
>  	if (ret)
> -		return ret;
> +		goto error_mutex;
>  
>  	priv->subdev.owner = THIS_MODULE;
>  	priv->subdev.dev = &pdev->dev;
> @@ -1272,21 +1272,23 @@ static int rcsi2_probe(struct platform_device *pdev)
>  	ret = media_entity_pads_init(&priv->subdev.entity, NR_OF_RCAR_CSI2_PAD,
>  				     priv->pads);
>  	if (ret)
> -		goto error;
> +		goto error_async;
>  
>  	pm_runtime_enable(&pdev->dev);
>  
>  	ret = v4l2_async_register_subdev(&priv->subdev);
>  	if (ret < 0)
> -		goto error;
> +		goto error_async;
>  
>  	dev_info(priv->dev, "%d lanes found\n", priv->lanes);
>  
>  	return 0;
>  
> -error:
> +error_async:
>  	v4l2_async_notifier_unregister(&priv->notifier);
>  	v4l2_async_notifier_cleanup(&priv->notifier);
> +error_mutex:
> +	mutex_destroy(&priv->lock);
>  
>  	return ret;
>  }
> @@ -1301,6 +1303,8 @@ static int rcsi2_remove(struct platform_device *pdev)
>  
>  	pm_runtime_disable(&pdev->dev);
>  
> +	mutex_destroy(&priv->lock);
> +
>  	return 0;
>  }
>  
> 

