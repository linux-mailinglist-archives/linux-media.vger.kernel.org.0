Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E91D0180D4D
	for <lists+linux-media@lfdr.de>; Wed, 11 Mar 2020 02:11:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727946AbgCKBL3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Mar 2020 21:11:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58888 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727528AbgCKBL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Mar 2020 21:11:29 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4CC445F;
        Wed, 11 Mar 2020 02:11:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1583889088;
        bh=zOxb/XPWIzzpfBdh3AVmyz5kHdMYkbB+MYcAU7NV3F8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oY6dAoI/KHDOOmzCs7tXXFr5HM2l6c6wen2k7tdsf2+fxEFfSkoYAHkQnCcOjZwVk
         0q5N70sR0R5JQ7RZRYHYp0rEz4LGbrCNTj4ch+GNme5uisfB4eYvulLRFe702BczgM
         nhbW5Y8h1K0EfKp9v431XEFYJ+GIHTPUDwXSfOGk=
Date:   Wed, 11 Mar 2020 03:11:24 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Helen Koike <helen.koike@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v4 2/3] rcar-vin: Make use of V4L2_CAP_IO_MC
Message-ID: <20200311011124.GD4871@pendragon.ideasonboard.com>
References: <20200306163935.805333-1-niklas.soderlund@ragnatech.se>
 <20200306163935.805333-3-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200306163935.805333-3-niklas.soderlund@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Fri, Mar 06, 2020 at 05:39:34PM +0100, Niklas Söderlund wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Set the V4L2_CAP_IO_MC capability flag and remove the driver specific
> vidioc_enum_input, vidioc_g_input and vidioc_s_input callbacks for the
> media controller enabled part of the driver.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 17 +----------------
>  1 file changed, 1 insertion(+), 16 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index 5151a3cd8a6e6754..96ddd36619167fd5 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -767,18 +767,6 @@ static int rvin_mc_s_fmt_vid_cap(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static int rvin_mc_enum_input(struct file *file, void *priv,
> -			      struct v4l2_input *i)
> -{
> -	if (i->index != 0)
> -		return -EINVAL;
> -
> -	i->type = V4L2_INPUT_TYPE_CAMERA;
> -	strscpy(i->name, "Camera", sizeof(i->name));
> -
> -	return 0;
> -}
> -
>  static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
>  	.vidioc_querycap		= rvin_querycap,
>  	.vidioc_try_fmt_vid_cap		= rvin_mc_try_fmt_vid_cap,
> @@ -786,10 +774,6 @@ static const struct v4l2_ioctl_ops rvin_mc_ioctl_ops = {
>  	.vidioc_s_fmt_vid_cap		= rvin_mc_s_fmt_vid_cap,
>  	.vidioc_enum_fmt_vid_cap	= rvin_enum_fmt_vid_cap,
>  
> -	.vidioc_enum_input		= rvin_mc_enum_input,
> -	.vidioc_g_input			= rvin_g_input,
> -	.vidioc_s_input			= rvin_s_input,
> -
>  	.vidioc_reqbufs			= vb2_ioctl_reqbufs,
>  	.vidioc_create_bufs		= vb2_ioctl_create_bufs,
>  	.vidioc_querybuf		= vb2_ioctl_querybuf,
> @@ -961,6 +945,7 @@ int rvin_v4l2_register(struct rvin_dev *vin)
>  	vin->format.colorspace = RVIN_DEFAULT_COLORSPACE;
>  
>  	if (vin->info->use_mc) {
> +		vdev->device_caps |= V4L2_CAP_IO_MC;
>  		vdev->ioctl_ops = &rvin_mc_ioctl_ops;
>  	} else {
>  		vdev->ioctl_ops = &rvin_ioctl_ops;

-- 
Regards,

Laurent Pinchart
