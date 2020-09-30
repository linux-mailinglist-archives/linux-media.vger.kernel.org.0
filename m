Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7344B27E696
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 12:28:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729243AbgI3K2R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 06:28:17 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:55650 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728500AbgI3K2Q (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 06:28:16 -0400
Received: from relay12.mail.gandi.net (unknown [217.70.178.232])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 876BF3B815C;
        Wed, 30 Sep 2020 10:27:04 +0000 (UTC)
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 03CA7200005;
        Wed, 30 Sep 2020 10:26:40 +0000 (UTC)
Date:   Wed, 30 Sep 2020 12:30:37 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v6 1/3] media: i2c: ov772x: Parse endpoint properties
Message-ID: <20200930103037.putcmd7sjyaut6lr@uno.localdomain>
References: <20200917174224.11430-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200917174224.11430-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200917174224.11430-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

On Thu, Sep 17, 2020 at 06:42:22PM +0100, Lad Prabhakar wrote:
> Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
> to determine the bus type and store it in the driver structure.
>
> Set bus_type to V4L2_MBUS_PARALLEL as it's the only supported one
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Looks good!

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

> ---
>  drivers/media/i2c/ov772x.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 2cc6a678069a..f61a3f09ad64 100644
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
> +	enum v4l2_mbus_type		  bus_type;
>  };
>
>  /*
> @@ -1348,6 +1350,34 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
>  	.pad	= &ov772x_subdev_pad_ops,
>  };
>
> +static int ov772x_parse_dt(struct i2c_client *client,
> +			   struct ov772x_priv *priv)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg;
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> +					    NULL);
> +	if (!ep) {
> +		dev_err(&client->dev, "Endpoint node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	if (ret)
> +		goto error_fwnode_put;
> +
> +	priv->bus_type = bus_cfg.bus_type;
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +error_fwnode_put:
> +	fwnode_handle_put(ep);
> +
> +	return ret;
> +}
> +
>  /*
>   * i2c_driver function
>   */
> @@ -1415,6 +1445,10 @@ static int ov772x_probe(struct i2c_client *client)
>  		goto error_clk_put;
>  	}
>
> +	ret = ov772x_parse_dt(client, priv);
> +	if (ret)
> +		goto error_clk_put;
> +
>  	ret = ov772x_video_probe(priv);
>  	if (ret < 0)
>  		goto error_gpio_put;
> --
> 2.17.1
>
