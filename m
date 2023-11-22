Return-Path: <linux-media+bounces-830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 331927F497F
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 15:56:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7CB3B21000
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B2D4BAA7;
	Wed, 22 Nov 2023 14:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lzPk2RTo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0DB1A8;
	Wed, 22 Nov 2023 06:56:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id ED22229A;
	Wed, 22 Nov 2023 15:55:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700664938;
	bh=AQD+AKtGlu5tb4VGoUq86TgL623DydxCYLmlNgoA7c4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lzPk2RTolTmQljSyoiQ+sfpc6Pyg/8tXEJs3yMlo9BGljwJLnNAwonjJiomJXb5lo
	 HSU807deQV2E+RgEs8lcoJSVasn35heION686EHylY6++bKv/LWGX7rIgYUeUPE5/G
	 f7B2+xSxvjba7q15LmmnCQIEEj/zW+y6KBfecC4M=
Date: Wed, 22 Nov 2023 16:56:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] media: imx-mipi-csis: Fix clock handling in remove()
Message-ID: <20231122145615.GE8627@pendragon.ideasonboard.com>
References: <20231122-imx-csis-v1-0-0617368eb996@ideasonboard.com>
 <20231122-imx-csis-v1-1-0617368eb996@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231122-imx-csis-v1-1-0617368eb996@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Wed, Nov 22, 2023 at 03:13:48PM +0200, Tomi Valkeinen wrote:
> The driver always calls mipi_csis_runtime_suspend() and
> mipi_csis_clk_disable() in remove(). This causes multiple WARNs from the
> kernel, as the clocks get disabled too many times.

Did you try to unload the driver ? What a weird idea :-)

> Fix the remove() to call mipi_csis_runtime_suspend() and
> mipi_csis_clk_disable() in a way that reverses what is done in probe().
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 6cb20b45e0a1..b39d7aeba750 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -1502,8 +1502,10 @@ static void mipi_csis_remove(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&csis->notifier);
>  	v4l2_async_unregister_subdev(&csis->sd);
>  
> +	if (!pm_runtime_enabled(&pdev->dev))
> +		mipi_csis_runtime_suspend(&pdev->dev);
> +
>  	pm_runtime_disable(&pdev->dev);
> -	mipi_csis_runtime_suspend(&pdev->dev);
>  	mipi_csis_clk_disable(csis);
>  	v4l2_subdev_cleanup(&csis->sd);
>  	media_entity_cleanup(&csis->sd.entity);
> 

-- 
Regards,

Laurent Pinchart

