Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C15327E6CE
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 12:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgI3KjU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 06:39:20 -0400
Received: from mslow2.mail.gandi.net ([217.70.178.242]:38564 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgI3KjU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 06:39:20 -0400
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id A1FF53B81D9;
        Wed, 30 Sep 2020 10:28:50 +0000 (UTC)
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 302F240007;
        Wed, 30 Sep 2020 10:28:26 +0000 (UTC)
Date:   Wed, 30 Sep 2020 12:32:23 +0200
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
Subject: Re: [PATCH v6 2/3] media: i2c: ov772x: Add support for BT.656 mode
Message-ID: <20200930103223.w3gh2mo67e7yq74u@uno.localdomain>
References: <20200917174224.11430-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200917174224.11430-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200917174224.11430-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hello,

On Thu, Sep 17, 2020 at 06:42:23PM +0100, Lad Prabhakar wrote:
> Add support to read the bus-type for V4L2_MBUS_BT656 and enable BT.656
> mode in the sensor if needed.
>
> For backward compatibility with older DTS where the bus-type property was
> not mandatory, assume V4L2_MBUS_PARALLEL as it was the only supported bus
> at the time. v4l2_fwnode_endpoint_alloc_parse() will not fail if
> 'bus-type' is not specified.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/ov772x.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index f61a3f09ad64..fe48b5881ad9 100644
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
> @@ -1364,10 +1371,22 @@ static int ov772x_parse_dt(struct i2c_client *client,
>  		return -EINVAL;
>  	}
>
> +	/*
> +	 * For backward compatibility with older DTS where the
> +	 * bus-type property was not mandatory, assume
> +	 * V4L2_MBUS_PARALLEL as it was the only supported bus at the
> +	 * time. v4l2_fwnode_endpoint_alloc_parse() will not fail if
> +	 * 'bus-type' is not specified.
> +	 */
>  	bus_cfg.bus_type = V4L2_MBUS_PARALLEL;
>  	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> -	if (ret)
> -		goto error_fwnode_put;
> +	if (ret) {
> +		bus_cfg = (struct v4l2_fwnode_endpoint)
> +			  { .bus_type = V4L2_MBUS_BT656 };
> +		ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +		if (ret)
> +			goto error_fwnode_put;
> +	}
>
>  	priv->bus_type = bus_cfg.bus_type;
>  	v4l2_fwnode_endpoint_free(&bus_cfg);
> --
> 2.17.1
>
