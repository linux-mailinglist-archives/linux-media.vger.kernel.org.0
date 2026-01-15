Return-Path: <linux-media+bounces-50778-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2B7D247F8
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 13:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 335C030E6D46
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 12:27:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0658D396B6C;
	Thu, 15 Jan 2026 12:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="BlXxSD56"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303EB35B150;
	Thu, 15 Jan 2026 12:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768480033; cv=none; b=JCZr0tlYsuYFOL1+HnRV/V0NZgirKvjbp/REzYsWEbbN291x5XmlKXjNqzYES1w1vFHkdfSpN2VdTvUEmtGn9NiognvrUUGKfTJdSXpw93Otb76mUIPHtj43TABNFD40wW/GcWVAw3NpnEMJwgQtvvRR7zu5lEZeYAIuflUyjH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768480033; c=relaxed/simple;
	bh=nLSZgV56iezNxSKqBce34DVNzHxKtSLSvcQvuSpAuec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=psAfWPg62AtySM+2VIBCDZOPSSIoXXpIZpZ9I9jZXhC86yFp1+XipLDzjzFUf/QT3WzMDbYDjB78C5fLPF/WtVUQ3U0eJl+b4lUis2VHtJTCYlyNhSxWUPexIQCfsK814SIjuu2BHTiemy2bMvnl4IdPnS44BA4nez02PpvV/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=BlXxSD56; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9234C24A;
	Thu, 15 Jan 2026 13:26:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768480000;
	bh=nLSZgV56iezNxSKqBce34DVNzHxKtSLSvcQvuSpAuec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BlXxSD56ZhIjgatuB3H+Le37hIlDTLBZWv6sZKpJNlF6DVhGNFkcuu/+tSf0rT/F9
	 WTwA3GdOlt9hHm30O7L4U3MfKo0NPjsY4vAIxVnyFb1t9Lve4sH9H7l+WtBQyJxELj
	 HD6xQprji1X7RSKI7MBk7TjNLb3UGQ3b8gVohZHY=
Message-ID: <84a6038a-4805-4cce-abaf-975a61b196e4@ideasonboard.com>
Date: Thu, 15 Jan 2026 14:27:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 13/19] media: ti: j721e-csi2rx: add multistream support
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
 <20251230083220.2405247-14-r-donadkar@ti.com>
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
In-Reply-To: <20251230083220.2405247-14-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Each CSI2 stream can be multiplexed into 4 independent streams, each
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
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 259 +++++++++++++-----
>  1 file changed, 189 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 6f9f34aa26f1b..4a063364f893e 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -137,6 +137,7 @@ struct ti_csi2rx_dev {
>  		dma_addr_t		paddr;
>  		size_t			len;
>  	} drain;
> +	bool                            vc_cached;
>  };
>  
>  static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
> @@ -144,17 +145,6 @@ static inline struct ti_csi2rx_dev *to_csi2rx_dev(struct v4l2_subdev *sd)
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
> @@ -567,8 +557,10 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  	fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
>  
>  	/* De-assert the pixel interface reset. */
> -	reg = SHIM_CNTL_PIX_RST;
> -	writel(reg, csi->shim + SHIM_CNTL);
> +	if (!csi->enable_count) {
> +		reg = SHIM_CNTL_PIX_RST;
> +		writel(reg, csi->shim + SHIM_CNTL);
> +	}

I think this is a bit messy. Here we have ti_csi2rx_setup_shim() which
is passed ctx as a parameter, but it also does non-context stuff, if
this is the first enable.

In ti_csi2rx_sd_enable_streams(), we check !csi->vc_cached (which,
afaics, is essentially also "is this the first enable"), and do stuff.

The structure should be so that we have a clear
setup-things-on-the-first-enable function, and
setup-things-for-a-context function. Now these two things are mixed in
together, also with the 'vc_cached' field which I think is not needed at
all.

Actually, maybe I'm mixing the operation of the video dev and the subdev
here, as the single file contains both. It still looks confusing: in
ti_csi2rx_stop_streaming() we assert reset, but we don't de-assert in
ti_csi2rx_start_streaming(). Instead we deassert in
ti_csi2rx_setup_shim() which is called from ti_csi2rx_sd_enable_streams().

Please check these out. There most likely should be more symmetry here
wrt. enabling and disabling things.

>  
>  	/* Negotiate pixel count from the source */
>  	ti_csi2rx_request_max_ppc(csi);
> @@ -889,29 +881,69 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  	}
>  }
>  
> +static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
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
> +	state = v4l2_subdev_get_locked_active_state(&csi->subdev);
> +
> +	for_each_active_route(&state->routing, r) {
> +		if (r->source_pad == pad->index) {
> +			ctx->stream = r->sink_stream;
> +			return 0;
> +		}
> +	}
> +
> +	/* No route found for this ctx */
> +	return -ENODEV;
> +}
> +
>  static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
>  {
>  	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct ti_csi2rx_ctx *curr_ctx;
>  	struct v4l2_mbus_frame_desc fd;
> -	struct media_pad *pad;
> -	int ret, i;
> +	struct media_pad *source_pad;
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
> -		if (ctx->stream == fd.entry[i].stream) {
> -			ctx->vc = fd.entry[i].bus.csi2.vc;
> -			ctx->dt = fd.entry[i].bus.csi2.dt;
> -		}
> +	for (i = 0; i < csi->num_ctx; i++) {
> +		curr_ctx = &csi->ctx[i];
> +
> +		/* Capture VC 0 by default */
> +		curr_ctx->vc = 0;
> +
> +		ret = ti_csi2rx_get_stream(curr_ctx);
> +		if (ret)
> +			continue;
> +
> +		for (j = 0; j < fd.num_entries; j++)
> +			if (curr_ctx->stream == fd.entry[j].stream) {
> +				curr_ctx->vc = fd.entry[j].bus.csi2.vc;
> +				curr_ctx->dt = fd.entry[j].bus.csi2.dt;
> +			}
>  	}
>  
>  	return 0;
> @@ -922,8 +954,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>  	struct ti_csi2rx_dev *csi = ctx->csi;
>  	struct ti_csi2rx_dma *dma = &ctx->dma;
> -	struct ti_csi2rx_buffer *buf;
> -	const struct ti_csi2rx_fmt *fmt;
>  	unsigned long flags;
>  	int ret = 0;
>  
> @@ -938,35 +968,9 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret)
>  		goto err;
>  
> -	ret = ti_csi2rx_get_vc_and_dt(ctx);
> -	if (ret == -ENOIOCTLCMD) {
> -		ctx->vc = 0;
> -		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
> -		ctx->dt = fmt->csi_dt;
> -	} else if (ret < 0) {
> -		goto err;
> -	}
> -
> -	ti_csi2rx_setup_shim(ctx);
> -
> -	ctx->sequence = 0;
> -
> -	spin_lock_irqsave(&dma->lock, flags);
> -	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
> -
> -	ret = ti_csi2rx_start_dma(ctx, buf);
> -	if (ret) {
> -		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
> -		spin_unlock_irqrestore(&dma->lock, flags);
> -		goto err_pipeline;
> -	}
> -
> -	list_move_tail(&buf->list, &dma->submitted);
> -	dma->state = TI_CSI2RX_DMA_ACTIVE;
> -	spin_unlock_irqrestore(&dma->lock, flags);
> -
> +	/* Start stream 0, we don't allow multiple streams on the source pad */
>  	ret = v4l2_subdev_enable_streams(&csi->subdev,
> -					 TI_CSI2RX_PAD_FIRST_SOURCE,
> +					 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
>  					 BIT_U64(0));
>  	if (ret)
>  		goto err_dma;
> @@ -975,7 +979,6 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  
>  err_dma:
>  	ti_csi2rx_stop_dma(ctx);
> -err_pipeline:
>  	video_device_pipeline_stop(&ctx->vdev);
>  	writel(0, csi->shim + SHIM_CNTL);
>  	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
> @@ -990,17 +993,26 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
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
>  					  BIT_U64(0));
>  	if (ret)
>  		dev_err(csi->dev, "Failed to stop subdev stream\n");
>  
> +	mutex_unlock(&csi->mutex);
> +
>  	ti_csi2rx_stop_dma(ctx);
>  	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
>  }
> @@ -1043,25 +1055,84 @@ static int ti_csi2rx_sd_set_fmt(struct v4l2_subdev *sd,
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
> +
> +	static const struct v4l2_mbus_framefmt format = {
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
> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_SINK);
> -	*fmt = ti_csi2rx_default_fmt;
> +	ret = v4l2_subdev_routing_validate(sd, routing,
> +					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 |
> +					   V4L2_SUBDEV_ROUTING_NO_SOURCE_MULTIPLEXING);
>  
> -	fmt = v4l2_subdev_state_get_format(state, TI_CSI2RX_PAD_FIRST_SOURCE);
> -	*fmt = ti_csi2rx_default_fmt;
> +	if (ret)
> +		return ret;
>  
> -	return 0;
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
> @@ -1069,15 +1140,58 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
>  				       u32 pad, u64 streams_mask)
>  {
>  	struct ti_csi2rx_dev *csi = to_csi2rx_dev(sd);
> +	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
> +	struct ti_csi2rx_dma *dma = &ctx->dma;
>  	struct media_pad *remote_pad;
> +	struct ti_csi2rx_buffer *buf;
> +	const struct ti_csi2rx_fmt *fmt;
> +	unsigned long flags;
> +	u64 sink_streams;
>  	int ret = 0;
>  
> +	ret = ti_csi2rx_get_stream(ctx);
> +	if (ret)
> +		return ret;
> +
> +	/* Get the VC and DT for all enabled ctx on first stream start */
> +	if (!csi->vc_cached) {
> +		ret = ti_csi2rx_get_vc_and_dt(ctx);
> +		if (ret == -ENOIOCTLCMD) {
> +			ctx->vc = 0;
> +			fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
> +			ctx->dt = fmt->csi_dt;
> +		} else if (ret < 0) {
> +			return ret;
> +		}
> +		csi->vc_cached = true;
> +	}
> +
> +	ti_csi2rx_setup_shim(ctx);
> +	ctx->sequence = 0;
> +
> +	spin_lock_irqsave(&dma->lock, flags);
> +	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
> +
> +	ret = ti_csi2rx_start_dma(ctx, buf);
> +	if (ret) {
> +		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
> +		spin_unlock_irqrestore(&dma->lock, flags);
> +		return ret;
> +	}
> +
> +	list_move_tail(&buf->list, &dma->submitted);
> +	dma->state = TI_CSI2RX_DMA_ACTIVE;
> +	spin_unlock_irqrestore(&dma->lock, flags);
> +
>  	remote_pad = media_entity_remote_source_pad_unique(&csi->subdev.entity);
>  	if (!remote_pad)
>  		return -ENODEV;
> +	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
> +						       TI_CSI2RX_PAD_SINK,
> +						       &streams_mask);
>  
>  	ret = v4l2_subdev_enable_streams(csi->source, remote_pad->index,
> -					 BIT_U64(0));
> +					 sink_streams);
>  	if (ret)
>  		return ret;
>  
> @@ -1092,17 +1206,21 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
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

Correct me if I'm wrong, but I don't think this should ever happen. If
you want, you can place it in the beginning of the func, with a WARN_ON().

>  
>  	ret = v4l2_subdev_disable_streams(csi->source, remote_pad->index,
> -					  BIT_U64(0));
> +					  sink_streams);
>  	if (!ret)
>  		--csi->enable_count;
>  
> @@ -1111,6 +1229,7 @@ static int ti_csi2rx_sd_disable_streams(struct v4l2_subdev *sd,
>  
>  static const struct v4l2_subdev_pad_ops ti_csi2rx_subdev_pad_ops = {
>  	.enum_mbus_code	= ti_csi2rx_enum_mbus_code,
> +	.set_routing = ti_csi2rx_sd_set_routing,
>  	.get_fmt = v4l2_subdev_get_fmt,
>  	.set_fmt = ti_csi2rx_sd_set_fmt,
>  	.enable_streams = ti_csi2rx_sd_enable_streams,
> @@ -1289,7 +1408,7 @@ static int ti_csi2rx_v4l2_init(struct ti_csi2rx_dev *csi)
>  	v4l2_subdev_init(sd, &ti_csi2rx_subdev_ops);
>  	sd->internal_ops = &ti_csi2rx_internal_ops;
>  	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> -	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
> +	sd->flags = V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
>  	strscpy(sd->name, dev_name(csi->dev), sizeof(sd->name));
>  	sd->dev = csi->dev;
>  	sd->entity.ops = &ti_csi2rx_subdev_entity_ops;


