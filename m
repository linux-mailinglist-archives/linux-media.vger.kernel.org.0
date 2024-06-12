Return-Path: <linux-media+bounces-13024-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 277629050A9
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 12:46:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 099391C20F10
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 10:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C902B16E888;
	Wed, 12 Jun 2024 10:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kraUfmpm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D8D984A21
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 10:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718189185; cv=none; b=OJ3cEANtkBJO/bzAV3mTdAhoNLbc4F/+bee4TL4FT1cRrRjKQp+9wPX90PPUoNc124JPtIgQEMulwFT2ggAiOPmFFKXXVgXAJm5KJvN0JL41/gtTv9aFtJL4k7tQTvm1kfZGx/WWJ4JBumm3MYXcWS6yRZhrunH/rZCV/OjbyWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718189185; c=relaxed/simple;
	bh=9Y2FxY6ZwHQ9p+CWNxqovUkXKsLC8T/agl2zxAoxyKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZzFj8nfP2nU/qdTZ4+cx3M5GEIlJG+z+Tm0KMukf5l2Jr0DXEdBObhwYpE0ndT/F1P7Pf6X48/vzxH5DpaF87/84tTccK2PQaKUfc4xhOU4WeMpDX6e+55Y/wAr2PzuKO2HZTFinLKHIaRB9hGzu6CL5Ab8kC5xjOwSVLKdLrR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kraUfmpm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07FA44AB;
	Wed, 12 Jun 2024 12:46:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718189167;
	bh=9Y2FxY6ZwHQ9p+CWNxqovUkXKsLC8T/agl2zxAoxyKw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kraUfmpmETTCqGWIECTnnpcK1oFi8EM7+cj5GyeK0LWt+MkTGCIFS9QuqW+jEnjtg
	 C4IEkL27N7t4XnT7yHrJwGJ4mlShyXxeHp/S0aRUb+leLvE6VGAyrzAhhbZhwRoeIW
	 4ubKK5mugDvAO7nfCYYBl0QBug7ouIaqRmCYM1k0=
Message-ID: <f6279fd6-abe6-440b-9acc-e8641bba5252@ideasonboard.com>
Date: Wed, 12 Jun 2024 11:46:17 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] media: rkisp1: Add support for ext format
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@iki.fi>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Stefan Klug <stefan.klug@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Umang Jain <umang.jain@ideasonboard.com>,
 Dafna Hirschfeld <dafna@fastmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>
References: <20240605165434.432230-1-jacopo.mondi@ideasonboard.com>
 <20240605165434.432230-5-jacopo.mondi@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20240605165434.432230-5-jacopo.mondi@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacopo, thanks for the patch

On 05/06/2024 17:54, Jacopo Mondi wrote:
> Add support to the rkisp1 driver for the extensible parameters format.
>
> Allow the driver to enumerate the existing and the new format and
> implement support for the try_fmt and s_fmt operations.
>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>


Isn't this too early in the set? I'd expect this to come after the actual support for handling the 
extensible buffers was done.

> ---
>   .../platform/rockchip/rkisp1/rkisp1-common.h  |  1 +
>   .../platform/rockchip/rkisp1/rkisp1-params.c  | 87 +++++++++++++++++--
>   2 files changed, 79 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 2a715f964f6e..0bddae8dbdb1 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -383,6 +383,7 @@ struct rkisp1_params {
>   	spinlock_t config_lock; /* locks the buffers list 'params' */
>   	struct list_head params;
>   
> +	struct v4l2_meta_format metafmt;
>   	enum v4l2_quantization quantization;
>   	enum v4l2_ycbcr_encoding ycbcr_encoding;
>   	enum rkisp1_fmt_raw_pat_type raw_type;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 1f449f29b241..6f99c7dad758 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -33,6 +33,34 @@
>   #define RKISP1_ISP_CC_COEFF(n) \
>   			(RKISP1_CIF_ISP_CC_COEFF_0 + (n) * 4)
>   
> +enum rkisp1_params_formats {
> +	RKISP1_PARAMS_FIXED,
> +	RKISP1_PARAMS_EXTENSIBLE,
> +	RKISP1_PARAMS_NUM_FMT,
> +};
> +
> +static const struct v4l2_meta_format rkisp1_params_formats[] = {
> +	[RKISP1_PARAMS_FIXED] = {
> +		.dataformat = V4L2_META_FMT_RK_ISP1_PARAMS,
> +		.buffersize = sizeof(struct rkisp1_params_cfg),
> +	},
> +	[RKISP1_PARAMS_EXTENSIBLE] = {
> +		.dataformat = V4L2_META_FMT_RK_ISP1_EXT_PARAMS,
> +		.buffersize = sizeof(struct rkisp1_ext_params_cfg),
> +	},
> +};
> +
> +static const struct v4l2_meta_format *
> +rkisp1_params_get_format_info(u32 dataformat)
> +{
> +	for (unsigned int i = 0; i < RKISP1_PARAMS_NUM_FMT; i++) {
> +		if (rkisp1_params_formats[i].dataformat == dataformat)
> +			return &rkisp1_params_formats[i];
> +	}
> +
> +	return &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
> +}
> +
>   static inline void
>   rkisp1_param_set_bits(struct rkisp1_params *params, u32 reg, u32 bit_mask)
>   {
> @@ -1742,11 +1770,13 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
>   					   struct v4l2_fmtdesc *f)
>   {
>   	struct video_device *video = video_devdata(file);
> +	const struct v4l2_meta_format *metafmt;
>   
> -	if (f->index > 0 || f->type != video->queue->type)
> +	if (f->index >= RKISP1_PARAMS_NUM_FMT || f->type != video->queue->type)
>   		return -EINVAL;
>   
> -	f->pixelformat = V4L2_META_FMT_RK_ISP1_PARAMS;
> +	metafmt = &rkisp1_params_formats[f->index];
> +	f->pixelformat = metafmt->dataformat;
>   
>   	return 0;
>   }
> @@ -1755,14 +1785,44 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
>   					struct v4l2_format *f)
>   {
>   	struct video_device *video = video_devdata(file);
> +	struct rkisp1_params *params = video_get_drvdata(video);
>   	struct v4l2_meta_format *meta = &f->fmt.meta;
>   
>   	if (f->type != video->queue->type)
>   		return -EINVAL;
>   
>   	memset(meta, 0, sizeof(*meta));
> -	meta->dataformat = V4L2_META_FMT_RK_ISP1_PARAMS;
> -	meta->buffersize = sizeof(struct rkisp1_params_cfg);
> +	*meta = params->metafmt;
> +
> +	return 0;
> +}
> +
> +static int rkisp1_params_try_fmt_meta_out(struct file *file, void *fh,
> +					  struct v4l2_format *f)
> +{
> +	struct video_device *video = video_devdata(file);
> +	struct v4l2_meta_format *meta = &f->fmt.meta;
> +
> +	if (f->type != video->queue->type)
> +		return -EINVAL;
> +
> +	*meta = *rkisp1_params_get_format_info(meta->dataformat);
> +
> +	return 0;
> +}
> +
> +static int rkisp1_params_s_fmt_meta_out(struct file *file, void *fh,
> +					struct v4l2_format *f)
> +{
> +	struct video_device *video = video_devdata(file);
> +	struct rkisp1_params *params = video_get_drvdata(video);
> +	struct v4l2_meta_format *meta = &f->fmt.meta;
> +
> +	if (f->type != video->queue->type)
> +		return -EINVAL;
> +
> +	*meta = *rkisp1_params_get_format_info(meta->dataformat);
> +	params->metafmt = *meta;
>   
>   	return 0;
>   }
> @@ -1792,8 +1852,8 @@ static const struct v4l2_ioctl_ops rkisp1_params_ioctl = {
>   	.vidioc_streamoff = vb2_ioctl_streamoff,
>   	.vidioc_enum_fmt_meta_out = rkisp1_params_enum_fmt_meta_out,
>   	.vidioc_g_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
> -	.vidioc_s_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
> -	.vidioc_try_fmt_meta_out = rkisp1_params_g_fmt_meta_out,
> +	.vidioc_s_fmt_meta_out = rkisp1_params_s_fmt_meta_out,
> +	.vidioc_try_fmt_meta_out = rkisp1_params_try_fmt_meta_out,
>   	.vidioc_querycap = rkisp1_params_querycap,
>   	.vidioc_subscribe_event = v4l2_ctrl_subscribe_event,
>   	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
> @@ -1805,13 +1865,16 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
>   					 unsigned int sizes[],
>   					 struct device *alloc_devs[])
>   {
> +	struct rkisp1_params *params = vq->drv_priv;
> +	size_t buf_size = params->metafmt.buffersize;
> +
>   	*num_buffers = clamp_t(u32, *num_buffers,
>   			       RKISP1_ISP_PARAMS_REQ_BUFS_MIN,
>   			       RKISP1_ISP_PARAMS_REQ_BUFS_MAX);
>   
>   	*num_planes = 1;
>   
> -	sizes[0] = sizeof(struct rkisp1_params_cfg);
> +	sizes[0] = buf_size;
sizes[0] = params->metafmt.buffersize; would save a variable - up to you.
>   
>   	return 0;
>   }
> @@ -1831,10 +1894,14 @@ static void rkisp1_params_vb2_buf_queue(struct vb2_buffer *vb)
>   
>   static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
>   {
> -	if (vb2_plane_size(vb, 0) < sizeof(struct rkisp1_params_cfg))
> +	struct vb2_queue *vq = vb->vb2_queue;
> +	struct rkisp1_params *params = vq->drv_priv;
> +	size_t buf_size = params->metafmt.buffersize;
> +
> +	if (vb2_plane_size(vb, 0) < buf_size)
>   		return -EINVAL;
>   
> -	vb2_set_plane_payload(vb, 0, sizeof(struct rkisp1_params_cfg));
> +	vb2_set_plane_payload(vb, 0, buf_size);
>   
>   	return 0;
>   }
> @@ -1929,6 +1996,8 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>   	else
>   		params->ops = &rkisp1_v10_params_ops;
>   
> +	params->metafmt = rkisp1_params_formats[RKISP1_PARAMS_FIXED];
> +
>   	video_set_drvdata(vdev, params);
>   
>   	node->pad.flags = MEDIA_PAD_FL_SOURCE;

