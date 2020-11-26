Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9B9D2C51CC
	for <lists+linux-media@lfdr.de>; Thu, 26 Nov 2020 11:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbgKZKJH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Nov 2020 05:09:07 -0500
Received: from relay12.mail.gandi.net ([217.70.178.232]:46723 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726099AbgKZKJH (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Nov 2020 05:09:07 -0500
Received: from uno.localdomain (host-80-104-176-17.retail.telecomitalia.it [80.104.176.17])
        (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 733BE200003;
        Thu, 26 Nov 2020 10:09:03 +0000 (UTC)
Date:   Thu, 26 Nov 2020 11:09:08 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/5] rcar-vin: Rework parallel firmware parsing
Message-ID: <20201126100908.ikcrv5vwhakmsmlw@uno.localdomain>
References: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
 <20201125164450.2056963-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201125164450.2056963-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

On Wed, Nov 25, 2020 at 05:44:47PM +0100, Niklas Söderlund wrote:
> Rework the parallel firmware parsing code to not use the soon to be
> removed v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper. The
> change only aims to prepare for the removing of the old helper and there
> are no functional change.

nit: 'changes' as you use 'are'

>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 50 +++++++++++++++------
>  1 file changed, 36 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 07f250bfc0051135..396ff5531359f3f4 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -604,32 +604,56 @@ static const struct v4l2_async_notifier_operations rvin_parallel_notify_ops = {
>  	.complete = rvin_parallel_notify_complete,
>  };
>
> -static int rvin_parallel_parse_v4l2(struct device *dev,
> -				    struct v4l2_fwnode_endpoint *vep,
> -				    struct v4l2_async_subdev *asd)
> +static int rvin_parallel_parse_of(struct rvin_dev *vin)
>  {
> -	struct rvin_dev *vin = dev_get_drvdata(dev);
> +	struct fwnode_handle *ep, *fwnode;
> +	struct v4l2_fwnode_endpoint vep = {
> +		.bus_type = V4L2_MBUS_UNKNOWN,
> +	};

Afaict bus autodiscovery is kind of deprectated. Unfortunately we
don't enforce the "bus-type" property presence in DTS, so it's very hard
to identify mis-configurations and set defaults (which we know and
should set). I think this calls for a slight rework of this part with
an associated bindings update.

We assume DTS are correct, so this is not pressing, but currently we
don't have any validation in place.

For later, anyway.

> +	struct v4l2_async_subdev *asd;
> +	int ret;
>
> -	if (vep->base.port || vep->base.id)
> -		return -ENOTCONN;
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 0, 0, 0);

get_next_endpoint() would do the same afaict, but being explicit is
probably better

> +	if (!ep)
> +		return 0;
>
> -	vin->parallel.mbus_type = vep->bus_type;
> +	fwnode = fwnode_graph_get_remote_endpoint(ep);

We're matching a parallel subdevice, which usually registers its async
subdev on the device node, not on endpoints.

In facts v4l2_async_notifier_fwnode_parse_endpoint() which is in the
call path of the v4l2_async_notifier_parse_fwnode_endpoints_by_port()
you are removing does:

	asd->match.fwnode =
		fwnode_graph_get_remote_port_parent(endpoint);

We now have match_fwnode() that adjusts endpoints to be matched
against the remote's parent but this still feels like a workaround as
most subdevs in mainline (all but adv748x?) still match on device
node.

I wonder how many system would actually break if we change
        v4l2_async_register_subdev[_sensor_common]()
to use the first available endpoint as match target.

> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	fwnode_handle_put(ep);
> +	if (ret) {
> +		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> +		ret = -EINVAL;
> +		goto out;
> +	}
>
> -	switch (vin->parallel.mbus_type) {
> +	switch (vep.bus_type) {
>  	case V4L2_MBUS_PARALLEL:
>  	case V4L2_MBUS_BT656:
>  		vin_dbg(vin, "Found %s media bus\n",
> -			vin->parallel.mbus_type == V4L2_MBUS_PARALLEL ?
> +			vep.bus_type == V4L2_MBUS_PARALLEL ?
>  			"PARALLEL" : "BT656");
> -		vin->parallel.bus = vep->bus.parallel;
> +		vin->parallel.mbus_type = vep.bus_type;
> +		vin->parallel.bus = vep.bus.parallel;
>  		break;
>  	default:
>  		vin_err(vin, "Unknown media bus type\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->notifier, fwnode,
> +						    sizeof(*asd));
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto out;
>  	}
>
>  	vin->parallel.asd = asd;
>
> +	vin_dbg(vin, "Add parallel OF device %pOF\n", to_of_node(fwnode));

You could omit OF as it is implied :)

> +out:
> +	fwnode_handle_put(fwnode);
> +
>  	return 0;
>  }
>
> @@ -639,9 +663,7 @@ static int rvin_parallel_init(struct rvin_dev *vin)
>
>  	v4l2_async_notifier_init(&vin->notifier);
>
> -	ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
> -		vin->dev, &vin->notifier, sizeof(*vin->parallel.asd),
> -		0, rvin_parallel_parse_v4l2);
> +	ret = rvin_parallel_parse_of(vin);

Patch is very nice, I like this direction
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>  	if (ret)
>  		return ret;
>
> --
> 2.29.2
>
