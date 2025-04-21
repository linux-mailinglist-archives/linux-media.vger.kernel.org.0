Return-Path: <linux-media+bounces-30616-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FDAA951B9
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:34:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C98C5168B53
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:34:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6CBD265CAB;
	Mon, 21 Apr 2025 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JIZOPSHe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2CE41A83F9;
	Mon, 21 Apr 2025 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745242464; cv=none; b=lTeUt4c/Ywhx7PKokv6b88/mN4FUWUcIDtT3AqzbvMB+9R9KJyKxPkL1eFh8xQK8ihE8nzVxAt8jRMFcHdMQbIe3usqaOl7aL5hhw79DC+rwg2UrHwA9Yu72AXXsdSRy0kHqcXVwTGcjlRiM8QTx2o+/2eGNCRZC/dta49afMKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745242464; c=relaxed/simple;
	bh=e9mCg59LrHYpTZnERz1wXVXjp85owru2+efmUdmDizU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oDlYS+xeDfRoiSxD0PTziBQxn2d3tzpPrw1WuJFD1rG2E8fLEsg3UPaz3Ybc5yFoLTd5qwxZel7M9vgVCts/kClQo1YZRcmclX4lHjgUItXAMFBwSzDgMnYFPGrEHpxWJnZotbB51r1k8x1POFA9gSyLJVQqC2y8Dt0z3SEC12Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JIZOPSHe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E14B36D5;
	Mon, 21 Apr 2025 15:32:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745242334;
	bh=e9mCg59LrHYpTZnERz1wXVXjp85owru2+efmUdmDizU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JIZOPSHesmF8U0ddr3mJx9VlZOHs/dG2qqtbErG2SAXw121dCfTs9YWzWl5seT2ia
	 w/8WKKbYHRCOvOBM+cZvqLN7RmA9slCkQVDy0IHAE1hh4vITKZ2yxG4ysj0NeAORbb
	 qAzje2ibjZYOpggjMr0fkx6z8kZcDfS3KPIOFwdo=
Date: Mon, 21 Apr 2025 16:34:18 +0300
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
Subject: Re: [PATCH v3 08/13] media: ti: j721e-csi2rx: add support for
 processing virtual channels
Message-ID: <20250421133418.GI29483@pendragon.ideasonboard.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-9-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-9-r-donadkar@ti.com>

Hi Rishikesh,

Thank you for the patch.

On Thu, Apr 17, 2025 at 12:25:49PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
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
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index e85d04d7c2ff9..3e2a0517a9096 100644
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
> @@ -573,6 +576,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  	}
>  
>  	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
>  
>  	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>  
> @@ -846,6 +850,33 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  	}
>  }
>  
> +static int ti_csi2rx_get_vc(struct ti_csi2rx_ctx *ctx)
> +{
> +	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct v4l2_mbus_frame_desc fd;
> +	struct media_pad *pad;
> +	int ret, i;

i can never be negative, you can make it an unsigned int.

> +
> +	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
> +	if (!pad)
> +		return -ENODEV;
> +
> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index,
> +			       &fd);
> +	if (ret)
> +		return ret;
> +
> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EINVAL;
> +
> +	for (i = 0; i < fd.num_entries; i++) {
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
> @@ -866,6 +897,14 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret)
>  		goto err;
>  
> +	ret = ti_csi2rx_get_vc(ctx);
> +	if (ret == -ENOIOCTLCMD)
> +		ctx->vc = 0;
> +	else if (ret < 0)
> +		goto err;
> +	else
> +		ctx->vc = ret;
> +

When you'll add support for multiple streams in patch 11/13, you will
end up calling .get_frame_desc() once per stream. All calls will return
the same information, so it's a bit wasteful. Would it be possible to
call this function once only at start time, and cache and use the
results for all video devices ?

>  	ti_csi2rx_setup_shim(ctx);
>  
>  	ctx->sequence = 0;

-- 
Regards,

Laurent Pinchart

