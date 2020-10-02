Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32FAA281D82
	for <lists+linux-media@lfdr.de>; Fri,  2 Oct 2020 23:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgJBVNj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 2 Oct 2020 17:13:39 -0400
Received: from mga04.intel.com ([192.55.52.120]:55896 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725379AbgJBVNj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 2 Oct 2020 17:13:39 -0400
IronPort-SDR: ycG5J1ZnZ2GK1PeWFW/fLs4A0VRnl7Hp5Vi2IIgCv3afO/wql/LEECu9xg610o+/DwPZCxqmOK
 6fa/dSgwK0Gg==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="160480616"
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="160480616"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 14:13:38 -0700
IronPort-SDR: i3g4u9Rxh/hEXvioCGiWPvXMcewTwUKhj33tGO7l9AtKFw15lZYqPna56zc1UjfONFSmPml2qP
 xD7i2yEVodnw==
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="342089885"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 14:13:36 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1E184205EA; Sat,  3 Oct 2020 00:13:34 +0300 (EEST)
Date:   Sat, 3 Oct 2020 00:13:34 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v7 2/3] media: i2c: ov772x: Add support for BT.656 mode
Message-ID: <20201002211334.GY26842@paasikivi.fi.intel.com>
References: <20201002165656.16744-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20201002165656.16744-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201002165656.16744-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Oct 02, 2020 at 05:56:55PM +0100, Lad Prabhakar wrote:
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
> Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/media/i2c/ov772x.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov772x.c b/drivers/media/i2c/ov772x.c
> index b56f8d7609e6..6b46ad493bf7 100644
> --- a/drivers/media/i2c/ov772x.c
> +++ b/drivers/media/i2c/ov772x.c
> @@ -583,6 +583,13 @@ static int ov772x_s_stream(struct v4l2_subdev *sd, int enable)
>  	if (priv->streaming == enable)
>  		goto done;
>  
> +	if (priv->bus_type == V4L2_MBUS_BT656) {
> +		ret = regmap_update_bits(priv->regmap, COM7, ITU656_ON_OFF,
> +					 enable ? ITU656_ON_OFF : ~ITU656_ON_OFF);

Here, too...

> +		if (ret)
> +			goto done;
> +	}
> +
>  	ret = regmap_update_bits(priv->regmap, COM2, SOFT_SLEEP_MODE,
>  				 enable ? 0 : SOFT_SLEEP_MODE);
>  	if (ret)
> @@ -1364,9 +1371,21 @@ static int ov772x_parse_dt(struct i2c_client *client,
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

-- 
Sakari Ailus
