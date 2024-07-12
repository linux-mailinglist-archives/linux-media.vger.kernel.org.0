Return-Path: <linux-media+bounces-14969-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFD992FBC1
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 15:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 45FE01F2136C
	for <lists+linux-media@lfdr.de>; Fri, 12 Jul 2024 13:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB5B517107B;
	Fri, 12 Jul 2024 13:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IK4LyMdj"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B1416F8F3;
	Fri, 12 Jul 2024 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720792125; cv=none; b=HF3NmuftPHnHWOrE5TkOZVJsUdgJULsb1Soj60gcZ+x1/eNFnpZ+4/rN6Rx73EcZ9cdsTJgsgr7HMbmeoPo7KpnHVsFQXDCQt5r01cusIZIZJqIsR4o4S277dW54AFIXA5mjWmu4mJsM3ky06CwbFYy3BpQiTlt8Rh7CdQSapjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720792125; c=relaxed/simple;
	bh=igQITk/C+lEynHXIIzRXvteEHKFB84TMYY31COCnYsY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0VA/xT939bk1oRZpNDkKFSTO0vhTdWQqhzHDo5APzYUzrG7awYVB7ao/7TSJCDhMbpvjbSH/9lAlWdvXFfQzMKsFOGngtNB2gvnC2EGi1yz0AOzrwzi+/P0CW0YM083BcTzpLSxeGoviWICgkdE0+LEOKDlv3RYmC1cujZdWbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IK4LyMdj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-56-63.net.vodafone.it [5.90.56.63])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 53C575A5;
	Fri, 12 Jul 2024 15:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1720792087;
	bh=igQITk/C+lEynHXIIzRXvteEHKFB84TMYY31COCnYsY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IK4LyMdj9PVyhwaDHgXws8p7niLhBxYmt8AVvFv/388O5k6CI8xHoVub9wk3gGUPw
	 tHxHhm1RPK520ImWcsNwNK1VzlM/HBxQD4L81dxObTXhgKc9h/WLZxHl/NySMrNcDS
	 fSQlp12UiHhzfFYEhcYmg5Imf7tgSdJwyPTF4OTY=
Date: Fri, 12 Jul 2024 15:48:38 +0200
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
Subject: Re: [PATCH v2 05/13] media: ti: j721e-csi2rx: allocate DMA channel
 based on context index
Message-ID: <ttrv34fhuhma5bnwf7pxh77wpuhz5nhs3beeypog43swyx7wor@vofdkqcsvex4>
References: <20240627-multistream-v2-0-6ae96c54c1c3@ti.com>
 <20240627-multistream-v2-5-6ae96c54c1c3@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240627-multistream-v2-5-6ae96c54c1c3@ti.com>

Hi Jai

On Thu, Jun 27, 2024 at 06:40:00PM GMT, Jai Luthra wrote:
> From: Pratyush Yadav <p.yadav@ti.com>
>
> With multiple contexts, there needs to be a different DMA channel for
> each context. Earlier, the DMA channel name was hard coded to "rx0" for
> the sake of simplicity. Generate the DMA channel name based on its index
> and get the channel corresponding to the context.
>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
   j

> ---
>  drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index bffc8165fd33..361b0ea8e0d9 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -1027,6 +1027,7 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>  	struct dma_slave_config cfg = {
>  		.src_addr_width = DMA_SLAVE_BUSWIDTH_16_BYTES,
>  	};
> +	char name[32];
>  	int ret;
>
>  	INIT_LIST_HEAD(&ctx->dma.queue);
> @@ -1035,7 +1036,8 @@ static int ti_csi2rx_init_dma(struct ti_csi2rx_ctx *ctx)
>
>  	ctx->dma.state = TI_CSI2RX_DMA_STOPPED;
>
> -	ctx->dma.chan = dma_request_chan(ctx->csi->dev, "rx0");
> +	snprintf(name, sizeof(name), "rx%u", ctx->idx);
> +	ctx->dma.chan = dma_request_chan(ctx->csi->dev, name);
>  	if (IS_ERR(ctx->dma.chan))
>  		return PTR_ERR(ctx->dma.chan);
>
>
> --
> 2.43.0
>
>

