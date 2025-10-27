Return-Path: <linux-media+bounces-45602-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C2203C0B9B7
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 02:41:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842923BAB14
	for <lists+linux-media@lfdr.de>; Mon, 27 Oct 2025 01:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7720A28D8D1;
	Mon, 27 Oct 2025 01:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="V/l1R8D9"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6636D289E17;
	Mon, 27 Oct 2025 01:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761529271; cv=none; b=mTyEPQaPrL6L+TqTxseUdvWQHB4v030EezS4Uhg9vN8bynJYRLXPYQtTEbch+y5G3mYl83XYJFgTjHP7KUZfcIViWUqCIXYUvrJX6fLNS/VJeS3gwrg82jO4E5l1gM4TBLqRp6hfvK2U6j6nXzzc3VhcRkG0al/7TvfOS5OwvbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761529271; c=relaxed/simple;
	bh=n2izf+vNSxdejnbRHxRXfCo5yW8E26f7kiMpnt+M1RY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ay4IBiElf4H4N/AUK5fRmuv/3oqyAnUHWP/QrzE1hW2eNpboPdFYZZA6N3uhkqylxBidWyHWRUYljcVGUq/7Ylut6PR9lMQ8aHfKZ2D/ugoKMeMimuLIKRE2LqLni4aRCRHEtszrYBxEteZgj3AkqChcSzJcTSlNiVBcC5Zq9Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=V/l1R8D9; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 99B671661;
	Mon, 27 Oct 2025 02:39:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761529159;
	bh=n2izf+vNSxdejnbRHxRXfCo5yW8E26f7kiMpnt+M1RY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V/l1R8D94FVYffJ/y1K80bQndqw60xN08/Gyck75Ld4b+RZwAxdzBgzbM/r9VJOnG
	 33iB5BHXrR88goAvPfcxeWnsU/Aq6ubb5yvrBqkZ/NPOwHyCLfTYGS0qGYdXr0tMir
	 UZXEHiuuXgjO8lDf5bbuyGws3cD/1gF1NvLcL8u8=
Date: Mon, 27 Oct 2025 03:40:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Alice Yuan <alice.yuan@nxp.com>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 10/31] media: staging: media: imx6-mipi-csi2: use
 devm_platform_ioremap_resource() simplify code
Message-ID: <20251027014052.GU13023@pendragon.ideasonboard.com>
References: <20250821-95_cam-v3-0-c9286fbb34b9@nxp.com>
 <20250821-95_cam-v3-10-c9286fbb34b9@nxp.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250821-95_cam-v3-10-c9286fbb34b9@nxp.com>

On Thu, Aug 21, 2025 at 04:15:45PM -0400, Frank Li wrote:
> Use devm_platform_ioremap_resource() simplify code. No functional change.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/staging/media/imx/imx6-mipi-csi2.c | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/staging/media/imx/imx6-mipi-csi2.c b/drivers/staging/media/imx/imx6-mipi-csi2.c
> index b04c1b98c088b8bfa66eb3f61cca8bb735b7eae4..7b8911bea3fad8187fafb1d0916d730fd6fa671c 100644
> --- a/drivers/staging/media/imx/imx6-mipi-csi2.c
> +++ b/drivers/staging/media/imx/imx6-mipi-csi2.c
> @@ -738,7 +738,6 @@ static void csi2_nf_cleanup(void *data)
>  static int csi2_probe(struct platform_device *pdev)
>  {
>  	struct csi2_dev *csi2;
> -	struct resource *res;
>  	int i, ret;
>  
>  	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
> @@ -772,15 +771,10 @@ static int csi2_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res) {
> -		v4l2_err(&csi2->sd, "failed to get platform resources\n");
> -		return -ENODEV;
> -	}
> -
> -	csi2->base = devm_ioremap(&pdev->dev, res->start, PAGE_SIZE);
> -	if (!csi2->base)
> -		return -ENOMEM;
> +	csi2->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(csi2->base))
> +		return dev_err_probe(&pdev->dev, -ENOMEM,
> +				     "failed to get platform resources");

devm_platform_ioremap_resource() prints error messages internally with
dev_err_probe(), so you can just

		return PTR_ERR(csi2->base);

here. With that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  
>  	ret = devm_mutex_init(&pdev->dev, &csi2->lock);
>  	if (ret)
> 

-- 
Regards,

Laurent Pinchart

