Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8A2C446156
	for <lists+linux-media@lfdr.de>; Fri,  5 Nov 2021 10:23:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbhKEJZv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Nov 2021 05:25:51 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:43947 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbhKEJZu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Nov 2021 05:25:50 -0400
Received: (Authenticated sender: jacopo@jmondi.org)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id 735E6200016;
        Fri,  5 Nov 2021 09:23:07 +0000 (UTC)
Date:   Fri, 5 Nov 2021 10:23:59 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        laurent.pinchart@ideasonboard.com, sakari.ailus@iki.fi,
        robh+dt@kernel.org, nicolas.ferre@microchip.com
Subject: Re: [PATCH 09/21] media: atmel: atmel-isc-base: remove
 frameintervals VIDIOC
Message-ID: <20211105092359.qlogekdzzk6nnjs2@uno.localdomain>
References: <20211022075247.518880-1-eugen.hristev@microchip.com>
 <20211022075247.518880-10-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211022075247.518880-10-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen

On Fri, Oct 22, 2021 at 10:52:35AM +0300, Eugen Hristev wrote:
> VIDIOC_ENUM_FRAMEINTERVALS is not recommended for a top video driver.
> The frame rate is defined by the sensor subdevice, thus it can be queried
> directly by anyone interested in the frame intervals.

This change makes sense in the context of moving towards media
controller, but I wonder how does this impact existing userspace that
relies on this.

Anyway
Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j
>
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  drivers/media/platform/atmel/atmel-isc-base.c | 37 -------------------
>  1 file changed, 37 deletions(-)
>
> diff --git a/drivers/media/platform/atmel/atmel-isc-base.c b/drivers/media/platform/atmel/atmel-isc-base.c
> index 6f14cc549543..8537ad73d160 100644
> --- a/drivers/media/platform/atmel/atmel-isc-base.c
> +++ b/drivers/media/platform/atmel/atmel-isc-base.c
> @@ -1108,42 +1108,6 @@ static int isc_enum_framesizes(struct file *file, void *fh,
>  	return 0;
>  }
>
> -static int isc_enum_frameintervals(struct file *file, void *fh,
> -				    struct v4l2_frmivalenum *fival)
> -{
> -	struct isc_device *isc = video_drvdata(file);
> -	struct v4l2_subdev_frame_interval_enum fie = {
> -		.code = isc->config.sd_format->mbus_code,
> -		.index = fival->index,
> -		.width = fival->width,
> -		.height = fival->height,
> -		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
> -	};
> -	int ret = -EINVAL;
> -	unsigned int i;
> -
> -	for (i = 0; i < isc->num_user_formats; i++)
> -		if (isc->user_formats[i]->fourcc == fival->pixel_format)
> -			ret = 0;
> -
> -	for (i = 0; i < isc->controller_formats_size; i++)
> -		if (isc->controller_formats[i].fourcc == fival->pixel_format)
> -			ret = 0;
> -
> -	if (ret)
> -		return ret;
> -
> -	ret = v4l2_subdev_call(isc->current_subdev->sd, pad,
> -			       enum_frame_interval, NULL, &fie);
> -	if (ret)
> -		return ret;
> -
> -	fival->type = V4L2_FRMIVAL_TYPE_DISCRETE;
> -	fival->discrete = fie.interval;
> -
> -	return 0;
> -}
> -
>  static const struct v4l2_ioctl_ops isc_ioctl_ops = {
>  	.vidioc_querycap		= isc_querycap,
>  	.vidioc_enum_fmt_vid_cap	= isc_enum_fmt_vid_cap,
> @@ -1168,7 +1132,6 @@ static const struct v4l2_ioctl_ops isc_ioctl_ops = {
>  	.vidioc_g_parm			= isc_g_parm,
>  	.vidioc_s_parm			= isc_s_parm,
>  	.vidioc_enum_framesizes		= isc_enum_framesizes,
> -	.vidioc_enum_frameintervals	= isc_enum_frameintervals,
>
>  	.vidioc_log_status		= v4l2_ctrl_log_status,
>  	.vidioc_subscribe_event		= v4l2_ctrl_subscribe_event,
> --
> 2.25.1
>
