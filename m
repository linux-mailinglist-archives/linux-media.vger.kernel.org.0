Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1412A240413
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 11:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgHJJdM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 05:33:12 -0400
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:48855 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726304AbgHJJdM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 05:33:12 -0400
X-Originating-IP: 82.52.18.94
Received: from uno.localdomain (host-82-52-18-94.retail.telecomitalia.it [82.52.18.94])
        (Authenticated sender: jacopo@jmondi.org)
        by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 0AA55E0004;
        Mon, 10 Aug 2020 09:33:07 +0000 (UTC)
Date:   Mon, 10 Aug 2020 11:36:49 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] rcar-csi2: Use V4L2 async helpers to create the
 notifier
Message-ID: <20200810093649.kzynbnxe5zf5lig3@uno.localdomain>
References: <20200807111619.3664763-1-niklas.soderlund+renesas@ragnatech.se>
 <20200807111619.3664763-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200807111619.3664763-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Fri, Aug 07, 2020 at 01:16:19PM +0200, Niklas Söderlund wrote:
> The V4L2 async framework helpers now populates the async notifier with

helpers -> populate

> endpoint matching information and there is no need to do this manually

"with endpoint matching information" sounds weird.

What about

The V4L2 async framework helpers have now moved to match async
subdevices matching on endpoints. There is not need anymore to do this
manually...

> in the R-Car CSI-2 driver, switch to using the provided helper.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-csi2.c | 48 +++++----------------
>  1 file changed, 11 insertions(+), 37 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
> index c6cc4f473a077899..f0067ff21d5d9d33 100644
> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
> @@ -362,7 +362,6 @@ struct rcar_csi2 {
>  	struct media_pad pads[NR_OF_RCAR_CSI2_PAD];
>
>  	struct v4l2_async_notifier notifier;
> -	struct v4l2_async_subdev asd;
>  	struct v4l2_subdev *remote;
>
>  	struct v4l2_mbus_framefmt mf;
> @@ -774,9 +773,11 @@ static const struct v4l2_async_notifier_operations rcar_csi2_notify_ops = {
>  	.unbind = rcsi2_notify_unbind,
>  };
>
> -static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
> -			    struct v4l2_fwnode_endpoint *vep)
> +static int rcar_csi2_parse_v4l2(struct device *dev,
> +				struct v4l2_fwnode_endpoint *vep,
> +				struct v4l2_async_subdev *asd)
>  {
> +	struct rcar_csi2 *priv = dev_get_drvdata(dev);
>  	unsigned int i;
>
>  	/* Only port 0 endpoint 0 is valid. */
> @@ -806,53 +807,26 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
>  		}
>  	}
>
> +	dev_dbg(priv->dev, "Found '%pOF'\n", to_of_node(asd->match.fwnode));
> +
>  	return 0;
>  }
>
>  static int rcsi2_parse_dt(struct rcar_csi2 *priv)
>  {
> -	struct device_node *ep;
> -	struct v4l2_fwnode_endpoint v4l2_ep = { .bus_type = 0 };
>  	int ret;
>
> -	ep = of_graph_get_endpoint_by_regs(priv->dev->of_node, 0, 0);
> -	if (!ep) {
> -		dev_err(priv->dev, "Not connected to subdevice\n");
> -		return -EINVAL;
> -	}
> -
> -	ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(ep), &v4l2_ep);
> -	if (ret) {
> -		dev_err(priv->dev, "Could not parse v4l2 endpoint\n");
> -		of_node_put(ep);
> -		return -EINVAL;
> -	}
> -
> -	ret = rcsi2_parse_v4l2(priv, &v4l2_ep);
> -	if (ret) {
> -		of_node_put(ep);
> -		return ret;
> -	}
> -
> -	priv->asd.match.fwnode =
> -		fwnode_graph_get_remote_endpoint(of_fwnode_handle(ep));
> -	priv->asd.match_type = V4L2_ASYNC_MATCH_FWNODE;
> -
> -	of_node_put(ep);
> -
>  	v4l2_async_notifier_init(&priv->notifier);
>
> -	ret = v4l2_async_notifier_add_subdev(&priv->notifier, &priv->asd);
> -	if (ret) {
> -		fwnode_handle_put(priv->asd.match.fwnode);
> +	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
> +			priv->dev, &priv->notifier,
> +			sizeof(struct v4l2_async_subdev), 0,
> +			rcar_csi2_parse_v4l2);
> +	if (ret)

I have not really followed the whole call chain, but I presume
v4l2_async_notifier_parse_fwnode_endpoints_by_port() could fail after
having added the async subdev ? Is it worth calling notifier_cleanup()
if we fail here ?

This apart, the patch looks really nice, finally we're not the black
sheeps anymore!

Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>  		return ret;
> -	}
>
>  	priv->notifier.ops = &rcar_csi2_notify_ops;
>
> -	dev_dbg(priv->dev, "Found '%pOF'\n",
> -		to_of_node(priv->asd.match.fwnode));
> -
>  	ret = v4l2_async_subdev_notifier_register(&priv->subdev,
>  						  &priv->notifier);
>  	if (ret)
> --
> 2.28.0
>
