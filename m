Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B8D526BF10
	for <lists+linux-media@lfdr.de>; Wed, 16 Sep 2020 10:21:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgIPIVR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Sep 2020 04:21:17 -0400
Received: from relay11.mail.gandi.net ([217.70.178.231]:57121 "EHLO
        relay11.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726068AbgIPIVQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Sep 2020 04:21:16 -0400
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay11.mail.gandi.net (Postfix) with ESMTPSA id E67C5100009;
        Wed, 16 Sep 2020 08:21:08 +0000 (UTC)
Date:   Wed, 16 Sep 2020 10:24:59 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v5 2/3] media: i2c: ov772x: Add support for BT.656 mode
Message-ID: <20200916082459.udoppvygwniktkzi@uno.localdomain>
References: <20200915174235.1229-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200915174235.1229-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200915174235.1229-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Tue, Sep 15, 2020 at 06:42:34PM +0100, Lad Prabhakar wrote:
> Add support to read the bus-type for V4L2_MBUS_BT656 and
> enable BT.656 mode in the sensor if needed.

Here we should be concerned about retro-compatibility, as a new bus
type is added. I would move the comment you had in 1/3 to this patch.

Otherwise the code flow looks ok: if no bus-type is specified assume
parallel as it was the only supported bus type at the time.
If someone wants BT.656 it has to be a new DTS and then the bus-type
property is mandatory.

>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/media/i2c/ov772x.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 4ab4b3c883d0..869f2d94faec 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
> @@ -583,6 +583,13 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (priv->streaming == enable)
>  		goto done;
>
> +	if (priv->bus_type == V4L2_MBUS_BT656) {
> +		ret = regmap_update_bits(priv->regmap, COM7, ITU656_ON_OFF,
> +					 enable ? ITU656_ON_OFF : ~ITU656_ON_OFF);
> +		if (ret)
> +			goto done;
> +	}
> +
>  	ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
>  				 enable ? 0 : SOFT_SLEEP_MODE);
>  	if (ret)
> @@ -1436,9 +1443,17 @@ static int ov772x_probe(struct i2c_client *client)
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
>  	priv->bus_type = bus_cfg.bus_type;
>  	v4l2_fwnode_endpoint_free(&bus_cfg);
> +	if (ret) {
> +		bus_cfg = (struct v4l2_fwnode_endpoint)
> +			  { .bus_type = V4L2_MBUS_BT656 };
> +		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);

If you really want to keep using alloc_parse() you should remember to
endpoint_free() here.

> +		if (ret) {
> +			fwnode_handle_put(ep);
> +			goto error_clk_put;
> +		}
> +		priv->bus_type = bus_cfg.bus_type;
> +	}
>  	fwnode_handle_put(ep);

I would assign priv->bus_type here.

Also, this has grown quite a bit, have you considered making a
ov772x_parse_dt() function ?

With this last changes I think we're good to go. I'll send tags on
the next version!

Thank you for your perseverance

> -	if (ret)
> -		goto error_clk_put;
>
>  	ret = ov772x_video_probe(priv);
>  	if (ret < 0)
> --
> 2.17.1
>
