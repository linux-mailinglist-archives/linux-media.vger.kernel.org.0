Return-Path: <linux-media+bounces-50704-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BBDFD1FBEB
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 16:28:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C18A43030D22
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 15:23:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BD8839E6D3;
	Wed, 14 Jan 2026 15:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="tHEGRVDB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D4639E17E;
	Wed, 14 Jan 2026 15:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404135; cv=none; b=l2q6RCD82L2aGMfPTR9ytd3NrtEakmWqun1sq9xRWrZdw8Bs0QmP0VIMR+aRPDNnCDuajIuL+7yubXm4n+vzrPryMzBvewWn1+i2Vn/cq0ZWLEQE7nHQpD4bBDl99YOCahq1Eg+SQIareVqHzLmhcCixjrWWpPO1cAahZ9hir6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404135; c=relaxed/simple;
	bh=a9+RI2q9zhV09xSpAURgTsgxs89zUGiTm0/mR2Y6j4w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eiXKr6y03pqYzhX3SJquZsiQ/JOTx6gngrGRChWUBh3CFyViB7YCpEiNP+yv+C214SAictjx+C3R4ZNZpKr4eeeIr1achE3yra37FcGuwgYSD4aOsczw1o/qOxK/+l5kAlCi5k6JyznKbHU9uFEiIr0zMhl7PGBTDFSj+Zf/5ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tHEGRVDB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D6E955C;
	Wed, 14 Jan 2026 16:21:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768404086;
	bh=a9+RI2q9zhV09xSpAURgTsgxs89zUGiTm0/mR2Y6j4w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tHEGRVDBeZqWyogKUAdEQ1KqIh+QOgAE2fr72TKEkd1TasDn9vqJ7W5fu3fAXWYzR
	 FOLhoWT0AF3S1+x5yO+dgCllqBbNU1Vod+K5qis9usDkcWFQPMk5LJPj061FLqIOTW
	 vNlkm/AwtuKGadqhnwymhMUqJzheDoZZ6cXabXoY=
Message-ID: <ee8152c0-daf5-48dd-a2d1-2fafcfeca797@ideasonboard.com>
Date: Wed, 14 Jan 2026 17:21:49 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 06/19] media: ti: j721e-csi2rx: add a subdev for the
 core device
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
References: <20251230083220.2405247-1-r-donadkar@ti.com>
 <20251230083220.2405247-7-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251230083220.2405247-7-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> With single stream capture, it was simpler to use the video device as
> the media entity representing the main TI CSI2RX device. Now with multi
> stream capture coming into the picture, the model has shifted to each
> video device having a link to the main device's subdev. The routing
> would then be set on this subdev.
> 
> Add this subdev, link each context to this subdev's entity and link the
> subdev's entity to the source. Also add an array of media pads. It will
> have one sink pad and source pads equal to the number of contexts.
> 
> Support the new enable_stream()/disable_stream() APIs in the subdev
> instead of s_stream() hook.
> 
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 292 +++++++++++++++---
>  1 file changed, 248 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index f66d68edcd57a..8f49ea2638585 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -54,6 +54,11 @@
>  #define MAX_WIDTH_BYTES			SZ_16K
>  #define MAX_HEIGHT_LINES		SZ_16K
>  
> +#define TI_CSI2RX_PAD_SINK		0
> +#define TI_CSI2RX_PAD_FIRST_SOURCE	1
> +#define TI_CSI2RX_NUM_SOURCE_PADS	1
> +#define TI_CSI2RX_NUM_PADS		(1 + TI_CSI2RX_NUM_SOURCE_PADS)
> +
>  #define DRAIN_TIMEOUT_MS		50
>  #define DRAIN_BUFFER_SIZE		SZ_32K
>  
> @@ -102,6 +107,7 @@ struct ti_csi2rx_ctx {
>  	struct mutex			mutex; /* To serialize ioctls. */
>  	struct v4l2_format		v_fmt;
>  	struct ti_csi2rx_dma		dma;
> +	struct media_pad		pad;
>  	u32				sequence;
>  	u32				idx;
>  };
> @@ -109,12 +115,15 @@ struct ti_csi2rx_ctx {
>  struct ti_csi2rx_dev {
>  	struct device			*dev;
>  	void __iomem			*shim;
> +	struct mutex			mutex; /* To serialize ioctls. */

The mutex is not used (in this patch at least).

> +	unsigned int			enable_count;
>  	struct v4l2_device		v4l2_dev;
>  	struct media_device		mdev;
>  	struct media_pipeline		pipe;
> -	struct media_pad		pad;
> +	struct media_pad		pads[TI_CSI2RX_NUM_PADS];
>  	struct v4l2_async_notifier	notifier;
>  	struct v4l2_subdev		*source;
> +	struct v4l2_subdev		subdev;
>  	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_NUM_CTX];
>  	u8				pix_per_clk;
>  	/* Buffer to drain stale data from PSI-L endpoint */
> @@ -125,6 +134,22 @@ struct ti_csi2rx_dev {
>  	} drain;
>  };
>  
> +static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct ti_csi2rx_dev, subdev);
> +}
> +
> +static const struct v4l2_mbus_framefmt ti_csi2rx_default_fmt = {
> +	.width = 640,
> +	.height = 480,
> +	.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +	.field = V4L2_FIELD_NONE,
> +	.colorspace = V4L2_COLORSPACE_SRGB,
> +	.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +	.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +	.xfer_func = V4L2_XFER_FUNC_SRGB,
> +};
> +
>  static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
>  	{
>  		.fourcc			= V4L2_PIX_FMT_YUYV,
> @@ -422,6 +447,18 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
>  	int ret, i;
>  
> +	/* Create link from source to subdev */
> +	ret = media_create_pad_link(&csi->source->entity,
> +				    CSI2RX_BRIDGE_SOURCE_PAD,
> +				    &csi->subdev.entity,
> +				    TI_CSI2RX_PAD_SINK,
> +				    MEDIA_LNK_FL_IMMUTABLE |
> +				    MEDIA_LNK_FL_ENABLED);
> +
> +	if (ret)
> +		return ret;
> +
> +	/* Create and link video nodes for all DMA contexts */
>  	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
>  		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
>  		struct video_device *vdev = &ctx->vdev;
> @@ -429,15 +466,17 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  		if (ret)
>  			goto unregister_dev;
> -	}
>  
> -	ret = media_create_pad_link(&csi->source->entity,
> -				    CSI2RX_BRIDGE_SOURCE_PAD,
> -				    &csi->ctx[0].vdev.entity, csi->pad.index,
> -				    MEDIA_LNK_FL_IMMUTABLE |
> -				    MEDIA_LNK_FL_ENABLED);
> -	if (ret)
> -		goto unregister_dev;
> +		ret = media_create_pad_link(&csi->subdev.entity,
> +					    TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
> +					    &vdev->entity, 0,
> +					    MEDIA_LNK_FL_IMMUTABLE |
> +					    MEDIA_LNK_FL_ENABLED);
> +		if (ret) {
> +			video_unregister_device(vdev);
> +			goto unregister_dev;
> +		}
> +	}
>  
>  	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
>  	if (ret)
> @@ -447,8 +486,10 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  
>  unregister_dev:
>  	i--;
> -	for (; i >= 0; i--)
> +	for (; i >= 0; i--) {
> +		media_entity_remove_links(&csi->ctx[i].vdev.entity);
>  		video_unregister_device(&csi->ctx[i].vdev);
> +	}
>  	return ret;
>  }
>  
> @@ -493,14 +534,13 @@ static int ti_csi2rx_notifier_register(struct ti_csi2rx_dev *csi)
>  }
>  
>  /* Request maximum possible pixels per clock from the bridge */
> -static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_ctx *ctx)
> +static void ti_csi2rx_request_max_ppc(struct ti_csi2rx_dev *csi)
>  {
> -	struct ti_csi2rx_dev *csi = ctx->csi;
>  	u8 ppc = TI_CSI2RX_MAX_PIX_PER_CLK;
>  	struct media_pad *pad;
>  	int ret;
>  
> -	pad = media_entity_remote_source_pad_unique(&ctx->vdev.entity);
> +	pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>  	if (IS_ERR(pad))
>  		return;
>  
> @@ -526,7 +566,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  	writel(reg, csi->shim + SHIM_CNTL);
>  
>  	/* Negotiate pixel count from the source */
> -	ti_csi2rx_request_max_ppc(ctx);
> +	ti_csi2rx_request_max_ppc(csi);
>  
>  	reg = SHIM_DMACNTX_EN;
>  	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
> @@ -881,7 +921,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	dma->state = TI_CSI2RX_DMA_ACTIVE;
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  
> -	ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
> +	ret = v4l2_subdev_enable_streams(&csi->subdev,
> +					 TI_CSI2RX_PAD_FIRST_SOURCE,
> +					 BIT_U64(0));
>  	if (ret)
>  		goto err_dma;
>  
> @@ -909,7 +951,9 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  	writel(0, csi->shim + SHIM_CNTL);
>  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>  
> -	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
> +	ret = v4l2_subdev_disable_streams(&csi->subdev,
> +					  TI_CSI2RX_PAD_FIRST_SOURCE,
> +					  BIT_U64(0));
>  	if (ret)
>  		dev_err(csi->dev, "Failed to stop subdev stream\n");
>  
> @@ -925,8 +969,121 @@ static const struct vb2_ops csi_vb2_qops = {
>  	.stop_streaming = ti_csi2rx_stop_streaming,
>  };
>  
> +static int ti_csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
> +				    struct v4l2_subdev_state *state,
> +				    struct v4l2_subdev_mbus_code_enum *code_enum)
> +{
> +	if (code_enum->index >= ARRAY_SIZE(ti_csi2rx_formats))
> +		return -EINVAL;
> +
> +	code_enum->code = ti_csi2rx_formats[code_enum->index].code;
> +
> +	return 0;
> +}
> +
> +static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	/* No transcoding, don't allow setting source fmt */
> +	if (format->pad > TI_CSI2RX_PAD_SINK)
> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	if (!find_format_by_code(format->format.code))
> +		format->format.code = ti_csi2rx_formats[0].code;
> +
> +	format->format.field = V4L2_FIELD_NONE;
> +
> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	*fmt = format->format;
> +
> +	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
> +					   format->stream);
> +	*fmt = format->format;
> +
> +	return 0;
> +}
> +
> +static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_mbus_framefmt *fmt;
> +
> +	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
> +	*fmt = ti_csi2rx_default_fmt;
> +
> +	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
> +	*fmt = ti_csi2rx_default_fmt;
> +
> +	return 0;
> +}
> +
> +static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
> +				       struct v4l2_subdev_state *state,
> +				       u32 pad, u64 streams_mask)
> +{
> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
> +	struct media_pad *remote_pad;
> +	int ret = 0;
> +
> +	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
> +	if (!remote_pad)
> +		return -ENODEV;
> +
> +	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
> +					 BIT_U64(0));
> +	if (ret)
> +		return ret;
> +
> +	csi->enable_count++;
> +
> +	return 0;
> +}
> +
> +static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
> +					struct v4l2_subdev_state *state,
> +					u32 pad, u64 streams_mask)
> +{
> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
> +	struct media_pad *remote_pad;
> +	int ret = 0;
> +
> +	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
> +	if (!remote_pad)
> +		return -ENODEV;
> +
> +	if (csi->enable_count == 0)
> +		return -EINVAL;
> +
> +	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
> +					  BIT_U64(0));
> +	if (!ret)
> +		--csi->enable_count;
> +
> +	return 0;
> +}
> +
> +static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
> +	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = ti_csi2rx_sd_set_fmt,
> +	.enable_streams = ti_csi2rx_sd_enable_streams,
> +	.disable_streams = ti_csi2rx_sd_disable_streams,
> +};
> +
> +static const struct v4l2_subdev_ops ti_csi2rx_subdev_ops = {
> +	.pad = &ti_csi2rx_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ti_csi2rx_internal_ops = {
> +	.init_state = ti_csi2rx_sd_init_state,
> +};
> +
>  static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
>  {
> +	v4l2_subdev_cleanup(&csi->subdev);
>  	media_device_unregister(&csi->mdev);
>  	v4l2_device_unregister(&csi->v4l2_dev);
>  	media_device_cleanup(&csi->mdev);
> @@ -981,48 +1138,52 @@ static int ti_csi2rx_link_validate(struct media_link *link)
>  	struct ti_csi2rx_ctx *ctx = container_of(vdev, struct ti_csi2rx_ctx, vdev);
>  	struct ti_csi2rx_dev *csi = ctx->csi;
>  	struct v4l2_pix_format *csi_fmt = &ctx->v_fmt.fmt.pix;
> -	struct v4l2_subdev_format source_fmt = {
> -		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
> -		.pad	= link->source->index,
> -	};
> +	struct v4l2_mbus_framefmt *format;
> +	struct v4l2_subdev_state *state;
>  	const struct ti_csi2rx_fmt *ti_fmt;
> -	int ret;
>  
> -	ret = v4l2_subdev_call_state_active(csi->source, pad,
> -					    get_fmt, &source_fmt);
> -	if (ret)
> -		return ret;
> +	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
> +	format = v4l2_subdev_state_get_format(state, link->source->index, 0);
> +	v4l2_subdev_unlock_state(state);
>  
> -	if (source_fmt.format.width != csi_fmt->width) {
> +	if (!format) {
> +		dev_dbg(csi->dev,
> +			"Skipping validation as no format present on \"%s\":%u:0\n",
> +			link->source->entity->name, link->source->index);
> +		return 0;

Isn't this an error?

 Tomi


> +	}
> +
> +	if (format->width != csi_fmt->width) {
>  		dev_dbg(csi->dev, "Width does not match (source %u, sink %u)\n",
> -			source_fmt.format.width, csi_fmt->width);
> +			format->width, csi_fmt->width);
>  		return -EPIPE;
>  	}
>  
> -	if (source_fmt.format.height != csi_fmt->height) {
> +	if (format->height != csi_fmt->height) {
>  		dev_dbg(csi->dev, "Height does not match (source %u, sink %u)\n",
> -			source_fmt.format.height, csi_fmt->height);
> +			format->height, csi_fmt->height);
>  		return -EPIPE;
>  	}
>  
> -	if (source_fmt.format.field != csi_fmt->field &&
> +	if (format->field != csi_fmt->field &&
>  	    csi_fmt->field != V4L2_FIELD_NONE) {
>  		dev_dbg(csi->dev, "Field does not match (source %u, sink %u)\n",
> -			source_fmt.format.field, csi_fmt->field);
> +			format->field, csi_fmt->field);
>  		return -EPIPE;
>  	}
>  
> -	ti_fmt = find_format_by_code(source_fmt.format.code);
> +	ti_fmt = find_format_by_code(format->code);
>  	if (!ti_fmt) {
>  		dev_dbg(csi->dev, "Media bus format 0x%x not supported\n",
> -			source_fmt.format.code);
> +			format->code);
>  		return -EPIPE;
>  	}
>  
>  	if (ti_fmt->fourcc != csi_fmt->pixelformat) {
>  		dev_dbg(csi->dev,
> -			"Cannot transform source fmt 0x%x to sink fmt 0x%x\n",
> -			ti_fmt->fourcc, csi_fmt->pixelformat);
> +			"Cannot transform \"%s\":%u format %p4cc to %p4cc\n",
> +			link->source->entity->name, link->source->index,
> +			&ti_fmt->fourcc, &csi_fmt->pixelformat);
>  		return -EPIPE;
>  	}
>  
> @@ -1033,6 +1194,10 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
>  	.link_validate = ti_csi2rx_link_validate,
>  };
>  
> +static const struct media_entity_operations ti_csi2rx_subdev_entity_ops = {
> +	.link_validate = v4l2_subdev_link_validate,
> +};
> +
>  static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>  {
>  	struct dma_slave_config cfg = {
> @@ -1058,6 +1223,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>  static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  {
>  	struct media_device *mdev = &csi->mdev;
> +	struct v4l2_subdev *sd = &csi->subdev;
>  	int ret;
>  
>  	mdev->dev = csi->dev;
> @@ -1070,16 +1236,51 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  
>  	ret = v4l2_device_register(csi->dev, &csi->v4l2_dev);
>  	if (ret)
> -		return ret;
> +		goto cleanup_media;
>  
>  	ret = media_device_register(mdev);
> -	if (ret) {
> -		v4l2_device_unregister(&csi->v4l2_dev);
> -		media_device_cleanup(mdev);
> -		return ret;
> -	}
> +	if (ret)
> +		goto unregister_v4l2;
> +
> +	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
> +	sd->internal_ops = &ti_csi2rx_internal_ops;
> +	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> +	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
> +	sd->dev = csi->dev;
> +	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
> +
> +	csi->pads[TI_CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
> +
> +	for (unsigned int i = TI_CSI2RX_PAD_FIRST_SOURCE;
> +	     i < TI_CSI2RX_NUM_PADS; i++)
> +		csi->pads[i].flags = MEDIA_PAD_FL_SOURCE;
> +
> +	ret = media_entity_pads_init(&sd->entity, ARRAY_SIZE(csi->pads),
> +				     csi->pads);
> +	if (ret)
> +		goto unregister_media;
> +
> +	ret = v4l2_subdev_init_finalize(sd);
> +	if (ret)
> +		goto unregister_media;
> +
> +	ret = v4l2_device_register_subdev(&csi->v4l2_dev, sd);
> +	if (ret)
> +		goto cleanup_subdev;
>  
>  	return 0;
> +
> +cleanup_subdev:
> +	v4l2_subdev_cleanup(sd);
> +unregister_media:
> +	media_device_unregister(mdev);
> +unregister_v4l2:
> +	v4l2_device_unregister(&csi->v4l2_dev);
> +cleanup_media:
> +	media_device_cleanup(mdev);
> +
> +	return ret;
>  }
>  
>  static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
> @@ -1106,9 +1307,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>  
>  	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
>  
> -	csi->pad.flags = MEDIA_PAD_FL_SINK;
> +	ctx->pad.flags = MEDIA_PAD_FL_SINK;
>  	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
> -	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
> +	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
>  	if (ret)
>  		return ret;
>  
> @@ -1169,6 +1370,8 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  	if (!csi->drain.vaddr)
>  		return -ENOMEM;
>  
> +	mutex_init(&csi->mutex);
> +
>  	ret = ti_csi2rx_v4l2_init(csi);
>  	if (ret)
>  		goto err_v4l2;
> @@ -1201,6 +1404,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>  	ti_csi2rx_cleanup_v4l2(csi);
>  err_v4l2:
> +	mutex_destroy(&csi->mutex);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);
>  	return ret;
> @@ -1216,7 +1420,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  
>  	ti_csi2rx_cleanup_notifier(csi);
>  	ti_csi2rx_cleanup_v4l2(csi);
> -
> +	mutex_destroy(&csi->mutex);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);
>  }


