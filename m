Return-Path: <linux-media+bounces-30659-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D83A7A957EA
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 23:21:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A09CF1892D5A
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 21:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0733E2192F8;
	Mon, 21 Apr 2025 21:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="K9IxOC49"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B69820E338;
	Mon, 21 Apr 2025 21:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745270474; cv=none; b=tlT4XsiQpBWyzL/PejhZS6/7yWRjtfmcPLeICiwXQxI87E/fvxda2NnkxSoRC1h45KXQ3bKmG3iv+o23BLkjFVr/6t8hg6Crz2VG1cBgmWLLKTIpdY6LubcG58QJfpyiDfLVVDFR5WH0wBsbZtDqIc0WFbd0d0v6LsEbBecq3BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745270474; c=relaxed/simple;
	bh=gbGNiLskkmYRnfhaDT9bpoBD6PYRZv46CeHD/P2qXpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lm/IXeqaG87MxzyPMAe1OMwFN8Gn3gDpP6RnMPh3Lfo3KF+CTE9nh7r67knK92+nU8ImSjKkJL6P1reRTK2QfT2uPsgTX4OT7cx/tQKmZxGqW9gHfLtuwOIDtCYnUkhUt7GnUFacckd85ASK3UZPjHopq3EMIS9vlpwqqV08A8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=K9IxOC49; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DBA96D6;
	Mon, 21 Apr 2025 23:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745270344;
	bh=gbGNiLskkmYRnfhaDT9bpoBD6PYRZv46CeHD/P2qXpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K9IxOC49dSTtU49w7/HCkhvaaKZlahqnNF+Qmymta/l7Q5+DBh3QpaRImohAN2dBg
	 UOZh7W/gs2KGZbxO14kADhJ2D8gLF8jMKwCWhpQEV6GDrXvztd/XHEIaUzIJ/y8Gu4
	 +OO4g6zJxHA9eqzZtOEYFJntgMCRl2Y2lhKAYwZo=
Date: Tue, 22 Apr 2025 00:21:09 +0300
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
Subject: Re: [PATCH v4 06/13] media: nxp: imx8-isi: Use dev_err_probe()
 simplify code
Message-ID: <20250421212109.GP17813@pendragon.ideasonboard.com>
References: <20250408-8qxp_camera-v4-0-ef695f1b47c4@nxp.com>
 <20250408-8qxp_camera-v4-6-ef695f1b47c4@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250408-8qxp_camera-v4-6-ef695f1b47c4@nxp.com>

Hi Frank,

Thank you for the patch.

On Tue, Apr 08, 2025 at 05:53:04PM -0400, Frank Li wrote:
> Use dev_err_probe() simplify code. No functional changes intended.

In the subject line and here, s/simplify/to simplify/

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 073ea5912de3b..398cc03443be3 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -428,19 +428,14 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, isi->num_clks, "Failed to get clocks\n");
>  
>  	isi->regs = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(isi->regs)) {
> -		dev_err(dev, "Failed to get ISI register map\n");
> -		return PTR_ERR(isi->regs);
> -	}
> +	if (IS_ERR(isi->regs))
> +		return dev_err_probe(dev, PTR_ERR(isi->regs), "Failed to get ISI register map\n");

		return dev_err_probe(dev, PTR_ERR(isi->regs),
				     "Failed to get ISI register map\n");

>  
>  	if (isi->pdata->gasket_ops) {
>  		isi->gasket = syscon_regmap_lookup_by_phandle(dev->of_node,
>  							      "fsl,blk-ctrl");
> -		if (IS_ERR(isi->gasket)) {
> -			ret = PTR_ERR(isi->gasket);
> -			dev_err(dev, "failed to get gasket: %d\n", ret);
> -			return ret;
> -		}
> +		if (IS_ERR(isi->gasket))
> +			return dev_err_probe(dev, PTR_ERR(isi->gasket), "failed to get gasket\n");

			return dev_err_probe(dev, PTR_ERR(isi->gasket),
					     "failed to get gasket\n");

With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	}
>  
>  	dma_size = isi->pdata->has_36bit_dma ? 36 : 32;

-- 
Regards,

Laurent Pinchart

