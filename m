Return-Path: <linux-media+bounces-15143-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3D893767A
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 12:09:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 220331C210A6
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 10:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E0F883A14;
	Fri, 19 Jul 2024 10:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C5qv2iqv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE8457CBC;
	Fri, 19 Jul 2024 10:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721383761; cv=none; b=k6YaeKa6FDTF9Y0BHT3tKL+h4syG4H8vsXvVeiO46HjMVvnY1fN8DfKzu9RcAaSLEeiJRlcT610zFNevGAr1ycnHusWTAO5Of/ZdA7X9iauNaz3JaQtd2bXrSkTmMXYZkO8mYeQBjx/Scg/R5ZYhgmeBNMGcfeb+3L8/9N31UwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721383761; c=relaxed/simple;
	bh=lzudtVWmw9NQO7kuU0aulUsDtvr0+fppS+NObr+6Epk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDmTYu0ybjCix+6EtZ52UIFPnLPOMl6LXWrauW2yaj6lzV4MTtD0ClRfRRmlBC2vZ5PiSukyNbWD3WM+dXGJziiY74dBZHhLNMDvzW/6x2d27OAxFmnmFdy3YmLQYwz5vFq1O1xYcMahJj6P21lP3iHdIHjDwuk0Vjoz+zPZkXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C5qv2iqv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-157-149-128.elisa-laajakaista.fi [91.157.149.128])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E796C471;
	Fri, 19 Jul 2024 12:08:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721383718;
	bh=lzudtVWmw9NQO7kuU0aulUsDtvr0+fppS+NObr+6Epk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=C5qv2iqvFvhc20FIRWf++E5bFsHtl6Ozc97LRSyv7IvlD1qMyDAf47U7EPELLP4FJ
	 6rwTFufyytZ//Glyu5RJXUeBQJoPFQnnkkr3wtUkaSZhSg8t3tQ3E1vIgate9d9B+d
	 liLAjcQDucfe619OvVMmQ3hrz2G4KGUnElp9fzdA=
Message-ID: <fd0c4091-923d-4ef3-b440-5032b5d38851@ideasonboard.com>
Date: Fri, 19 Jul 2024 13:09:14 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] media: ti: j721e-csi2rx: add multistream support
To: Jai Luthra <j-luthra@ti.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 Julien Massot <julien.massot@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath
 <vaishnav.a@ti.com>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-12-6ae96c54c1c3@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20240627-multistream-v2-12-6ae96c54c1c3@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27/06/2024 16:10, Jai Luthra wrote:
> Each CSI2 stream can be multiplexed into 4 independent streams, each
> identified by its virtual channel number. To capture this multiplexed
> stream, the application needs to tell the driver how it wants to route
> the data. It needs to specify which context should process which stream.
> This is done via the new routing APIs.
> 
> Add ioctls to accept routing information from the application and save
> that in the driver. This can be used when starting streaming on a
> context to determine which route and consequently which virtual channel
> it should process.
> 
> Support the new enable_stream()/disable_stream() APIs in the subdev
> instead of s_stream() hook. We wait for the userspace to start capturing
> on all video nodes that have active routes, and once all video nodes are
> STREAMON, we request the source to enable_stream() for all the sink
> streams.
> 
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>   .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 231 +++++++++++++++++----
>   1 file changed, 185 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index c0916ca1a6f8..84b972c251e8 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -124,6 +124,7 @@ struct ti_csi2rx_dev {
>   	struct v4l2_subdev		*source;
>   	struct v4l2_subdev		subdev;
>   	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
> +	u64				streams_mask; /* Enabled sink streams */
>   	/* Buffer to drain stale data from PSI-L endpoint */
>   	struct {
>   		void			*vaddr;
> @@ -535,10 +536,6 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>   
>   	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>   
> -	/* De-assert the pixel interface reset. */
> -	reg = SHIM_CNTL_PIX_RST;
> -	writel(reg, csi->shim + SHIM_CNTL);
> -
>   	reg = SHIM_DMACNTX_EN;
>   	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
>   
> @@ -881,8 +878,12 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>   	struct ti_csi2rx_dev *csi = ctx->csi;
>   	struct ti_csi2rx_dma *dma = &ctx->dma;
>   	struct ti_csi2rx_buffer *buf;
> +	struct v4l2_subdev_krouting *routing;
> +	struct v4l2_subdev_route *route = NULL;
> +	struct media_pad *remote_pad;
>   	unsigned long flags;
> -	int ret = 0;
> +	int ret = 0, i;
> +	struct v4l2_subdev_state *state;
>   
>   	spin_lock_irqsave(&dma->lock, flags);
>   	if (list_empty(&dma->queue))
> @@ -895,6 +896,40 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>   	if (ret)
>   		goto err;
>   
> +	remote_pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
> +	if (!remote_pad) {
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
> +
> +	routing = &state->routing;
> +
> +	/* Find the stream to process. */
> +	for (i = 0; i < routing->num_routes; i++) {

for_each_active_route()

> +		struct v4l2_subdev_route *r = &routing->routes[i];
> +
> +		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;
> +
> +		if (r->source_pad != remote_pad->index)
> +			continue;
> +
> +		route = r;
> +		break;
> +	}
> +
> +	if (!route) {
> +		ret = -ENODEV;
> +		v4l2_subdev_unlock_state(state);
> +		goto err;
> +	}
> +
> +	ctx->stream = route->sink_stream;
> +
> +	v4l2_subdev_unlock_state(state);
> +
>   	ret = ti_csi2rx_get_vc(ctx);
>   	if (ret == -ENOIOCTLCMD)
>   		ctx->vc = 0;
> @@ -921,7 +956,10 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>   	dma->state = TI_CSI2RX_DMA_ACTIVE;
>   	spin_unlock_irqrestore(&dma->lock, flags);
>   
> -	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 1);
> +	/* Start stream 0, we don't allow multiple streams on the source pad */
> +	ret = v4l2_subdev_enable_streams(&csi->subdev,
> +					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
> +					 BIT(0));
>   	if (ret)
>   		goto err_dma;
>   
> @@ -944,12 +982,16 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>   	struct ti_csi2rx_dev *csi = ctx->csi;
>   	int ret;
>   
> -	video_device_pipeline_stop(&ctx->vdev);
> -
> +	/* assert pixel reset to prevent stale data */
>   	writel(0, csi->shim + SHIM_CNTL);
> +
> +	video_device_pipeline_stop(&ctx->vdev);
>   	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>   
> -	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
> +	ret = v4l2_subdev_disable_streams(&csi->subdev,
> +					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
> +					  BIT(0));
> +
>   	if (ret)
>   		dev_err(csi->dev, "Failed to stop subdev stream\n");
>   
> @@ -995,8 +1037,8 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
>   	}
>   	*fmt = format->format;
>   
> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
> -					   format->stream);
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
>   	if (!fmt) {
>   		ret = -EINVAL;
>   		goto out;
> @@ -1007,72 +1049,169 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
>   	return ret;
>   }
>   
> +static int _ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     struct v4l2_subdev_krouting *routing)
> +{
> +	int ret;
> +
> +	const struct v4l2_mbus_framefmt format = {

static const

  Tomi


