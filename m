Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 411014087BA
	for <lists+linux-media@lfdr.de>; Mon, 13 Sep 2021 11:05:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238281AbhIMJGj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Sep 2021 05:06:39 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56997 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235890AbhIMJGi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Sep 2021 05:06:38 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 191932000D;
        Mon, 13 Sep 2021 09:05:20 +0000 (UTC)
Date:   Mon, 13 Sep 2021 11:06:08 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Fabio Estevam <festevam@gmail.com>
Cc:     laurent.pinchart@ideasonboard.com, hverkuil-cisco@xs4all.nl,
        linux-media@vger.kernel.org, jacopo+renesas@jmondi.org,
        morimoto.kuninori@renesas.com
Subject: Re: [RFC 3/3] media: tw9910: Initialize the entity type
Message-ID: <20210913090608.54riik5fmlo7spic@uno.localdomain>
References: <20210827130150.909695-1-festevam@gmail.com>
 <20210827130150.909695-3-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210827130150.909695-3-festevam@gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Fri, Aug 27, 2021 at 10:01:50AM -0300, Fabio Estevam wrote:
> Currently the following warning is seen:
>
> imx7-csi 2214000.csi: Entity type for entity tw9910 2-0044 was not initialized!
>
> Initialize the entity type accordingly.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/media/i2c/tw9910.c | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/tw9910.c b/drivers/media/i2c/tw9910.c
> index 0411b8ea9bda..ad4149073ba4 100644
> --- a/drivers/media/i2c/tw9910.c
> +++ b/drivers/media/i2c/tw9910.c
> @@ -228,6 +228,7 @@ struct tw9910_scale_ctrl {
>
>  struct tw9910_priv {
>  	struct v4l2_subdev		subdev;
> +	struct media_pad		pad;
>  	struct clk			*clk;
>  	struct tw9910_video_info	*info;
>  	struct gpio_desc		*pdn_gpio;
> @@ -948,6 +949,7 @@ static int tw9910_probe(struct i2c_client *client,
>  {
>  	struct tw9910_priv		*priv;
>  	struct i2c_adapter		*adapter = client->adapter;
> +	struct v4l2_subdev *sd;

As questionable as it could be, the existing variables are aligned
differently.

>  	int ret;
>
>  	if (!i2c_check_functionality(adapter, I2C_FUNC_SMBUS_BYTE_DATA)) {
> @@ -973,14 +975,22 @@ static int tw9910_probe(struct i2c_client *client,
>  		return -ENODEV;
>  	}
>
> -	v4l2_i2c_subdev_init(&priv->subdev, client, &tw9910_subdev_ops);
> +	sd = &priv->subdev;
> +	v4l2_i2c_subdev_init(sd, client, &tw9910_subdev_ops);
> +	priv->pad.flags = MEDIA_PAD_FL_SOURCE;
> +	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_HAS_EVENTS;
> +	sd->entity.function = MEDIA_ENT_F_ATV_DECODER;

Seems appropriate!

> +	ret = media_entity_pads_init(&sd->entity, 1, &priv->pad);
> +	if (ret)
> +		return ret;
>
>  	priv->clk = clk_get(&client->dev, "xti");
>  	if (PTR_ERR(priv->clk) == -ENOENT) {
>  		priv->clk = NULL;
>  	} else if (IS_ERR(priv->clk)) {
>  		dev_err(&client->dev, "Unable to get xti clock\n");
> -		return PTR_ERR(priv->clk);
> +		ret = PTR_ERR(priv->clk);
> +		goto media_entity_cleanup;
>  	}
>
>  	priv->pdn_gpio = gpiod_get_optional(&client->dev, "pdn",
> @@ -1006,7 +1016,9 @@ static int tw9910_probe(struct i2c_client *client,
>  		gpiod_put(priv->pdn_gpio);
>  error_clk_put:
>  	clk_put(priv->clk);
> -
> +

Rougue tab, or is it my mail client ?

> +media_entity_cleanup:
> +	media_entity_cleanup(&sd->entity);
>  	return ret;
>  }
>
> --
> 2.25.1
>
