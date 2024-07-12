Return-Path: <linux-media+bounces-14968-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6427192FB9F
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 15:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 964641C222DF
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 13:42:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E43170844;
	Fri, 12 Jul 2024 13:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K+nGv6yR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 855C616F903;
	Fri, 12 Jul 2024 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720791740; cv=none; b=m2Ps99YEvsvJRaUEMOZ5+P+dHSpqIWO2DN/qTtyotnGluImCl5FG5onA0vMoSjtN03lZpTC7gU1ODkog9+7uoLNyKO92E4OtqVsBmqXe5gtmqoSIAEJb/9wvr3ItJ+1YAn7rzzObZ9hO1cCCwf/4kWyX+jNZpMKPJZAo3Qknu38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720791740; c=relaxed/simple;
	bh=fwfvSlkMDsCGp031zDgoNEHyPRejBk3AzC6OM84JV6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggzGVB6i+xw82v/Y2yVHI8aL/lvJOs0uy71dujR7F3JFvrvU1+str8DcCdfCEvUL0S9a2tVRcbAAA5Hf3TGahmrCSqzh42eoG0Q/NtUq2A/utw8cVCk3E8ICR3qZJ5ckG4Y1jbB7PBJdNQjEYboXe9tS5CfrKvvntsZzM1+2mzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K+nGv6yR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-63.net.vodafone.it [5.90.56.63])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B6145A5;
	Fri, 12 Jul 2024 15:41:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720791702;
	bh=fwfvSlkMDsCGp031zDgoNEHyPRejBk3AzC6OM84JV6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K+nGv6yRamGTuBdBWPZngHlMe1zi/W7BTuz4PRq0ph04/oFheLW3WBMAi1+GIWoX5
	 BZX8uQaGxpmQgqB0l1v6H/CC+RdqJj/CKZ3aLBX27nxmwH7kfC1Mo+gyzsXF4fd4Bc
	 jRFGf8fVadajTQfe0t2rzmlEzt8vcrQ2eUFhIUag=
Date: Fri, 12 Jul 2024 15:42:13 +0200
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
Subject: Re: [PATCH v2 04/13] media: ti: j721e-csi2rx: prepare SHIM code for
 multiple contexts
Message-ID: <jkn5urzgplqdf6jkra7ybkgpwrkjfh2jenzlmz6m5ow5yufllh@4adtwt4mp6ye>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-4-6ae96c54c1c3@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240627-multistream-v2-4-6ae96c54c1c3@ti.com>

Hi Jai

On Thu, Jun 27, 2024 at 06:39:59PM GMT, Jai Luthra wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
>
> Currently the SHIM code to configure the context only touches the first
> context. Add support for writing to the context's registers based on the
> context index.
>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index d8dfe0002b72..bffc8165fd33 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -25,7 +25,7 @@
>  #define SHIM_CNTL			0x10
>  #define SHIM_CNTL_PIX_RST		BIT(0)
>
> -#define SHIM_DMACNTX			0x20
> +#define SHIM_DMACNTX(i)			(0x20 + ((i) * 0x20))
>  #define SHIM_DMACNTX_EN			BIT(31)
>  #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
>  #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
> @@ -35,7 +35,7 @@
>  #define SHIM_DMACNTX_SIZE_16		1
>  #define SHIM_DMACNTX_SIZE_32		2
>
> -#define SHIM_PSI_CFG0			0x24
> +#define SHIM_PSI_CFG0(i)		(0x24 + ((i) * 0x20))
>  #define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
>  #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
>
> @@ -549,11 +549,11 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>
>  	reg |= FIELD_PREP(SHIM_DMACNTX_SIZE, fmt->size);
>
> -	writel(reg, csi->shim + SHIM_DMACNTX);
> +	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>
>  	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
>  	      FIELD_PREP(SHIM_PSI_CFG0_DST_TAG, 0);
> -	writel(reg, csi->shim + SHIM_PSI_CFG0);
> +	writel(reg, csi->shim + SHIM_PSI_CFG0(ctx->idx));
>  }
>
>  static void ti_csi2rx_drain_callback(void *param)
> @@ -870,7 +870,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  err_pipeline:
>  	video_device_pipeline_stop(&ctx->vdev);
>  	writel(0, csi->shim + SHIM_CNTL);
> -	writel(0, csi->shim + SHIM_DMACNTX);
> +	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>  err:
>  	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
>  	return ret;
> @@ -885,7 +885,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
>  	video_device_pipeline_stop(&ctx->vdev);
>
>  	writel(0, csi->shim + SHIM_CNTL);
> -	writel(0, csi->shim + SHIM_DMACNTX);
> +	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
>
>  	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
>  	if (ret)
>
> --
> 2.43.0
>
>

