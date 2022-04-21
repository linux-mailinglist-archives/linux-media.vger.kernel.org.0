Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CBF6050A9A5
	for <lists+linux-media@lfdr.de>; Thu, 21 Apr 2022 22:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1392158AbiDUUEf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Apr 2022 16:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392160AbiDUUEf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Apr 2022 16:04:35 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99C3F4BFC0
        for <linux-media@vger.kernel.org>; Thu, 21 Apr 2022 13:01:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BC47D4A8;
        Thu, 21 Apr 2022 22:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650571298;
        bh=4NSr+AiFOqZ4LV4ktg1rCFw7xK28BPpVgypeKoNYuEs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RlD3CJHfetk2dvRZjwtJjU3mKNbls019cBZIpSKhvTH4ujPuSHDQsFjY01s9P9Xxv
         RNcR/612oM9kJVKJ4nlQyRw0Ntv3p1qls9VxVQhXBMrtJ5ie02Q/VtbeXs3sS4eELN
         qL/umWjEjO9+ZNVuHrADgnkuqKCGyprd4Rgf0EH4=
Date:   Thu, 21 Apr 2022 23:01:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
Subject: Re: [PATCH 1/6] media: ti: cal: fix error paths in
 cal_camerarx_create()
Message-ID: <YmG4I3seaJmtmtC9@pendragon.ideasonboard.com>
References: <20220421143449.552312-1-tomi.valkeinen@ideasonboard.com>
 <20220421143449.552312-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220421143449.552312-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Apr 21, 2022 at 05:34:44PM +0300, Tomi Valkeinen wrote:
> The error paths are not correct: media_entity_cleanup() should not be
> called unless media_entity_pads_init() has been called. Fix this.

See commit 443bf23d0048 ("media: media-entity: Clarify
media_entity_cleanup() usage") :-)

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti/cal/cal-camerarx.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/cal/cal-camerarx.c b/drivers/media/platform/ti/cal/cal-camerarx.c
> index 6b43a1525b45..a41941fa819a 100644
> --- a/drivers/media/platform/ti/cal/cal-camerarx.c
> +++ b/drivers/media/platform/ti/cal/cal-camerarx.c
> @@ -854,7 +854,7 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	if (IS_ERR(phy->base)) {
>  		cal_err(cal, "failed to ioremap\n");
>  		ret = PTR_ERR(phy->base);
> -		goto error;
> +		goto err_free_phy;
>  	}
>  
>  	cal_dbg(1, cal, "ioresource %s at %pa - %pa\n",
> @@ -862,11 +862,11 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
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
> @@ -883,20 +883,21 @@ struct cal_camerarx *cal_camerarx_create(struct cal_dev *cal,
>  	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(phy->pads),
>  				     phy->pads);
>  	if (ret)
> -		goto error;
> +		goto err_free_phy;
>  
>  	ret = cal_camerarx_sd_init_cfg(sd, NULL);
>  	if (ret)
> -		goto error;
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
