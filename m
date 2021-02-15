Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF07131B38A
	for <lists+linux-media@lfdr.de>; Mon, 15 Feb 2021 01:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhBOANe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 14 Feb 2021 19:13:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229792AbhBOANd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 14 Feb 2021 19:13:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FE1CC061574
        for <linux-media@vger.kernel.org>; Sun, 14 Feb 2021 16:12:53 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4BC89E6;
        Mon, 15 Feb 2021 01:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1613347968;
        bh=q0gNJyx2Xyu1m2RjYMG6cef2ZeLKN3HI5rFAqf5mQJw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iOSo9PB5Uu4G05AM/MlokDbnqvLNCFwTkH4P8D3CCy/KR1Q6PLOkuQhlRN5dZzpXP
         USQeX8lhjKnSEj/woo6YLkfIuRhPqgIY2o053dpRUY7kOCusz/ZdJPkHqhogLvZQgs
         lRB7x7uPnFfIRQkt3pkLBYnflLPSOd0zTC2jk9tM=
Date:   Mon, 15 Feb 2021 02:12:23 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ipu3-cio2: Use v4l2_get_link_freq helper
Message-ID: <YCm8Z/8MMYv1vh4t@pendragon.ideasonboard.com>
References: <20201013153633.31022-3-sakari.ailus@linux.intel.com>
 <20201014083015.9074-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201014083015.9074-1-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Replying to an old thread.

On Wed, Oct 14, 2020 at 11:30:15AM +0300, Sakari Ailus wrote:
> Use v4l2_get_link_freq helper and add support for sensor drivers
> implementing only V4L2_CID_PIXEL_RATE.
> 
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> since v1:
> 
> - Use %lld for printing long long int
> 
> - Remove r (unused variable)
> 
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 34 +++++++++---------------
>  1 file changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index c557d189200b..d060cfe473d8 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -33,6 +33,7 @@ struct ipu3_cio2_fmt {
>  	u32 mbus_code;
>  	u32 fourcc;
>  	u8 mipicode;
> +	u8 bpp;
>  };
>  
>  /*
> @@ -46,18 +47,22 @@ static const struct ipu3_cio2_fmt formats[] = {
>  		.mbus_code	= MEDIA_BUS_FMT_SGRBG10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_IPU3_SGRBG10,
>  		.mipicode	= 0x2b,
> +		.bpp		= 10,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SGBRG10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_IPU3_SGBRG10,
>  		.mipicode	= 0x2b,
> +		.bpp		= 10,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SBGGR10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_IPU3_SBGGR10,
>  		.mipicode	= 0x2b,
> +		.bpp		= 10,
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_SRGGB10_1X10,
>  		.fourcc		= V4L2_PIX_FMT_IPU3_SRGGB10,
>  		.mipicode	= 0x2b,
> +		.bpp		= 10,
>  	},
>  };
>  
> @@ -288,35 +293,20 @@ static s32 cio2_rx_timing(s32 a, s32 b, s64 freq, int def)
>  
>  /* Calculate the the delay value for termination enable of clock lane HS Rx */
>  static int cio2_csi2_calc_timing(struct cio2_device *cio2, struct cio2_queue *q,
> -				 struct cio2_csi2_timing *timing)
> +				 struct cio2_csi2_timing *timing,
> +				 unsigned int bpp, unsigned int lanes)
>  {
>  	struct device *dev = &cio2->pci_dev->dev;
> -	struct v4l2_querymenu qm = { .id = V4L2_CID_LINK_FREQ };
> -	struct v4l2_ctrl *link_freq;
>  	s64 freq;
> -	int r;
>  
>  	if (!q->sensor)
>  		return -ENODEV;
>  
> -	link_freq = v4l2_ctrl_find(q->sensor->ctrl_handler, V4L2_CID_LINK_FREQ);
> -	if (!link_freq) {
> -		dev_err(dev, "failed to find LINK_FREQ\n");
> -		return -EPIPE;
> -	}
> -
> -	qm.index = v4l2_ctrl_g_ctrl(link_freq);
> -	r = v4l2_querymenu(q->sensor->ctrl_handler, &qm);
> -	if (r) {
> -		dev_err(dev, "failed to get menu item\n");
> -		return r;
> -	}
> -
> -	if (!qm.value) {
> -		dev_err(dev, "error invalid link_freq\n");
> -		return -EINVAL;
> +	freq = v4l2_get_link_rate(q->sensor->ctrl_handler, bpp, lanes);

Shouldn't this use lanes * 2 ?

> +	if (freq < 0) {
> +		dev_err(dev, "error %lld, invalid link_freq\n", freq);
> +		return freq;
>  	}
> -	freq = qm.value;
>  
>  	timing->clk_termen = cio2_rx_timing(CIO2_CSIRX_DLY_CNT_TERMEN_CLANE_A,
>  					    CIO2_CSIRX_DLY_CNT_TERMEN_CLANE_B,
> @@ -364,7 +354,7 @@ static int cio2_hw_init(struct cio2_device *cio2, struct cio2_queue *q)
>  
>  	lanes = q->csi2.lanes;
>  
> -	r = cio2_csi2_calc_timing(cio2, q, &timing);
> +	r = cio2_csi2_calc_timing(cio2, q, &timing, fmt->bpp, lanes);
>  	if (r)
>  		return r;
>  

-- 
Regards,

Laurent Pinchart
