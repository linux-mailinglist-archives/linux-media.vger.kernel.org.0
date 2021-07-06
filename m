Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D7D3BDBAA
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 18:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhGFQxe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 12:53:34 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:37385 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229770AbhGFQxd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 12:53:33 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 13F89240002;
        Tue,  6 Jul 2021 16:50:52 +0000 (UTC)
Date:   Tue, 6 Jul 2021 18:51:41 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 04/11] rcar-vin: Improve reuse of parallel notifier
Message-ID: <20210706165141.adzayyndbfwzocpr@uno.localdomain>
References: <20210413180253.2575451-1-niklas.soderlund+renesas@ragnatech.se>
 <20210413180253.2575451-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210413180253.2575451-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Tue, Apr 13, 2021 at 08:02:46PM +0200, Niklas Söderlund wrote:
> In preparation for adding a new media graph layout move the code reuse
> of the parallel notifier setup from probe directly to the current media
> graph initialization function. This is needed as there will be no
> parallel interface in the new graph layout.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 48 ++++++++++-----------
>  1 file changed, 22 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index da23d55aa72b7f0d..81574bf33116ad59 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -702,9 +702,8 @@ static int rvin_parallel_init(struct rvin_dev *vin)
>  	if (ret)
>  		return ret;
>
> -	/* If using mc, it's fine not to have any input registered. */
>  	if (!vin->parallel.asd)
> -		return vin->info->use_mc ? 0 : -ENODEV;
> +		return -ENODEV;

Nit: isn't it better to keep the error handling here ?

>
>  	vin_dbg(vin, "Found parallel subdevice %pOF\n",
>  		to_of_node(vin->parallel.asd->match.fwnode));
> @@ -955,11 +954,9 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
>
>  static void rvin_csi2_cleanup(struct rvin_dev *vin)
>  {
> -	if (!vin->info->use_mc)
> -		return;
> -
>  	rvin_group_notifier_cleanup(vin);
>  	rvin_group_put(vin);
> +	rvin_free_controls(vin);
>  }
>
>  static int rvin_csi2_init(struct rvin_dev *vin)
> @@ -979,11 +976,18 @@ static int rvin_csi2_init(struct rvin_dev *vin)
>  	if (ret)
>  		goto err_controls;
>
> -	ret = rvin_mc_parse_of_graph(vin);
> -	if (ret)
> +	/* It's OK to not have a parallel subdevice. */
> +	ret = rvin_parallel_init(vin);
> +	if (ret && ret != -ENODEV)
>  		goto err_group;
>
> +	ret = rvin_mc_parse_of_graph(vin);
> +	if (ret)
> +		goto err_parallel;
> +
>  	return 0;
> +err_parallel:
> +	rvin_parallel_cleanup(vin);
>  err_group:
>  	rvin_group_put(vin);
>  err_controls:
> @@ -1469,27 +1473,20 @@ static int rcar_vin_probe(struct platform_device *pdev)
>
>  	platform_set_drvdata(pdev, vin);
>
> -	if (vin->info->use_mc) {
> +	if (vin->info->use_mc)
>  		ret = rvin_csi2_init(vin);
> -		if (ret)
> -			goto error_dma_unregister;
> -	}
> +	else
> +		ret = rvin_parallel_init(vin);
>
> -	ret = rvin_parallel_init(vin);
> -	if (ret)
> -		goto error_group_unregister;
> +	if (ret) {
> +		rvin_dma_unregister(vin);
> +		return ret;
> +	}
>
>  	pm_suspend_ignore_children(&pdev->dev, true);
>  	pm_runtime_enable(&pdev->dev);
>
>  	return 0;
> -error_group_unregister:
> -	rvin_free_controls(vin);
> -	rvin_csi2_cleanup(vin);
> -error_dma_unregister:
> -	rvin_dma_unregister(vin);
> -
> -	return ret;

This looks much much better and seems correct to me!

>  }
>
>  static int rcar_vin_remove(struct platform_device *pdev)
> @@ -1500,11 +1497,10 @@ static int rcar_vin_remove(struct platform_device *pdev)
>
>  	rvin_v4l2_unregister(vin);
>
> -	rvin_parallel_cleanup(vin);
> -
> -	rvin_csi2_cleanup(vin);
> -
> -	rvin_free_controls(vin);
> +	if (vin->info->use_mc)
> +		rvin_csi2_cleanup(vin);
> +	else
> +		rvin_parallel_cleanup(vin);

In the case use_mc == true but a parallel input was registered as well
this won't clean up the parallel notifier it seems.

Does it hurt to clean it up unconditionally ?

Thanks
  j
>
>  	rvin_dma_unregister(vin);
>
> --
> 2.31.1
>
