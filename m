Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB2C82791D9
	for <lists+linux-media@lfdr.de>; Fri, 25 Sep 2020 22:17:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbgIYUQ5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Sep 2020 16:16:57 -0400
Received: from mga14.intel.com ([192.55.52.115]:60654 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727256AbgIYUO5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Sep 2020 16:14:57 -0400
IronPort-SDR: wXcaRAg6rSEUHmwHdWYpVCKN1S322VEQfETaDMc/UobcvlHLjb/y4UNoqYGRtrurJjS91mLdFK
 vltsMdNkSEaw==
X-IronPort-AV: E=McAfee;i="6000,8403,9755"; a="160883918"
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="160883918"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 13:07:45 -0700
IronPort-SDR: hDaXwL/cXBC2wikLfbQLRct+Dk4h8O9LYlgwRHYGlnSwikIMc+uCDc8CtalhvuPv/GmSgreM5E
 +lVhmRwQPgvw==
X-IronPort-AV: E=Sophos;i="5.77,303,1596524400"; 
   d="scan'208";a="310959305"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2020 13:07:43 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 5FEA720728; Fri, 25 Sep 2020 23:07:41 +0300 (EEST)
Date:   Fri, 25 Sep 2020 23:07:41 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>
Subject: Re: [PATCH 4/5] media: mt9p031: Make pixel clock polarity
 configurable by DT
Message-ID: <20200925200741.GW26842@paasikivi.fi.intel.com>
References: <20200925075029.32181-1-s.riedmueller@phytec.de>
 <20200925075029.32181-4-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200925075029.32181-4-s.riedmueller@phytec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

Thanks for the patchset.

On Fri, Sep 25, 2020 at 09:50:28AM +0200, Stefan Riedmueller wrote:
> From: Christian Hemp <c.hemp@phytec.de>
> 
> Evaluate the desired pixel clock polarity from the device tree.
> 
> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
>  drivers/media/i2c/Kconfig   |  1 +
>  drivers/media/i2c/mt9p031.c | 19 ++++++++++++++++++-
>  include/media/i2c/mt9p031.h |  1 +
>  3 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index c7ba76fee599..7c026daeacf0 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1103,6 +1103,7 @@ config VIDEO_MT9P031
>  	select MEDIA_CONTROLLER
>  	select VIDEO_V4L2_SUBDEV_API
>  	select VIDEO_APTINA_PLL
> +	select V4L2_FWNODE
>  	help
>  	  This is a Video4Linux2 sensor driver for the Aptina
>  	  (Micron) mt9p031 5 Mpixel camera.
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index f5d6a7890c47..8f8ee37a2dd2 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -27,6 +27,7 @@
>  #include <media/v4l2-async.h>
>  #include <media/v4l2-ctrls.h>
>  #include <media/v4l2-device.h>
> +#include <media/v4l2-fwnode.h>
>  #include <media/v4l2-subdev.h>
>  
>  #include "aptina-pll.h"
> @@ -399,6 +400,14 @@ static int __mt9p031_set_power(struct mt9p031 *mt9p031, bool on)
>  		return ret;
>  	}
>  
> +	/* Configure the pixel clock polarity */
> +	if (mt9p031->pdata && mt9p031->pdata->pixclk_pol) {
> +		ret = mt9p031_write(client, MT9P031_PIXEL_CLOCK_CONTROL,
> +				MT9P031_PIXEL_CLOCK_INVERT);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	return v4l2_ctrl_handler_setup(&mt9p031->ctrls);
>  }
>  
> @@ -1062,7 +1071,8 @@ static const struct v4l2_subdev_internal_ops mt9p031_subdev_internal_ops = {
>  static struct mt9p031_platform_data *
>  mt9p031_get_pdata(struct i2c_client *client)
>  {
> -	struct mt9p031_platform_data *pdata;
> +	struct mt9p031_platform_data *pdata = NULL;
> +	struct v4l2_fwnode_endpoint endpoint;

Could you initialise the bus_type field to a valid value? I suppose this
sensor only supports one of them? That way you'll also initialise the rest
of the struct fields to zero.

>  	struct device_node *np;
>  
>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
> @@ -1072,6 +1082,10 @@ mt9p031_get_pdata(struct i2c_client *client)
>  	if (!np)
>  		return NULL;
>  
> +	endpoint.bus_type = V4L2_MBUS_UNKNOWN;
> +	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint) < 0)
> +		goto done;
> +
>  	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
>  		goto done;
> @@ -1079,6 +1093,9 @@ mt9p031_get_pdata(struct i2c_client *client)
>  	of_property_read_u32(np, "input-clock-frequency", &pdata->ext_freq);
>  	of_property_read_u32(np, "pixel-clock-frequency", &pdata->target_freq);
>  
> +	pdata->pixclk_pol = !!(endpoint.bus.parallel.flags &
> +			       V4L2_MBUS_PCLK_SAMPLE_RISING);
> +
>  done:
>  	of_node_put(np);
>  	return pdata;
> diff --git a/include/media/i2c/mt9p031.h b/include/media/i2c/mt9p031.h
> index 7c29c53aa988..f933cd0be8e5 100644
> --- a/include/media/i2c/mt9p031.h
> +++ b/include/media/i2c/mt9p031.h
> @@ -10,6 +10,7 @@ struct v4l2_subdev;
>   * @target_freq: Pixel clock frequency
>   */
>  struct mt9p031_platform_data {
> +	unsigned int pixclk_pol:1;
>  	int ext_freq;
>  	int target_freq;
>  };

-- 
Regards,

Sakari Ailus
