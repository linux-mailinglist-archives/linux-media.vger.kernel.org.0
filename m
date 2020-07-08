Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C41A217D73
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 05:17:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728417AbgGHDRC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Jul 2020 23:17:02 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40140 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728061AbgGHDRC (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Jul 2020 23:17:02 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: ezequiel)
        with ESMTPSA id 388982A1895
Message-ID: <f26407dbf3efc6cc046daaabdbe75c516743a187.camel@collabora.com>
Subject: Re: [PATCH v2 10/12] media: rkvdec: Lock capture pixel format in
 s_ctrl and s_fmt
From:   Ezequiel Garcia <ezequiel@collabora.com>
To:     Jonas Karlman <jonas@kwiboo.se>, linux-media@vger.kernel.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     Hans Verkuil <hans.verkuil@cisco.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 08 Jul 2020 00:16:50 -0300
In-Reply-To: <20200706215430.22859-11-jonas@kwiboo.se>
References: <20200701215616.30874-1-jonas@kwiboo.se>
         <20200706215430.22859-1-jonas@kwiboo.se>
         <20200706215430.22859-11-jonas@kwiboo.se>
Organization: Collabora
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jonas,

Nice work!

On Mon, 2020-07-06 at 21:54 +0000, Jonas Karlman wrote:
> Add an optional valid_fmt operation that should return the valid
> pixelformat of CAPTURE buffers.
> 
> This is used in next patch to ensure correct pixelformat is used for 10-bit
> and 4:2:2 content.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v2:
> - Reworked validation of pixelformat
> 
> Limitations:
> - Only a single valid format is supported, technically both CbCr and CrCb
>   format variants could be supported by HW.
> 
> Example call order using ffmpeg for a 10-bit H.264 608x480 video:
> 
> 0) Open /dev/video node
> rkvdec_reset_decoded_fmt: current valid_fmt= new valid_fmt=

Controls and formats always have some defined value.
So the concept of "valid format" is always what's
currently valid, and is what TRY_FMT accepts.

The applications get the currently set format with G_FMT.
As per the specification, there is always a format
set, which is why have to do all that annoying format
reset dance.

For instance, if the initial v4l2_ctrl_h264_sps.bit_depth_luma_minus8
is 0x0 and .chroma_format_idc is 0x1 [1] as well then our initial
valid format would be NV12.

See below.

[1] v4l2_ctrl_h264_sps is all 0x0 by default, but
that's something to address on std_init_compound.
 
> rkvdec_fill_decoded_pixfmt: pixelformat=NV12 width=64 height=48
> rkvdec_s_ctrl: current valid_fmt= new valid_fmt=NV12
> rkvdec_fill_decoded_pixfmt: pixelformat=NV12 width=64 height=48
> 
> 1) Set the coded format on the OUTPUT queue via VIDIOC_S_FMT()
> rkvdec_enum_output_fmt: index=0 pixelformat=S264
> rkvdec_s_output_fmt: pixelformat=S264 width=608 height=480 valid_fmt=NV12
> rkvdec_reset_decoded_fmt: current valid_fmt=NV12 new valid_fmt=
> rkvdec_fill_decoded_pixfmt: pixelformat=NV12 width=640 height=480
> 
> 2) Call VIDIOC_S_EXT_CTRLS() to set all the controls
> rkvdec_try_ctrl: current valid_fmt=
> rkvdec_s_ctrl: current valid_fmt= new valid_fmt=NV15
> rkvdec_fill_decoded_pixfmt: pixelformat=NV15 width=640 height=480
> 
> 3) Call VIDIOC_G_FMT() for CAPTURE queue
> rkvdec_g_capture_fmt: pixelformat=NV15 width=640 height=480
> 
> 4) Enumerate CAPTURE formats via VIDIOC_ENUM_FMT() on the CAPTURE queue
> rkvdec_enum_capture_fmt: index=0 pixelformat=NV15 valid_fmt=NV15
> 
> 5) Choose a different CAPTURE format than suggested via VIDIOC_G_FMT()
> rkvdec_s_capture_fmt: pixelformat=NV15 width=608 height=480 valid_fmt=NV15
> rkvdec_fill_decoded_pixfmt: pixelformat=NV15 width=640 height=480
> rkvdec_g_capture_fmt: pixelformat=NV15 width=640 height=480
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 59 ++++++++++++++++++++++++---
>  drivers/staging/media/rkvdec/rkvdec.h |  2 +
>  2 files changed, 55 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 911132be6d50..11a88cb6407d 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -38,6 +38,16 @@ static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
>  	pix_mp->field = V4L2_FIELD_NONE;
>  }
>  
> +static u32 rkvdec_valid_fmt(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl)
> +{
> +	const struct rkvdec_coded_fmt_desc *coded_desc = ctx->coded_fmt_desc;
> +
> +	if (coded_desc->ops->valid_fmt)
> +		return coded_desc->ops->valid_fmt(ctx, ctrl);
> +
> +	return ctx->valid_fmt;
> +}
> +
>  static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
> @@ -60,6 +70,10 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>  			/* Only 8-bit is supported */
>  			return -EINVAL;
>  
> +		if (ctx->valid_fmt && ctx->valid_fmt != rkvdec_valid_fmt(ctx, ctrl))
> +			/* Only current valid format */
> +			return -EINVAL;
> +

I think the user should be able to set the SPS to anything supported
and syntax-legal, and that would effectively reset the valid format.

Maybe it also means these drivers can't accept a new SPS if there
are buffers allocated (vb2_is_busy) ?

>  		width = (sps->pic_width_in_mbs_minus1 + 1) * 16;
>  		height = (sps->pic_height_in_map_units_minus1 + 1) * 16;
>  
> @@ -70,8 +84,27 @@ static int rkvdec_try_ctrl(struct v4l2_ctrl *ctrl)
>  	return 0;
>  }
>  
> +static int rkvdec_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct rkvdec_ctx *ctx = container_of(ctrl->handler, struct rkvdec_ctx, ctrl_hdl);
> +
> +	if (ctrl->id == V4L2_CID_MPEG_VIDEO_H264_SPS && !ctx->valid_fmt) {

Here's a non-tested idea.

If the SPS is supported [2], then we just set it and store it
(store the entire SPS) and negotiate a new format.

The application can the use TRY/S_FMT to negotiate
a format, and so SPS can be used to validate that.

This way, you don't need to store valid_fmt
and you remove the single format limitation.

Does that make sense?

Thanks,
Ezequiel

[2] and possibly provided
!vb2_is_busy(v4l2_m2m_get_vq(ctx->fh.m2m_ctx, CAPTURE))

> +		ctx->valid_fmt = rkvdec_valid_fmt(ctx, ctrl);
> +		if (ctx->valid_fmt) {
> +			struct v4l2_pix_format_mplane *pix_mp;
> +
> +			pix_mp = &ctx->decoded_fmt.fmt.pix_mp;
> +			pix_mp->pixelformat = ctx->valid_fmt;
> +			rkvdec_fill_decoded_pixfmt(ctx, pix_mp);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct v4l2_ctrl_ops rkvdec_ctrl_ops = {
>  	.try_ctrl = rkvdec_try_ctrl,
> +	.s_ctrl = rkvdec_s_ctrl,
>  };
>  
>  static const struct rkvdec_ctrl_desc rkvdec_h264_ctrl_descs[] = {
> @@ -188,6 +221,7 @@ static void rkvdec_reset_decoded_fmt(struct rkvdec_ctx *ctx)
>  {
>  	struct v4l2_format *f = &ctx->decoded_fmt;
>  
> +	ctx->valid_fmt = 0;
>  	rkvdec_reset_fmt(ctx, f, ctx->coded_fmt_desc->decoded_fmts[0]);
>  	f->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
>  	f->fmt.pix_mp.width = ctx->coded_fmt.fmt.pix_mp.width;
> @@ -243,13 +277,17 @@ static int rkvdec_try_capture_fmt(struct file *file, void *priv,
>  	if (WARN_ON(!coded_desc))
>  		return -EINVAL;
>  
> -	for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
> -		if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
> -			break;
> -	}
> +	if (ctx->valid_fmt) {
> +		pix_mp->pixelformat = ctx->valid_fmt;
> +	} else {
> +		for (i = 0; i < coded_desc->num_decoded_fmts; i++) {
> +			if (coded_desc->decoded_fmts[i] == pix_mp->pixelformat)
> +				break;
> +		}
>  
> -	if (i == coded_desc->num_decoded_fmts)
> -		pix_mp->pixelformat = coded_desc->decoded_fmts[0];
> +		if (i == coded_desc->num_decoded_fmts)
> +			pix_mp->pixelformat = coded_desc->decoded_fmts[0];
> +	}
>  
>  	/* Always apply the frmsize constraint of the coded end. */
>  	pix_mp->width = max(pix_mp->width, ctx->coded_fmt.fmt.pix_mp.width);
> @@ -324,6 +362,7 @@ static int rkvdec_s_capture_fmt(struct file *file, void *priv,
>  		return ret;
>  
>  	ctx->decoded_fmt = *f;
> +	ctx->valid_fmt = f->fmt.pix_mp.pixelformat;
>  	return 0;
>  }
>  
> @@ -413,6 +452,14 @@ static int rkvdec_enum_capture_fmt(struct file *file, void *priv,
>  	if (WARN_ON(!ctx->coded_fmt_desc))
>  		return -EINVAL;
>  
> +	if (ctx->valid_fmt) {
> +		if (f->index)
> +			return -EINVAL;
> +
> +		f->pixelformat = ctx->valid_fmt;
> +		return 0;
> +	}
> +
>  	if (f->index >= ctx->coded_fmt_desc->num_decoded_fmts)
>  		return -EINVAL;
>  
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 2fc9f46b6910..50e67401fdbe 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -64,6 +64,7 @@ vb2_to_rkvdec_decoded_buf(struct vb2_buffer *buf)
>  struct rkvdec_coded_fmt_ops {
>  	int (*adjust_fmt)(struct rkvdec_ctx *ctx,
>  			  struct v4l2_format *f);
> +	u32 (*valid_fmt)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
>  	int (*start)(struct rkvdec_ctx *ctx);
>  	void (*stop)(struct rkvdec_ctx *ctx);
>  	int (*run)(struct rkvdec_ctx *ctx);
> @@ -97,6 +98,7 @@ struct rkvdec_ctx {
>  	struct v4l2_fh fh;
>  	struct v4l2_format coded_fmt;
>  	struct v4l2_format decoded_fmt;
> +	u32 valid_fmt;
>  	const struct rkvdec_coded_fmt_desc *coded_fmt_desc;
>  	struct v4l2_ctrl_handler ctrl_hdl;
>  	struct rkvdec_dev *dev;


