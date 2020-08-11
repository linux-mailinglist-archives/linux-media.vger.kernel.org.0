Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627C8242297
	for <lists+linux-media@lfdr.de>; Wed, 12 Aug 2020 00:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgHKWmy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Aug 2020 18:42:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35046 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbgHKWmy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Aug 2020 18:42:54 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DE03B9A8;
        Wed, 12 Aug 2020 00:42:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597185772;
        bh=ENIgSbkwlduV3BQUn6qglP/PgTbvFC5RavhdZG9I8Mk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RJIFrzWJTlMPJ8vWzjcz2OnXNoW6bCdD+jVTTUHTgCkjMdju3CgozYTifLq8jvI/q
         TM6HJcDqBA6KgXnepXvqO28kuGoYtIaAbHKF0sM28O/K3QeJSC39p9cXtPBBZhvHy8
         jwHOKSisPlFTnq33ivq2FXiFrfJf2vPIckw9nZ4M=
Date:   Wed, 12 Aug 2020 01:42:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] rcar-csi2: Use V4L2 async helpers to create the
 notifier
Message-ID: <20200811224238.GB22031@pendragon.ideasonboard.com>
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

Thank you for the patch.

On Fri, Aug 07, 2020 at 01:16:19PM +0200, Niklas Söderlund wrote:
> The V4L2 async framework helpers now populates the async notifier with
> endpoint matching information and there is no need to do this manually
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

It seems a bit expensive to go through a complex logic of iterating over
all endpoints when rcar_csi2_parse_v4l2() will only accept port 0,
endpoint 0, but there's a clear benefit from not having to maintain this
code in the driver.

With Jacopo's comments addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

If anyone has time to spend on it, I think
__v4l2_async_notifier_parse_fwnode_ep() should be duplicated in
v4l2_async_notifier_parse_fwnode_endpoints() and
v4l2_async_notifier_parse_fwnode_endpoints_by_port(), with the latter
only iterating over the endpoints of the requested port.

I also wonder if the !is_available check needs to be inside the loop:

	fwnode_graph_for_each_endpoint(dev_fwnode(dev), fwnode) {
		struct fwnode_handle *dev_fwnode;
		bool is_available;

		dev_fwnode = fwnode_graph_get_port_parent(fwnode);
		is_available = fwnode_device_is_available(dev_fwnode);
		fwnode_handle_put(dev_fwnode);
		if (!is_available)
			continue;

		...
	}

Isn't dev_fwnode == dev_fwnode(dev) and thus constant ?

> +	if (ret)
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

-- 
Regards,

Laurent Pinchart
