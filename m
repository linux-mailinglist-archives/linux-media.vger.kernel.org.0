Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 425BA8AA9A
	for <lists+linux-media@lfdr.de>; Tue, 13 Aug 2019 00:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727162AbfHLWjl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 18:39:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:47302 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727003AbfHLWjl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 18:39:41 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A275B327;
        Tue, 13 Aug 2019 00:39:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565649579;
        bh=7eZ6GIdNhrm0MswPVxX9Y7ogEU+7+Y5AYyMvrJcw7Tk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tlccitXmrzSTy1O6l/H91Eug/JIszwFYABTUQYdx33RwWYAr5jZVHw5d2tJZS1nPl
         BWTonJbgtKcJDKry0ia3KxeTY42nrlHhdjTCmnDhGY/0mnEeLS8GCjG1HK15s7J2B9
         PYNOuqPm+IhbeUt3PBOoawk3gHHGk+QVwRAmGugQ=
Date:   Tue, 13 Aug 2019 01:39:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH 1/2] omap3isp: Set device on omap3isp subdevs
Message-ID: <20190812223936.GL5006@pendragon.ideasonboard.com>
References: <20190812083227.11838-1-sakari.ailus@linux.intel.com>
 <20190812083227.11838-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190812083227.11838-2-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Mon, Aug 12, 2019 at 11:32:26AM +0300, Sakari Ailus wrote:
> The omap3isp driver registered subdevs without the dev field being set. Do
> that now.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

The change looks fine, so

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

What are the implications of not setting the dev field ?

> ---
>  drivers/media/platform/omap3isp/ispccdc.c    | 1 +
>  drivers/media/platform/omap3isp/ispccp2.c    | 1 +
>  drivers/media/platform/omap3isp/ispcsi2.c    | 1 +
>  drivers/media/platform/omap3isp/isppreview.c | 1 +
>  drivers/media/platform/omap3isp/ispresizer.c | 1 +
>  drivers/media/platform/omap3isp/ispstat.c    | 2 ++
>  6 files changed, 7 insertions(+)
> 
> diff --git a/drivers/media/platform/omap3isp/ispccdc.c b/drivers/media/platform/omap3isp/ispccdc.c
> index 261ad1175f98..9297281402f5 100644
> --- a/drivers/media/platform/omap3isp/ispccdc.c
> +++ b/drivers/media/platform/omap3isp/ispccdc.c
> @@ -2605,6 +2605,7 @@ int omap3isp_ccdc_register_entities(struct isp_ccdc_device *ccdc,
>  	int ret;
>  
>  	/* Register the subdev and video node. */
> +	ccdc->subdev.dev = vdev->mdev->dev;
>  	ret = v4l2_device_register_subdev(vdev, &ccdc->subdev);
>  	if (ret < 0)
>  		goto error;
> diff --git a/drivers/media/platform/omap3isp/ispccp2.c b/drivers/media/platform/omap3isp/ispccp2.c
> index 2dea423ffc0e..3cf9a32c1d9e 100644
> --- a/drivers/media/platform/omap3isp/ispccp2.c
> +++ b/drivers/media/platform/omap3isp/ispccp2.c
> @@ -1034,6 +1034,7 @@ int omap3isp_ccp2_register_entities(struct isp_ccp2_device *ccp2,
>  	int ret;
>  
>  	/* Register the subdev and video nodes. */
> +	ccp2->subdev.dev = vdev->mdev->dev;
>  	ret = v4l2_device_register_subdev(vdev, &ccp2->subdev);
>  	if (ret < 0)
>  		goto error;
> diff --git a/drivers/media/platform/omap3isp/ispcsi2.c b/drivers/media/platform/omap3isp/ispcsi2.c
> index da66ea65be5d..9977702d57ff 100644
> --- a/drivers/media/platform/omap3isp/ispcsi2.c
> +++ b/drivers/media/platform/omap3isp/ispcsi2.c
> @@ -1201,6 +1201,7 @@ int omap3isp_csi2_register_entities(struct isp_csi2_device *csi2,
>  	int ret;
>  
>  	/* Register the subdev and video nodes. */
> +	csi2->subdev.dev = vdev->mdev->dev;
>  	ret = v4l2_device_register_subdev(vdev, &csi2->subdev);
>  	if (ret < 0)
>  		goto error;
> diff --git a/drivers/media/platform/omap3isp/isppreview.c b/drivers/media/platform/omap3isp/isppreview.c
> index 6ea6aeafd751..94fc9cf01436 100644
> --- a/drivers/media/platform/omap3isp/isppreview.c
> +++ b/drivers/media/platform/omap3isp/isppreview.c
> @@ -2228,6 +2228,7 @@ int omap3isp_preview_register_entities(struct isp_prev_device *prev,
>  	int ret;
>  
>  	/* Register the subdev and video nodes. */
> +	prev->subdev.dev = vdev->mdev->dev;
>  	ret = v4l2_device_register_subdev(vdev, &prev->subdev);
>  	if (ret < 0)
>  		goto error;
> diff --git a/drivers/media/platform/omap3isp/ispresizer.c b/drivers/media/platform/omap3isp/ispresizer.c
> index b281cae036b3..d5cce8b8af97 100644
> --- a/drivers/media/platform/omap3isp/ispresizer.c
> +++ b/drivers/media/platform/omap3isp/ispresizer.c
> @@ -1684,6 +1684,7 @@ int omap3isp_resizer_register_entities(struct isp_res_device *res,
>  	int ret;
>  
>  	/* Register the subdev and video nodes. */
> +	res->subdev.dev = vdev->mdev->dev;
>  	ret = v4l2_device_register_subdev(vdev, &res->subdev);
>  	if (ret < 0)
>  		goto error;
> diff --git a/drivers/media/platform/omap3isp/ispstat.c b/drivers/media/platform/omap3isp/ispstat.c
> index 46a42c5dc1cc..bb1578d6eaf6 100644
> --- a/drivers/media/platform/omap3isp/ispstat.c
> +++ b/drivers/media/platform/omap3isp/ispstat.c
> @@ -1029,6 +1029,8 @@ void omap3isp_stat_unregister_entities(struct ispstat *stat)
>  int omap3isp_stat_register_entities(struct ispstat *stat,
>  				    struct v4l2_device *vdev)
>  {
> +	stat->subdev.dev = vdev->mdev->dev;
> +
>  	return v4l2_device_register_subdev(vdev, &stat->subdev);
>  }
>  
> -- 
> 2.20.1
> 

-- 
Regards,

Laurent Pinchart
