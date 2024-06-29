Return-Path: <linux-media+bounces-14394-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A55C91CD7B
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 15:53:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C6F9B21973
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2024 13:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF3808175E;
	Sat, 29 Jun 2024 13:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kvaGtFOo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB24AEF7
	for <linux-media@vger.kernel.org>; Sat, 29 Jun 2024 13:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719669216; cv=none; b=SU0MmdW8Qn2xavzJ3EaTufAysM7sgpKDdBLLT/VAm2pdIHf6o/hLAemFr6gNklXT2UpyNtLwpYZxxik/w6uvY1gQYJMzzOoJCJg0/Nb57oqIBgaKvXE7I55nWX/ZoA7HMlQQbwzaA0VzOcJvLpaDF2OKCHFlofb85rgeeN8CZ/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719669216; c=relaxed/simple;
	bh=NQR85bRlNqRzo+V17B26ubeNmIfcWxXArJd0+sCUnAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uc759AOk//btjsoYfw7WbBO3ChVkQFYb9WnjlXZdK7dLf3zFmPcDL0gjWAHFOGmxuMYrzkBDA9qcPg8YoX42oO9VmO0zCBMlRU3GVWgkZLGjh4HkjCc/W463zXMtxBJmJJLnqotwGkL5OwlQFJJhKpcjHGToTu6+LE/MNiJmlXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kvaGtFOo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 659F84B0;
	Sat, 29 Jun 2024 15:53:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1719669186;
	bh=NQR85bRlNqRzo+V17B26ubeNmIfcWxXArJd0+sCUnAo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvaGtFOobvz/FYOVZPD3I7zhxe0lO/Tx2Tq/oOALy9hNLLiG58Aa2JgyWUvwDvW0Y
	 TJ7PcnkOx+S2YM5GGcUswZmCb0jILMobJGC1fhhZqXV8AK3wd2m7iCPYKcQGmw1gjL
	 r+yQBNGd0lnmW8E0Ggb8B9DzpMcBYvBjjbVtN/Q0=
Date: Sat, 29 Jun 2024 16:53:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 5/7] media: rkisp1: Cache the currently active format
Message-ID: <20240629135310.GF30900@pendragon.ideasonboard.com>
References: <20240621145406.119088-1-jacopo.mondi@ideasonboard.com>
 <20240621145406.119088-6-jacopo.mondi@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240621145406.119088-6-jacopo.mondi@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Fri, Jun 21, 2024 at 04:54:03PM +0200, Jacopo Mondi wrote:
> The rkisp1-params driver assumes the data buffer format is the only
> currently supported "fixed" one. The usage of the "fixed" format is
> assumed when allocating memory for the scratch buffers and when
> initializing the vb2 queue.
> 
> In order to prepare to support the "extensible" format beside the
> existing "fixed" one, add support in the driver for both formats by
> caching a pointer to the active one in the driver structure and use it
> in the vb2 queue operations and subdev pad operations implementations.
> 
> Do not yet allow userspace to select between the two formats as the
> support for the "extensible" format parsing will be introduced in a later
> patch in the series.
> 
> While at it, document the un-documented ycbcr_encoding field of
> struct rkisp1_params_ops.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  8 ++-
>  .../platform/rockchip/rkisp1/rkisp1-params.c  | 62 ++++++++++++-------
>  2 files changed, 43 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index cdc7cc64ebd5..ccd2065351b4 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -255,7 +255,7 @@ struct rkisp1_buffer {
>  struct rkisp1_params_buffer {
>  	struct vb2_v4l2_buffer vb;
>  	struct list_head queue;
> -	struct rkisp1_params_cfg *cfg;
> +	void *cfg;
>  };
>  
>  /*
> @@ -386,8 +386,9 @@ struct rkisp1_params_ops {
>   * @ops:		pointer to the variant-specific operations
>   * @config_lock:	locks the buffer list 'params'
>   * @params:		queue of rkisp1_buffer
> - * @vdev_fmt:		v4l2_format of the metadata format
> + * @metafmt		the currently enabled metadata format
>   * @quantization:	the quantization configured on the isp's src pad
> + * @ycbcr_encoding	the YCbCr encoding
>   * @raw_type:		the bayer pattern on the isp video sink pad
>   */
>  struct rkisp1_params {
> @@ -397,7 +398,8 @@ struct rkisp1_params {
>  
>  	spinlock_t config_lock; /* locks the buffers list 'params' */
>  	struct list_head params;
> -	struct v4l2_format vdev_fmt;
> +
> +	const struct v4l2_meta_format *metafmt;
>  
>  	enum v4l2_quantization quantization;
>  	enum v4l2_ycbcr_encoding ycbcr_encoding;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index c081b41d6212..e38d2da994f5 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -35,6 +35,22 @@
>  #define RKISP1_ISP_CC_COEFF(n) \
>  			(RKISP1_CIF_ISP_CC_COEFF_0 + (n) * 4)
>  
> +enum rkisp1_params_formats {
> +	RKISP1_PARAMS_FIXED,
> +	RKISP1_PARAMS_EXTENSIBLE,
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
>  static inline void
>  rkisp1_param_set_bits(struct rkisp1_params *params, u32 reg, u32 bit_mask)
>  {
> @@ -1745,7 +1761,7 @@ static int rkisp1_params_enum_fmt_meta_out(struct file *file, void *priv,
>  	if (f->index > 0 || f->type != video->queue->type)
>  		return -EINVAL;
>  
> -	f->pixelformat = params->vdev_fmt.fmt.meta.dataformat;
> +	f->pixelformat = params->metafmt->dataformat;
>  
>  	return 0;
>  }
> @@ -1761,8 +1777,8 @@ static int rkisp1_params_g_fmt_meta_out(struct file *file, void *fh,
>  		return -EINVAL;
>  
>  	memset(meta, 0, sizeof(*meta));
> -	meta->dataformat = params->vdev_fmt.fmt.meta.dataformat;
> -	meta->buffersize = params->vdev_fmt.fmt.meta.buffersize;
> +	meta->dataformat = params->metafmt->dataformat;
> +	meta->buffersize = params->metafmt->buffersize;
>  
>  	return 0;
>  }
> @@ -1805,13 +1821,15 @@ static int rkisp1_params_vb2_queue_setup(struct vb2_queue *vq,
>  					 unsigned int sizes[],
>  					 struct device *alloc_devs[])
>  {
> +	struct rkisp1_params *params = vq->drv_priv;
> +
>  	*num_buffers = clamp_t(u32, *num_buffers,
>  			       RKISP1_ISP_PARAMS_REQ_BUFS_MIN,
>  			       RKISP1_ISP_PARAMS_REQ_BUFS_MAX);
>  
>  	*num_planes = 1;
>  
> -	sizes[0] = sizeof(struct rkisp1_params_cfg);
> +	sizes[0] = params->metafmt->buffersize;
>  
>  	return 0;
>  }
> @@ -1821,8 +1839,10 @@ static int rkisp1_params_vb2_buf_init(struct vb2_buffer *vb)
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct rkisp1_params_buffer *params_buf =
>  		container_of(vbuf, struct rkisp1_params_buffer, vb);
> +	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
>  
> -	params_buf->cfg = kvmalloc(sizeof(*params_buf->cfg), GFP_KERNEL);
> +	params_buf->cfg = kvmalloc(params->metafmt->buffersize,
> +				   GFP_KERNEL);
>  	if (!params_buf->cfg)
>  		return -ENOMEM;
>  
> @@ -1857,19 +1877,19 @@ static int rkisp1_params_vb2_buf_prepare(struct vb2_buffer *vb)
>  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
>  	struct rkisp1_params_buffer *params_buf =
>  		container_of(vbuf, struct rkisp1_params_buffer, vb);
> -	struct rkisp1_params_cfg *cfg =
> -		vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
> +	void *cfg = vb2_plane_vaddr(&params_buf->vb.vb2_buf, 0);
> +	struct rkisp1_params *params = vb->vb2_queue->drv_priv;
>  
> -	if (vb2_plane_size(vb, 0) < sizeof(struct rkisp1_params_cfg))
> +	if (vb2_plane_size(vb, 0) < params->metafmt->buffersize)
>  		return -EINVAL;
>  
> -	vb2_set_plane_payload(vb, 0, sizeof(struct rkisp1_params_cfg));
> +	vb2_set_plane_payload(vb, 0, params->metafmt->buffersize);

I think you should drop this line. The plane payload is stored in
bytesused, which is set by userspace for output devices. It shouldn't be
overwritten by the driver.

Instead, you should check that the payload is big enough. For fixed
formats, that means checking it is >= sizeof(struct rkisp1_params_cfg)
(or params->metafmt->buffersize, as the two are the same). For
extensible formats, I would check that the payload is large enough to
store the parameters buffer header.

>  
>  	/*
>  	 * Copy the parameters buffer to the internal scratch buffer to avoid
>  	 * userspace modifying the buffer content while the driver processes it.
>  	 */
> -	memcpy(params_buf->cfg, cfg, sizeof(*cfg));
> +	memcpy(params_buf->cfg, cfg, params->metafmt->buffersize);

And here I would copy vb2_get_plane_payload(vb, 0) bytes only.

>  
>  	return 0;
>  }
> @@ -1932,19 +1952,6 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
>  	return vb2_queue_init(q);
>  }
>  
> -static void rkisp1_init_params(struct rkisp1_params *params)
> -{
> -	params->vdev_fmt.fmt.meta.dataformat =
> -		V4L2_META_FMT_RK_ISP1_PARAMS;
> -	params->vdev_fmt.fmt.meta.buffersize =
> -		sizeof(struct rkisp1_params_cfg);
> -
> -	if (params->rkisp1->info->isp_ver == RKISP1_V12)
> -		params->ops = &rkisp1_v12_params_ops;
> -	else
> -		params->ops = &rkisp1_v10_params_ops;
> -}
> -
>  int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  {
>  	struct rkisp1_params *params = &rkisp1->params;
> @@ -1973,7 +1980,14 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
>  	vdev->vfl_dir = VFL_DIR_TX;
>  	rkisp1_params_init_vb2_queue(vdev->queue, params);
> -	rkisp1_init_params(params);
> +
> +	params->metafmt = &rkisp1_params_formats[RKISP1_PARAMS_FIXED];
> +
> +	if (params->rkisp1->info->isp_ver == RKISP1_V12)
> +		params->ops = &rkisp1_v12_params_ops;
> +	else
> +		params->ops = &rkisp1_v10_params_ops;
> +
>  	video_set_drvdata(vdev, params);
>  
>  	node->pad.flags = MEDIA_PAD_FL_SOURCE;

-- 
Regards,

Laurent Pinchart

