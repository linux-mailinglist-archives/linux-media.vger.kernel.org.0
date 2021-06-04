Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5EC39BB0B
	for <lists+linux-media@lfdr.de>; Fri,  4 Jun 2021 16:42:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhFDOnz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Jun 2021 10:43:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229778AbhFDOnz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Jun 2021 10:43:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF498C061766
        for <linux-media@vger.kernel.org>; Fri,  4 Jun 2021 07:42:08 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DACD2A3;
        Fri,  4 Jun 2021 16:42:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1622817726;
        bh=K+D7n4Am9aFehjxSqR/gX09tbSAn+MHWNBX0sJiQCY4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WhP2E4EaFLQMWySqhFNAz0AwNTawqjzh5t+nI9tj1zLAYUvv9A/vyWPQfyxcSKiCw
         u/nCjRl68vZmSzjBJ69mvlnx6u2LmAyIkIqoHHW+Vo4SO0SL0LGWOr1OfQRW8Ms9UI
         FOT+b6GUEcZrvDNS3hh4yFrxRPYYxTB+MxbwJADg=
Date:   Fri, 4 Jun 2021 17:41:53 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Subject: Re: [PATCH v2 2/3] media: vivid: remove stream_sliced_vbi_cap field
Message-ID: <YLo7sdZd9S7qmVXI@pendragon.ideasonboard.com>
References: <20210412110211.275791-1-tomi.valkeinen@ideasonboard.com>
 <20210412110211.275791-3-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412110211.275791-3-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:02:10PM +0300, Tomi Valkeinen wrote:
> Vivid tracks the VBI capture mode in vivid_dev->stream_sliced_vbi_cap
> field.  We can just look at the buffer type instead, and drop the field.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/test-drivers/vivid/vivid-core.h        | 1 -
>  drivers/media/test-drivers/vivid/vivid-kthread-cap.c | 2 +-
>  drivers/media/test-drivers/vivid/vivid-vbi-cap.c     | 6 ++----
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/test-drivers/vivid/vivid-core.h b/drivers/media/test-drivers/vivid/vivid-core.h
> index 9c2d1470b597..9af7e843c2cf 100644
> --- a/drivers/media/test-drivers/vivid/vivid-core.h
> +++ b/drivers/media/test-drivers/vivid/vivid-core.h
> @@ -428,7 +428,6 @@ struct vivid_dev {
>  	u32				vbi_cap_seq_start;
>  	u32				vbi_cap_seq_count;
>  	bool				vbi_cap_streaming;
> -	bool				stream_sliced_vbi_cap;
>  	u32				meta_cap_seq_start;
>  	u32				meta_cap_seq_count;
>  	bool				meta_cap_streaming;
> diff --git a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
> index 67fb3c00f9ad..781763c193eb 100644
> --- a/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-kthread-cap.c
> @@ -750,7 +750,7 @@ static noinline_for_stack void vivid_thread_vid_cap_tick(struct vivid_dev *dev,
>  
>  		v4l2_ctrl_request_setup(vbi_cap_buf->vb.vb2_buf.req_obj.req,
>  					&dev->ctrl_hdl_vbi_cap);
> -		if (dev->stream_sliced_vbi_cap)
> +		if (vbi_cap_buf->vb.vb2_buf.type == V4L2_BUF_TYPE_SLICED_VBI_CAPTURE)
>  			vivid_sliced_vbi_cap_process(dev, vbi_cap_buf);
>  		else
>  			vivid_raw_vbi_cap_process(dev, vbi_cap_buf);
> diff --git a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> index 1a9348eea781..387df4ff01b0 100644
> --- a/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> +++ b/drivers/media/test-drivers/vivid/vivid-vbi-cap.c
> @@ -255,9 +255,8 @@ int vidioc_s_fmt_vbi_cap(struct file *file, void *priv,
>  
>  	if (ret)
>  		return ret;
> -	if (dev->stream_sliced_vbi_cap && vb2_is_busy(&dev->vb_vbi_cap_q))
> +	if (f->type != V4L2_BUF_TYPE_VBI_CAPTURE && vb2_is_busy(&dev->vb_vbi_cap_q))

I think think this is correct. The code checks if the currently
configured format is the sliced variant, and you replace this with a
check for the new format.

>  		return -EBUSY;
> -	dev->stream_sliced_vbi_cap = false;
>  	dev->vbi_cap_dev.queue->type = V4L2_BUF_TYPE_VBI_CAPTURE;
>  	return 0;
>  }
> @@ -322,10 +321,9 @@ int vidioc_s_fmt_sliced_vbi_cap(struct file *file, void *fh, struct v4l2_format
>  
>  	if (ret)
>  		return ret;
> -	if (!dev->stream_sliced_vbi_cap && vb2_is_busy(&dev->vb_vbi_cap_q))
> +	if (fmt->type != V4L2_BUF_TYPE_SLICED_VBI_CAPTURE && vb2_is_busy(&dev->vb_vbi_cap_q))
>  		return -EBUSY;
>  	dev->service_set_cap = vbi->service_set;
> -	dev->stream_sliced_vbi_cap = true;
>  	dev->vbi_cap_dev.queue->type = V4L2_BUF_TYPE_SLICED_VBI_CAPTURE;
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
