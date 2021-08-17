Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5FAC3EE73F
	for <lists+linux-media@lfdr.de>; Tue, 17 Aug 2021 09:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238243AbhHQHav (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Aug 2021 03:30:51 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:55517 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234402AbhHQHau (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Aug 2021 03:30:50 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id 5F16F100007;
        Tue, 17 Aug 2021 07:30:16 +0000 (UTC)
Date:   Tue, 17 Aug 2021 09:31:04 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] media: rcar-csi2: Cleanup mutex on remove and fail
Message-ID: <20210817073104.6qy7ltabl32hnh46@uno.localdomain>
References: <20210815024915.1183417-1-niklas.soderlund+renesas@ragnatech.se>
 <20210815024915.1183417-2-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210815024915.1183417-2-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Sun, Aug 15, 2021 at 04:49:14AM +0200, Niklas Söderlund wrote:
> The mutex was not destroyed on remove or failed probe, fix this.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Looks good!

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

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
> --
> 2.32.0
>
