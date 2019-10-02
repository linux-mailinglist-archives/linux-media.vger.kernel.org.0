Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED06AC8901
	for <lists+linux-media@lfdr.de>; Wed,  2 Oct 2019 14:45:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfJBMpz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Oct 2019 08:45:55 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:54470 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbfJBMpz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 2 Oct 2019 08:45:55 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 29E5429017D
Message-ID: <c8665b68798982c958d672a65589a6f6b34311e4.camel@collabora.com>
Subject: Re: [PATCHv2 2/2] v4l2-ioctl.c: use new v4l2_fourcc_conv/args macros
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Date:   Wed, 02 Oct 2019 09:45:46 -0300
In-Reply-To: <20190916100433.24367-3-hverkuil-cisco@xs4all.nl>
References: <20190916100433.24367-1-hverkuil-cisco@xs4all.nl>
         <20190916100433.24367-3-hverkuil-cisco@xs4all.nl>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, 2019-09-16 at 12:04 +0200, Hans Verkuil wrote:
> Use these new standard macros to log the fourcc value in a
> human readable format.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 58 +++++++++-------------------
>  1 file changed, 18 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 51b912743f0f..8a302691447e 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -264,12 +264,9 @@ static void v4l_print_fmtdesc(const void *arg, bool write_only)
>  {
>  	const struct v4l2_fmtdesc *p = arg;
>  
> -	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=%c%c%c%c, description='%.*s'\n",
> +	pr_cont("index=%u, type=%s, flags=0x%x, pixelformat=" v4l2_fourcc_conv ", description='%.*s'\n",
>  		p->index, prt_names(p->type, v4l2_type_names),
> -		p->flags, (p->pixelformat & 0xff),
> -		(p->pixelformat >>  8) & 0xff,
> -		(p->pixelformat >> 16) & 0xff,
> -		(p->pixelformat >> 24) & 0xff,
> +		p->flags, v4l2_fourcc_args(p->pixelformat),
>  		(int)sizeof(p->description), p->description);
>  }
>  
> @@ -291,12 +288,9 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE:
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT:
>  		pix = &p->fmt.pix;
> -		pr_cont(", width=%u, height=%u, pixelformat=%c%c%c%c, field=%s, bytesperline=%u, sizeimage=%u, colorspace=%d, flags=0x%x,
> ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> +		pr_cont(", width=%u, height=%u, pixelformat=" v4l2_fourcc_conv ", field=%s, bytesperline=%u, sizeimage=%u, colorspace=%d, flags=0x%x,
> ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
>  			pix->width, pix->height,
> -			(pix->pixelformat & 0xff),
> -			(pix->pixelformat >>  8) & 0xff,
> -			(pix->pixelformat >> 16) & 0xff,
> -			(pix->pixelformat >> 24) & 0xff,
> +			v4l2_fourcc_args(pix->pixelformat),
>  			prt_names(pix->field, v4l2_field_names),
>  			pix->bytesperline, pix->sizeimage,
>  			pix->colorspace, pix->flags, pix->ycbcr_enc,
> @@ -305,12 +299,9 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>  		mp = &p->fmt.pix_mp;
> -		pr_cont(", width=%u, height=%u, format=%c%c%c%c, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u,
> xfer_func=%u\n",
> +		pr_cont(", width=%u, height=%u, format=" v4l2_fourcc_conv ", field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u,
> quantization=%u, xfer_func=%u\n",
>  			mp->width, mp->height,
> -			(mp->pixelformat & 0xff),
> -			(mp->pixelformat >>  8) & 0xff,
> -			(mp->pixelformat >> 16) & 0xff,
> -			(mp->pixelformat >> 24) & 0xff,
> +			v4l2_fourcc_args(mp->pixelformat),
>  			prt_names(mp->field, v4l2_field_names),
>  			mp->colorspace, mp->num_planes, mp->flags,
>  			mp->ycbcr_enc, mp->quantization, mp->xfer_func);
> @@ -358,20 +349,14 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	case V4L2_BUF_TYPE_SDR_CAPTURE:
>  	case V4L2_BUF_TYPE_SDR_OUTPUT:
>  		sdr = &p->fmt.sdr;
> -		pr_cont(", pixelformat=%c%c%c%c\n",
> -			(sdr->pixelformat >>  0) & 0xff,
> -			(sdr->pixelformat >>  8) & 0xff,
> -			(sdr->pixelformat >> 16) & 0xff,
> -			(sdr->pixelformat >> 24) & 0xff);
> +		pr_cont(", pixelformat=" v4l2_fourcc_conv "\n",
> +			v4l2_fourcc_args(sdr->pixelformat));
>  		break;
>  	case V4L2_BUF_TYPE_META_CAPTURE:
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		meta = &p->fmt.meta;
> -		pr_cont(", dataformat=%c%c%c%c, buffersize=%u\n",
> -			(meta->dataformat >>  0) & 0xff,
> -			(meta->dataformat >>  8) & 0xff,
> -			(meta->dataformat >> 16) & 0xff,
> -			(meta->dataformat >> 24) & 0xff,
> +		pr_cont(", dataformat=" v4l2_fourcc_conv ", buffersize=%u\n",
> +			v4l2_fourcc_args(meta->dataformat),
>  			meta->buffersize);
>  		break;
>  	}
> @@ -381,15 +366,12 @@ static void v4l_print_framebuffer(const void *arg, bool write_only)
>  {
>  	const struct v4l2_framebuffer *p = arg;
>  
> -	pr_cont("capability=0x%x, flags=0x%x, base=0x%p, width=%u, height=%u, pixelformat=%c%c%c%c, bytesperline=%u, sizeimage=%u, colorspace=%d\n",
> -			p->capability, p->flags, p->base,
> -			p->fmt.width, p->fmt.height,
> -			(p->fmt.pixelformat & 0xff),
> -			(p->fmt.pixelformat >>  8) & 0xff,
> -			(p->fmt.pixelformat >> 16) & 0xff,
> -			(p->fmt.pixelformat >> 24) & 0xff,
> -			p->fmt.bytesperline, p->fmt.sizeimage,
> -			p->fmt.colorspace);
> +	pr_cont("capability=0x%x, flags=0x%x, base=0x%p, width=%u, height=%u, pixelformat=" v4l2_fourcc_conv ", bytesperline=%u, sizeimage=%u,
> colorspace=%d\n",
> +		p->capability, p->flags, p->base,
> +		p->fmt.width, p->fmt.height,
> +		v4l2_fourcc_args(p->fmt.pixelformat),
> +		p->fmt.bytesperline, p->fmt.sizeimage,
> +		p->fmt.colorspace);
>  }
>  
>  static void v4l_print_buftype(const void *arg, bool write_only)
> @@ -1383,12 +1365,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  				return;
>  			WARN(1, "Unknown pixelformat 0x%08x\n", fmt->pixelformat);
>  			flags = 0;
> -			snprintf(fmt->description, sz, "%c%c%c%c%s",
> -					(char)(fmt->pixelformat & 0x7f),
> -					(char)((fmt->pixelformat >> 8) & 0x7f),
> -					(char)((fmt->pixelformat >> 16) & 0x7f),
> -					(char)((fmt->pixelformat >> 24) & 0x7f),
> -					(fmt->pixelformat & (1UL << 31)) ? "-BE" : "");
> +			snprintf(fmt->description, sz, v4l2_fourcc_conv,
> +				 v4l2_fourcc_args(fmt->pixelformat));
>  			break;
>  		}
>  	}

Nice cleanup!

I think these are the only media drivers that would have to be converted,
in case anyone wants to tackle this.

drivers/media/common/saa7146/saa7146_video.c:	      vv->ov_fmt->pixelformat, v4l2_field_names[vv->ov.win.field]);
drivers/media/platform/atmel/atmel-isc-base.c:			 (char *)&pixfmt->pixelformat, (char *)&sd_fmt->fourcc);
drivers/media/platform/sti/delta/delta-debug.c:		 (char *)&f->pixelformat, f->width, f->height,
drivers/media/platform/vsp1/vsp1_drm.c:		cfg->pixelformat, cfg->pitch, &cfg->mem[0], &cfg->mem[1],

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks,
Ezequiel

