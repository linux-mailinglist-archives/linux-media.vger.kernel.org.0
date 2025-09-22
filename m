Return-Path: <linux-media+bounces-42949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A0947B91677
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 15:30:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54A4D2A37B6
	for <lists+linux-media@lfdr.de>; Mon, 22 Sep 2025 13:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF69530C36F;
	Mon, 22 Sep 2025 13:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="A8WHERhA"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094C741C63;
	Mon, 22 Sep 2025 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758547827; cv=none; b=IPbC0iSEM6RuZtmfjAD8bbnWjSqyiWK7UovfTs56Vz8H/SeI2hKGDzXocQO2K5YZxGOTcks0XLEyYgpl/EBblTNJfzu6LBawSbTLYun9OhsunqBjX9Me85Kk2Cw6ppvS8feBofb3pf8XFOKzRTxtXG4fcNjT4GLrWWf34sMozmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758547827; c=relaxed/simple;
	bh=/nAVCigp73cE6lEPVXQKwxrrvSOq/c8fB/xSb/ejS6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Re69+OepLRFAulNgiBwNx1g0yg8AVxB9OhSk7JFOLu6Yv/GGexERNOWZT4bhjr401YkfKU2N1j6w3xBYSH1FSH18e+vF8kt162jGxZLLKXuezSe922vhJtfOpX1cxeycHMIJS/LX9vZ4SEJuvKbcOxIoiu6dtL9lc6P7wB2nhks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=A8WHERhA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78DEF4AD;
	Mon, 22 Sep 2025 15:28:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758547737;
	bh=/nAVCigp73cE6lEPVXQKwxrrvSOq/c8fB/xSb/ejS6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A8WHERhAtUEW5oz7Xk/vCj/s0Yl8dUJ3vxYdQKJ+znHqVpTyc9W9PvUeLgYuaiRUr
	 MvbxIFS6lQ9dU5oAgN/RoUOE5TsDEEAPkXtqv5BeZPJ5lAzo31ZcYQQgHxFlowemYd
	 evUr/1uNO47O3qxxjsVJtJxHtLFtadU8aDxW0FKA=
Message-ID: <fa27ae08-4568-4b0c-b8bb-a4b31746e27f@ideasonboard.com>
Date: Mon, 22 Sep 2025 16:30:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/16] media: ti: j721e-csi2rx: add support for
 processing virtual channels
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
 <20250911102832.1583440-10-r-donadkar@ti.com>
Content-Language: en-US
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20250911102832.1583440-10-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11/09/2025 13:28, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Use get_frame_desc() to get the frame desc from the connected source,
> and use the provided virtual channel instead of hardcoded one.
> 
> get_frame_desc() returns the same information when called on each stream
> start, so instead get the VCs for all the routed stream at first
> stream start and cache this information in the driver.
> 
> get_frame_desc() works per stream, but as we don't support multiple
> streams yet, we will just always use stream 0. If the source doesn't
> support get_frame_desc(), fall back to the previous method of always
> capturing virtual channel 0.
> 
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index f3443c3ab01a..903722b5aea7 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -32,6 +32,7 @@
>  #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
>  #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
>  #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
> +#define SHIM_DMACNTX_VC			GENMASK(9, 6)
>  #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
>  #define SHIM_DMACNTX_YUV422_MODE_11	3
>  #define SHIM_DMACNTX_SIZE_8		0
> @@ -103,6 +104,7 @@ struct ti_csi2rx_dev;
>  
>  struct ti_csi2rx_ctx {
>  	struct ti_csi2rx_dev		*csi;
> +	struct v4l2_subdev_route	*route;
>  	struct video_device		vdev;
>  	struct vb2_queue		vidq;
>  	struct mutex			mutex; /* To serialize ioctls. */
> @@ -111,6 +113,8 @@ struct ti_csi2rx_ctx {
>  	struct media_pad		pad;
>  	u32				sequence;
>  	u32				idx;
> +	u32				vc;
> +	u32				stream;
>  };
>  
>  struct ti_csi2rx_dev {
> @@ -134,6 +138,7 @@ struct ti_csi2rx_dev {
>  		dma_addr_t		paddr;
>  		size_t			len;
>  	} drain;
> +	bool				vc_cached;
>  };
>  
>  static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
> @@ -610,6 +615,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  	}
>  
>  	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
>  
>  	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>  
> @@ -884,6 +890,82 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  	}
>  }
>  
> +static int ti_csi2rx_get_route(struct ti_csi2rx_ctx *ctx)
> +{
> +	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct media_pad *pad;
> +	struct v4l2_subdev_state *state;
> +	struct v4l2_subdev_route *r;
> +
> +	/* Get the source pad connected to this ctx */
> +	pad = media_entity_remote_source_pad_unique(ctx->pad.entity);
> +	if (!pad) {
> +		dev_err(csi->dev, "No pad connected to ctx %d\n", ctx->idx);
> +		return -ENODEV;
> +	}
> +
> +	state = v4l2_subdev_lock_and_get_active_state(&csi->subdev);
> +
> +	for_each_active_route(&state->routing, r) {
> +		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> +			continue;
> +		if (r->source_pad != pad->index)
> +			continue;
> +
> +		ctx->route = r;
> +	}
> +
> +	v4l2_subdev_unlock_state(state);

I'm still learning the structure for this driver, but the pattern here
does not look right. If you unlock the state, the state can change. You
can't store the route and expect it to stay the same after unlock.
Here you are even storing a pointer to the state, which can be dangerous.

Our current v4l2 state locking is not perfect and we need to do some
manual locking/unlocking in the drivers for now, and, indeed, we just
have to expect that it doesn't change. But that has to happen inside the
enable/disable path, with such locking that it's "as safe as possible",
which means locking early, as much as possible and keeping the lock
during the processing. In many cases the framework deals with that (and
that's our future target generally).

In the subdev enable path, .enable_streams already has the state locked
and the driver doesn't have to deal with it. If using s_stream (but why
would you?) you need to lock it yourself, and it usually makes sense to
lock almost as the first thing, and pass the state forward (or use
v4l2_subdev_get_locked_active_state()).

Here all this processing is happening from ti_csi2rx_start_streaming(),
so not even from the subdev's ops. So I'm not sure yet how to clean this
up, but, as I said, it just doesn't look right.

 Tomi

> +
> +	if (!ctx->route)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
> +static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
> +{
> +	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct ti_csi2rx_ctx *curr_ctx;
> +	struct v4l2_mbus_frame_desc fd;
> +	struct media_pad *source_pad;
> +	struct v4l2_subdev_route *curr_route;
> +	int ret;
> +	unsigned int i, j;
> +
> +	/* Get the frame desc form source */
> +	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
> +	if (!source_pad)
> +		return -ENODEV;
> +
> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
> +	if (ret)
> +		return ret;
> +
> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EINVAL;
> +
> +	for (i = 0; i < csi->num_ctx; i++) {
> +		curr_ctx = &csi->ctx[i];
> +
> +		/* Capture VC 0 by default */
> +		curr_ctx->vc = 0;
> +
> +		ret = ti_csi2rx_get_route(curr_ctx);
> +		if (ret)
> +			continue;
> +
> +		curr_route = curr_ctx->route;
> +		curr_ctx->stream = curr_route->sink_stream;
> +
> +		for (j = 0; j < fd.num_entries; j++)
> +			if (curr_ctx->stream == fd.entry[j].stream)
> +				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
> @@ -904,6 +986,25 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret)
>  		goto err;
>  
> +	/* If no stream is routed to this ctx, exit early */
> +	ret = ti_csi2rx_get_route(ctx);
> +	if (ret)
> +		goto err;
> +
> +	/* Get the VC for all enabled ctx on first stream start */
> +	mutex_lock(&csi->mutex);
> +	if (!csi->vc_cached) {
> +		ret = ti_csi2rx_get_vc(ctx);
> +		if (ret == -ENOIOCTLCMD) {
> +			ctx->vc = 0;
> +		} else if (ret < 0) {
> +			mutex_unlock(&csi->mutex);
> +			goto err;
> +		}
> +		csi->vc_cached = true;
> +	}
> +	mutex_unlock(&csi->mutex);
> +
>  	ti_csi2rx_setup_shim(ctx);
>  
>  	ctx->sequence = 0;
> @@ -950,6 +1051,10 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  	writel(0, csi->shim + SHIM_CNTL);
>  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>  
> +	mutex_lock(&csi->mutex);
> +	csi->vc_cached = false;
> +	mutex_unlock(&csi->mutex);
> +
>  	ret = v4l2_subdev_call(&csi->subdev, video, s_stream, 0);
>  	if (ret)
>  		dev_err(csi->dev, "Failed to stop subdev stream\n");
> @@ -1303,6 +1408,8 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>  
>  	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
>  
> +	ctx->route = NULL;
> +
>  	ctx->pad.flags = MEDIA_PAD_FL_SINK;
>  	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
>  	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);


