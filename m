Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F25EA204AA
	for <lists+linux-media@lfdr.de>; Thu, 16 May 2019 13:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726597AbfEPL1C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 May 2019 07:27:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33900 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726383AbfEPL1C (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 May 2019 07:27:02 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 11D382FD;
        Thu, 16 May 2019 13:27:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1558006020;
        bh=FkJc/3DoxFLlNWst8DBdO9jA38GXg4sow+A0cr4TmWk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZHk6+aTmP33JJrSxExbeZ2Oatz9Xy7vWs51prYqdNi2fZ5bfufYEpYkAQjzSf0iRj
         61oI9F+CiRNgJ1RBwtaUR/nisOPAbSHDrMjrXgASJTh13/90L1JlHCgH2lIoRsnE1W
         4iHqzNfjWGcOcThhWQkTkhxHOfP8Ur4d1bF68vjM=
Date:   Thu, 16 May 2019 14:26:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Cc:     Ulrich Hecht <uli@fpond.eu>, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Ulrich Hecht <uli+renesas@fpond.eu>
Subject: Re: [PATCH v2 4/8] rcar-vin: Do not sync subdevice format when
 opening the video device
Message-ID: <20190516112644.GB14820@pendragon.ideasonboard.com>
References: <20190516011417.10590-1-niklas.soderlund+renesas@ragnatech.se>
 <20190516011417.10590-5-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190516011417.10590-5-niklas.soderlund+renesas@ragnatech.se>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Niklas,

Thank you for the patch.

On Thu, May 16, 2019 at 03:14:13AM +0200, Niklas Söderlund wrote:
> The format is already synced when the subdevice is bound, there is no
> need to do do it every time the video device is opened.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>

This seems a bug fix to me, formats should not be modified at open()
time according to the V4L2 spec. You may want to add a Fixes: line,
although I suppose this would go back to the origins of the driver, and
this series is likely not a candidate for the stable tree, so it may not
be a good idea.

I'm slightly worried of side effects as rvin_s_fmt_vid_cap() calls
rvin_try_format() which in turn calls v4l2_subdev_call(sd, pad, set_fmt,
pad_cfg, &format). If you're confident that there's no risk of breakage,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/rcar-vin/rcar-v4l2.c | 25 ---------------------
>  1 file changed, 25 deletions(-)
> 
> diff --git a/drivers/media/platform/rcar-vin/rcar-v4l2.c b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> index f67cef97b89a3bd4..71651c5a69483367 100644
> --- a/drivers/media/platform/rcar-vin/rcar-v4l2.c
> +++ b/drivers/media/platform/rcar-vin/rcar-v4l2.c
> @@ -782,38 +782,13 @@ static int rvin_initialize_device(struct file *file)
>  	struct rvin_dev *vin = video_drvdata(file);
>  	int ret;
>  
> -	struct v4l2_format f = {
> -		.type = V4L2_BUF_TYPE_VIDEO_CAPTURE,
> -		.fmt.pix = {
> -			.width		= vin->format.width,
> -			.height		= vin->format.height,
> -			.field		= vin->format.field,
> -			.colorspace	= vin->format.colorspace,
> -			.pixelformat	= vin->format.pixelformat,
> -		},
> -	};
> -
>  	ret = rvin_power_on(vin);
>  	if (ret < 0)
>  		return ret;
>  
> -	/*
> -	 * Try to configure with default parameters. Notice: this is the
> -	 * very first open, so, we cannot race against other calls,
> -	 * apart from someone else calling open() simultaneously, but
> -	 * .host_lock is protecting us against it.
> -	 */
> -	ret = rvin_s_fmt_vid_cap(file, NULL, &f);
> -	if (ret < 0)
> -		goto esfmt;
> -
>  	v4l2_ctrl_handler_setup(&vin->ctrl_handler);
>  
>  	return 0;
> -esfmt:
> -	rvin_power_off(vin);
> -
> -	return ret;
>  }
>  
>  static int rvin_open(struct file *file)

-- 
Regards,

Laurent Pinchart
