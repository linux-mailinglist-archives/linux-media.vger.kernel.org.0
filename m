Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33F122C468B
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 18:21:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730653AbgKYRVa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Nov 2020 12:21:30 -0500
Received: from mga06.intel.com ([134.134.136.31]:19930 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729631AbgKYRVa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Nov 2020 12:21:30 -0500
IronPort-SDR: K3mpwZPRxmQ/A8pfjU+vmrrt1d207chLhRtH60Hpsqh6LitgpYpDdOWX/tht6siSdx8pxIYs2O
 ZixtHIqaszSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9816"; a="233779466"
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; 
   d="scan'208";a="233779466"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 09:21:27 -0800
IronPort-SDR: fqU2vK3YqQDV8IEsrS7wABHNKmn4MHKsIgssE/jJ0PnRWA0htLHVLa2Tmj36KhSzwwcYQNReSj
 oZg9J9m7tEcQ==
X-IronPort-AV: E=Sophos;i="5.78,369,1599548400"; 
   d="scan'208";a="343645972"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2020 09:21:26 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 34C08208C5; Wed, 25 Nov 2020 19:21:24 +0200 (EET)
Date:   Wed, 25 Nov 2020 19:21:24 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 4/5] rcar-vin: Rework CSI-2 firmware parsing
Message-ID: <20201125172124.GJ3940@paasikivi.fi.intel.com>
References: <20201125164450.2056963-1-niklas.soderlund+renesas@ragnatech.se>
 <20201125164450.2056963-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201125164450.2056963-5-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hejssan Niklas,

Tack för detta hop av lappar! De är verkligen jättebehagliga!

On Wed, Nov 25, 2020 at 05:44:49PM +0100, Niklas Söderlund wrote:
> Rework the CSI-2 firmware parsing code to not use the soon to be
> removed v4l2_async_notifier_parse_fwnode_endpoints_by_port() helper. The
> change only aims to prepare for the removing of the old helper and there
> are no functional change.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  drivers/media/platform/rcar-vin/rcar-core.c | 67 ++++++++++++---------
>  1 file changed, 40 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-core.c b/drivers/media/platform/rcar-vin/rcar-core.c
> index 830ab0865967310b..98bff765b02e67d9 100644
> --- a/drivers/media/platform/rcar-vin/rcar-core.c
> +++ b/drivers/media/platform/rcar-vin/rcar-core.c
> @@ -812,37 +812,48 @@ static const struct v4l2_async_notifier_operations rvin_group_notify_ops = {
>  	.complete = rvin_group_notify_complete,
>  };
>  
> -static int rvin_mc_parse_of_endpoint(struct device *dev,
> -				     struct v4l2_fwnode_endpoint *vep,
> -				     struct v4l2_async_subdev *asd)
> +static int rvin_mc_parse_of(struct rvin_dev *vin, unsigned int id)
>  {
> -	struct rvin_dev *vin = dev_get_drvdata(dev);
> -	int ret = 0;
> +	struct fwnode_handle *ep, *fwnode;
> +	struct v4l2_fwnode_endpoint vep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY,
> +	};

This would fit on a single line.

> +	struct v4l2_async_subdev *asd;
> +	int ret;
>  
> -	if (vep->base.port != 1 || vep->base.id >= RVIN_CSI_MAX)
> -		return -EINVAL;
> +	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(vin->dev), 1, id, 0);

You could use the FWNODE_GRAPH_ENDPOINT_NEXT flag to get the next endpoint
instead of specifying its number. Whichever works better...

> +	if (!ep)
> +		return 0;
>  
> -	if (!of_device_is_available(to_of_node(asd->match.fwnode))) {
> +	fwnode = fwnode_graph_get_remote_endpoint(ep);
> +	ret = v4l2_fwnode_endpoint_parse(ep, &vep);
> +	fwnode_handle_put(ep);
> +	if (ret) {
> +		vin_err(vin, "Failed to parse %pOF\n", to_of_node(fwnode));
> +		ret = -EINVAL;
> +		goto out;
> +	}
> +
> +	if (!of_device_is_available(to_of_node(fwnode))) {

fwnode is an endpoint here, not the device node.

But there's no need for this check either, as
fwnode_graph_get_endpoint_by_id(), by default, only returns endpoints that
are connected to available device's endpoints. So you can remove this
check.

>  		vin_dbg(vin, "OF device %pOF disabled, ignoring\n",
> -			to_of_node(asd->match.fwnode));
> -		return -ENOTCONN;
> -	}
> -
> -	mutex_lock(&vin->group->lock);
> -
> -	if (vin->group->csi[vep->base.id].asd) {
> -		vin_dbg(vin, "OF device %pOF already handled\n",
> -			to_of_node(asd->match.fwnode));
> +			to_of_node(fwnode));
>  		ret = -ENOTCONN;
>  		goto out;
>  	}
>  
> -	vin->group->csi[vep->base.id].asd = asd;
> +	asd = v4l2_async_notifier_add_fwnode_subdev(&vin->group->notifier,
> +						    fwnode, sizeof(*asd));
> +	if (IS_ERR(asd)) {
> +		ret = PTR_ERR(asd);
> +		goto out;
> +	}
> +
> +	vin->group->csi[vep.base.id].asd = asd;
>  
>  	vin_dbg(vin, "Add group OF device %pOF to slot %u\n",
> -		to_of_node(asd->match.fwnode), vep->base.id);
> +		to_of_node(fwnode), vep.base.id);
>  out:
> -	mutex_unlock(&vin->group->lock);
> +	fwnode_handle_put(fwnode);
>  
>  	return ret;
>  }
> @@ -850,7 +861,7 @@ static int rvin_mc_parse_of_endpoint(struct device *dev,
>  static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
>  {
>  	unsigned int count = 0, vin_mask = 0;
> -	unsigned int i;
> +	unsigned int i, id;
>  	int ret;
>  
>  	mutex_lock(&vin->group->lock);
> @@ -881,12 +892,14 @@ static int rvin_mc_parse_of_graph(struct rvin_dev *vin)
>  		if (!(vin_mask & BIT(i)))
>  			continue;
>  
> -		ret = v4l2_async_notifier_parse_fwnode_endpoints_by_port(
> -				vin->group->vin[i]->dev, &vin->group->notifier,
> -				sizeof(struct v4l2_async_subdev), 1,
> -				rvin_mc_parse_of_endpoint);
> -		if (ret)
> -			return ret;
> +		for (id = 0; id < RVIN_CSI_MAX; id++) {
> +			if (vin->group->csi[id].asd)
> +				continue;
> +
> +			ret = rvin_mc_parse_of(vin->group->vin[i], id);
> +			if (ret)
> +				return ret;
> +		}
>  	}
>  
>  	if (list_empty(&vin->group->notifier.asd_list))

-- 
Vänliga hälsningar,

Sakari Ailus
