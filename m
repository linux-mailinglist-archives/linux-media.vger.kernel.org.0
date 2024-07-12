Return-Path: <linux-media+bounces-14971-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3CA92FC5D
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 16:18:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3FD3B23288
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 14:18:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0DB817165D;
	Fri, 12 Jul 2024 14:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t1kcvruq"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53508F58;
	Fri, 12 Jul 2024 14:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720793924; cv=none; b=M4hc2qgO7dCKDTVUJVZODf4svoglUxViB/XzUt0BJm+puqivqphoVd81c03Qc3qMZkovYLKIYZYbI+OIU+lnV7latswrGpKBtBDxi1/7ZFBpE9AWwPQ9hizOdXqaAm8Q+a4DkLIhHQ5JMLN2qQfJ0YJQ5DzCd7bIoNv9VOM399Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720793924; c=relaxed/simple;
	bh=Gpc8LL2l9TC1owgaqw+KVsmY5X66DdSYgsVLuOYWWg8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aiPf8oZc3+W6rIr6poYhcCJOwP9OO+FAYUr7mMrVLoQpnbqV0cX54PXK82Swzj2utSGR5kcdhnvb1J8LXJIof53czZUSFGHNf8ktgjvggjBwcP8YxizTDjJ0h8B79w43qPjQbMMqHm7plcoU0UoqYM2bINnX2fr6ANGixdKZG60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t1kcvruq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-63.net.vodafone.it [5.90.56.63])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5ED54512;
	Fri, 12 Jul 2024 16:18:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720793885;
	bh=Gpc8LL2l9TC1owgaqw+KVsmY5X66DdSYgsVLuOYWWg8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t1kcvruq3irsIjd6lxHTKxstBdlkTOtFbiE0oRMtoNp+MiH5If6YUEYKmFvp7KHH0
	 xpxgYOLM3wZgvSaMf8KfX4gwQoVYFHHByFfc31JaiUeNQpyG18T3i7VKeHqRWpJZkM
	 R10U0XBsxIzBlfUh8IUTmMy19OlSwfm+9USAQQ64=
Date: Fri, 12 Jul 2024 16:18:36 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Jai Luthra <j-luthra@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Vaishnav Achath <vaishnav.a@ti.com>, 
	Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
	Aradhya Bhatia <a-bhatia1@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Changhuang Liang <changhuang.liang@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>, 
	Julien Massot <julien.massot@collabora.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 06/13] media: ti: j721e-csi2rx: add a subdev for the
 core device
Message-ID: <jrblrr34yriz2xb4id5hpx6cbf5vdzte4jmkt535uwmyfoqsox@jvvcjtq5nlmh>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-6-6ae96c54c1c3@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240627-multistream-v2-6-6ae96c54c1c3@ti.com>

On Thu, Jun 27, 2024 at 06:40:01PM GMT, Jai Luthra wrote:
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
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 237 ++++++++++++++++++---
>  1 file changed, 212 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 361b0ea8e0d9..13d7426ab4ba 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -51,6 +51,11 @@
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
> @@ -97,6 +102,7 @@ struct ti_csi2rx_ctx {
>  	struct mutex			mutex; /* To serialize ioctls. */
>  	struct v4l2_format		v_fmt;
>  	struct ti_csi2rx_dma		dma;
> +	struct media_pad		pad;
>  	u32				sequence;
>  	u32				idx;
>  };
> @@ -104,12 +110,15 @@ struct ti_csi2rx_ctx {
>  struct ti_csi2rx_dev {
>  	struct device			*dev;
>  	void __iomem			*shim;
> +	struct mutex			mutex; /* To serialize ioctls. */
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
>  	/* Buffer to drain stale data from PSI-L endpoint */
>  	struct {
> @@ -431,6 +440,15 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  	struct ti_csi2rx_dev *csi = dev_get_drvdata(notifier->v4l2_dev->dev);
>  	int ret, i;
>
> +	/* Create link from source to subdev */
> +	ret = v4l2_create_fwnode_links_to_pad(csi->source,

Isn't this a single link from the image source to the RX's sink pad ?
Wouldn't media_create_pad_link() do here ?


> +					      &csi->pads[TI_CSI2RX_PAD_SINK],
> +					      MEDIA_LNK_FL_IMMUTABLE |
> +					      MEDIA_LNK_FL_ENABLED);
> +	if (ret)
> +		return ret;
> +
> +	/* Create and link video nodes for all DMA contexts */
>  	for (i = 0; i < TI_CSI2RX_NUM_CTX; i++) {
>  		struct ti_csi2rx_ctx *ctx = &csi->ctx[i];
>  		struct video_device *vdev = &ctx->vdev;
> @@ -438,13 +456,17 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
>  		ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  		if (ret)
>  			goto unregister_dev;
> -	}
>
> -	ret = v4l2_create_fwnode_links_to_pad(csi->source, &csi->pad,
> -					      MEDIA_LNK_FL_IMMUTABLE |
> -					      MEDIA_LNK_FL_ENABLED);
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

Should you call media_entity_remove_links() on the csi2 entity on the
error path ?

> +		}
> +	}
>
>  	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
>  	if (ret)
> @@ -859,7 +881,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	dma->state = TI_CSI2RX_DMA_ACTIVE;
>  	spin_unlock_irqrestore(&dma->lock, flags);
>
> -	ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
> +	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 1);
>  	if (ret)
>  		goto err_dma;
>
> @@ -887,7 +909,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  	writel(0, csi->shim + SHIM_CNTL);
>  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>
> -	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
> +	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
>  	if (ret)
>  		dev_err(csi->dev, "Failed to stop subdev stream\n");
>
> @@ -905,6 +927,119 @@ static const struct vb2_ops csi_vb2_qops = {
>  	.wait_finish = vb2_ops_wait_finish,
>  };
>
> +static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct ti_csi2rx_dev, subdev);
> +}
> +
> +static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_format *format)
> +{
> +	struct v4l2_mbus_framefmt *fmt;
> +	int ret = 0;
> +
> +	/* No transcoding, don't allow setting source fmt */
> +	if (format->pad >= TI_CSI2RX_PAD_FIRST_SOURCE)


                        > TI_CSI2RX_PAD_SINK

might be clearer

> +		return v4l2_subdev_get_fmt(sd, state, format);
> +
> +	if (!find_format_by_code(format->format.code))
> +		format->format.code = ti_csi2rx_formats[0].code;
> +
> +	format->format.field = V4L2_FIELD_NONE;

What about other colorspace related fields ?

> +
> +	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
> +	if (!fmt) {

Can this happen ?

> +		ret = -EINVAL;
> +		goto out;
> +	}
> +	*fmt = format->format;
> +
> +	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE,
> +					   format->stream);
> +	if (!fmt) {
> +		ret = -EINVAL;

ditto

> +		goto out;

kind of missing the point of a jump here where you can simply return
-EINVAL

> +	}
> +	*fmt = format->format;
> +
> +out:
> +	return ret;
> +}
> +
> +static int ti_csi2rx_sd_init_state(struct v4l2_subdev *sd,
> +				   struct v4l2_subdev_state *state)
> +{
> +	struct v4l2_subdev_format format = {
> +		.pad = TI_CSI2RX_PAD_SINK,
> +		.format = {
> +			.width = 640,
> +			.height = 480,
> +			.code = MEDIA_BUS_FMT_UYVY8_1X16,
> +			.field = V4L2_FIELD_NONE,
> +			.colorspace = V4L2_COLORSPACE_SRGB,
> +			.ycbcr_enc = V4L2_YCBCR_ENC_601,
> +			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
> +			.xfer_func = V4L2_XFER_FUNC_SRGB,
> +		},
> +	};
> +
> +	return ti_csi2rx_sd_set_fmt(sd, state, &format);
> +}
> +
> +static int ti_csi2rx_sd_s_stream(struct v4l2_subdev *sd, int enable)

Even if I never used that API myself, but I have a feeling
enable_streams() (which is meant to replace s_stream for multiplexed
subdev) would help you avoiding the manual enable_count booking here
below ?

> +{
> +	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
> +	int ret = 0;
> +
> +	mutex_lock(&csi->mutex);
> +
> +	if (enable) {
> +		if (csi->enable_count > 0) {
> +			csi->enable_count++;
> +			goto out;
> +		}
> +
> +		ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
> +		if (ret)
> +			goto out;
> +
> +		csi->enable_count++;
> +	} else {
> +		if (csi->enable_count == 0) {
> +			ret = -EINVAL;
> +			goto out;
> +		}
> +
> +		if (--csi->enable_count > 0)
> +			goto out;
> +
> +		ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
> +	}
> +
> +out:
> +	mutex_unlock(&csi->mutex);
> +	return ret;
> +}
> +
> +static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
> +	.get_fmt = v4l2_subdev_get_fmt,
> +	.set_fmt = ti_csi2rx_sd_set_fmt,
> +};
> +
> +static const struct v4l2_subdev_video_ops ti_csi2rx_subdev_video_ops = {
> +	.s_stream = ti_csi2rx_sd_s_stream,
> +};
> +
> +static const struct v4l2_subdev_ops ti_csi2rx_subdev_ops = {
> +	.video = &ti_csi2rx_subdev_video_ops,
> +	.pad = &ti_csi2rx_subdev_pad_ops,
> +};
> +
> +static const struct v4l2_subdev_internal_ops ti_csi2rx_internal_ops = {
> +	.init_state = ti_csi2rx_sd_init_state,
> +};
> +
>  static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_ctx *ctx)
>  {
>  	dma_release_channel(ctx->dma.chan);
> @@ -912,6 +1047,7 @@ static void ti_csi2rx_cleanup_dma(struct ti_csi2rx_ctx *ctx)
>
>  static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
>  {
> +	v4l2_subdev_cleanup(&csi->subdev);
>  	media_device_unregister(&csi->mdev);
>  	v4l2_device_unregister(&csi->v4l2_dev);
>  	media_device_cleanup(&csi->mdev);
> @@ -973,14 +1109,22 @@ static int ti_csi2rx_link_validate(struct media_link *link)
>  	struct v4l2_subdev_format source_fmt = {
>  		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
>  		.pad	= link->source->index,
> +		.stream = 0,

I don't think it hurts, but this seems not to be strictly related to
this patch ?

>  	};
> +	struct v4l2_subdev_state *state;
>  	const struct ti_csi2rx_fmt *ti_fmt;
>  	int ret;
>
> -	ret = v4l2_subdev_call_state_active(csi->source, pad,
> -					    get_fmt, &source_fmt);
> -	if (ret)
> -		return ret;
> +	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
> +	ret = v4l2_subdev_call(&csi->subdev, pad, get_fmt, state, &source_fmt);
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (ret) {
> +		dev_dbg(csi->dev,
> +			"Skipping validation as no format present on \"%s\":%u:0\n",
> +			link->source->entity->name, link->source->index);

If get_fmt returns an error, should you simply continue or fail ? In
which cases get_fmt on a subdev fails ? Only if the pad or the stream
are not valid right ?

> +		return 0;
> +	}
>
>  	if (source_fmt.format.width != csi_fmt->width) {
>  		dev_dbg(csi->dev, "Width does not match (source %u, sink %u)\n",
> @@ -1010,8 +1154,9 @@ static int ti_csi2rx_link_validate(struct media_link *link)
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
> @@ -1022,6 +1167,10 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
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
> @@ -1053,7 +1202,8 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>  static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  {
>  	struct media_device *mdev = &csi->mdev;
> -	int ret;
> +	struct v4l2_subdev *sd = &csi->subdev;
> +	int ret, i;
>
>  	mdev->dev = csi->dev;
>  	mdev->hw_revision = 1;
> @@ -1065,16 +1215,50 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
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
> +	for (i = TI_CSI2RX_PAD_FIRST_SOURCE; i < TI_CSI2RX_NUM_PADS; i++)

        for (unsigned int i = 0;

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
> @@ -1101,9 +1285,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>
>  	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
>
> -	csi->pad.flags = MEDIA_PAD_FL_SINK;

Ah was this re-initializing the same pad multiple times ?

> +	ctx->pad.flags = MEDIA_PAD_FL_SINK;
>  	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
> -	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &csi->pad);
> +	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);
>  	if (ret)
>  		return ret;
>
> @@ -1159,6 +1343,8 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  	if (!csi->drain.vaddr)
>  		return -ENOMEM;
>
> +	mutex_init(&csi->mutex);
> +
>  	ret = ti_csi2rx_v4l2_init(csi);
>  	if (ret)
>  		goto err_v4l2;
> @@ -1191,6 +1377,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>  	ti_csi2rx_cleanup_v4l2(csi);
>  err_v4l2:
> +	mutex_destroy(&csi->mutex);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);
>  	return ret;
> @@ -1213,7 +1400,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>
>  	ti_csi2rx_cleanup_notifier(csi);
>  	ti_csi2rx_cleanup_v4l2(csi);
> -
> +	mutex_destroy(&csi->mutex);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);
>  }
>
> --
> 2.43.0
>
>

