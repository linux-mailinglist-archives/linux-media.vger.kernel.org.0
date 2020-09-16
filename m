Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B6CC26BE64
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 09:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgIPHnw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 03:43:52 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:49513 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgIPHnv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 03:43:51 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 046716000A;
        Wed, 16 Sep 2020 07:43:46 +0000 (UTC)
Date:   Wed, 16 Sep 2020 09:47:37 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v5 1/3] media: i2c: ov772x: Parse endpoint properties
Message-ID: <20200916074737.phc6atpsahxowfjt@uno.localdomain>
References: <20200915174235.1229-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200915174235.1229-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200915174235.1229-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Tue, Sep 15, 2020 at 06:42:33PM +0100, Lad Prabhakar wrote:
> Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
> to determine bus-type and store it locally in priv data.
>
> v4l2_fwnode_endpoint_alloc_parse() with bus_type set to
> V4L2_MBUS_PARALLEL falls back to V4L2_MBUS_PARALLEL thus handling
> backward compatibility with existing DT where bus-type isn't specified.


I don't think this is necessary here. This patch does not need to
handle any retrocompatibility, as only PARALLEL is supported.

The 'right' way to put it to me would be
"Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
to determine the bus type and store it in the driver structure.

Set bus_type to V4L2_MBUS_PARALLEL as it's the only supported one"

See comment in the next patch for retrocompatibility

>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov772x.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 2cc6a678069a..4ab4b3c883d0 100644
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
> @@ -1354,6 +1356,8 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
>
>  static int ov772x_probe(struct i2c_client *client)
>  {
> +	struct v4l2_fwnode_endpoint bus_cfg;
> +	struct fwnode_handle	*ep;
>  	struct ov772x_priv	*priv;
>  	int			ret;
>  	static const struct regmap_config ov772x_regmap_config = {
> @@ -1415,6 +1419,27 @@ static int ov772x_probe(struct i2c_client *client)
>  		goto error_clk_put;
>  	}
>
> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> +					    NULL);
> +	if (!ep) {
> +		dev_err(&client->dev, "endpoint node not found\n");
> +		ret = -EINVAL;
> +		goto error_clk_put;
> +	}
> +
> +	/* For backward compatibility with the existing DT where
> +	 * bus-type isn't specified v4l2_fwnode_endpoint_alloc_parse()
> +	 * with bus_type set to V4L2_MBUS_PARALLEL falls back to
> +	 * V4L2_MBUS_PARALLEL
> +	 */

You can drop this comment block

> +	bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	priv->bus_type = bus_cfg.bus_type;

Set this after if (ret)

> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		goto error_clk_put;
> +
>  	ret = ov772x_video_probe(priv);
>  	if (ret < 0)
>  		goto error_gpio_put;
> --
> 2.17.1
>
