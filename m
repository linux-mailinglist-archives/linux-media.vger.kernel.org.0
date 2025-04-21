Return-Path: <linux-media+bounces-30601-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F4CA9504B
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:37:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 21EDC3B2B5D
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 11:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423742641E1;
	Mon, 21 Apr 2025 11:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZPjIKrl9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9705B264637;
	Mon, 21 Apr 2025 11:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745235420; cv=none; b=Z89rNbty+F3O9LkW3wdRurcEC/vzuA207TDOK0ne+Gxfh5IIMs0oQMw+g9VLTTzD0kbonHKVIESjo6mRuZqzqgGJGUNWbUd7phLDzxo/grdr3c+gLmQjH95UeR8IQGC4f9k6JAqXZsMf87l0JZdMdJraM41pGwW7YZ7hIDtgFKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745235420; c=relaxed/simple;
	bh=xrakHmlA6LksyJuXF53HJRC6zIg8buvU/C8IzSupxbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgwhB/tLYZXCyNqFcDGY5P+jKpDgQbIUbrRtXo2Q1vShUs6C62odb9F3LOYAGBw5Hq13u2MR5DEhzDCjRPK2qbYGY37kbdeXMtVG55dk370JHB2Fu1h+XLIVS+A09idQjjZv8YFI5CpzcLPpJXaQSVe4FeyFvL66N8cEMqSsVyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZPjIKrl9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1ACC473E;
	Mon, 21 Apr 2025 13:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745235289;
	bh=xrakHmlA6LksyJuXF53HJRC6zIg8buvU/C8IzSupxbY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZPjIKrl9qxvyCAnpgIEZGOFYXgcafFyE6FvCFlf6eg0vIIx1fU1pn17jd9DbtLmVe
	 +x+2U5sB9m2J24W+yGy4/QsIJxwjEIyitpRIyH3XJa6+uDrX/frKb/Tz/1/eSWW4Z5
	 NAGh5pi7F3B8QEJILP+GuXs59sYn6+eioM+gheg4=
Date: Mon, 21 Apr 2025 14:36:54 +0300
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
Subject: Re: [PATCH v3 04/13] media: ti: j721e-csi2rx: allocate DMA channel
 based on context index
Message-ID: <20250421113654.GD29483@pendragon.ideasonboard.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-5-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-5-r-donadkar@ti.com>

Hi Rishikesh,

Thank you for the patch.

On Thu, Apr 17, 2025 at 12:25:45PM +0530, Rishikesh Donadkar wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
> 
> With multiple contexts, there needs to be a different DMA channel for
> each context. Earlier, the DMA channel name was hard coded to "rx0" for
> the sake of simplicity. Generate the DMA channel name based on its index
> and get the channel corresponding to the context.
> 
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index d03dc4e56d306..523c890139098 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -1015,6 +1015,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>  	struct dma_slave_config cfg = {
>  		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
>  	};
> +	char name[32];

That seems a bit long. 5 characters should be enough.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	int ret;
>  
>  	INIT_LIST_HEAD(&ctx->dma.queue);
> @@ -1023,7 +1024,8 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>  
>  	ctx->dma.state = TI_CSI2RX_DMA_STOPPED;
>  
> -	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");
> +	snprintf(name, sizeof(name), "rx%u", ctx->idx);
> +	ctx->dma.chan = dma_request_chan(ctx->csi->dev, name);
>  	if (IS_ERR(ctx->dma.chan))
>  		return PTR_ERR(ctx->dma.chan);
>  

-- 
Regards,

Laurent Pinchart

