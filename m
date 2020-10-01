Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D71E280397
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 18:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732417AbgJAQKp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Oct 2020 12:10:45 -0400
Received: from mga02.intel.com ([134.134.136.20]:23130 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732391AbgJAQKo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 1 Oct 2020 12:10:44 -0400
IronPort-SDR: lMFvP4PXO3hjhKMq5ZUWm39AVzD47d2BY8WNAJv0nIRCozVJTTWLwFLYBPRSqEmlcg6G7ONkD3
 Vyf5ZXDe4NBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="150404291"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="150404291"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 09:10:35 -0700
IronPort-SDR: 8R3/R3ckdWza/dk9598fP9+FPvk0Pa3gpJTuQPgwN9orPSUkpVJ+kHYMk/GWZ7ERP9eWowB+As
 p6K79KElAZNQ==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; 
   d="scan'208";a="514778224"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2020 09:10:34 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1904F2068C; Thu,  1 Oct 2020 19:10:32 +0300 (EEST)
Date:   Thu, 1 Oct 2020 19:10:32 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Stefan Riedmueller <s.riedmueller@phytec.de>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Christian Hemp <c.hemp@phytec.de>
Subject: Re: [PATCH v2 4/5] media: mt9p031: Make pixel clock polarity
 configurable by DT
Message-ID: <20201001161031.GP26842@paasikivi.fi.intel.com>
References: <20200930105133.139981-1-s.riedmueller@phytec.de>
 <20200930105133.139981-4-s.riedmueller@phytec.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200930105133.139981-4-s.riedmueller@phytec.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Stefan,

On Wed, Sep 30, 2020 at 12:51:32PM +0200, Stefan Riedmueller wrote:
> From: Christian Hemp <c.hemp@phytec.de>
> 
> Evaluate the desired pixel clock polarity from the device tree.
> 
> Signed-off-by: Christian Hemp <c.hemp@phytec.de>
> Signed-off-by: Stefan Riedmueller <s.riedmueller@phytec.de>
> ---
> Changes in v2:
>  - Initialise endpoint bus_type field to V4L2_MBUS_PARALLEL since the
>    sensor only supports a parallel interface
> ---
>  drivers/media/i2c/Kconfig   |  1 +
>  drivers/media/i2c/mt9p031.c | 20 +++++++++++++++++++-
>  include/media/i2c/mt9p031.h |  1 +
>  3 files changed, 21 insertions(+), 1 deletion(-)
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
> index de36025260a8..d10457361e6c 100644
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
> @@ -1062,8 +1071,11 @@ static const struct v4l2_subdev_internal_ops mt9p031_subdev_internal_ops = {
>  static struct mt9p031_platform_data *
>  mt9p031_get_pdata(struct i2c_client *client)
>  {
> -	struct mt9p031_platform_data *pdata;
> +	struct mt9p031_platform_data *pdata = NULL;
>  	struct device_node *np;
> +	struct v4l2_fwnode_endpoint endpoint = {
> +		.bus_type = V4L2_MBUS_PARALLEL
> +	};
>  
>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>  		return client->dev.platform_data;
> @@ -1072,6 +1084,9 @@ mt9p031_get_pdata(struct i2c_client *client)
>  	if (!np)
>  		return NULL;
>  
> +	if (v4l2_fwnode_endpoint_parse(of_fwnode_handle(np), &endpoint) < 0)
> +		goto done;
> +
>  	pdata = devm_kzalloc(&client->dev, sizeof(*pdata), GFP_KERNEL);
>  	if (!pdata)
>  		goto done;
> @@ -1079,6 +1094,9 @@ mt9p031_get_pdata(struct i2c_client *client)
>  	of_property_read_u32(np, "input-clock-frequency", &pdata->ext_freq);
>  	of_property_read_u32(np, "pixel-clock-frequency", &pdata->target_freq);
>  
> +	pdata->pixclk_pol = !!(endpoint.bus.parallel.flags &
> +			       V4L2_MBUS_PCLK_SAMPLE_RISING);

Could you document this in DT bindings? And the default, too.

Ideally other properties relevant to the device would be there, too. 

-- 
Sakari Ailus
