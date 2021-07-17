Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D533CC2A6
	for <lists+linux-media@lfdr.de>; Sat, 17 Jul 2021 12:27:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233163AbhGQK36 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Jul 2021 06:29:58 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:33401 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229471AbhGQK35 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Jul 2021 06:29:57 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id C415C100005;
        Sat, 17 Jul 2021 10:26:59 +0000 (UTC)
Date:   Sat, 17 Jul 2021 12:27:47 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2 04/11] rcar-vin: Improve reuse of parallel notifier
Message-ID: <20210717102747.fimv53rsxdx76yql@uno.localdomain>
References: <20210709142600.651718-1-niklas.soderlund+renesas@ragnatech.se>
 <20210709142600.651718-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210709142600.651718-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Jul 09, 2021 at 04:25:53PM +0200, Niklas Söderlund wrote:
> In preparation for adding a new media graph layout move the code reuse
> of the parallel notifier setup from probe directly to the current media
> graph initialization function. This is needed as there will be no
> parallel interface in the new graph layout.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Make sure the parallel port is cleaned up in for the MC code paths.
>   Thanks Jacopo for spotting this!
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 49 ++++++++++-----------
>  1 file changed, 23 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 2957fa10252fd1e0..674766be1ad590a7 100644
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
>
>  	vin_dbg(vin, "Found parallel subdevice %pOF\n",
>  		to_of_node(vin->parallel.asd->match.fwnode));
> @@ -955,11 +954,10 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
>
>  static void rvin_csi2_cleanup(struct rvin_dev *vin)
>  {
> -	if (!vin->info->use_mc)
> -		return;
> -
> +	rvin_parallel_cleanup(vin);
>  	rvin_group_notifier_cleanup(vin);
>  	rvin_group_put(vin);
> +	rvin_free_controls(vin);

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>  }
>
>  static int rvin_csi2_init(struct rvin_dev *vin)
> @@ -979,11 +977,18 @@ static int rvin_csi2_init(struct rvin_dev *vin)
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
> @@ -1473,27 +1478,20 @@ static int rcar_vin_probe(struct platform_device *pdev)
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
>  }
>
>  static int rcar_vin_remove(struct platform_device *pdev)
> @@ -1504,11 +1502,10 @@ static int rcar_vin_remove(struct platform_device *pdev)
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
>
>  	rvin_dma_unregister(vin);
>
> --
> 2.32.0
>
