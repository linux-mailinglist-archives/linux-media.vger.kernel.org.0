Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D686423FF
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2019 13:30:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407929AbfFLLam (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Jun 2019 07:30:42 -0400
Received: from retiisi.org.uk ([95.216.213.190]:46188 "EHLO
        hillosipuli.retiisi.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727352AbfFLLam (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Jun 2019 07:30:42 -0400
Received: from valkosipuli.localdomain (valkosipuli.retiisi.org.uk [IPv6:2a01:4f9:c010:4572::80:2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by hillosipuli.retiisi.org.uk (Postfix) with ESMTPS id D12CF634C7B;
        Wed, 12 Jun 2019 14:30:05 +0300 (EEST)
Received: from sailus by valkosipuli.localdomain with local (Exim 4.89)
        (envelope-from <sakari.ailus@retiisi.org.uk>)
        id 1hb1S9-0001e5-VI; Wed, 12 Jun 2019 14:30:05 +0300
Date:   Wed, 12 Jun 2019 14:30:05 +0300
From:   Sakari Ailus <sakari.ailus@iki.fi>
To:     Eugen.Hristev@microchip.com
Cc:     hverkuil@xs4all.nl, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/3] media: atmel: atmel-isc: fix and cleanup
 potential bugs
Message-ID: <20190612113005.44zvi4vgdl4pqlv7@valkosipuli.retiisi.org.uk>
References: <1560336983-16843-1-git-send-email-eugen.hristev@microchip.com>
 <1560336983-16843-3-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560336983-16843-3-git-send-email-eugen.hristev@microchip.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Wed, Jun 12, 2019 at 11:01:15AM +0000, Eugen.Hristev@microchip.com wrote:
> From: Eugen Hristev <eugen.hristev@microchip.com>
> 
> Fixed issues that can lead to potential bugs.
> Cleanup order in the driver
> Taking into consideration std control creation can fail
> mutex_destroy call
> changing controller_formats with const specifier
> some cosmetic cleanups
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
> Changes in v5:
> - new patch that fixes issues reviewed by Sakari
> 
>  drivers/media/platform/atmel/atmel-isc-base.c    | 28 +++++++++++++++---------
>  drivers/media/platform/atmel/atmel-isc.h         |  2 +-
>  drivers/media/platform/atmel/atmel-sama5d2-isc.c | 14 +++++++-----
>  3 files changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> index edfd7e0..678383e 100644
> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> @@ -45,7 +45,7 @@ MODULE_PARM_DESC(sensor_preferred,
>  		 "Sensor is preferred to output the specified format (1-on 0-off), default 1");
>  
>  /* This is a list of the formats that the ISC can *output* */
> -struct isc_format controller_formats[] = {
> +const struct isc_format controller_formats[] = {
>  	{
>  		.fourcc		= V4L2_PIX_FMT_ARGB444,
>  	},
> @@ -231,7 +231,7 @@ static inline void isc_update_awb_ctrls(struct isc_device *isc)
>  
>  static inline void isc_reset_awb_ctrls(struct isc_device *isc)
>  {
> -	int c;
> +	unsigned int c;
>  
>  	for (c = ISC_HIS_CFG_MODE_GR; c <= ISC_HIS_CFG_MODE_B; c++) {
>  		/* gains have a fixed point at 9 decimals */
> @@ -1456,7 +1456,7 @@ static int isc_enum_frameintervals(struct file *file, void *fh,
>  		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>  	};
>  	int ret = -EINVAL;
> -	int i;
> +	unsigned int i;
>  
>  	for (i = 0; i < isc->num_user_formats; i++)
>  		if (isc->user_formats[i]->fourcc == fival->pixel_format)
> @@ -1883,6 +1883,12 @@ static int isc_ctrl_init(struct isc_device *isc)
>  	isc->do_wb_ctrl = v4l2_ctrl_new_std(hdl, ops, V4L2_CID_DO_WHITE_BALANCE,
>  					    0, 0, 0, 0);
>  
> +	if (!isc->do_wb_ctrl) {
> +		ret = hdl->error;
> +		v4l2_ctrl_handler_free(hdl);
> +		return ret;
> +	}
> +
>  	v4l2_ctrl_activate(isc->do_wb_ctrl, false);
>  
>  	v4l2_ctrl_handler_setup(hdl);
> @@ -2010,7 +2016,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
>  					      struct isc_device, v4l2_dev);
>  	struct video_device *vdev = &isc->video_dev;
>  	struct vb2_queue *q = &isc->vb2_vidq;
> -	int ret;
> +	int ret = 0;
>  
>  	INIT_WORK(&isc->awb_work, isc_awb_work);
>  
> @@ -2041,7 +2047,7 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
>  	if (ret < 0) {
>  		v4l2_err(&isc->v4l2_dev,
>  			 "vb2_queue_init() failed: %d\n", ret);
> -		return ret;
> +		goto isc_async_complete_err;
>  	}
>  
>  	/* Init video dma queues */
> @@ -2053,19 +2059,19 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
>  	if (ret < 0) {
>  		v4l2_err(&isc->v4l2_dev,
>  			 "Init format failed: %d\n", ret);
> -		return ret;
> +		goto isc_async_complete_err;
>  	}
>  
>  	ret = isc_set_default_fmt(isc);
>  	if (ret) {
>  		v4l2_err(&isc->v4l2_dev, "Could not set default format\n");
> -		return ret;
> +		goto isc_async_complete_err;
>  	}
>  
>  	ret = isc_ctrl_init(isc);
>  	if (ret) {
>  		v4l2_err(&isc->v4l2_dev, "Init isc ctrols failed: %d\n", ret);
> -		return ret;
> +		goto isc_async_complete_err;
>  	}
>  
>  	/* Register video device */
> @@ -2085,10 +2091,12 @@ static int isc_async_complete(struct v4l2_async_notifier *notifier)
>  	if (ret < 0) {
>  		v4l2_err(&isc->v4l2_dev,
>  			 "video_register_device failed: %d\n", ret);
> -		return ret;
> +		goto isc_async_complete_err;
>  	}
>  
> -	return 0;

I presume you did not intend to remove that line?

The patch seems good apart from that.

> +isc_async_complete_err:
> +	mutex_destroy(&isc->lock);
> +	return ret;
>  }
>  
>  const struct v4l2_async_notifier_operations isc_async_ops = {
> diff --git a/drivers/media/platform/atmel/atmel-isc.h b/drivers/media/platform/atmel/atmel-isc.h
> index 5be5b09..f5f5932 100644
> --- a/drivers/media/platform/atmel/atmel-isc.h
> +++ b/drivers/media/platform/atmel/atmel-isc.h
> @@ -235,7 +235,7 @@ extern unsigned int debug;
>  extern unsigned int sensor_preferred;
>  
>  extern struct isc_format formats_list[];
> -extern struct isc_format controller_formats[];
> +extern const struct isc_format controller_formats[];
>  extern const u32 isc_gamma_table[GAMMA_MAX + 1][GAMMA_ENTRIES];
>  extern const struct regmap_config isc_regmap_config;
>  extern const struct v4l2_async_notifier_operations isc_async_ops;
> diff --git a/drivers/media/platform/atmel/atmel-sama5d2-isc.c b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> index 127e79c..266df14 100644
> --- a/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> +++ b/drivers/media/platform/atmel/atmel-sama5d2-isc.c
> @@ -122,8 +122,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  					ISC_PFE_CFG0_CCIR656;
>  
>  		subdev_entity->asd->match_type = V4L2_ASYNC_MATCH_FWNODE;
> -		subdev_entity->asd->match.fwnode =
> -			of_fwnode_handle(rem);
> +		subdev_entity->asd->match.fwnode = of_fwnode_handle(rem);
>  		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
>  	}
>  
> @@ -282,13 +281,14 @@ static int atmel_isc_remove(struct platform_device *pdev)
>  	struct isc_device *isc = platform_get_drvdata(pdev);
>  
>  	pm_runtime_disable(&pdev->dev);
> -	clk_disable_unprepare(isc->ispck);
> -	clk_disable_unprepare(isc->hclock);
>  
>  	isc_subdev_cleanup(isc);
>  
>  	v4l2_device_unregister(&isc->v4l2_dev);
>  
> +	clk_disable_unprepare(isc->ispck);
> +	clk_disable_unprepare(isc->hclock);
> +
>  	isc_clk_cleanup(isc);
>  
>  	return 0;
> @@ -313,7 +313,11 @@ static int __maybe_unused isc_runtime_resume(struct device *dev)
>  	if (ret)
>  		return ret;
>  
> -	return clk_prepare_enable(isc->ispck);
> +	ret = clk_prepare_enable(isc->ispck);
> +	if (ret)
> +		clk_disable_unprepare(isc->hclock);
> +
> +	return ret;
>  }
>  
>  static const struct dev_pm_ops atmel_isc_dev_pm_ops = {
> -- 
> 2.7.4
> 

-- 
Sakari Ailus
