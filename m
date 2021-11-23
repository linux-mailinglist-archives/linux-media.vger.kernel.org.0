Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1AD345A16E
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 12:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236144AbhKWL2v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 06:28:51 -0500
Received: from mga01.intel.com ([192.55.52.88]:56519 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236111AbhKWL2t (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 06:28:49 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10176"; a="258870769"
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="258870769"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:23:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="571038146"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2021 03:23:26 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 04EF0201E1;
        Tue, 23 Nov 2021 13:23:24 +0200 (EET)
Date:   Tue, 23 Nov 2021 13:23:24 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     leonl@leopardimaging.com, linux-media@vger.kernel.org,
        skomatineni@nvidia.com, luca@lucaceresoli.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: i2c: imx274: implement fwnode parsing
Message-ID: <YZzPLOv2RBuj+zoS@paasikivi.fi.intel.com>
References: <20211123111521.593863-1-eugen.hristev@microchip.com>
 <20211123111521.593863-2-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211123111521.593863-2-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Tue, Nov 23, 2021 at 01:15:21PM +0200, Eugen Hristev wrote:
> Implement fwnode parsing at probe time.
> Check if the bus and number of lanes are supported.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  drivers/media/i2c/imx274.c | 40 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index e31f006b10d9..774912f44efe 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -27,6 +27,7 @@
>  
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
>  /*
> @@ -1957,6 +1958,41 @@ static const struct i2c_device_id imx274_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, imx274_id);
>  
> +static int imx274_fwnode_parse(struct device *dev)
> +{
> +	struct fwnode_handle *endpoint;
> +	/* Only CSI2 is supported */
> +	struct v4l2_fwnode_endpoint ep = {
> +		.bus_type = V4L2_MBUS_CSI2_DPHY
> +	};
> +	int ret;
> +
> +	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> +	if (!endpoint) {
> +		dev_err(dev, "Endpoint node not found\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep);

This allocates memory for the link frequencies. It needs to be released at
some point.

You could also use v4l1_fwnode_endpoint_parse() as the driver doesn't seem
to use link frequencies (albeit it probably should, but that's another
discussion).

> +	fwnode_handle_put(endpoint);
> +	if (ret == -ENXIO) {
> +		dev_err(dev, "Unsupported bus type, should be CSI2\n");
> +		return ret;
> +	} else if (ret) {
> +		dev_err(dev, "Parsing endpoint node failed %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Check number of data lanes, only 4 lanes supported */
> +	if (ep.bus.mipi_csi2.num_data_lanes != 4) {
> +		dev_err(dev, "Invalid data lanes: %d\n",
> +			ep.bus.mipi_csi2.num_data_lanes);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int imx274_probe(struct i2c_client *client)
>  {
>  	struct v4l2_subdev *sd;
> @@ -1971,6 +2007,10 @@ static int imx274_probe(struct i2c_client *client)
>  
>  	mutex_init(&imx274->lock);
>  
> +	ret = imx274_fwnode_parse(dev);
> +	if (ret)
> +		return ret;
> +
>  	imx274->inck = devm_clk_get_optional(dev, "inck");
>  	if (IS_ERR(imx274->inck))
>  		return PTR_ERR(imx274->inck);

-- 
Kind regards,

Sakari Ailus
