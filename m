Return-Path: <linux-media+bounces-30600-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 864CDA9503B
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 479A81893233
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:33:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21DBF263F51;
	Mon, 21 Apr 2025 11:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="aJ7jGu15"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E32D14658C;
	Mon, 21 Apr 2025 11:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745235213; cv=none; b=PAzSVJJWaxPaWgG0kJrfaSvTnLIF6YENA7iCYn/gCH6HqnE72fu2/OldRFM8YvQh9b18lEcaBwFSSAckXQ5AdaKk0Upzx9kuI9vv1jB0RZhCox9ux0FhAR7JMJxFObxMW10QzIZKU11ma4+2Nx8w1BA1tejUxwm2FdIsfLFo7N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745235213; c=relaxed/simple;
	bh=BS73TbWoRbRLz9Ow/2wvxGQ5xhsENh8PoydPAUWqWSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KwHvPpPpZuM1AH2Ezf2/Uzdv01jNJRwwWo6qyYSYx6Iw0mcbg1et3Avj7PcSFCQGT2pmjTNW7HYh4ablLNtxSMWBLu6rFmpUGwTq/pcNOS6vh9KVoLhlbS+FNB+Kf/yy1e0LWGM5XjZxqrSO0yxATKRUXZA90cpV74l2hO5HhwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=aJ7jGu15; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 87B2D6D5;
	Mon, 21 Apr 2025 13:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745235083;
	bh=BS73TbWoRbRLz9Ow/2wvxGQ5xhsENh8PoydPAUWqWSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aJ7jGu15aWo8OMHAdE4KVOsqvVS0hVJ6rghDQmxHtDysvzntc21ZIGRsM00S2jFZI
	 pL/QIiFZA0PmpL30TlM8EMhpg3U+oUuy1IFkM3rexG/KTN4uPgi2CLNZe5XiHCVl41
	 xwHAWE/94W4PhaNSiHfMNB3STASEHBnvTWt4HPc4=
Date: Mon, 21 Apr 2025 14:33:28 +0300
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
Subject: Re: [PATCH v3 03/13] media: ti: j721e-csi2rx: prepare SHIM code for
 multiple contexts
Message-ID: <20250421113328.GC29483@pendragon.ideasonboard.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-4-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-4-r-donadkar@ti.com>

Hi Rishikesh,

Thank you for the patch.

On Thu, Apr 17, 2025 at 12:25:44PM +0530, Rishikesh Donadkar wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
> 
> Currently the SHIM code to configure the context only touches the first
> context. Add support for writing to the context's registers based on the
> context index.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c    | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 36cde2e87aabb..d03dc4e56d306 100644
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

-- 
Regards,

Laurent Pinchart

