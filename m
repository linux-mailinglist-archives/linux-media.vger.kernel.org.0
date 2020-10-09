Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61290289025
	for <lists+linux-media@lfdr.de>; Fri,  9 Oct 2020 19:41:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733006AbgJIRQ2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 9 Oct 2020 13:16:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733034AbgJIRPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 9 Oct 2020 13:15:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D50C0613D2
        for <linux-media@vger.kernel.org>; Fri,  9 Oct 2020 10:15:43 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2187D539;
        Fri,  9 Oct 2020 19:15:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1602263742;
        bh=iGikRoc5tLt2PbUKHNqPjws9QgJcPuhkSS9EZiiS5Hg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HG4sPlrZY7aGQVcWAzDnWHZs7rH/9Dw0HXfnFypwcTsUq+YWVBIt+0cnnlbahlN+J
         cka8qbDYCbmstWEDQZ5RLVeV3T0q/oHwZu0xHGfVV+cwlGzcPj17ieJjev966rSjIc
         ZZGJYXU5FMZmtwq8Ch2YdrW9CrvV435hmRLuB79U=
Date:   Fri, 9 Oct 2020 20:14:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Tsuchiya Yuto <kitakar@gmail.com>,
        bingbu.cao@intel.com, Yong Zhi <yong.zhi@intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>
Subject: Re: [PATCH 4/5] ipu3-cio2: Validate mbus format in setting subdev
 format
Message-ID: <20201009171459.GA24849@pendragon.ideasonboard.com>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
 <20201009150756.3397-5-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201009150756.3397-5-sakari.ailus@linux.intel.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thank you for the patch.

On Fri, Oct 09, 2020 at 06:07:55PM +0300, Sakari Ailus wrote:
> Validate media bus code, width and height when setting the subdev format.
> 
> This effectively reworks how setting subdev format is implemented in the
> driver.
> 
> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 28 ++++++++++++++++--------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 9c7b527a8800..9726091c9985 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1257,6 +1257,9 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
>  			       struct v4l2_subdev_format *fmt)
>  {
>  	struct cio2_queue *q = container_of(sd, struct cio2_queue, subdev);
> +	struct v4l2_mbus_framefmt *mbus;
> +	u32 mbus_code = fmt->format.code;
> +	unsigned int i;
>  
>  	/*
>  	 * Only allow setting sink pad format;
> @@ -1265,18 +1268,25 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *sd,
>  	if (fmt->pad == CIO2_PAD_SOURCE)
>  		return cio2_subdev_get_fmt(sd, cfg, fmt);
>  
> -	mutex_lock(&q->subdev_lock);
> +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> +		mbus = v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> +	else
> +		mbus = &q->subdev_fmt;
>  
> -	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
> -		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) = fmt->format;
> -	} else {
> -		/* It's the sink, allow changing frame size */
> -		q->subdev_fmt.width = fmt->format.width;
> -		q->subdev_fmt.height = fmt->format.height;
> -		q->subdev_fmt.code = fmt->format.code;
> -		fmt->format = q->subdev_fmt;
> +	fmt->format.code = formats[0].mbus_code;
> +
> +	for (i = 0; i < ARRAY_SIZE(formats); i++) {
> +		if (formats[i].mbus_code == fmt->format.code) {
> +			fmt->format.code = mbus_code;
> +			break;
> +		}
>  	}

I really, really wish C had a for...else construct as in Python :-(

>  
> +	fmt->format.width = min(fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
> +	fmt->format.height = min(fmt->format.height, CIO2_IMAGE_MAX_LENGTH);

This looks good, but it would be worth renaming CIO2_IMAGE_MAX_LENGTH to
CIO2_IMAGE_MAX_HEIGHT in a separate patch.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	mutex_lock(&q->subdev_lock);
> +	*mbus = fmt->format;
>  	mutex_unlock(&q->subdev_lock);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
