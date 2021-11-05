Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A18BC4461A2
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 10:52:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbhKEJyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 05:54:50 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:35545 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232829AbhKEJyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 05:54:47 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 2520860011;
        Fri,  5 Nov 2021 09:52:02 +0000 (UTC)
Date:   Fri, 5 Nov 2021 10:52:54 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        robh+dt@kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH 10/21] media: atmel: atmel-isc-base: report frame sizes
 as full supported range
Message-ID: <20211105095254.iueeneatxn2fm73k@uno.localdomain>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-11-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211022075247.518880-11-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen

On Fri, Oct 22, 2021 at 10:52:36AM +0300, Eugen Hristev wrote:
> The ISC supports a full broad range of frame sizes.
> Until now, the subdevice was queried for possible frame sizes and these
> were reported to the user space.
> However, the ISC should not care about which frame sizes the subdev supports,
> as long as this frame size is supported.
> Thus, report a continuous range from smallest frame size up to the max
> resolution.
>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>

Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
   j

> ---
>  drivers/media/platform/atmel/atmel-isc-base.c | 22 +++++++++----------
>  1 file changed, 10 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> index 8537ad73d160..2dd2511c7be1 100644
> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> @@ -1077,14 +1077,12 @@ static int isc_enum_framesizes(struct file *file, void *fh,
>  			       struct v4l2_frmsizeenum *fsize)
>  {
>  	struct isc_device *isc = video_drvdata(file);
> -	struct v4l2_subdev_frame_size_enum fse = {
> -		.code = isc->config.sd_format->mbus_code,
> -		.index = fsize->index,
> -		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> -	};
>  	int ret = -EINVAL;
>  	int i;
>
> +	if (fsize->index)
> +		return -EINVAL;
> +
>  	for (i = 0; i < isc->num_user_formats; i++)
>  		if (isc->user_formats[i]->fourcc == fsize->pixel_format)
>  			ret = 0;
> @@ -1096,14 +1094,14 @@ static int isc_enum_framesizes(struct file *file, void *fh,
>  	if (ret)
>  		return ret;
>
> -	ret = v4l2_subdev_call(isc->current_subdev->sd, pad, enum_frame_size,
> -			       NULL, &fse);
> -	if (ret)
> -		return ret;
> +	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
>
> -	fsize->type = V4L2_FRMSIZE_TYPE_DISCRETE;
> -	fsize->discrete.width = fse.max_width;
> -	fsize->discrete.height = fse.max_height;
> +	fsize->stepwise.min_width = 16;
> +	fsize->stepwise.max_width = isc->max_width;
> +	fsize->stepwise.min_height = 16;
> +	fsize->stepwise.max_height = isc->max_height;
> +	fsize->stepwise.step_width = 1;
> +	fsize->stepwise.step_height = 1;
>
>  	return 0;
>  }
> --
> 2.25.1
>
