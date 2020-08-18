Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2A21247FF1
	for <lists+linux-media@lfdr.de>; Tue, 18 Aug 2020 09:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbgHRHvn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 18 Aug 2020 03:51:43 -0400
Received: from mga07.intel.com ([134.134.136.100]:36067 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726391AbgHRHvn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 18 Aug 2020 03:51:43 -0400
IronPort-SDR: miBir/xaCGkIRbMId22e/PjVetFulUeF34tZVriGa9eiCHdALiXoDat/eCfUNKWFsB4Uhg5jPj
 U+/AMjANWjrg==
X-IronPort-AV: E=McAfee;i="6000,8403,9716"; a="219174024"
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="219174024"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 00:51:42 -0700
IronPort-SDR: O7IbCjQr4XUbwiQF5whfNvBdUcO2/Z69nS32nzJifLg4ENj9Q+JQzu7duTgzBxxOFAjuIv+CP/
 xDqHIdilxU+g==
X-IronPort-AV: E=Sophos;i="5.76,326,1592895600"; 
   d="scan'208";a="328896449"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2020 00:51:39 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 0708A2064F; Tue, 18 Aug 2020 10:51:37 +0300 (EEST)
Date:   Tue, 18 Aug 2020 10:51:36 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] rcar-csi2: Use V4L2 async helpers to create the
 notifier
Message-ID: <20200818075136.GO24582@paasikivi.fi.intel.com>
References: <20200807111619.3664763-1-niklas.soderlund+renesas@ragnatech.se>
 <20200807111619.3664763-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200807111619.3664763-3-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

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

Please don't. We'd rather like to remove that helper that necessitates the
use of deprecated behaviour. This driver is the last user left actually.

Could you see an example in drivers/media/pci/intel/ipu3/ipu3-cio2.c on how
to make this more condensed?

There's more code left than with that helper as there are multiple things
done here, and a few of these things interact at least in the general case:

- setting binding defaults (missing here),

- parsing the DT as well as storing the configuration you need (should you
  not use the V4L2 EP as such),

- getting the remote and

- registration of the subdev in the notifier.

You should also set the bus_type field if you know that in advance --- I
believe you do.

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
Kind regards,

Sakari Ailus
