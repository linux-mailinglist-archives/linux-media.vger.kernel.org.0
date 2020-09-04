Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2C0625CF09
	for <lists+linux-media@lfdr.de>; Fri,  4 Sep 2020 03:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgIDBU2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 21:20:28 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42224 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725787AbgIDBU1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 21:20:27 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D17E277;
        Fri,  4 Sep 2020 03:20:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599182424;
        bh=h+UWj+YWC7qG0b3g8wEpqmRH0C5HgRlo+QQRG2z9LWs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mQU+aM+XbZwbm5L+kxz8MmJ1zt+seUET7sJDp80Q5hfqaybG0qeifHdMr1Te7dFF/
         dn5i3znGLGqJVOz6NhLVZynKkDPrxJi8GXhBfxDUWyJK+D3zucJs3nmX20DcDO4hny
         fjlx8W0g+7+cWBtAqOaBDfpYqqb42nt0LThPODFk=
Date:   Fri, 4 Sep 2020 04:20:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v3 1/2] media: i2c: ov772x: Add support for BT656 mode
Message-ID: <20200904012000.GA9369@pendragon.ideasonboard.com>
References: <20200824190406.27478-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200824190406.27478-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200824190406.27478-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Mon, Aug 24, 2020 at 08:04:05PM +0100, Lad Prabhakar wrote:
> Add support to read the bus-type and enable BT656 mode if needed.
> 
> Also fail probe if unsupported bus_type is detected.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/i2c/ov772x.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 2cc6a678069a..67764d647526 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
> @@ -31,6 +31,7 @@
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
>  #include <media/v4l2-event.h>
> +#include <media/v4l2-fwnode.h>
>  #include <media/v4l2-image-sizes.h>
>  #include <media/v4l2-subdev.h>
>  
> @@ -434,6 +435,7 @@ struct ov772x_priv {
>  #ifdef CONFIG_MEDIA_CONTROLLER
>  	struct media_pad pad;
>  #endif
> +	struct v4l2_fwnode_endpoint ep;
>  };
>  
>  /*
> @@ -581,6 +583,13 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (priv->streaming == enable)
>  		goto done;
>  
> +	if (priv->ep.bus_type == V4L2_MBUS_BT656) {
> +		ret = regmap_update_bits(priv->regmap, COM7, ITU656_ON_OFF,
> +					 enable ? ITU656_ON_OFF : ~ITU656_ON_OFF);
> +		if (ret)
> +			goto done;
> +	}
> +
>  	ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
>  				 enable ? 0 : SOFT_SLEEP_MODE);
>  	if (ret)
> @@ -1354,6 +1363,7 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
>  
>  static int ov772x_probe(struct i2c_client *client)
>  {
> +	struct fwnode_handle *endpoint;
>  	struct ov772x_priv	*priv;
>  	int			ret;
>  	static const struct regmap_config ov772x_regmap_config = {
> @@ -1415,6 +1425,28 @@ static int ov772x_probe(struct i2c_client *client)
>  		goto error_clk_put;
>  	}
>  
> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> +						  NULL);
> +	if (!endpoint) {
> +		dev_err(&client->dev, "endpoint node not found\n");
> +		ret = -EINVAL;
> +		goto error_clk_put;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_parse(endpoint, &priv->ep);

v4l2_fwnode_endpoint_parse() is deprecated for new drivers,
v4l2_fwnode_endpoint_alloc_parse() is recommended instead. Please note
that v4l2_fwnode_endpoint_free() then needs to be called in the error
path and in remove().

On the other hand, not setting .bus_type and letting the parse()
function determine the but type automatically is also deprecated, and I
don't think forcing drivers to call v4l2_fwnode_endpoint_alloc_parse()
once for each bus type until one succeeds is a good API. As change will
be needed in that API, you can ignore v4l2_fwnode_endpoint_alloc_parse()
for the time being if you want.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	fwnode_handle_put(endpoint);
> +	if (ret) {
> +		dev_err(&client->dev, "Could not parse endpoint\n");
> +		goto error_clk_put;
> +	}
> +
> +	if (priv->ep.bus_type != V4L2_MBUS_PARALLEL &&
> +	    priv->ep.bus_type != V4L2_MBUS_BT656) {
> +		dev_err(&client->dev, "Unsupported bus type %d\n",
> +			priv->ep.bus_type);
> +		goto error_clk_put;
> +	}
> +
>  	ret = ov772x_video_probe(priv);
>  	if (ret < 0)
>  		goto error_gpio_put;

-- 
Regards,

Laurent Pinchart
