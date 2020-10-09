Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2DB287F85
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 02:40:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728703AbgJIAkk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 20:40:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725852AbgJIAkk (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 8 Oct 2020 20:40:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A504AC0613D2
        for <linux-media@vger.kernel.org>; Thu,  8 Oct 2020 17:40:39 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A57E59E;
        Fri,  9 Oct 2020 02:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602204037;
        bh=fo+9158993ZSaDHrSomyh7fkSLlt5EjyfBb7VFb0MFQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OmIRY+2QkS16m4d2GesTzgyt3ZMrv5RRLPE4PpoC2U1KD4WRLgssEZ34Wrr2WupW2
         bNQWMTcj9YOTzRbjs/cbh1QrHOIbaV650+4hmfYz3iXTlOmwZOqp+GvqXKvVrBtVGR
         7vwwBhzVpW/YLN0lWpHhtfP7h/l7wSKQvQTm0WsA=
Date:   Fri, 9 Oct 2020 03:39:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tsuchiya Yuto <kitakar@gmail.com>,
        bingbu.cao@intel.com, Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH 1/3] ipu3-cio2: Return actual subdev format
Message-ID: <20201009003954.GA12857@pendragon.ideasonboard.com>
References: <20201008204747.26320-1-sakari.ailus@linux.intel.com>
 <20201008204747.26320-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201008204747.26320-2-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Thu, Oct 08, 2020 at 11:47:45PM +0300, Sakari Ailus wrote:
> Return actual subdev format on ipu3-cio2 subdev pads. The earlier
> implementation was based on an infinite recursion that exhausted the
> stack.

A bad idea indeed :-)

> Reported-by: Tsuchiya Yuto <kitakar@gmail.com>
> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 4e598e937dfe..afa472026ba4 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1232,29 +1232,11 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev *sd,
>  			       struct v4l2_subdev_format *fmt)
>  {
>  	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
> -	struct v4l2_subdev_format format;
> -	int ret;
>  
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
>  		fmt->format = *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> -		return 0;
> -	}
> -
> -	if (fmt->pad == CIO2_PAD_SINK) {
> -		format.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> -		ret = v4l2_subdev_call(sd, pad, get_fmt, NULL,
> -				       &format);
> -
> -		if (ret)
> -			return ret;
> -		/* update colorspace etc */
> -		q->subdev_fmt.colorspace = format.format.colorspace;
> -		q->subdev_fmt.ycbcr_enc = format.format.ycbcr_enc;
> -		q->subdev_fmt.quantization = format.format.quantization;
> -		q->subdev_fmt.xfer_func = format.format.xfer_func;
> -	}
> -
> -	fmt->format = q->subdev_fmt;

I'm pretty speechless. All I can say is

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

and let's forget this has ever existed :-)

> +	else
> +		fmt->format = q->subdev_fmt;
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
