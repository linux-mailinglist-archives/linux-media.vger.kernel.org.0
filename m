Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AE7536357A
	for <lists+linux-media@lfdr.de>; Sun, 18 Apr 2021 15:18:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhDRNTQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 18 Apr 2021 09:19:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhDRNTQ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 18 Apr 2021 09:19:16 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24287C06174A
        for <linux-media@vger.kernel.org>; Sun, 18 Apr 2021 06:18:48 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 887AD499;
        Sun, 18 Apr 2021 15:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1618751926;
        bh=+6scWzCAnVnMJ6Uz6DU6M3Vi7Yu8KyM1LG8npFs61uA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OZFZBBgcUeZ8IV0plf9rKuuMmLkcvYNnnexPmNvDe0dAiVenxkLYgPSPhBa/Xo7ur
         pQ2TW7r7amVW+X50EZNmGg5e6Nc7YmBqhcg6pEOXsrkbIE/4T42RckyJnZzYNzKBRP
         Z09rxe8mjdURAYg6ANZa3HPijAasja0rbbVChrD4=
Date:   Sun, 18 Apr 2021 16:18:43 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Benoit Parrot <bparrot@ti.com>, Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>, linux-media@vger.kernel.org
Subject: Re: [PATCH 25/28] media: ti-vpe: cal: rename non-MC funcs to
 cal_legacy_*
Message-ID: <YHwxsymQFKxSW2gS@pendragon.ideasonboard.com>
References: <20210412113457.328012-1-tomi.valkeinen@ideasonboard.com>
 <20210412113457.328012-26-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210412113457.328012-26-tomi.valkeinen@ideasonboard.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Mon, Apr 12, 2021 at 02:34:54PM +0300, Tomi Valkeinen wrote:
> To make it more obvious if the function in question is dealing with
> media-controller API or the legacy API, rename legacy API functions to
> cal_legacy_*.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/platform/ti-vpe/cal-video.c | 46 +++++++++++------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/media/platform/ti-vpe/cal-video.c b/drivers/media/platform/ti-vpe/cal-video.c
> index 1d9c0fce4b03..0494cd04b9a5 100644
> --- a/drivers/media/platform/ti-vpe/cal-video.c
> +++ b/drivers/media/platform/ti-vpe/cal-video.c
> @@ -102,7 +102,7 @@ static const struct cal_format_info *find_format_by_code(struct cal_ctx *ctx,
>  	return NULL;
>  }
>  
> -static int cal_enum_fmt_vid_cap(struct file *file, void  *priv,
> +static int cal_legacy_enum_fmt_vid_cap(struct file *file, void  *priv,
>  				struct v4l2_fmtdesc *f)

Could you update the indentation ? Same below.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  {
>  	struct cal_ctx *ctx = video_drvdata(file);
> @@ -189,7 +189,7 @@ static void cal_calc_format_size(struct cal_ctx *ctx,
>  		f->fmt.pix.bytesperline, f->fmt.pix.sizeimage);
>  }
>  
> -static int cal_try_fmt_vid_cap(struct file *file, void *priv,
> +static int cal_legacy_try_fmt_vid_cap(struct file *file, void *priv,
>  			       struct v4l2_format *f)
>  {
>  	struct cal_ctx *ctx = video_drvdata(file);
> @@ -249,7 +249,7 @@ static int cal_try_fmt_vid_cap(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static int cal_s_fmt_vid_cap(struct file *file, void *priv,
> +static int cal_legacy_s_fmt_vid_cap(struct file *file, void *priv,
>  			     struct v4l2_format *f)
>  {
>  	struct cal_ctx *ctx = video_drvdata(file);
> @@ -266,7 +266,7 @@ static int cal_s_fmt_vid_cap(struct file *file, void *priv,
>  		return -EBUSY;
>  	}
>  
> -	ret = cal_try_fmt_vid_cap(file, priv, f);
> +	ret = cal_legacy_try_fmt_vid_cap(file, priv, f);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -300,7 +300,7 @@ static int cal_s_fmt_vid_cap(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static int cal_enum_framesizes(struct file *file, void *fh,
> +static int cal_legacy_enum_framesizes(struct file *file, void *fh,
>  			       struct v4l2_frmsizeenum *fsize)
>  {
>  	struct cal_ctx *ctx = video_drvdata(file);
> @@ -337,7 +337,7 @@ static int cal_enum_framesizes(struct file *file, void *fh,
>  	return 0;
>  }
>  
> -static int cal_enum_input(struct file *file, void *priv,
> +static int cal_legacy_enum_input(struct file *file, void *priv,
>  			  struct v4l2_input *inp)
>  {
>  	if (inp->index > 0)
> @@ -348,19 +348,19 @@ static int cal_enum_input(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static int cal_g_input(struct file *file, void *priv, unsigned int *i)
> +static int cal_legacy_g_input(struct file *file, void *priv, unsigned int *i)
>  {
>  	*i = 0;
>  	return 0;
>  }
>  
> -static int cal_s_input(struct file *file, void *priv, unsigned int i)
> +static int cal_legacy_s_input(struct file *file, void *priv, unsigned int i)
>  {
>  	return i > 0 ? -EINVAL : 0;
>  }
>  
>  /* timeperframe is arbitrary and continuous */
> -static int cal_enum_frameintervals(struct file *file, void *priv,
> +static int cal_legacy_enum_frameintervals(struct file *file, void *priv,
>  				   struct v4l2_frmivalenum *fival)
>  {
>  	struct cal_ctx *ctx = video_drvdata(file);
> @@ -388,27 +388,27 @@ static int cal_enum_frameintervals(struct file *file, void *priv,
>  	return 0;
>  }
>  
> -static int cal_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
> +static int cal_legacy_g_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  {
>  	struct cal_ctx *ctx = video_drvdata(file);
>  
>  	return v4l2_g_parm_cap(video_devdata(file), ctx->phy->source, a);
>  }
>  
> -static int cal_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
> +static int cal_legacy_s_parm(struct file *file, void *fh, struct v4l2_streamparm *a)
>  {
>  	struct cal_ctx *ctx = video_drvdata(file);
>  
>  	return v4l2_s_parm_cap(video_devdata(file), ctx->phy->source, a);
>  }
>  
> -static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
> +static const struct v4l2_ioctl_ops cal_ioctl_legacy_ops = {
>  	.vidioc_querycap      = cal_querycap,
> -	.vidioc_enum_fmt_vid_cap  = cal_enum_fmt_vid_cap,
> +	.vidioc_enum_fmt_vid_cap  = cal_legacy_enum_fmt_vid_cap,
>  	.vidioc_g_fmt_vid_cap     = cal_g_fmt_vid_cap,
> -	.vidioc_try_fmt_vid_cap   = cal_try_fmt_vid_cap,
> -	.vidioc_s_fmt_vid_cap     = cal_s_fmt_vid_cap,
> -	.vidioc_enum_framesizes   = cal_enum_framesizes,
> +	.vidioc_try_fmt_vid_cap   = cal_legacy_try_fmt_vid_cap,
> +	.vidioc_s_fmt_vid_cap     = cal_legacy_s_fmt_vid_cap,
> +	.vidioc_enum_framesizes   = cal_legacy_enum_framesizes,
>  	.vidioc_reqbufs       = vb2_ioctl_reqbufs,
>  	.vidioc_create_bufs   = vb2_ioctl_create_bufs,
>  	.vidioc_prepare_buf   = vb2_ioctl_prepare_buf,
> @@ -416,17 +416,17 @@ static const struct v4l2_ioctl_ops cal_ioctl_video_ops = {
>  	.vidioc_qbuf          = vb2_ioctl_qbuf,
>  	.vidioc_dqbuf         = vb2_ioctl_dqbuf,
>  	.vidioc_expbuf        = vb2_ioctl_expbuf,
> -	.vidioc_enum_input    = cal_enum_input,
> -	.vidioc_g_input       = cal_g_input,
> -	.vidioc_s_input       = cal_s_input,
> -	.vidioc_enum_frameintervals = cal_enum_frameintervals,
> +	.vidioc_enum_input    = cal_legacy_enum_input,
> +	.vidioc_g_input       = cal_legacy_g_input,
> +	.vidioc_s_input       = cal_legacy_s_input,
> +	.vidioc_enum_frameintervals = cal_legacy_enum_frameintervals,
>  	.vidioc_streamon      = vb2_ioctl_streamon,
>  	.vidioc_streamoff     = vb2_ioctl_streamoff,
>  	.vidioc_log_status    = v4l2_ctrl_log_status,
>  	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>  	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> -	.vidioc_g_parm		= cal_g_parm,
> -	.vidioc_s_parm		= cal_s_parm,
> +	.vidioc_g_parm		= cal_legacy_g_parm,
> +	.vidioc_s_parm		= cal_legacy_s_parm,
>  };
>  
>  /* ------------------------------------------------------------------
> @@ -966,7 +966,7 @@ int cal_ctx_v4l2_init(struct cal_ctx *ctx)
>  	vfd->queue = q;
>  	snprintf(vfd->name, sizeof(vfd->name), "CAL output %u", ctx->dma_ctx);
>  	vfd->release = video_device_release_empty;
> -	vfd->ioctl_ops = cal_mc_api ? &cal_ioctl_mc_ops : &cal_ioctl_video_ops;
> +	vfd->ioctl_ops = cal_mc_api ? &cal_ioctl_mc_ops : &cal_ioctl_legacy_ops;
>  	vfd->lock = &ctx->mutex;
>  	video_set_drvdata(vfd, ctx);
>  

-- 
Regards,

Laurent Pinchart
