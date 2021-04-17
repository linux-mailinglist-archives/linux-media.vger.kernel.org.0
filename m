Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BC8436329D
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 01:05:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhDQXFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 17 Apr 2021 19:05:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbhDQXFd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 17 Apr 2021 19:05:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DD70C06174A
        for <linux-media@vger.kernel.org>; Sat, 17 Apr 2021 16:05:06 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8166351E;
        Sun, 18 Apr 2021 01:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618700704;
        bh=gnFaNRilwbVIOsygZtPrNqT5QUywK38A2icFcKYJ8hs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZTn69X49ELZbKqovo9cBt1QwsvJ2qM98uW8uh5gccT0OXJckXPpGSAr0e7bvX6qkN
         aQpixNY23aIjdA6VnHsocuAXUL0Cr0GAKllPCD7bEFC2FInRt3c+rscc6XemDEOwE7
         3jcy/LiZYaZt8ApJF2D9O38wiG2oy6bubIFFoQv0=
Date:   Sun, 18 Apr 2021 02:05:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 02/28] media: ti-vpe: cal: fix error handling in
 cal_camerarx_create
Message-ID: <YHtpnurWK0or8TfM@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-3-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:31PM +0300, Tomi Valkeinen wrote:
> cal_camerarx_create() doesn't handle error returned from
> cal_camerarx_sd_init_cfg()

This looks good.

> and it always runs all the cleanup/free
> functions in the error code path. The latter doesn't cause any issues at
> the moment as media_entity_cleanup() is an empty function.

But this was by design. Do you think we could keep
media_entity_cleanup() idempotent ? That would simplify error paths (as
shown here).

> Fix the error handling.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-camerarx.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-camerarx.c b/drivers/media/platform/ti-vpe/cal-camerarx.c
> index cbe6114908de..820fb483c402 100644
> --- a/drivers/media/platform/ti-vpe/cal-camerarx.c
> +++ b/drivers/media/platform/ti-vpe/cal-camerarx.c
> @@ -812,7 +812,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	if (IS_ERR(phy->base)) {
>  		cal_err(cal, "failed to ioremap\n");
>  		ret = PTR_ERR(phy->base);
> -		goto error;
> +		goto err_free_phy;
>  	}
>  
>  	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
> @@ -820,11 +820,11 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  
>  	ret = cal_camerarx_regmap_init(cal, phy);
>  	if (ret)
> -		goto error;
> +		goto err_free_phy;
>  
>  	ret = cal_camerarx_parse_dt(phy);
>  	if (ret)
> -		goto error;
> +		goto err_free_phy;
>  
>  	/* Initialize the V4L2 subdev and media entity. */
>  	sd = &phy->subdev;
> @@ -840,18 +840,21 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
>  				     phy->pads);
>  	if (ret)
> -		goto error;
> +		goto err_entity_cleanup;
>  
> -	cal_camerarx_sd_init_cfg(sd, NULL);
> +	ret = cal_camerarx_sd_init_cfg(sd, NULL);
> +	if (ret)
> +		goto err_entity_cleanup;
>  
>  	ret = v4l2_device_register_subdev(&cal->v4l2_dev, sd);
>  	if (ret)
> -		goto error;
> +		goto err_entity_cleanup;
>  
>  	return phy;
>  
> -error:
> +err_entity_cleanup:
>  	media_entity_cleanup(&phy->subdev.entity);
> +err_free_phy:
>  	kfree(phy);
>  	return ERR_PTR(ret);
>  }

-- 
Regards,

Laurent Pinchart
