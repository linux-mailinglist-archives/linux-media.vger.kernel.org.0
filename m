Return-Path: <linux-media+bounces-13185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F41269069FE
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 12:28:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 71B0D1F255D3
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 10:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDF27142633;
	Thu, 13 Jun 2024 10:28:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287B84A56;
	Thu, 13 Jun 2024 10:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718274520; cv=none; b=hdlIiKGOUIdY6DhURa5smM7biZNVdD0FKnVNScLKD+On9e5jB3C0s2Vlc/mT3gHPVqMMZhVxRiuO8pVfenQBaLINWYZWiCwwNlEwlyXBIhT2m97CPmTWRGpsdT02CglrVh6eep7yjoBh7TsclQUBWn0LsgB7NJ+jhn6K41hCfJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718274520; c=relaxed/simple;
	bh=gXIDd7kaBV1qUrIkyMMv+2dtaqYzdSwdJdsuebziqnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ge4v0gFzYHQf6vd8sqDsDabTCXVMtiqbQ96mWs7dkJIjOFBHtvFJJcx4sQ3HHmzlTEA0H0LfgY5PX8O/jg0KLgw9ljCvN3gt6iB+K80++gMhcmDXVT7G+qWeKFyjuIIREzzzSlb0yfdf++DI7ALcPCDS3JkBy4yc3WEQUSucU1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAC8AC2BBFC;
	Thu, 13 Jun 2024 10:28:37 +0000 (UTC)
Message-ID: <52b3f0be-6427-40b3-862b-640f378e6b02@xs4all.nl>
Date: Thu, 13 Jun 2024 12:28:35 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] media: chips-media: wave5: Use helpers to
 calculate bytesperline and sizeimage.
To: Jackson Lee <jackson.lee@chipsnmedia.com>, mchehab@kernel.org,
 nicolas@ndufresne.ca, sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 nas.chung@chipsnmedia.com, lafley.kim@chipsnmedia.com, b-brnich@ti.com,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20240611071501.80-1-jackson.lee@chipsnmedia.com>
 <20240611071501.80-4-jackson.lee@chipsnmedia.com>
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <20240611071501.80-4-jackson.lee@chipsnmedia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/06/2024 09:15, Jackson Lee wrote:
> From: "jackson.lee" <jackson.lee@chipsnmedia.com>
> 
> Use v4l2-common helper functions to calculate bytesperline and sizeimage,
> instead of calculating in a wave5 driver directly.
> 
> In case of raw(YUV) v4l2_pix_format, the wave5 driver updates
> v4l2_pix_format_mplane struct through v4l2_fill_pixfmt_mp() function.
> 
> Encoder and Decoder need same bytesperline and sizeimage values
> for same v4l2_pix_format.
> So, a wave5_update_pix_fmt is refactored to support both together.
> 
> Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../platform/chips-media/wave5/wave5-helper.c |  24 ++
>  .../platform/chips-media/wave5/wave5-helper.h |   5 +
>  .../chips-media/wave5/wave5-vpu-dec.c         | 296 ++++++------------
>  .../chips-media/wave5/wave5-vpu-enc.c         | 197 +++++-------
>  .../platform/chips-media/wave5/wave5-vpu.h    |   5 +-
>  .../chips-media/wave5/wave5-vpuconfig.h       |  27 +-
>  6 files changed, 235 insertions(+), 319 deletions(-)
> 
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.c b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> index 7e0f34bfa5be..b20ab69cd341 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.c
> @@ -7,6 +7,8 @@
>  
>  #include "wave5-helper.h"
>  
> +#define DEFAULT_BS_SIZE(width, height) ((width) * (height) / 8 * 3)
> +
>  const char *state_to_str(enum vpu_instance_state state)
>  {
>  	switch (state) {
> @@ -224,3 +226,25 @@ void wave5_return_bufs(struct vb2_queue *q, u32 state)
>  		v4l2_m2m_buf_done(vbuf, state);
>  	}
>  }
> +
> +void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
> +			  int pix_fmt_type,
> +			  unsigned int width,
> +			  unsigned int height,
> +			  const struct v4l2_frmsize_stepwise *frmsize)
> +{
> +	v4l2_apply_frmsize_constraints(&width, &height, frmsize);
> +
> +	if (pix_fmt_type == VPU_FMT_TYPE_CODEC) {
> +		pix_mp->width = width;
> +		pix_mp->height = height;
> +		pix_mp->num_planes = 1;
> +		pix_mp->plane_fmt[0].bytesperline = 0;
> +		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_BS_SIZE(width, height),
> +						     pix_mp->plane_fmt[0].sizeimage);
> +	} else {
> +		v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, width, height);
> +	}
> +	pix_mp->flags = 0;
> +	pix_mp->field = V4L2_FIELD_NONE;
> +}
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-helper.h b/drivers/media/platform/chips-media/wave5/wave5-helper.h
> index 6cee1c14d3ce..9937fce553fc 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-helper.h
> +++ b/drivers/media/platform/chips-media/wave5/wave5-helper.h
> @@ -28,4 +28,9 @@ const struct vpu_format *wave5_find_vpu_fmt_by_idx(unsigned int idx,
>  						   const struct vpu_format fmt_list[MAX_FMTS]);
>  enum wave_std wave5_to_vpu_std(unsigned int v4l2_pix_fmt, enum vpu_instance_type type);
>  void wave5_return_bufs(struct vb2_queue *q, u32 state);
> +void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp,
> +			  int pix_fmt_type,
> +			  unsigned int width,
> +			  unsigned int height,
> +			  const struct v4l2_frmsize_stepwise *frmsize);
>  #endif
> diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> index 861a0664047c..f246c290ad6a 100644
> --- a/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> +++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-dec.c
> @@ -11,111 +11,92 @@
>  #define VPU_DEC_DEV_NAME "C&M Wave5 VPU decoder"
>  #define VPU_DEC_DRV_NAME "wave5-dec"
>  
> -#define DEFAULT_SRC_SIZE(width, height) ({			\
> -	(width) * (height) / 8 * 3;					\
> -})
> +static const struct v4l2_frmsize_stepwise dec_hevc_frmsize = {
> +	.min_width = W5_MIN_DEC_PIC_8_WIDTH,
> +	.max_width = W5_MAX_DEC_PIC_WIDTH,
> +	.step_width = W5_DEC_CODEC_STEP_WIDTH,
> +	.min_height = W5_MIN_DEC_PIC_8_HEIGHT,
> +	.max_height = W5_MAX_DEC_PIC_HEIGHT,
> +	.step_height = W5_DEC_CODEC_STEP_HEIGHT,
> +};
> +
> +static const struct v4l2_frmsize_stepwise dec_h264_frmsize = {
> +	.min_width = W5_MIN_DEC_PIC_32_WIDTH,
> +	.max_width = W5_MAX_DEC_PIC_WIDTH,
> +	.step_width = W5_DEC_CODEC_STEP_WIDTH,
> +	.min_height = W5_MIN_DEC_PIC_32_HEIGHT,
> +	.max_height = W5_MAX_DEC_PIC_HEIGHT,
> +	.step_height = W5_DEC_CODEC_STEP_HEIGHT,
> +};
> +
> +static const struct v4l2_frmsize_stepwise dec_raw_frmsize = {
> +	.min_width = W5_MIN_DEC_PIC_8_WIDTH,
> +	.max_width = W5_MAX_DEC_PIC_WIDTH,
> +	.step_width = W5_DEC_RAW_STEP_WIDTH,
> +	.min_height = W5_MIN_DEC_PIC_8_HEIGHT,
> +	.max_height = W5_MAX_DEC_PIC_HEIGHT,
> +	.step_height = W5_DEC_RAW_STEP_HEIGHT,
> +};
>  
>  static const struct vpu_format dec_fmt_list[FMT_TYPES][MAX_FMTS] = {
>  	[VPU_FMT_TYPE_CODEC] = {
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_HEVC,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_hevc_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_H264,
> -			.max_width = 8192,
> -			.min_width = 32,
> -			.max_height = 4320,
> -			.min_height = 32,
> +			.v4l2_frmsize = &dec_h264_frmsize,
>  		},
>  	},
>  	[VPU_FMT_TYPE_RAW] = {
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422P,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV420M,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_NV12M,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_NV21M,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_YUV422M,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_NV16M,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  		{
>  			.v4l2_pix_fmt = V4L2_PIX_FMT_NV61M,
> -			.max_width = 8192,
> -			.min_width = 8,
> -			.max_height = 4320,
> -			.min_height = 8,
> +			.v4l2_frmsize = &dec_raw_frmsize,
>  		},
>  	}
>  };
> @@ -234,74 +215,6 @@ static void wave5_handle_src_buffer(struct vpu_instance *inst, dma_addr_t rd_ptr
>  	inst->remaining_consumed_bytes = consumed_bytes;
>  }
>  
> -static void wave5_update_pix_fmt(struct v4l2_pix_format_mplane *pix_mp, unsigned int width,
> -				 unsigned int height)
> -{
> -	switch (pix_mp->pixelformat) {
> -	case V4L2_PIX_FMT_YUV420:
> -	case V4L2_PIX_FMT_NV12:
> -	case V4L2_PIX_FMT_NV21:
> -		pix_mp->width = round_up(width, 32);
> -		pix_mp->height = round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage = width * height * 3 / 2;
> -		break;
> -	case V4L2_PIX_FMT_YUV422P:
> -	case V4L2_PIX_FMT_NV16:
> -	case V4L2_PIX_FMT_NV61:
> -		pix_mp->width = round_up(width, 32);
> -		pix_mp->height = round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage = width * height * 2;
> -		break;
> -	case V4L2_PIX_FMT_YUV420M:
> -		pix_mp->width = round_up(width, 32);
> -		pix_mp->height = round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage = width * height;
> -		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
> -		pix_mp->plane_fmt[1].sizeimage = width * height / 4;
> -		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
> -		pix_mp->plane_fmt[2].sizeimage = width * height / 4;
> -		break;
> -	case V4L2_PIX_FMT_NV12M:
> -	case V4L2_PIX_FMT_NV21M:
> -		pix_mp->width = round_up(width, 32);
> -		pix_mp->height = round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage = width * height;
> -		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
> -		pix_mp->plane_fmt[1].sizeimage = width * height / 2;
> -		break;
> -	case V4L2_PIX_FMT_YUV422M:
> -		pix_mp->width = round_up(width, 32);
> -		pix_mp->height = round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage = width * height;
> -		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32) / 2;
> -		pix_mp->plane_fmt[1].sizeimage = width * height / 2;
> -		pix_mp->plane_fmt[2].bytesperline = round_up(width, 32) / 2;
> -		pix_mp->plane_fmt[2].sizeimage = width * height / 2;
> -		break;
> -	case V4L2_PIX_FMT_NV16M:
> -	case V4L2_PIX_FMT_NV61M:
> -		pix_mp->width = round_up(width, 32);
> -		pix_mp->height = round_up(height, 16);
> -		pix_mp->plane_fmt[0].bytesperline = round_up(width, 32);
> -		pix_mp->plane_fmt[0].sizeimage = width * height;
> -		pix_mp->plane_fmt[1].bytesperline = round_up(width, 32);
> -		pix_mp->plane_fmt[1].sizeimage = width * height;
> -		break;
> -	default:
> -		pix_mp->width = width;
> -		pix_mp->height = height;
> -		pix_mp->plane_fmt[0].bytesperline = 0;
> -		pix_mp->plane_fmt[0].sizeimage = max(DEFAULT_SRC_SIZE(width, height),
> -						     pix_mp->plane_fmt[0].sizeimage);
> -		break;
> -	}
> -}
> -
>  static int start_decode(struct vpu_instance *inst, u32 *fail_res)
>  {
>  	struct v4l2_m2m_ctx *m2m_ctx = inst->v4l2_fh.m2m_ctx;
> @@ -389,6 +302,8 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
>  	}
>  
>  	if (p_dec_info->initial_info_obtained) {
> +		const struct vpu_format *vpu_fmt;
> +
>  		inst->conf_win.left = initial_info->pic_crop_rect.left;
>  		inst->conf_win.top = initial_info->pic_crop_rect.top;
>  		inst->conf_win.width = initial_info->pic_width -
> @@ -396,10 +311,27 @@ static int handle_dynamic_resolution_change(struct vpu_instance *inst)
>  		inst->conf_win.height = initial_info->pic_height -
>  			initial_info->pic_crop_rect.top - initial_info->pic_crop_rect.bottom;
>  
> -		wave5_update_pix_fmt(&inst->src_fmt, initial_info->pic_width,
> -				     initial_info->pic_height);
> -		wave5_update_pix_fmt(&inst->dst_fmt, initial_info->pic_width,
> -				     initial_info->pic_height);
> +		vpu_fmt = wave5_find_vpu_fmt(inst->src_fmt.pixelformat,
> +					     dec_fmt_list[VPU_FMT_TYPE_CODEC]);
> +		if (!vpu_fmt)
> +			return -EINVAL;
> +
> +		wave5_update_pix_fmt(&inst->src_fmt,
> +				     VPU_FMT_TYPE_CODEC,
> +				     initial_info->pic_width,
> +				     initial_info->pic_height,
> +				     vpu_fmt->v4l2_frmsize);
> +
> +		vpu_fmt = wave5_find_vpu_fmt(inst->dst_fmt.pixelformat,
> +					     dec_fmt_list[VPU_FMT_TYPE_RAW]);
> +		if (!vpu_fmt)
> +			return -EINVAL;
> +
> +		wave5_update_pix_fmt(&inst->dst_fmt,
> +				     VPU_FMT_TYPE_RAW,
> +				     initial_info->pic_width,
> +				     initial_info->pic_height,
> +				     vpu_fmt->v4l2_frmsize);
>  	}
>  
>  	v4l2_event_queue_fh(fh, &vpu_event_src_ch);
> @@ -545,15 +477,11 @@ static int wave5_vpu_dec_enum_framesizes(struct file *f, void *fh, struct v4l2_f
>  		vpu_fmt = wave5_find_vpu_fmt(fsize->pixel_format, dec_fmt_list[VPU_FMT_TYPE_RAW]);
>  		if (!vpu_fmt)
>  			return -EINVAL;
> +		return -ENOTTY;

Huh? Where does this come from? It wasn't part of v4, and it doesn't make
sense either.

It looks like a spurious test line that you forgot to remove.

Regards,

	Hans

>  	}
>  
>  	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
> -	fsize->stepwise.min_width = vpu_fmt->min_width;
> -	fsize->stepwise.max_width = vpu_fmt->max_width;
> -	fsize->stepwise.step_width = 1;
> -	fsize->stepwise.min_height = vpu_fmt->min_height;
> -	fsize->stepwise.max_height = vpu_fmt->max_height;
> -	fsize->stepwise.step_height = 1;
> +	fsize->stepwise = *vpu_fmt->v4l2_frmsize;
>  
>  	return 0;
>  }

Regards,

	Hans


