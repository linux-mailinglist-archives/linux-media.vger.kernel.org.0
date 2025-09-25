Return-Path: <linux-media+bounces-43154-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 022ABB9F385
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 14:24:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E38873B808E
	for <lists+linux-media@lfdr.de>; Thu, 25 Sep 2025 12:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4F6730DEB9;
	Thu, 25 Sep 2025 12:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lYRasnu2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4944302150;
	Thu, 25 Sep 2025 12:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758802667; cv=none; b=E7ZcIFdHjVgPHvAffXlsqzXkDnbX5W6Ema2sNGFifMV5CwlITChQH72IwH7DTxiYGFZAhUv1pN/cPfmNwdeWkLuhgTWEJK7gSfhoC7PKyJx4hh/aZ42+YBYLM4Z4vJA/Fa8fnHdaztzdRp9+YmqZ7PsBEwbIcjR0SzJ/ZtHaWME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758802667; c=relaxed/simple;
	bh=/H18EEGmd23bZeWmSLMGvzq/xi98YvVE1gTvBOLucmo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W39BHtQ48qsSl7eAhxYznRUdk8cb41bK339crVCpKVoobAgRl7QE4fa6ByCwKW2PG960NxH+N/mcZuplqJLSDsFncX3tD3HwGBYDWY70T1J220EDcpnHe2wn0Ea3h5LiuMnwYqcl/DtvxXp/m7XFnVkVGrydPoMqMfr6Lyk1khE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lYRasnu2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E015C1419;
	Thu, 25 Sep 2025 14:16:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758802578;
	bh=/H18EEGmd23bZeWmSLMGvzq/xi98YvVE1gTvBOLucmo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lYRasnu24E3ScQ7+1999KINs0g0X+pSopmqeCp3oxZ1Is8MHqRRDkmWevSQ4yGTv1
	 xrkrQz/Bgmp3feHzjrBNBy7UwG7/47TWYEcYle78dziDioV9MySivb0dLrUjq0bGW+
	 CdgJwe5bK6D42+Ly8EZid2xZjRCx8hogPWTjGbOQ=
Message-ID: <4534a09b-7eef-4e61-835a-c70d07df3416@ideasonboard.com>
Date: Thu, 25 Sep 2025 15:17:38 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/16] media: ti: j721e-csi2rx: add multistream support
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250911102832.1583440-1-r-donadkar@ti.com>
 <20250911102832.1583440-12-r-donadkar@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250911102832.1583440-12-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2025 13:28, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Each CSI2 stream can be multiplexed into 4 independent streams, each
> identified by its virtual channel number. To capture this multiplexed

The split can also be done with the datatype. I don't see it supported
in the driver, but afaics the HW supports it. Was there a reason not to
support DT filtering? I would think it would be very simple addition.

 Tomi

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
> instead of s_stream() hook.
> 
> De-assert the pixel interface reset on first start_streaming() and assert
> it on the last stop_streaming().
> 
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 194 ++++++++++++------
>  1 file changed, 136 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 903722b5aea7..f0c6f931bfc7 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -146,17 +146,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
>  	return container_of(sd, struct ti_csi2rx_dev, subdev);
>  }
>  
> -static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
> -	.width = 640,
> -	.height = 480,
> -	.code = MEDIA_BUS_FMT_UYVY8_1X16,
> -	.field = V4L2_FIELD_NONE,
> -	.colorspace = V4L2_COLORSPACE_SRGB,
> -	.ycbcr_enc = V4L2_YCBCR_ENC_601,
> -	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> -	.xfer_func = V4L2_XFER_FUNC_SRGB,
> -};
> -
>  static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>  	{
>  		.fourcc			= V4L2_PIX_FMT_YUYV,
> @@ -568,8 +557,10 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>  
>  	/* De-assert the pixel interface reset. */
> -	reg = SHIM_CNTL_PIX_RST;
> -	writel(reg, csi->shim + SHIM_CNTL);
> +	if (!csi->enable_count) {
> +		reg = SHIM_CNTL_PIX_RST;
> +		writel(reg, csi->shim + SHIM_CNTL);
> +	}
>  
>  	/* Negotiate pixel count from the source */
>  	ti_csi2rx_request_max_ppc(csi);
> @@ -1023,7 +1014,10 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	dma->state = TI_CSI2RX_DMA_ACTIVE;
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  
> -	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 1);
> +	/* Start stream 0, we don't allow multiple streams on the source pad */
> +	ret = v4l2_subdev_enable_streams(&csi->subdev,
> +					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
> +					 BIT(0));
>  	if (ret)
>  		goto err_dma;
>  
> @@ -1046,19 +1040,26 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  	struct ti_csi2rx_dev *csi = ctx->csi;
>  	int ret;
>  
> -	video_device_pipeline_stop(&ctx->vdev);
> +	mutex_lock(&csi->mutex);
>  
> -	writel(0, csi->shim + SHIM_CNTL);
>  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>  
> -	mutex_lock(&csi->mutex);
> -	csi->vc_cached = false;
> -	mutex_unlock(&csi->mutex);
> +	/* assert pixel reset to prevent stale data */
> +	if (csi->enable_count == 1) {
> +		writel(0, csi->shim + SHIM_CNTL);
> +		csi->vc_cached = false;
> +	}
>  
> -	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
> +	video_device_pipeline_stop(&ctx->vdev);
> +
> +	ret = v4l2_subdev_disable_streams(&csi->subdev,
> +					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
> +					  BIT(0));
>  	if (ret)
>  		dev_err(csi->dev, "Failed to stop subdev stream\n");
>  
> +	mutex_unlock(&csi->mutex);
> +
>  	ti_csi2rx_stop_dma(ctx);
>  	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
>  }
> @@ -1101,74 +1102,151 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
>  	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
>  	*fmt = format->format;
>  
> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
> -					   format->stream);
> +	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
> +							   format->stream);
> +	if (!fmt)
> +		return -EINVAL;
> +
>  	*fmt = format->format;
>  
>  	return 0;
>  }
>  
> -static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
> -				   struct v4l2_subdev_state *state)
> +static int _ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
> +				     struct v4l2_subdev_state *state,
> +				     struct v4l2_subdev_krouting *routing)
>  {
> -	struct v4l2_mbus_framefmt *fmt;
> +	int ret;
>  
> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
> -	*fmt = ti_csi2rx_default_fmt;
> +	const struct v4l2_mbus_framefmt format = {
> +		.width = 640,
> +		.height = 480,
> +		.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +		.field = V4L2_FIELD_NONE,
> +		.colorspace = V4L2_COLORSPACE_SRGB,
> +		.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +		.xfer_func = V4L2_XFER_FUNC_SRGB,
> +	};
>  
> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
> -	*fmt = ti_csi2rx_default_fmt;
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
>  
> -	return 0;
> +	if (ret)
> +		return ret;
> +
> +	/* Only stream ID 0 allowed on source pads */
> +	for (unsigned int i = 0; i < routing->num_routes; ++i) {
> +		const struct v4l2_subdev_route *route = &routing->routes[i];
> +
> +		if (route->source_stream != 0)
> +			return -EINVAL;
> +	}
> +
> +	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format);
> +
> +	return ret;
> +}
> +
> +static int ti_csi2rx_sd_set_routing(struct v4l2_subdev *sd,
> +				    struct v4l2_subdev_state *state,
> +				    enum v4l2_subdev_format_whence which,
> +				    struct v4l2_subdev_krouting *routing)
> +{
> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
> +
> +	if (csi->enable_count > 0)
> +		return -EBUSY;
> +
> +	return _ti_csi2rx_sd_set_routing(sd, state, routing);
> +}
> +
> +static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_route routes[] = { {
> +		.sink_pad = 0,
> +		.sink_stream = 0,
> +		.source_pad = TI_CSI2RX_PAD_FIRST_SOURCE,
> +		.source_stream = 0,
> +		.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
> +	} };
> +
> +	struct v4l2_subdev_krouting routing = {
> +		.num_routes = 1,
> +		.routes = routes,
> +	};
> +
> +	/* Initialize routing to single route to the fist source pad */
> +	return _ti_csi2rx_sd_set_routing(sd, state, &routing);
>  }
>  
> -static int ti_csi2rx_sd_s_stream(struct v4l2_subdev *sd, int enable)
> +static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *state,
> +				       u32 pad, u64 streams_mask)
>  {
>  	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
> +	struct media_pad *remote_pad;
> +	u64 sink_streams;
>  	int ret = 0;
>  
> +	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
> +	if (!remote_pad)
> +		return -ENODEV;
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       TI_CSI2RX_PAD_SINK,
> +						       &streams_mask);
> +
> +	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
> +					 sink_streams);
> +	if (ret)
> +		return ret;
> +
>  	mutex_lock(&csi->mutex);
> +	csi->enable_count++;
> +	mutex_unlock(&csi->mutex);
>  
> -	if (enable) {
> -		if (csi->enable_count > 0) {
> -			csi->enable_count++;
> -			goto out;
> -		}
> +	return 0;
> +}
>  
> -		ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
> -		if (ret)
> -			goto out;
> +static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					u32 pad, u64 streams_mask)
> +{
> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
> +	struct media_pad *remote_pad;
> +	u64 sink_streams;
> +	int ret = 0;
>  
> -		csi->enable_count++;
> -	} else {
> -		if (csi->enable_count == 0) {
> -			ret = -EINVAL;
> -			goto out;
> -		}
> +	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
> +	if (!remote_pad)
> +		return -ENODEV;
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       TI_CSI2RX_PAD_SINK,
> +						       &streams_mask);
>  
> -		if (--csi->enable_count > 0)
> -			goto out;
> +	if (csi->enable_count == 0)
> +		return -EINVAL;
>  
> -		ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
> -	}
> +	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
> +					  sink_streams);
> +	if (!ret)
> +		--csi->enable_count;
>  
> -out:
> -	mutex_unlock(&csi->mutex);
> -	return ret;
> +	return 0;
>  }
>  
>  static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
>  	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
> +	.set_routing = ti_csi2rx_sd_set_routing,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ti_csi2rx_sd_set_fmt,
> -};
> -
> -static const struct v4l2_subdev_video_ops ti_csi2rx_subdev_video_ops = {
> -	.s_stream = ti_csi2rx_sd_s_stream,
> +	.enable_streams = ti_csi2rx_sd_enable_streams,
> +	.disable_streams = ti_csi2rx_sd_disable_streams,
>  };
>  
>  static const struct v4l2_subdev_ops ti_csi2rx_subdev_ops = {
> -	.video = &ti_csi2rx_subdev_video_ops,
>  	.pad = &ti_csi2rx_subdev_pad_ops,
>  };
>  
> @@ -1345,7 +1423,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
>  	sd->internal_ops = &ti_csi2rx_internal_ops;
>  	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> -	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>  	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
>  	sd->dev = csi->dev;
>  	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;


