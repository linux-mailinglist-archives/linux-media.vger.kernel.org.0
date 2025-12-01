Return-Path: <linux-media+bounces-47955-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C79C977C2
	for <lists+linux-media@lfdr.de>; Mon, 01 Dec 2025 14:08:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 386D33A3EA5
	for <lists+linux-media@lfdr.de>; Mon,  1 Dec 2025 13:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E444530FF1E;
	Mon,  1 Dec 2025 13:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YtVXA88b"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38AF3101D4;
	Mon,  1 Dec 2025 13:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764594233; cv=none; b=s5YLCb2vQRlIazkF7QhBGs+y0S5mwHA76LhaminM76d46Dn9cY7uyWppNN2Vd0Iij4kvTAJdDKfPsDIo/akDPKHFNzbk3GzZ5hVynv78fBHtomiqei+6y7e9yAYYRigW9KAWAkdxPRnj8iUI/QVXZ7T4hu1r+LwBrc+rVITKuwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764594233; c=relaxed/simple;
	bh=3/DvHuv5reqPX2Y5FLZOS3UvAQnK6XxiD0s5HRoC8rE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+IYYzisdTjvrESdEqOWCDNmO0Zi6gyKeFuZbGq7dYYDt0VTE6Qlwu6gYvAbxuoS3J7cYdxZxPc/lLlqiOru7E4CpcJnYUa0pUr6xPoksuQGKxtM4YJI0e24w/xF8aQm5oD9jRkSxoXiorYVXm0/C+gknQqCx7LhdTiwLgU0Q3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YtVXA88b; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D8E86AC;
	Mon,  1 Dec 2025 14:01:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1764594093;
	bh=3/DvHuv5reqPX2Y5FLZOS3UvAQnK6XxiD0s5HRoC8rE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YtVXA88bB66RNnR1zTfDUlVKUjFn1yd1UrmY1W9dj5SKsMrYJ3jNNsbk3+qJmu1hX
	 Zv1UGpWlYciX75MIweixh4h9fNUfsLG3XjAO6pbNUr5C7A7YthZdH96znFCNcUdxJx
	 woA0E7KZitt+KIh/5pR6MDQt9kGK+M8p17Jwp0Vk=
Message-ID: <1e7be0c3-b7da-4eac-9a39-147c1e627cbb@ideasonboard.com>
Date: Mon, 1 Dec 2025 15:03:42 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 13/18] media: ti: j721e-csi2rx: add multistream support
To: Rishikesh Donadkar <r-donadkar@ti.com>, jai.luthra@linux.dev,
 laurent.pinchart@ideasonboard.com, mripard@kernel.org
Cc: y-abhilashchandra@ti.com, devarsht@ti.com, s-jain1@ti.com,
 vigneshr@ti.com, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 p.zabel@pengutronix.de, conor+dt@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil-cisco@xs4all.nl, jai.luthra@ideasonboard.com,
 changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com,
 sjoerd@collabora.com, dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20251112115459.2479225-1-r-donadkar@ti.com>
 <20251112115459.2479225-14-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 xsFNBE6ms0cBEACyizowecZqXfMZtnBniOieTuFdErHAUyxVgtmr0f5ZfIi9Z4l+uUN4Zdw2
 wCEZjx3o0Z34diXBaMRJ3rAk9yB90UJAnLtb8A97Oq64DskLF81GCYB2P1i0qrG7UjpASgCA
 Ru0lVvxsWyIwSfoYoLrazbT1wkWRs8YBkkXQFfL7Mn3ZMoGPcpfwYH9O7bV1NslbmyJzRCMO
 eYV258gjCcwYlrkyIratlHCek4GrwV8Z9NQcjD5iLzrONjfafrWPwj6yn2RlL0mQEwt1lOvn
 LnI7QRtB3zxA3yB+FLsT1hx0va6xCHpX3QO2gBsyHCyVafFMrg3c/7IIWkDLngJxFgz6DLiA
 G4ld1QK/jsYqfP2GIMH1mFdjY+iagG4DqOsjip479HCWAptpNxSOCL6z3qxCU8MCz8iNOtZk
 DYXQWVscM5qgYSn+fmMM2qN+eoWlnCGVURZZLDjg387S2E1jT/dNTOsM/IqQj+ZROUZuRcF7
 0RTtuU5q1HnbRNwy+23xeoSGuwmLQ2UsUk7Q5CnrjYfiPo3wHze8avK95JBoSd+WIRmV3uoO
 rXCoYOIRlDhg9XJTrbnQ3Ot5zOa0Y9c4IpyAlut6mDtxtKXr4+8OzjSVFww7tIwadTK3wDQv
 Bus4jxHjS6dz1g2ypT65qnHen6mUUH63lhzewqO9peAHJ0SLrQARAQABzTBUb21pIFZhbGtl
 aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT7CwY4EEwEIADgWIQTEOAw+
 ll79gQef86f6PaqMvJYe9QUCX/HruAIbAwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgAAKCRD6
 PaqMvJYe9WmFD/99NGoD5lBJhlFDHMZvO+Op8vCwnIRZdTsyrtGl72rVh9xRfcSgYPZUvBuT
 VDxE53mY9HaZyu1eGMccYRBaTLJSfCXl/g317CrMNdY0k40b9YeIX10feiRYEWoDIPQ3tMmA
 0nHDygzcnuPiPT68JYZ6tUOvAt7r6OX/litM+m2/E9mtp8xCoWOo/kYO4mOAIoMNvLB8vufi
 uBB4e/AvAjtny4ScuNV5c5q8MkfNIiOyag9QCiQ/JfoAqzXRjVb4VZG72AKaElwipiKCWEcU
 R4+Bu5Qbaxj7Cd36M/bI54OrbWWETJkVVSV1i0tghCd6HHyquTdFl7wYcz6cL1hn/6byVnD+
 sR3BLvSBHYp8WSwv0TCuf6tLiNgHAO1hWiQ1pOoXyMEsxZlgPXT+wb4dbNVunckwqFjGxRbl
 Rz7apFT/ZRwbazEzEzNyrBOfB55xdipG/2+SmFn0oMFqFOBEszXLQVslh64lI0CMJm2OYYe3
 PxHqYaztyeXsx13Bfnq9+bUynAQ4uW1P5DJ3OIRZWKmbQd/Me3Fq6TU57LsvwRgE0Le9PFQs
 dcP2071rMTpqTUteEgODJS4VDf4lXJfY91u32BJkiqM7/62Cqatcz5UWWHq5xeF03MIUTqdE
 qHWk3RJEoWHWQRzQfcx6Fn2fDAUKhAddvoopfcjAHfpAWJ+ENc7BTQROprNHARAAx0aat8GU
 hsusCLc4MIxOQwidecCTRc9Dz/7U2goUwhw2O5j9TPqLtp57VITmHILnvZf6q3QAho2QMQyE
 DDvHubrdtEoqaaSKxKkFie1uhWNNvXPhwkKLYieyL9m2JdU+b88HaDnpzdyTTR4uH7wk0bBa
 KbTSgIFDDe5lXInypewPO30TmYNkFSexnnM3n1PBCqiJXsJahE4ZQ+WnV5FbPUj8T2zXS2xk
 0LZ0+DwKmZ0ZDovvdEWRWrz3UzJ8DLHb7blPpGhmqj3ANXQXC7mb9qJ6J/VSl61GbxIO2Dwb
 xPNkHk8fwnxlUBCOyBti/uD2uSTgKHNdabhVm2dgFNVuS1y3bBHbI/qjC3J7rWE0WiaHWEqy
 UVPk8rsph4rqITsj2RiY70vEW0SKePrChvET7D8P1UPqmveBNNtSS7In+DdZ5kUqLV7rJnM9
 /4cwy+uZUt8cuCZlcA5u8IsBCNJudxEqBG10GHg1B6h1RZIz9Q9XfiBdaqa5+CjyFs8ua01c
 9HmyfkuhXG2OLjfQuK+Ygd56mV3lq0aFdwbaX16DG22c6flkkBSjyWXYepFtHz9KsBS0DaZb
 4IkLmZwEXpZcIOQjQ71fqlpiXkXSIaQ6YMEs8WjBbpP81h7QxWIfWtp+VnwNGc6nq5IQDESH
 mvQcsFS7d3eGVI6eyjCFdcAO8eMAEQEAAcLBXwQYAQIACQUCTqazRwIbDAAKCRD6PaqMvJYe
 9fA7EACS6exUedsBKmt4pT7nqXBcRsqm6YzT6DeCM8PWMTeaVGHiR4TnNFiT3otD5UpYQI7S
 suYxoTdHrrrBzdlKe5rUWpzoZkVK6p0s9OIvGzLT0lrb0HC9iNDWT3JgpYDnk4Z2mFi6tTbq
 xKMtpVFRA6FjviGDRsfkfoURZI51nf2RSAk/A8BEDDZ7lgJHskYoklSpwyrXhkp9FHGMaYII
 m9EKuUTX9JPDG2FTthCBrdsgWYPdJQvM+zscq09vFMQ9Fykbx5N8z/oFEUy3ACyPqW2oyfvU
 CH5WDpWBG0s5BALp1gBJPytIAd/pY/5ZdNoi0Cx3+Z7jaBFEyYJdWy1hGddpkgnMjyOfLI7B
 CFrdecTZbR5upjNSDvQ7RG85SnpYJTIin+SAUazAeA2nS6gTZzumgtdw8XmVXZwdBfF+ICof
 92UkbYcYNbzWO/GHgsNT1WnM4sa9lwCSWH8Fw1o/3bX1VVPEsnESOfxkNdu+gAF5S6+I6n3a
 ueeIlwJl5CpT5l8RpoZXEOVtXYn8zzOJ7oGZYINRV9Pf8qKGLf3Dft7zKBP832I3PQjeok7F
 yjt+9S+KgSFSHP3Pa4E7lsSdWhSlHYNdG/czhoUkSCN09C0rEK93wxACx3vtxPLjXu6RptBw
 3dRq7n+mQChEB1am0BueV1JZaBboIL0AGlSJkm23kw==
In-Reply-To: <20251112115459.2479225-14-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/2025 13:54, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Each CSI2 stream can be multiplexed into 4 independent streams, each

Well, that's not true, at least generally speaking (there can be more
than 4). Is that specific to TI hardware?

> identified by its virtual channel number and data type. The incoming
> data from these streams can be filtered on the basis of either the
> virtual channel or the data type.
> 
> To capture this multiplexed stream, the application needs to tell
> the driver how it wants to route the data. It needs to specify
> which context should process which stream. This is done via the
> new routing APIs.
> 
> Add ioctls to accept routing information from the application and save
> that in the driver. This can be used when starting streaming on a
> context to determine which route and consequently which virtual channel
> it should process.
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
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 224 ++++++++++++++----
>  1 file changed, 179 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 126a62fa2c4c4..c8e0e761f2802 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -103,6 +103,7 @@ struct ti_csi2rx_dev;
>  
>  struct ti_csi2rx_ctx {
>  	struct ti_csi2rx_dev		*csi;
> +	struct v4l2_subdev_route        *route;
>  	struct video_device		vdev;
>  	struct vb2_queue		vidq;
>  	struct mutex			mutex; /* To serialize ioctls. */
> @@ -136,6 +137,7 @@ struct ti_csi2rx_dev {
>  		dma_addr_t		paddr;
>  		size_t			len;
>  	} drain;
> +	bool                            vc_cached;
>  };
>  
>  static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
> @@ -143,17 +145,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
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
> @@ -566,8 +557,10 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
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
> @@ -888,30 +881,80 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
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

This looks a bit concerning. You lock the state, find the correct route
and store a pointer to the route into the ctx, then unlock the state...
Alarm bells should be ringing here.

> +
> +	for_each_active_route(&state->routing, r) {
> +		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))

for_each_active_route() already checks this ("_active_").

> +			continue;
> +		if (r->source_pad != pad->index)
> +			continue;
> +
> +		ctx->route = r;

Shouldn't you break here?

> +	}
> +
> +	v4l2_subdev_unlock_state(state);
> +
> +	if (!ctx->route)
> +		return -ENODEV;
> +
> +	return 0;
> +}
> +
>  static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
>  {
>  	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct ti_csi2rx_ctx *curr_ctx;
>  	struct v4l2_mbus_frame_desc fd;
> -	struct media_pad *pad;
> -	int ret, i;
> +	struct media_pad *source_pad;
> +	struct v4l2_subdev_route *curr_route;
> +	int ret;
> +	unsigned int i, j;
>  
> -	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
> -	if (!pad)
> +	/* Get the frame desc form source */
> +	source_pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
> +	if (!source_pad)
>  		return -ENODEV;
>  
> -	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, source_pad->index, &fd);
>  	if (ret)
>  		return ret;
>  
>  	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>  		return -EINVAL;
>  
> -	for (i = 0; i < fd.num_entries; i++) {
> -		if (ctx->stream == fd.entry[i].stream)
> -			return fd.entry[i].bus.csi2.vc;
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
>  	}
>  
> -	return -ENODEV;
> +	return 0;
>  }
>  
>  static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
> @@ -934,13 +977,24 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret)
>  		goto err;
>  
> -	ret = ti_csi2rx_get_vc(ctx);
> -	if (ret == -ENOIOCTLCMD)
> -		ctx->vc = 0;
> -	else if (ret < 0)
> +	/* If no stream is routed to this ctx, exit early */
> +	ret = ti_csi2rx_get_route(ctx);
> +	if (ret)
>  		goto err;
> -	else
> -		ctx->vc = ret;
> +
> +	/* Get the VC for all enabled ctx on first stream start */

Is the comment right? How does this work? ti_csi2rx_get_vc() is passed a
single context, but... it gets VCs for all contexts? And shouldn't these
also be dealing with DT at the same time with VC?

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
>  
>  	ti_csi2rx_setup_shim(ctx);
>  
> @@ -960,8 +1014,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	dma->state = TI_CSI2RX_DMA_ACTIVE;
>  	spin_unlock_irqrestore(&dma->lock, flags);
>  
> +	/* Start stream 0, we don't allow multiple streams on the source pad */
>  	ret = v4l2_subdev_enable_streams(&csi->subdev,
> -					 TI_CSI2RX_PAD_FIRST_SOURCE,
> +					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>  					 BIT(0));
>  	if (ret)
>  		goto err_dma;
> @@ -985,17 +1040,26 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  	struct ti_csi2rx_dev *csi = ctx->csi;
>  	int ret;
>  
> -	video_device_pipeline_stop(&ctx->vdev);
> +	mutex_lock(&csi->mutex);
>  
> -	writel(0, csi->shim + SHIM_CNTL);
>  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>  
> +	/* assert pixel reset to prevent stale data */
> +	if (csi->enable_count == 1) {
> +		writel(0, csi->shim + SHIM_CNTL);
> +		csi->vc_cached = false;
> +	}
> +
> +	video_device_pipeline_stop(&ctx->vdev);
> +
>  	ret = v4l2_subdev_disable_streams(&csi->subdev,
> -					  TI_CSI2RX_PAD_FIRST_SOURCE,
> +					  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>  					  BIT(0));
>  	if (ret)
>  		dev_err(csi->dev, "Failed to stop subdev stream\n");
>  
> +	mutex_unlock(&csi->mutex);
> +
>  	ti_csi2rx_stop_dma(ctx);
>  	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
>  }
> @@ -1038,25 +1102,84 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
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

"static const"

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
>  static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
> @@ -1065,14 +1188,18 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
>  {
>  	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>  	struct media_pad *remote_pad;
> +	u64 sink_streams;
>  	int ret = 0;
>  
>  	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>  	if (!remote_pad)
>  		return -ENODEV;
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       TI_CSI2RX_PAD_SINK,
> +						       &streams_mask);
>  
>  	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
> -					 BIT(0));
> +					 sink_streams);
>  	if (ret)
>  		return ret;
>  
> @@ -1087,17 +1214,21 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
>  {
>  	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
>  	struct media_pad *remote_pad;
> +	u64 sink_streams;
>  	int ret = 0;
>  
>  	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>  	if (!remote_pad)
>  		return -ENODEV;
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       TI_CSI2RX_PAD_SINK,
> +						       &streams_mask);
>  
>  	if (csi->enable_count == 0)
>  		return -EINVAL;
>  
>  	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
> -					  BIT(0));
> +					  sink_streams);
>  	if (!ret)
>  		--csi->enable_count;
>  
> @@ -1106,6 +1237,7 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
>  
>  static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
>  	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
> +	.set_routing = ti_csi2rx_sd_set_routing,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ti_csi2rx_sd_set_fmt,
>  	.enable_streams = ti_csi2rx_sd_enable_streams,
> @@ -1284,7 +1416,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
>  	sd->internal_ops = &ti_csi2rx_internal_ops;
>  	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> -	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>  	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
>  	sd->dev = csi->dev;
>  	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;
> @@ -1347,6 +1479,8 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
>  
>  	ti_csi2rx_fill_fmt(fmt, &ctx->v_fmt);
>  
> +	ctx->route = NULL;
> +
>  	ctx->pad.flags = MEDIA_PAD_FL_SINK;
>  	vdev->entity.ops = &ti_csi2rx_video_entity_ops;
>  	ret = media_entity_pads_init(&ctx->vdev.entity, 1, &ctx->pad);


