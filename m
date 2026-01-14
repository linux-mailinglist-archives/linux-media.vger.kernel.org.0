Return-Path: <linux-media+bounces-50706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 39525D1FE67
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 16:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 08D743091D53
	for <lists+linux-media@lfdr.de>; Wed, 14 Jan 2026 15:32:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C803A0B29;
	Wed, 14 Jan 2026 15:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hL3Vod+/"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D58439C655;
	Wed, 14 Jan 2026 15:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404724; cv=none; b=fX7jv4CfspWMg0bPmyWSqTemeYJuHVQgqM7TuRcP1+JVLCfg2/zYdoszKBcvH/AiniPzTQyE8vvAMjIXkbmvkbF5Yw70Poy3UJ/Vs4K8ZHvyh1E+J4tPlf7UUmVcwBm6eFJ+ez2q5MjBm1Q/dwD+eBLUWLWk7tzR15QVipp2ox4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404724; c=relaxed/simple;
	bh=+8YbGQ84O5le4qfT2gsExq8Gsl8PpyFY4BI/dGopQk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDVg36g5ta1GTnkILVl7zFQgH8xFHp6zg7HvUWtkgY/OLJrBEHUS35gY+OCWvvGY0Nz3eFaF22md8SRtGpk/IduvIfWPzueuJS/fDAaZyGoH2/ANtcnM+69NMkC6+HK3uDiQ1kkIRjdSX43jISjZCHlPXVrarIlPcuOMil/vGQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hL3Vod+/; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.88.20] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 27CFA55C;
	Wed, 14 Jan 2026 16:31:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768404694;
	bh=+8YbGQ84O5le4qfT2gsExq8Gsl8PpyFY4BI/dGopQk4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hL3Vod+/XzV/Ci1wsmG6aAUJq3YhYRfeFDmgVYanQZ5akngqrzcknSp2cDpH211Ug
	 uFdrsbB5Ku0S5EoVzLcTSbHQ1sLmHqUu7MMUm1zMkANqCrirnunCLTHsGj7xlQe/tz
	 sx10y15fxRg2CAfsv8/jvlmEnT51G3gAvq1alZ0E=
Message-ID: <bd2ee047-efd8-477b-bcdc-27047a1023cc@ideasonboard.com>
Date: Wed, 14 Jan 2026 17:31:56 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/19] media: ti: j721e-csi2rx: add support for
 processing virtual channels
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
 <20251230083220.2405247-12-r-donadkar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Content-Language: en-US
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
In-Reply-To: <20251230083220.2405247-12-r-donadkar@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 30/12/2025 10:32, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Use get_frame_desc() to get the frame desc from the connected source,
> and use the provided virtual channel instead of VC 0.
> 
> get_frame_desc() works for single stream case, but as we don't

Is that supposed to say "get_frame_desc works for multi-stream use case"?

> support multiple streams yet, we will just always use stream 0.
> If the source doesn't support get_frame_desc(), fall back to
> the previous method of always capturing virtual channel 0.
> 
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 45 ++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index f54ad67ff3f9d..6f9f34aa26f1b 100644
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
> @@ -110,6 +111,9 @@ struct ti_csi2rx_ctx {
>  	struct media_pad		pad;
>  	u32				sequence;
>  	u32				idx;
> +	u32				vc;
> +	u32				dt;
> +	u32				stream;
>  };
>  
>  struct ti_csi2rx_dev {
> @@ -570,7 +574,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  	ti_csi2rx_request_max_ppc(csi);
>  
>  	reg = SHIM_DMACNTX_EN;
> -	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
> +	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, ctx->dt);
>  
>  	/*
>  	 * The hardware assumes incoming YUV422 8-bit data on MIPI CSI2 bus
> @@ -610,6 +614,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  	}
>  
>  	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
>  
>  	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>  
> @@ -884,12 +889,41 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  	}
>  }
>  
> +static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
> +{
> +	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct v4l2_mbus_frame_desc fd;
> +	struct media_pad *pad;
> +	int ret, i;
> +
> +	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
> +	if (!pad)
> +		return -ENODEV;
> +
> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
> +	if (ret)
> +		return ret;
> +
> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EINVAL;
> +
> +	for (i = 0; i < fd.num_entries; i++) {
> +		if (ctx->stream == fd.entry[i].stream) {
> +			ctx->vc = fd.entry[i].bus.csi2.vc;
> +			ctx->dt = fd.entry[i].bus.csi2.dt;
> +		}
> +	}

I think you can "break" when you find the stream. But this should also
catch the case when there's no matching stream, and give an error in
that case.

 Tomi

> +
> +	return 0;
> +}
> +
>  static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>  	struct ti_csi2rx_dev *csi = ctx->csi;
>  	struct ti_csi2rx_dma *dma = &ctx->dma;
>  	struct ti_csi2rx_buffer *buf;
> +	const struct ti_csi2rx_fmt *fmt;
>  	unsigned long flags;
>  	int ret = 0;
>  
> @@ -904,6 +938,15 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret)
>  		goto err;
>  
> +	ret = ti_csi2rx_get_vc_and_dt(ctx);
> +	if (ret == -ENOIOCTLCMD) {
> +		ctx->vc = 0;
> +		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
> +		ctx->dt = fmt->csi_dt;
> +	} else if (ret < 0) {
> +		goto err;
> +	}
> +
>  	ti_csi2rx_setup_shim(ctx);
>  
>  	ctx->sequence = 0;


