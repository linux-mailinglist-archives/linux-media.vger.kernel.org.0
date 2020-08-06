Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 937BD23DDD0
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730066AbgHFROZ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:14:25 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:35152 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730195AbgHFRJ6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 13:09:58 -0400
Received: from relay11.mail.gandi.net (unknown [217.70.178.231])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 1F3A23B2C0F;
        Thu,  6 Aug 2020 14:46:57 +0000 (UTC)
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id CA24C100006;
        Thu,  6 Aug 2020 14:41:30 +0000 (UTC)
Date:   Thu, 6 Aug 2020 16:45:11 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: i2c: ov772x: Add support for BT656 mode
Message-ID: <20200806144511.6ajoqyynowglnbpm@uno.localdomain>
References: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596454753-13612-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1596454753-13612-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 03, 2020 at 12:39:12PM +0100, Lad Prabhakar wrote:
> Add support to read the bus-type and enable BT656 mode if needed.
>
> The driver defaults to parallel mode if bus-type is not specified in DT.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/i2c/ov772x.c | 40 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
>
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 2cc6a678069a..2de9248e3689 100644
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
> @@ -574,6 +576,7 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
>  {
>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>  	struct ov772x_priv *priv = to_ov772x(sd);
> +	unsigned int val;
>  	int ret = 0;
>
>  	mutex_lock(&priv->lock);
> @@ -581,6 +584,22 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (priv->streaming == enable)
>  		goto done;
>
> +	if (priv->ep.bus_type == V4L2_MBUS_BT656 && enable) {
> +		ret = regmap_read(priv->regmap, COM7, &val);
> +		if (ret)
> +			goto done;
> +		val |= ITU656_ON_OFF;
> +		ret = regmap_write(priv->regmap, COM7, val);
> +	} else if (priv->ep.bus_type == V4L2_MBUS_BT656 && !enable) {

is the !enable intentional ? (sorry I don't have access to the sensor
manual). If not, see below:

> +		ret = regmap_read(priv->regmap, COM7, &val);
> +		if (ret)
> +			goto done;
> +		val &= ~ITU656_ON_OFF;
> +		ret = regmap_write(priv->regmap, COM7, val);
> +	}
> +	if (ret)
> +		goto done;

Could you write this as:

static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
{
	struct i2c_client *client = v4l2_get_subdevdata(sd);
	struct ov772x_priv *priv = to_ov772x(sd);
	int ret = 0;

	mutex_lock(&priv->lock);

	if (priv->streaming == enable)
		goto done;

	if (enable) {
		ret = regmap_read(priv->regmap, COM7, &val);
		if (ret)
			goto done;

	        if (priv->ep.bus_type == V4L2_MBUS_BT656)
		        val |= ITU656_ON_OFF;
                else /* if you accept my suggestion to consider othe
                        bus types as errors */
		        val &= ~ITU656_ON_OFF;

		ret = regmap_write(priv->regmap, COM7, val);
		if (ret)
			goto done;

		dev_dbg(&client->dev, "format %d, win %s\n",
			priv->cfmt->code, priv->win->name);
	}

	ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
				 enable ? 0 : SOFT_SLEEP_MODE);
	if (ret)
		goto done;
	priv->streaming = enable;

done:
	mutex_unlock(&priv->lock);

	return ret;
}


>  	ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
>  				 enable ? 0 : SOFT_SLEEP_MODE);
>  	if (ret)
> @@ -1354,6 +1373,7 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
>
>  static int ov772x_probe(struct i2c_client *client)
>  {
> +	struct fwnode_handle *endpoint;
>  	struct ov772x_priv	*priv;
>  	int			ret;
>  	static const struct regmap_config ov772x_regmap_config = {
> @@ -1415,6 +1435,26 @@ static int ov772x_probe(struct i2c_client *client)
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
> +	fwnode_handle_put(endpoint);
> +	if (ret) {
> +		dev_err(&client->dev, "Could not parse endpoint\n");
> +		goto error_clk_put;
> +	}
> +
> +	/* fallback to parallel mode */
> +	if (priv->ep.bus_type != V4L2_MBUS_PARALLEL &&
> +	    priv->ep.bus_type != V4L2_MBUS_BT656)
> +		priv->ep.bus_type = V4L2_MBUS_PARALLEL;

shouldn't this be an error ? It's either the bus type has not been
specified on DT (which is fine, otherwise old DTB without that
properties will fail) and the bus identification routine implemented
in v4l2_fwnode_endpoint_parse() detected a bus type which is not
supported, hence the DT properties are wrong, and this should be an
error. If you plan to expand the parsing routine to support, say
bus-width and pclk polarity please break this out to a new function.

Thanks
   j

> +
>  	ret = ov772x_video_probe(priv);
>  	if (ret < 0)
>  		goto error_gpio_put;
> --
> 2.17.1
>
