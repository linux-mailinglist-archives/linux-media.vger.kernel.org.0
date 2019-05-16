Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6392820310
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 12:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726799AbfEPKB5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 06:01:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55062 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbfEPKB5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 06:01:57 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD69E320;
        Thu, 16 May 2019 12:01:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558000915;
        bh=nmHcdou937jfYn5nqsN3FCl9FyAYe17NV6i0+vPnwWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TE0ME/QygbuyUm9PONaCmK6WIIV6wSyE9WrBkNl+IHb82MZL6aok8lETOMoPC/Qmq
         UGv5DTgpfPA4KjOllmJgR7xCEponRKkw9++wFZNYkyegMyKGeWjiw3/koF/RlfcXeD
         lStRdOkEceQGofG5KODFFpR0GIWo3soX3+2yC15Y=
Date:   Thu, 16 May 2019 13:01:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/3] rcar-vin: Add control for alpha component
Message-ID: <20190516100138.GB4995@pendragon.ideasonboard.com>
References: <20190516004746.3794-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516004746.3794-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516004746.3794-3-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, May 16, 2019 at 02:47:45AM +0200, Niklas Söderlund wrote:
> In preparation to adding support for RGB pixel formats with an alpha
> component add a control to allow the user to control which alpha value
> should be used.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 53 ++++++++++++++++++++-
>  drivers/media/platform/rcar-vin/rcar-dma.c  |  5 ++
>  drivers/media/platform/rcar-vin/rcar-vin.h  |  5 ++
>  3 files changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 64f9cf790445d14e..ee6e6cb39c749675 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -389,6 +389,28 @@ static void rvin_group_put(struct rvin_dev *vin)
>  	kref_put(&group->refcount, rvin_group_release);
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * Controls
> + */
> +
> +static int rvin_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct rvin_dev *vin =
> +		container_of(ctrl->handler, struct rvin_dev, ctrl_handler);
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_ALPHA_COMPONENT:
> +		rvin_set_alpha(vin, ctrl->val);

You can set vin->alpha here directly, no need for a rvin_set_alpha()
function.

> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_ctrl_ops rvin_ctrl_ops = {
> +	.s_ctrl = rvin_s_ctrl,
> +};
> +
>  /* -----------------------------------------------------------------------------
>   * Async notifier
>   */
> @@ -478,6 +500,15 @@ static int rvin_parallel_subdevice_attach(struct rvin_dev *vin,
>  	if (ret < 0)
>  		return ret;
>  
> +	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> +			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> +
> +	if (vin->ctrl_handler.error) {
> +		ret = vin->ctrl_handler.error;
> +		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> +		return ret;
> +	}
> +
>  	ret = v4l2_ctrl_add_handler(&vin->ctrl_handler, subdev->ctrl_handler,
>  				    NULL, true);
>  	if (ret < 0) {
> @@ -870,6 +901,21 @@ static int rvin_mc_init(struct rvin_dev *vin)
>  	if (ret)
>  		rvin_group_put(vin);
>  
> +	ret = v4l2_ctrl_handler_init(&vin->ctrl_handler, 1);
> +	if (ret < 0)
> +		return ret;
> +
> +	v4l2_ctrl_new_std(&vin->ctrl_handler, &rvin_ctrl_ops,
> +			  V4L2_CID_ALPHA_COMPONENT, 0, 255, 1, 255);
> +
> +	if (vin->ctrl_handler.error) {
> +		ret = vin->ctrl_handler.error;
> +		v4l2_ctrl_handler_free(&vin->ctrl_handler);
> +		return ret;
> +	}
> +
> +	vin->vdev.ctrl_handler = &vin->ctrl_handler;
> +
>  	return ret;
>  }
>  
> @@ -1245,6 +1291,7 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  
>  	vin->dev = &pdev->dev;
>  	vin->info = of_device_get_match_data(&pdev->dev);
> +	vin->alpha = 0xff;
>  
>  	/*
>  	 * Special care is needed on r8a7795 ES1.x since it
> @@ -1288,6 +1335,8 @@ static int rcar_vin_probe(struct platform_device *pdev)
>  	return 0;
>  
>  error_group_unregister:
> +	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> +
>  	if (vin->info->use_mc) {
>  		mutex_lock(&vin->group->lock);
>  		if (&vin->v4l2_dev == vin->group->notifier.v4l2_dev) {
> @@ -1323,10 +1372,10 @@ static int rcar_vin_remove(struct platform_device *pdev)
>  		}
>  		mutex_unlock(&vin->group->lock);
>  		rvin_group_put(vin);
> -	} else {
> -		v4l2_ctrl_handler_free(&vin->ctrl_handler);
>  	}
>  
> +	v4l2_ctrl_handler_free(&vin->ctrl_handler);
> +
>  	rvin_dma_unregister(vin);
>  
>  	return 0;
> diff --git a/drivers/media/platform/rcar-vin/rcar-dma.c b/drivers/media/platform/rcar-vin/rcar-dma.c
> index 2d146ecf93d66ad5..4e991cce5fb56a90 100644
> --- a/drivers/media/platform/rcar-vin/rcar-dma.c
> +++ b/drivers/media/platform/rcar-vin/rcar-dma.c
> @@ -1343,3 +1343,8 @@ int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel)
>  
>  	return 0;
>  }
> +
> +void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha)
> +{
> +	vin->alpha = alpha;
> +}
> diff --git a/drivers/media/platform/rcar-vin/rcar-vin.h b/drivers/media/platform/rcar-vin/rcar-vin.h
> index 0b13b34d03e3dce4..365dfde06ec25add 100644
> --- a/drivers/media/platform/rcar-vin/rcar-vin.h
> +++ b/drivers/media/platform/rcar-vin/rcar-vin.h
> @@ -178,6 +178,8 @@ struct rvin_info {
>   * @compose:		active composing
>   * @source:		active size of the video source
>   * @std:		active video standard of the video source
> + *

Do you need a blank line here ?

Apart from that the patch looks good to me.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * @alpha:		Alpha component to fill in for supported pixel formats
>   */
>  struct rvin_dev {
>  	struct device *dev;
> @@ -215,6 +217,8 @@ struct rvin_dev {
>  	struct v4l2_rect compose;
>  	struct v4l2_rect source;
>  	v4l2_std_id std;
> +
> +	unsigned int alpha;
>  };
>  
>  #define vin_to_source(vin)		((vin)->parallel->subdev)
> @@ -266,5 +270,6 @@ const struct rvin_video_format *rvin_format_from_pixel(u32 pixelformat);
>  void rvin_crop_scale_comp(struct rvin_dev *vin);
>  
>  int rvin_set_channel_routing(struct rvin_dev *vin, u8 chsel);
> +void rvin_set_alpha(struct rvin_dev *vin, unsigned int alpha);
>  
>  #endif

-- 
Regards,

Laurent Pinchart
