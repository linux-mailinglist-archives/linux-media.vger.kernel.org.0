Return-Path: <linux-media+bounces-30612-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACBD3A95168
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:12:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 971BC3AF1B3
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:12:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0811D265CAA;
	Mon, 21 Apr 2025 13:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="icKEVapo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13549264A86;
	Mon, 21 Apr 2025 13:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241150; cv=none; b=Cqabg78FvLlZOqnY7DSlw0wo/WhF9QXYIqIIuFZdD3JRAdcUJsjbuzsotOuWa35xIzXxxJ08boKd0evnnmzBF1iYSLbmj4Pc3Xoiu3vy6RweZnzWaISJWsXUOFYxYVI0ftxzUE1TQXgrdwv6MIfdrQvXk7guMq/6fTi3GzjvDa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241150; c=relaxed/simple;
	bh=mDkQ8BpafYD8bkq1vS3udTjyPhni4W+EplBFBuDryWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4f2ZTEEc1Co9Zu80YOjA5wz7ei7eFD8nZ32sBgXRlZaoE/jp6FPhFcg/BE2nlCSXWx9qEwl5wX60D7fuzP/ipAboOSPQHAdQna2RDbyefjiQY0v9EwubrwSl9SdCIZ0A/QTT/Wi0rgUU7NHGHDip0XXX9JFXcLkgKYdEQfaPms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=icKEVapo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A8D36D5;
	Mon, 21 Apr 2025 15:10:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745241018;
	bh=mDkQ8BpafYD8bkq1vS3udTjyPhni4W+EplBFBuDryWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=icKEVapoIMJafkXK/KYyRZ224cduW/OpqTXysaNlC73KcsJog7sdS4DAPVJLmlVaa
	 utguAZmB4PwO4v4fiP1TKl4bVRdXCiT1dnn62sf4n14OHB/rHSNXWNqEqk3/C9ZwmU
	 9CX9eWZr5Kpgu+B11SuhKuixPin9WlwS2xTknfNY=
Date: Mon, 21 Apr 2025 16:12:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, mripard@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	devarsht@ti.com, y-abhilashchandra@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com
Subject: Re: [PATCH v3 05/13] media: ti: j721e-csi2rx: add a subdev for the
 core device
Message-ID: <20250421131223.GE29483@pendragon.ideasonboard.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-6-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-6-r-donadkar@ti.com>

Hi Rishikesh,

Thank you for the patch.

On Thu, Apr 17, 2025 at 12:25:46PM +0530, Rishikesh Donadkar wrote:
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
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 230 ++++++++++++++++--
>  1 file changed, 205 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 523c890139098..ea7e331e872af 100644
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
> +		}
> +	}
>  
>  	ret = v4l2_device_register_subdev_nodes(&csi->v4l2_dev);
>  	if (ret)
> @@ -454,8 +476,10 @@ static int csi_async_notifier_complete(struct v4l2_async_notifier *notifier)
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
> @@ -859,7 +883,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	dma->state = TI_CSI2RX_DMA_ACTIVE;
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  
> -	ret = v4l2_subdev_call(csi->source, video, s_stream, 1);
> +	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 1);
>  	if (ret)
>  		goto err_dma;
>  
> @@ -887,7 +911,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  	writel(0, csi->shim + SHIM_CNTL);
>  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>  
> -	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
> +	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
>  	if (ret)
>  		dev_err(csi->dev, "Failed to stop subdev stream\n");
>  
> @@ -903,8 +927,112 @@ static const struct vb2_ops csi_vb2_qops = {
>  	.stop_streaming = ti_csi2rx_stop_streaming,
>  };
>  
> +static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
> +{
> +	return container_of(sd, struct ti_csi2rx_dev, subdev);
> +}
> +

It's customary to place such functions just after the definition of the
corresponding structure.

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

Are there no minimum/maximum limits on the side ?

> +	format->format.field = V4L2_FIELD_NONE;

The colorspace fields need handling too. It's typical for userspace to
set them to *_DEFAULT, on the sink pad, and the kernel is supposed then
adjust them as the V4L2 spec indicates that *_DEFAULT can't be returned.

As lots of drivers handle color spaces in a pass-through way, some help
from the V4L2 core would be nice.

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

Given that ti_csi2rx_sd_set_fmt() doesn't really perform any relevant
adjustment for the default format, it may be easier to replace the above
structure with a static const struct v4l2_mbus_framefmt, and assign it
to the sink and source formats. It depends a bit on how
ti_csi2rx_sd_set_fmt() will evolve when adding support for multiple
streams.

> +}
> +
> +static int ti_csi2rx_sd_s_stream(struct v4l2_subdev *sd, int enable)
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

Have you run v4l2-compliance ? I would have thought that at least
.enum_mbus_code would be mandatory.

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
>  static void ti_csi2rx_cleanup_v4l2(struct ti_csi2rx_dev *csi)
>  {
> +	v4l2_subdev_cleanup(&csi->subdev);
>  	media_device_unregister(&csi->mdev);
>  	v4l2_device_unregister(&csi->v4l2_dev);
>  	media_device_cleanup(&csi->mdev);
> @@ -961,14 +1089,22 @@ static int ti_csi2rx_link_validate(struct media_link *link)
>  	struct v4l2_subdev_format source_fmt = {
>  		.which	= V4L2_SUBDEV_FORMAT_ACTIVE,
>  		.pad	= link->source->index,
> +		.stream = 0,
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

How can no format be present ? Is this for the case where no stream is
routed to a particular context ? If so, the corresponding video device
shouldn't be reached by the pipeline walk algorithm, and this function
shouldn't be called in the first place. Am I missing something ?

> +		return 0;
> +	}
>  
>  	if (source_fmt.format.width != csi_fmt->width) {
>  		dev_dbg(csi->dev, "Width does not match (source %u, sink %u)\n",
> @@ -998,8 +1134,9 @@ static int ti_csi2rx_link_validate(struct media_link *link)
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
> @@ -1010,6 +1147,10 @@ static const struct media_entity_operations ti_csi2rx_video_entity_ops = {
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
> @@ -1041,6 +1182,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>  static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  {
>  	struct media_device *mdev = &csi->mdev;
> +	struct v4l2_subdev *sd = &csi->subdev;
>  	int ret;
>  
>  	mdev->dev = csi->dev;
> @@ -1053,16 +1195,51 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
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
> @@ -1089,9 +1266,9 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
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
> @@ -1147,6 +1324,8 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  	if (!csi->drain.vaddr)
>  		return -ENOMEM;
>  
> +	mutex_init(&csi->mutex);
> +
>  	ret = ti_csi2rx_v4l2_init(csi);
>  	if (ret)
>  		goto err_v4l2;
> @@ -1179,6 +1358,7 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
>  		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
>  	ti_csi2rx_cleanup_v4l2(csi);
>  err_v4l2:
> +	mutex_destroy(&csi->mutex);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);
>  	return ret;
> @@ -1194,7 +1374,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
>  
>  	ti_csi2rx_cleanup_notifier(csi);
>  	ti_csi2rx_cleanup_v4l2(csi);
> -
> +	mutex_destroy(&csi->mutex);
>  	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
>  			  csi->drain.paddr);
>  }

-- 
Regards,

Laurent Pinchart

