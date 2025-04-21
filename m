Return-Path: <linux-media+bounces-30658-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D86A957E1
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 23:19:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68D45173DD1
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 21:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CD9B218E97;
	Mon, 21 Apr 2025 21:19:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="GxXpiLfY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF771E9B0C;
	Mon, 21 Apr 2025 21:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745270372; cv=none; b=T6mwEElqP4Zkuepu79MCu4RA0P73QJs5pEKpYc6K9/IwPzqSrUFrqezdx48ECLjWefprIq2k3A5a8wAnihtLtS/GClXEh+sYl7heOA6oyVCF8KzB3qIzc/Xp0BBPCwwI6D6zznoQQXL3Op5RKS3TMPHHVfLrWmlzEmCoKAGEfCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745270372; c=relaxed/simple;
	bh=zKVa3Z5aM32fCtoxaiw1OCcvtoZ41LoC9dMmnkEK18Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nba53JeUIp4tTKVAX0gGQSlZpZlPo1mwzLpnzxuE1/jxswbFS19NBaxYOD0KA2kQCePA4s/4kbsVkM3VBD6TJut+tfWIi1xrVDXIPs+pODEHyVTx/qJ8zHlCT3FQSvIz3T8UgKv54OL9ArdQWZwIUD7QOi8Ff/+tmu7f2l67DQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=GxXpiLfY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 460536D6;
	Mon, 21 Apr 2025 23:17:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745270242;
	bh=zKVa3Z5aM32fCtoxaiw1OCcvtoZ41LoC9dMmnkEK18Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GxXpiLfY1K3IMcZFWy/UyfAvTFnjR5IhvBQ8X0xgNiCiybSUeGP8AOik/4QpkrVpE
	 87A2M/3P9gVlzCoJcFab91etnV+Zm3OR5AfQiQ6UNow0jWaq/LgEbkj6TTOm8/xiR6
	 xrOMBeoz0qqRlzfiptHMp1OjqqKM9QbSxN/FXuZw=
Date: Tue, 22 Apr 2025 00:19:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v4 05/13] media: nxp: imx8-isi: Remove redundant check
 for dma_set_mask_and_coherent()
Message-ID: <20250421211927.GO17813@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-5-ef695f1b47c4@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408-8qxp_camera-v4-5-ef695f1b47c4@nxp.com>

Hi Frank,

Thank you for the patch.

On Tue, Apr 08, 2025 at 05:53:03PM -0400, Frank Li wrote:
> dma_set_mask_and_coherent() never return failure when mask bigger than
> 32bit.
> 
> See commit f7ae20f2fc4e ("docs: dma: correct dma_set_mask() sample code")
> 
> So remove return value check for dma_set_mask_and_coherent().
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 015350c6f2784..073ea5912de3b 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -444,11 +444,7 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	}
>  
>  	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;
> -	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
> -	if (ret) {
> -		dev_err(dev, "failed to set DMA mask\n");
> -		return ret;
> -	}
> +	dma_set_mask_and_coherent(dev, DMA_BIT_MASK(dma_size));
>  
>  	pm_runtime_enable(dev);
>  

-- 
Regards,

Laurent Pinchart

