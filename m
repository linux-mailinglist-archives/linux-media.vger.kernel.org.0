Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD69E3CCF87
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 11:00:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235272AbhGSIQz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 04:16:55 -0400
Received: from lb2-smtp-cloud7.xs4all.net ([194.109.24.28]:41701 "EHLO
        lb2-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235271AbhGSIQy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 04:16:54 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id 5OYZmRmCZ2bXB5OYam9n52; Mon, 19 Jul 2021 10:23:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1626683000; bh=z3zFfU9NS8BANmAu3GUed15OfjbfSdRrkZvjYgZZ52M=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=hcBe0MNWUssCzkKIzn3UKUWqdx8ACPRwhPZztMCfHRTK/Gyy7Wp3MtGMdDqw2nFM4
         Gspixz/xNn5TdeqwZn3dP/tguqBF+lqpOzBMyKZMhDuCZrcphlEdUWVGxltpztKXXe
         GN9ajeiRdTsmUQpSfPQbz7zkTPy54rkkRnD3dkF48NZHs/qdGwahkUgkP6iFL16jRU
         r9WEcxMD5i6Vr86qIZxok3TOhc+E+BtgT3up5PbKmJrmd823mKkiMbnIib6f3x++67
         onWC3LlyIiv5x8jppVSM7k5Q/beiaB0M3Rrkmumm7UCBrq3/wSX3qc9TkPNc1SR7DQ
         y5rWzQ+bngU5A==
Subject: Re: [RFC,WIP PATCH 2/2] Cedrus: add support for dynamic arrays in
 H264
To:     daniel.almeida@collabora.com, jernej.skrabec@gmail.com,
        ezequiel@collabora.com, paul.kocialkowski@bootlin.com,
        mripard@kernel.org
Cc:     kernel@collabora.com, linux-media@vger.kernel.org
References: <20210702020129.470720-1-daniel.almeida@collabora.com>
 <20210702020129.470720-3-daniel.almeida@collabora.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <ba6ce10e-9645-5afc-70fb-1595682b5fa8@xs4all.nl>
Date:   Mon, 19 Jul 2021 10:23:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702020129.470720-3-daniel.almeida@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNDBl3LpfhmG+kNaayOnqHmedAVJEOl3WXDhHDcVEbnyTGOaMLXb8s4BYZZwSZ6DptqP9CRQtLMeauHX/S9eS93BZCmIyJm+aiuZyjzFe+DoVDqmr+hC
 eZAqBB9GE3GGz2W/GyxhDaX0Ya0tovV/6pwRgCo4n8iqS3mKJ0WxdP2NCl2gLrrvwuY7n6Rb0UDIwxhoJTW8kFLQeY0luM17uY5XRHffqYeW2f6xwNjt80ru
 q87sxjwucbZc0dDY9Hx3Ii7Ya5GEPwcS01EBi07tRoKiaVuu+aISe+w7X08O3LncFAIj5oa1OXxAF6hP6cKYeWR+jdwJXPODwLUOXl9jt7HmklMZi/OXepjU
 S1ZcvrbkO3eUhgZ062gF4B1mSXxHzRV2/HtTcLyySv9dtboPbejrA9PkEw0YlRQiMjLM25hAD79D0oIzqpsS+Ikw1bUH/P8s0OgId1In5XB5JHvhRggmBYmg
 t4HSWez+0rvxh3gvrjytJFbCB9Td1pZ+npxJaw==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 02/07/2021 04:01, daniel.almeida@collabora.com wrote:
> From: Daniel Almeida <daniel.almeida@collabora.com>
> 
> So far the Cedrus driver is able to decode a slice at a time in slice
> mode.
> 
> Use the new flag "V4L2_CTRL_FLAG_DYNAMIC_ARRAY" and the new h264 slice
> decode mode to support passing an array with all the slices at once from
> userspace.
> 
> The device will process all slices in this array before calling
> v4l2_m2m_buf_done_and_job_finish, significantly reducing the
> amount of back and forth of data.
> 
> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
> ---
>  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
>  drivers/staging/media/sunxi/cedrus/cedrus.c   | 34 ++++++++++++--
>  drivers/staging/media/sunxi/cedrus/cedrus.h   | 18 ++++++++
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   | 33 +++++++++++++
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  | 46 ++++++++++++++++---
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    | 35 +++++++++++++-
>  include/uapi/linux/v4l2-controls.h            |  7 +++
>  7 files changed, 162 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> index b6344bbf1e00..5c7fe69d7097 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -367,6 +367,7 @@ const char * const *v4l2_ctrl_get_menu(u32 id)
>  	static const char * const h264_decode_mode[] = {
>  		"Slice-Based",
>  		"Frame-Based",
> +		"Slice Array Based",
>  		NULL,
>  	};
>  	static const char * const h264_start_code[] = {
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/staging/media/sunxi/cedrus/cedrus.c
> index e72810ace40f..3b55c1e5a288 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -56,6 +56,11 @@ static const struct cedrus_control cedrus_controls[] = {
>  	{
>  		.cfg = {
>  			.id	= V4L2_CID_STATELESS_H264_SLICE_PARAMS,

This will have to be a new id (V4L2_CID_STATELESS_H264_SLICES_PARAMS?) since
you cannot change the type of an existing control. So you will have to support
both V4L2_CID_STATELESS_H264_SLICE_PARAMS and the new id for slice arrays.


> +			.flags  = V4L2_CTRL_FLAG_DYNAMIC_ARRAY,
> +			.dims	= {32},

Add space after/before { and }

I think a comment explaining where the 32 comes from would be useful as well.
I assume it is the max number of slices that the HW can handle?

> +			/* FIXME: I suppose these last two will not be necessary */
> +			.type	= V4L2_CTRL_TYPE_H264_SLICE_PARAMS,
> +			.name	= "H264 Slice Parameters",
>  		},
>  		.codec		= CEDRUS_CODEC_H264,
>  	},
> @@ -86,7 +91,7 @@ static const struct cedrus_control cedrus_controls[] = {
>  	{
>  		.cfg = {
>  			.id	= V4L2_CID_STATELESS_H264_DECODE_MODE,
> -			.max	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
> +			.max	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED,
>  			.def	= V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
>  		},
>  		.codec		= CEDRUS_CODEC_H264,
> @@ -167,17 +172,40 @@ static const struct cedrus_control cedrus_controls[] = {
>  
>  #define CEDRUS_CONTROLS_COUNT	ARRAY_SIZE(cedrus_controls)
>  
> -void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id)
> +struct v4l2_ctrl *cedrus_find_control(struct cedrus_ctx *ctx, u32 id)
>  {
>  	unsigned int i;
>  
>  	for (i = 0; ctx->ctrls[i]; i++)
>  		if (ctx->ctrls[i]->id == id)
> -			return ctx->ctrls[i]->p_cur.p;
> +			return ctx->ctrls[i];
> +
> +	return NULL;
> +}
> +
> +void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl = cedrus_find_control(ctx, id);
> +	if (ctrl)
> +		return ctrl->p_cur.p;
>  
>  	return NULL;
>  }
>  
> +u32 cedrus_control_num_elems(struct cedrus_ctx *ctx, u32 id)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl = cedrus_find_control(ctx, id);
> +	if (ctrl) {
> +		return ctrl->elems;
> +	}
> +
> +	return 0;
> +}
> +
>  static int cedrus_init_ctrls(struct cedrus_dev *dev, struct cedrus_ctx *ctx)
>  {
>  	struct v4l2_ctrl_handler *hdl = &ctx->hdl;
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.h b/drivers/staging/media/sunxi/cedrus/cedrus.h
> index 88afba17b78b..b445c1dc2a29 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.h
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.h
> @@ -58,6 +58,18 @@ struct cedrus_control {
>  	enum cedrus_codec	codec;
>  };
>  
> +struct cedrus_h264_slice_ctx {
> +	u32 num_slices;
> +	u32 cur_slice;
> +};
> +
> +struct cedrus_slice_ctx {
> +	void *priv;
> +	union {
> +		struct cedrus_h264_slice_ctx h264;
> +	};
> +};
> +
>  struct cedrus_h264_run {
>  	const struct v4l2_ctrl_h264_decode_params	*decode_params;
>  	const struct v4l2_ctrl_h264_pps			*pps;
> @@ -118,6 +130,9 @@ struct cedrus_ctx {
>  	struct v4l2_ctrl_handler	hdl;
>  	struct v4l2_ctrl		**ctrls;
>  
> +	struct cedrus_slice_ctx		slice_ctx;
> +	bool 				slice_array_decode_mode;
> +
>  	union {
>  		struct {
>  			void		*mv_col_buf;
> @@ -160,6 +175,7 @@ struct cedrus_dec_ops {
>  	void (*irq_disable)(struct cedrus_ctx *ctx);
>  	enum cedrus_irq_status (*irq_status)(struct cedrus_ctx *ctx);
>  	void (*setup)(struct cedrus_ctx *ctx, struct cedrus_run *run);
> +	void (*setup_next_slice)(struct cedrus_ctx *ctx);
>  	int (*start)(struct cedrus_ctx *ctx);
>  	void (*stop)(struct cedrus_ctx *ctx);
>  	void (*trigger)(struct cedrus_ctx *ctx);
> @@ -256,5 +272,7 @@ vb2_to_cedrus_buffer(const struct vb2_buffer *p)
>  }
>  
>  void *cedrus_find_control_data(struct cedrus_ctx *ctx, u32 id);
> +u32 cedrus_control_num_elems(struct cedrus_ctx *ctx, u32 id);
> +struct v4l2_ctrl *cedrus_find_control(struct cedrus_ctx *ctx, u32 id);
>  
>  #endif
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> index 40e8c4123f76..9b9034044aa4 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_dec.c
> @@ -22,6 +22,37 @@
>  #include "cedrus_dec.h"
>  #include "cedrus_hw.h"
>  
> +static void fill_slice_ctx(struct cedrus_ctx *ctx, struct cedrus_run *run)
> +{
> +	struct v4l2_ctrl *ctrl;
> +
> +	ctrl = cedrus_find_control(ctx, V4L2_CID_STATELESS_H264_DECODE_MODE);
> +	if (!ctrl)
> +		return;
> +
> +	switch (ctx->current_codec) {
> +	case CEDRUS_CODEC_H264:
> +		ctx->slice_array_decode_mode =
> +			ctrl->cur.val == V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED;
> +
> +		if (!ctx->slice_array_decode_mode)
> +			return;
> +
> +		ctx->slice_ctx.h264.num_slices =
> +			cedrus_control_num_elems(ctx, V4L2_CID_STATELESS_H264_SLICE_PARAMS);
> +		ctx->slice_ctx.priv = kmalloc(sizeof(struct v4l2_ctrl_h264_slice_params) *
> +			ctx->slice_ctx.h264.num_slices, GFP_KERNEL);
> +
> +		memcpy(ctx->slice_ctx.priv,
> +		       run->h264.slice_params, sizeof(struct v4l2_ctrl_h264_slice_params) *
> +		       ctx->slice_ctx.h264.num_slices);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +}
> +
>  void cedrus_device_run(void *priv)
>  {
>  	struct cedrus_ctx *ctx = priv;
> @@ -83,6 +114,8 @@ void cedrus_device_run(void *priv)
>  		break;
>  	}
>  
> +	fill_slice_ctx(ctx, &run);
> +
>  	v4l2_m2m_buf_copy_metadata(run.src, run.dst, true);
>  
>  	cedrus_dst_format_set(dev, &ctx->dst_fmt);
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index de7442d4834d..bada2bf04f24 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -15,6 +15,8 @@
>  #include "cedrus_hw.h"
>  #include "cedrus_regs.h"
>  
> +static void cedrus_h264_trigger(struct cedrus_ctx *ctx);
> +
>  enum cedrus_h264_sram_off {
>  	CEDRUS_SRAM_H264_PRED_WEIGHT_TABLE	= 0x000,
>  	CEDRUS_SRAM_H264_FRAMEBUFFER_LIST	= 0x100,
> @@ -318,6 +320,31 @@ static void cedrus_skip_bits(struct cedrus_dev *dev, int num)
>  	}
>  }
>  
> +static void cedrus_h264_setup_next_slice(struct cedrus_ctx *ctx)
> +{
> +	struct v4l2_ctrl_h264_slice_params *sp;
> +	struct cedrus_h264_slice_ctx *sctx;
> +	u32 offset;
> +
> +	sp = ctx->slice_ctx.priv;
> +	sctx = &ctx->slice_ctx.h264;
> +	offset = sp[sctx->cur_slice++].header_bit_size;
> +
> +	/* skip to the next slice */
> +	cedrus_skip_bits(ctx->dev, offset);
> +
> +	/* clear status flags */
> +	cedrus_write(ctx->dev, VE_H264_STATUS, cedrus_read(ctx->dev, VE_H264_STATUS));
> +
> +	/* enable int */
> +	cedrus_write(ctx->dev, VE_H264_CTRL,
> +		     VE_H264_CTRL_SLICE_DECODE_INT |
> +		     VE_H264_CTRL_DECODE_ERR_INT |
> +		     VE_H264_CTRL_VLD_DATA_REQ_INT);
> +
> +	cedrus_h264_trigger(ctx);
> +}
> +
>  static void cedrus_set_params(struct cedrus_ctx *ctx,
>  			      struct cedrus_run *run)
>  {
> @@ -510,6 +537,10 @@ static void cedrus_h264_setup(struct cedrus_ctx *ctx,
>  	cedrus_write_frame_list(ctx, run);
>  
>  	cedrus_set_params(ctx, run);
> +
> +	if (ctx->slice_array_decode_mode)
> +		ctx->slice_ctx.h264.cur_slice++;
> +
>  }
>  
>  static int cedrus_h264_start(struct cedrus_ctx *ctx)
> @@ -682,11 +713,12 @@ static void cedrus_h264_trigger(struct cedrus_ctx *ctx)
>  }
>  
>  struct cedrus_dec_ops cedrus_dec_ops_h264 = {
> -	.irq_clear	= cedrus_h264_irq_clear,
> -	.irq_disable	= cedrus_h264_irq_disable,
> -	.irq_status	= cedrus_h264_irq_status,
> -	.setup		= cedrus_h264_setup,
> -	.start		= cedrus_h264_start,
> -	.stop		= cedrus_h264_stop,
> -	.trigger	= cedrus_h264_trigger,
> +	.irq_clear	  = cedrus_h264_irq_clear,
> +	.irq_disable	  = cedrus_h264_irq_disable,
> +	.irq_status	  = cedrus_h264_irq_status,
> +	.setup		  = cedrus_h264_setup,
> +	.setup_next_slice = cedrus_h264_setup_next_slice,
> +	.start		  = cedrus_h264_start,
> +	.stop		  = cedrus_h264_stop,
> +	.trigger	  = cedrus_h264_trigger,
>  };
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> index e2f2ff609c7e..4ff3da210e50 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_hw.c
> @@ -111,12 +111,25 @@ void cedrus_dst_format_set(struct cedrus_dev *dev,
>  	}
>  }
>  
> +static void clear_slice_ctx(struct cedrus_ctx *ctx)
> +{
> +	switch (ctx->current_codec) {
> +	case CEDRUS_CODEC_H264:
> +		kfree(ctx->slice_ctx.priv);
> +		memset(&ctx->slice_ctx, 0, sizeof(ctx->slice_ctx));
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
>  static irqreturn_t cedrus_irq(int irq, void *data)
>  {
>  	struct cedrus_dev *dev = data;
>  	struct cedrus_ctx *ctx;
>  	enum vb2_buffer_state state;
>  	enum cedrus_irq_status status;
> +	struct cedrus_h264_slice_ctx *h264sctx;
>  
>  	ctx = v4l2_m2m_get_curr_priv(dev->m2m_dev);
>  	if (!ctx) {
> @@ -132,10 +145,28 @@ static irqreturn_t cedrus_irq(int irq, void *data)
>  	dev->dec_ops[ctx->current_codec]->irq_disable(ctx);
>  	dev->dec_ops[ctx->current_codec]->irq_clear(ctx);
>  
> -	if (status == CEDRUS_IRQ_ERROR)
> +	if (status == CEDRUS_IRQ_OK && ctx->slice_array_decode_mode) {
> +		switch (ctx->current_codec) {
> +		case CEDRUS_CODEC_H264:
> +			h264sctx = &ctx->slice_ctx.h264;
> +			if (h264sctx->cur_slice < h264sctx->num_slices - 1) {
> +				dev->dec_ops[ctx->current_codec]->setup_next_slice(ctx);
> +				return IRQ_HANDLED;
> +			}
> +		default:
> +			break;
> +		}
> +
> +		clear_slice_ctx(ctx);
> +	}
> +
> +	if (status == CEDRUS_IRQ_ERROR) {
>  		state = VB2_BUF_STATE_ERROR;
> -	else
> +		if (ctx->slice_array_decode_mode)
> +			clear_slice_ctx(ctx);
> +	} else {
>  		state = VB2_BUF_STATE_DONE;
> +	}
>  
>  	v4l2_m2m_buf_done_and_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx,
>  					 state);
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index fdf97a6d7d18..8907076d0ddf 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -1231,10 +1231,17 @@ enum v4l2_detect_md_mode {
>   * by device drivers that are able to parse the slice(s) header(s)
>   * in hardware. When this mode is selected,
>   * V4L2_CID_STATELESS_H264_SLICE_PARAMS is not used.
> + * @V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED: indicates that
> + * decoding is performed for the entire frame using a slice array.
> + * When this mode is selected, a pointer to a contiguous memory region
> + * of v4l2_ctrl_h264_slice elements is expected.
> +
>   */
>  enum v4l2_stateless_h264_decode_mode {
>  	V4L2_STATELESS_H264_DECODE_MODE_SLICE_BASED,
>  	V4L2_STATELESS_H264_DECODE_MODE_FRAME_BASED,
> +	V4L2_STATELESS_H264_DECODE_MODE_SLICE_ARRAY_BASED,
> +
>  };
>  
>  #define V4L2_CID_STATELESS_H264_START_CODE	(V4L2_CID_CODEC_STATELESS_BASE + 1)
> 

Regards,

	Hans
