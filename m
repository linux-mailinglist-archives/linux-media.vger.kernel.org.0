Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FCF27E7D5
	for <lists+linux-media@lfdr.de>; Wed, 30 Sep 2020 13:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729322AbgI3Lpo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 07:45:44 -0400
Received: from mga07.intel.com ([134.134.136.100]:57312 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725776AbgI3Lpk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 07:45:40 -0400
IronPort-SDR: jSf/wI54As06nlC8Y7nN1NQgQ0CFcfvX00a7DUwMEw8psTxJPhMi2hV/x8/dlmmKxlJLz4bdGn
 KVSLuA9wVhDg==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="226572529"
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="226572529"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 04:45:34 -0700
IronPort-SDR: uxqs9CHThJukvG6Ul9PCkD+sHZL+L4tNH90Neuemx0IqnR9TY2Ult9AxGr9cEeRtH9k4hbwVO9
 IOo2JlEjfDhg==
X-IronPort-AV: E=Sophos;i="5.77,322,1596524400"; 
   d="scan'208";a="415692174"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2020 04:45:31 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 78C8120330; Wed, 30 Sep 2020 14:45:29 +0300 (EEST)
Date:   Wed, 30 Sep 2020 14:45:29 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v6 1/3] media: i2c: ov772x: Parse endpoint properties
Message-ID: <20200930114529.GM26842@paasikivi.fi.intel.com>
References: <20200917174224.11430-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200917174224.11430-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200917174224.11430-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Thu, Sep 17, 2020 at 06:42:22PM +0100, Lad Prabhakar wrote:
> Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
> to determine the bus type and store it in the driver structure.
> 
> Set bus_type to V4L2_MBUS_PARALLEL as it's the only supported one
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/media/i2c/ov772x.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 2cc6a678069a..f61a3f09ad64 100644
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
> @@ -1348,6 +1350,34 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
>  	.pad	= &ov772x_subdev_pad_ops,
>  };
>  
> +static int ov772x_parse_dt(struct i2c_client *client,
> +			   struct ov772x_priv *priv)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg;
> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> +					    NULL);
> +	if (!ep) {
> +		dev_err(&client->dev, "Endpoint node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	bus_cfg.bus_type = V4L2_MBUS_PARALLEL;

Please zero the entire struct, i.e. do this assignment in the declaration.

You can also use v4l2_fwnode_endpoint_parse() if you're not using the link
frequencies --- sensor drivers generally should but you could only add them
as optional at this point (out of scope of this patch).

> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	if (ret)
> +		goto error_fwnode_put;
> +
> +	priv->bus_type = bus_cfg.bus_type;
> +	v4l2_fwnode_endpoint_free(&bus_cfg);
> +
> +error_fwnode_put:
> +	fwnode_handle_put(ep);
> +
> +	return ret;
> +}
> +
>  /*
>   * i2c_driver function
>   */
> @@ -1415,6 +1445,10 @@ static int ov772x_probe(struct i2c_client *client)
>  		goto error_clk_put;
>  	}
>  
> +	ret = ov772x_parse_dt(client, priv);
> +	if (ret)
> +		goto error_clk_put;
> +
>  	ret = ov772x_video_probe(priv);
>  	if (ret < 0)
>  		goto error_gpio_put;
> -- 
> 2.17.1
> 

-- 
Sakari Ailus
