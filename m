Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C983F363576
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:17:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhDRNSC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:18:02 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:59410 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRNSC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:18:02 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EB87499;
        Sun, 18 Apr 2021 15:17:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618751853;
        bh=arDTGC2qr7MP/xu8tYwawZFXsmHZhB29hky4zxN8gmQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ubSYPQVhST8wxVikRSuLYHOn0HxeNHoCgaY2uXWSU3zl3//GxdgkXyg9lONokZydz
         1XuKruagX/fIGg+llQXn1/BKl89oMRkM+aEeynvQbI4q4CRn82JIA6oMTqBNbPztxk
         kmI/ZW8q4vXhXL9EzTva5zzR1ezEZwAsSjDMKrLY=
Date:   Sun, 18 Apr 2021 16:17:30 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 24/28] media: ti-vpe: cal: add mbus_code support to
 cal_mc_enum_fmt_vid_cap
Message-ID: <YHwxasJRMDprsHpx@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-25-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-25-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:53PM +0300, Tomi Valkeinen wrote:
> Commit e5b6b07a1b45dd9d19bec1fa1d60750b0fcf2fb0 ("media: v4l2: Extend

You can abbreviate that to 12 characters if desired.

> VIDIOC_ENUM_FMT to support MC-centric devices") added support to
> enumerate formats based in mbus-code.
> 
> Add this feature to cal driver.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-video.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index ea9b13c16a06..1d9c0fce4b03 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -437,13 +437,28 @@ static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
>  static int cal_mc_enum_fmt_vid_cap(struct file *file, void  *priv,
>  				   struct v4l2_fmtdesc *f)
>  {
> +	unsigned int i;
> +	unsigned int idx;
> +
>  	if (f->index >= cal_num_formats)
>  		return -EINVAL;
>  
> -	f->pixelformat = cal_formats[f->index].fourcc;
> -	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;

As a shortcut, you could have

	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;

	if (!f->mbus_code) {
		f->pixelformat = cal_formats[f->index].fourcc;
		return 0;
	}

> +	idx = 0;
>  
> -	return 0;
> +	for (i = 0; i < cal_num_formats; ++i) {
> +		if (f->mbus_code && cal_formats[i].code != f->mbus_code)

And drop the first condition here, as well as f->type below. Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			continue;
> +
> +		if (idx == f->index) {
> +			f->pixelformat = cal_formats[i].fourcc;
> +			f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
> +			return 0;
> +		}
> +
> +		idx++;
> +	}
> +
> +	return -EINVAL;
>  }
>  
>  static void cal_mc_try_fmt(struct cal_ctx *ctx, struct v4l2_format *f,

-- 
Regards,

Laurent Pinchart
