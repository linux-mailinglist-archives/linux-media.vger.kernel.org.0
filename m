Return-Path: <linux-media+bounces-14974-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B365E92FD19
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 17:01:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 59ED9282899
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 15:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4600172BC8;
	Fri, 12 Jul 2024 15:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="umb0Tt+g"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1EB117C6B;
	Fri, 12 Jul 2024 15:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720796472; cv=none; b=QlKKV6mMtBWAhJfvUd0yIQpnx4/PbN2xhKgBxmxegAe112sRlac5v2F6qZjlYdWnrDplgdCbfCTMIUCR/7UnUNriQ5xvGIzB2y9Ol/uvh5cQwC/Q00e2UuWpRHxvP5nB3ZEuA9NVm9nHWdPYLzl7ksY7pS8eRJEpmMjps5D+jb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720796472; c=relaxed/simple;
	bh=TELIwwG/3h5x8yMKF9Rhltm3vOa0nmrPuSIsFx4fOl4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q+koowrIC8+d8UECFREdBBTiDy7m7ywKzyBFdZMH7bSDhIiGrjwB/S6qz5OSicaYwNvr5y7TzJLzyZ1ZQfCqZlreee+tszg9dMNfR7MGgX3xYMO5iIzd62hUJ/l0hqL7DXr2IefWVljY51hr9CLUKktub5Nbn/VWwbgf8lbf9ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=umb0Tt+g; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-63.net.vodafone.it [5.90.56.63])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86F9B7E3;
	Fri, 12 Jul 2024 17:00:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720796433;
	bh=TELIwwG/3h5x8yMKF9Rhltm3vOa0nmrPuSIsFx4fOl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=umb0Tt+gFjFgUggaku8u+sG6c75ZIEr1pkX32DIFdEOds/ULLoN0UHuy453SEPG1L
	 JtC9UbOq5okLwgn2w/exZuTAFx80vAmXeenCVwAPPoZ4vLaYwfzKJnUe/fBH09sp+y
	 Lcl6LSCX+9EM3F5iSdvgAjiouzkNizdbfZh4EXGc=
Date: Fri, 12 Jul 2024 17:01:04 +0200
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
Subject: Re: [PATCH v2 09/13] media: ti: j721e-csi2rx: add support for
 processing virtual channels
Message-ID: <gn4p7imootxlidam6uddits5i7zwo5azzzb3h3wcobxquqpczs@2msb66c5hs4y>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-9-6ae96c54c1c3@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240627-multistream-v2-9-6ae96c54c1c3@ti.com>

Hi Jai

On Thu, Jun 27, 2024 at 06:40:04PM GMT, Jai Luthra wrote:
> Use get_frame_desc() to get the frame desc from the connected source,
> and use the provided virtual channel instead of hardcoded one.
>
> get_frame_desc() works per stream, but as we don't support multiple
> streams yet, we will just always use stream 0. If the source doesn't
> support get_frame_desc(), fall back to the previous method of always
> capturing virtual channel 0.
>
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c  | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index b4b4bb69c88a..c0916ca1a6f8 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -29,6 +29,7 @@
>  #define SHIM_DMACNTX_EN			BIT(31)
>  #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
>  #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
> +#define SHIM_DMACNTX_VC			GENMASK(9, 6)
>  #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
>  #define SHIM_DMACNTX_YUV422_MODE_11	3
>  #define SHIM_DMACNTX_SIZE_8		0
> @@ -105,6 +106,8 @@ struct ti_csi2rx_ctx {
>  	struct media_pad		pad;
>  	u32				sequence;
>  	u32				idx;
> +	u32				vc;
> +	u32				stream;
>  };
>
>  struct ti_csi2rx_dev {
> @@ -571,6 +574,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  	}
>
>  	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
>
>  	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>
> @@ -844,6 +848,33 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  	}
>  }
>
> +static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
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
> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index,
> +			       &fd);
> +	if (ret)
> +		return ret;

Would it be better to fail at bound() time if the remote subdev
doesn't support get_frame_desc ? you can use

        if (!v4l2_subdev_has_op(subdev, pad, get_frame_desc)) {

> +
> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EINVAL;
> +
> +	for (i = 0; i < fd.num_entries; i++) {

        for (unsigned int i

should num_entries be validated ?

> +		if (ctx->stream == fd.entry[i].stream)
> +			return fd.entry[i].bus.csi2.vc;
> +	}
> +
> +	return -ENODEV;
> +}
> +
>  static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
> @@ -864,6 +895,14 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret)
>  		goto err;
>
> +	ret = ti_csi2rx_get_vc(ctx);
> +	if (ret == -ENOIOCTLCMD)
> +		ctx->vc = 0;

Ah, so you fallback to 0 in case the subdev doesn't support
get_frame_desc. I'm not sure what would be better here maybe wait for
other's opinions as well.

Personally I would fail earlier to make sure subdev drivers are forced
to impement get_frame_desc

> +	else if (ret < 0)
> +		goto err;
> +	else
> +		ctx->vc = ret;
> +
>  	ti_csi2rx_setup_shim(ctx);
>
>  	ctx->sequence = 0;
>
> --
> 2.43.0
>
>

