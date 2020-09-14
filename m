Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD22268CD8
	for <lists+linux-media@lfdr.de>; Mon, 14 Sep 2020 16:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgINOGs (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 14 Sep 2020 10:06:48 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:35569 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726833AbgINOGE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 14 Sep 2020 10:06:04 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id BF0812000D;
        Mon, 14 Sep 2020 14:05:46 +0000 (UTC)
Date:   Mon, 14 Sep 2020 16:09:37 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v4 1/3] media: i2c: ov772x: Parse endpoint properties
Message-ID: <20200914140937.kja7x5k2xo2uwgqg@uno.localdomain>
References: <20200913184247.618-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200913184247.618-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200913184247.618-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Sun, Sep 13, 2020 at 07:42:45PM +0100, Lad Prabhakar wrote:
> Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
> to determine bus-type and store it locally in priv data.
>
> Also for backward compatibility with the existing DT where bus-type
> isnt specified fallback to V4L2_MBUS_PARALLEL.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov772x.c | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 2cc6a678069a..551082aa7026 100644
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
> +	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
> +	struct fwnode_handle	*ep;
>  	struct ov772x_priv	*priv;
>  	int			ret;
>  	static const struct regmap_config ov772x_regmap_config = {
> @@ -1415,6 +1419,26 @@ static int ov772x_probe(struct i2c_client *client)
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
> +	bus_cfg.bus_type = V4L2_MBUS_PARALLEL;

Could you set the bus type when you declare bus_cfg ? There's no point
in setting it to UNKNOW and re-writing it here

> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);

Should you here fwnode_handle_put(ep) ?

Also, this driver does not support the 'link_frequency' property, as the
device does not support CSI-2. As commented on the previous version,
the 'alloc' version of v4l2_fwnode_endpoint_parse() reserves space for
that property, and requires a manual free like you have here below. So
using the 'alloc' version is not techincally wrong, but I don't think
it's required here.

> +	priv->bus_type = bus_cfg.bus_type;
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +	if (ret) {

By reading the code in v4l2-fwnode it seems to me that, if you set
bus_cfg.bus_type:
1) The "bus_type" property is set in the fwnode and doesn't match the
requested one -> return -ENXIO
2) The "bus_type" property is not set in the fwnode: no error code is
returned and vep->bus_type is not changed.

> +		/* For backward compatibility with the existing DT where
> +		 * bus-type isnt specified fallback to V4L2_MBUS_PARALLEL
> +		 */

This mean there's no need to fallback here, as at this point we only
support PARALLEL. If fwnode,bus_type is not set you won't faile, if
it's set and doesn't match you should fail as the DT is not correct
(at this point).

1) In this patch: try to parse as MBUS_PARALLEL, fail if -ENXIO,
assume parallel otherwise and continue.

2) When you introduce BT.656 in the next patch things become nasty.
Newer DTS will have bus_type mandatory once my series gets in. Old
ones do not and assume "parallel".
2.a) If you try to parse with "cfg.bus_type = MBUS_BT656" and there's
no 'bus_type' in the fwnode, the 'parallel' flags are simply cleared
at the end of v4l2_fwnode_endpoint_parse_parallel_bus(), but the
bus_type does not get changed. You won't detect the mismatch and
happily assume the bus type is BT.656. In other word, if you set
cfg.bus_type that's always authoritative unless the fwnode property
contradicts it (and if that's the case, it should be documented in
v4l2-fnode, unless it is and I missed it).
2.b) If the fwnode.bus_type is set, you try to parse one bus type
first, if -ENOXIO try the second. If it fails again, then return an
error.

In the next patch, to avoid the case described in 2.a I would:
- Parse the 'bus_type' property in the driver (mentioning it's for
  retrocompatibility).
-- If not present: Assume parallel and parse the fwnode. Enclose that
with a comment about "retrocompatibility" and proceed.
-- If present: Do what suggested in the 2.b case. Try one, then the
other, then eventually fail.

I hope this makes any sense, this part is such a gray area... and as a
note to "self" in the forthcoming "of_graph.yaml", let's make bus_type
mandatory for all endpoints!

Also, I might be mistaken in following the code and if you have tested
all cases and they work as intended please call me out on this :)

Thanks
  j

> +		priv->bus_type = V4L2_MBUS_PARALLEL;
> +		dev_notice(&client->dev, "Falling back to V4L2_MBUS_PARALLEL mode\n");
> +	}
> +
>  	ret = ov772x_video_probe(priv);
>  	if (ret < 0)
>  		goto error_gpio_put;
> --
> 2.17.1
>
