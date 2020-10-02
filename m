Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F27D281D7A
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 23:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgJBVMm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 17:12:42 -0400
Received: from mga14.intel.com ([192.55.52.115]:46681 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725355AbgJBVMm (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 17:12:42 -0400
IronPort-SDR: sj5z9g159R4FvIK7RBq7tbgvFTcyw/fNHYHkZlIFW4Q1I+CSscskop19IN+JCUcVUbPTkzvtzv
 grL6i6aij86g==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="162320450"
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="162320450"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 14:12:41 -0700
IronPort-SDR: RV5B29wDovtR8i1L4Q9iVYMQ4iHrXvcu2RvZoctm4y/ErqDGVtpiZtHFl+5xYfJX0EImY0EiQG
 NA7ubQXar8xQ==
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="295465313"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 14:12:39 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 34108205EA; Sat,  3 Oct 2020 00:12:36 +0300 (EEST)
Date:   Sat, 3 Oct 2020 00:12:36 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v7 1/3] media: i2c: ov772x: Parse endpoint properties
Message-ID: <20201002211236.GW26842@paasikivi.fi.intel.com>
References: <20201002165656.16744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201002165656.16744-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002165656.16744-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Prabhakar,

On Fri, Oct 02, 2020 at 05:56:54PM +0100, Lad Prabhakar wrote:
> Parse endpoint properties using v4l2_fwnode_endpoint_alloc_parse()
> to determine the bus type and store it in the driver structure.
> 
> Set bus_type to V4L2_MBUS_PARALLEL as it's the only supported one
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/ov772x.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index 2cc6a678069a..b56f8d7609e6 100644
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
> @@ -1348,6 +1350,33 @@ static const struct v4l2_subdev_ops ov772x_subdev_ops = {
>  	.pad	= &ov772x_subdev_pad_ops,
>  };
>  
> +static int ov772x_parse_dt(struct i2c_client *client,
> +			   struct ov772x_priv *priv)
> +{
> +	struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = V4L2_MBUS_PARALLEL };

This one gets over 80.

> +	struct fwnode_handle *ep;
> +	int ret;
> +
> +	ep = fwnode_graph_get_next_endpoint(dev_fwnode(&client->dev),
> +					    NULL);

And this needs no newline.

> +	if (!ep) {
> +		dev_err(&client->dev, "Endpoint node not found\n");
> +		return -EINVAL;
> +	}
> +
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
> @@ -1415,6 +1444,10 @@ static int ov772x_probe(struct i2c_client *client)
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

-- 
Sakari Ailus
