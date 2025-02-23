Return-Path: <linux-media+bounces-26706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 520E7A410B5
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 19:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA73B3B7761
	for <lists+linux-media@lfdr.de>; Sun, 23 Feb 2025 18:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9CBF1607B4;
	Sun, 23 Feb 2025 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Myu5qZUL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D32E347CC;
	Sun, 23 Feb 2025 18:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740334449; cv=none; b=imN89HzsFq2CfoXQB7nc06pSuc+W+XkUrso5alB+NjZ6+98oNmLVsoFq/hvW4/zegnTk9z2sk66iy6/rxLPdVH/6LJYj/zTX1gGdI7a9g5lzZltoEjPJ9E5UaZuNBBrgXsvL2dxEnBKRyzNZvQ0lkL0AWshlRgsD8Z7G5llce94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740334449; c=relaxed/simple;
	bh=X5KdXFu8yL61vOfqOmCft6juco+6SAuRlN1Kh3F/93w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KL40rs/ZzStrAKXnWgy2Ow2chPRilf7UoDpmOsLRXXwD7TS1RUuqymhrJdpc2UYbIsPj6pWlBcSWYerNQ9Rty/5/HWOpPkAal0IGm1nGJTM1bwz9dm1GQ7O0BT4PXjAUhFPRSYW4AHVV4gP0x4L30MBmp7Clta0E0ldhJr+PXys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Myu5qZUL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6F5D8496;
	Sun, 23 Feb 2025 19:12:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740334360;
	bh=X5KdXFu8yL61vOfqOmCft6juco+6SAuRlN1Kh3F/93w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Myu5qZULoGuChhhDX7eIYMW+qhtUeMxjagD+w1L/JA7KeSkCKZpgi6HPNFVup3j5R
	 cYPFnltYlJqBoph+OIY7O1osnPodaLtk6SVTp2TcpVmpN+H6C+09rGbDWQrLM0MFyj
	 CCjqfc8znPNGSbP7OpePNAELDyok+8RV5K91bEQQ=
Date: Sun, 23 Feb 2025 20:13:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org, biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/18] media: rzg2l-cru: csi2: Use local variable for
 struct device in rzg2l_csi2_probe()
Message-ID: <20250223181348.GA8330@pendragon.ideasonboard.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
 <20250221155532.576759-5-tommaso.merciai.xr@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250221155532.576759-5-tommaso.merciai.xr@bp.renesas.com>

Hi Tommaso,

Thank you for the patch.

On Fri, Feb 21, 2025 at 04:55:18PM +0100, Tommaso Merciai wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Use a local variable for the struct device pointers. This increases code
> readability with shortened lines.
> 
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
> Changes since v1:
>  - Fixed commit msg and commit body as suggested by LPinchart
>  - Collected tags
> 
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 31 ++++++++++---------
>  1 file changed, 16 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> index 881e910dce02..948f1917b830 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
> @@ -764,10 +764,11 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
>  
>  static int rzg2l_csi2_probe(struct platform_device *pdev)
>  {
> +	struct device *dev = &pdev->dev;
>  	struct rzg2l_csi2 *csi2;
>  	int ret;
>  
> -	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
> +	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
>  	if (!csi2)
>  		return -ENOMEM;
>  
> @@ -775,28 +776,28 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	if (IS_ERR(csi2->base))
>  		return PTR_ERR(csi2->base);
>  
> -	csi2->cmn_rstb = devm_reset_control_get_exclusive(&pdev->dev, "cmn-rstb");
> +	csi2->cmn_rstb = devm_reset_control_get_exclusive(dev, "cmn-rstb");
>  	if (IS_ERR(csi2->cmn_rstb))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->cmn_rstb),
> +		return dev_err_probe(dev, PTR_ERR(csi2->cmn_rstb),
>  				     "Failed to get cpg cmn-rstb\n");
>  
> -	csi2->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
> +	csi2->presetn = devm_reset_control_get_shared(dev, "presetn");
>  	if (IS_ERR(csi2->presetn))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->presetn),
> +		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
>  				     "Failed to get cpg presetn\n");
>  
> -	csi2->sysclk = devm_clk_get(&pdev->dev, "system");
> +	csi2->sysclk = devm_clk_get(dev, "system");
>  	if (IS_ERR(csi2->sysclk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
> +		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
>  				     "Failed to get system clk\n");
>  
> -	csi2->vclk = devm_clk_get(&pdev->dev, "video");
> +	csi2->vclk = devm_clk_get(dev, "video");
>  	if (IS_ERR(csi2->vclk))
> -		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
> +		return dev_err_probe(dev, PTR_ERR(csi2->vclk),
>  				     "Failed to get video clock\n");
>  	csi2->vclk_rate = clk_get_rate(csi2->vclk);
>  
> -	csi2->dev = &pdev->dev;
> +	csi2->dev = dev;
>  
>  	platform_set_drvdata(pdev, csi2);
>  
> @@ -804,18 +805,18 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	pm_runtime_enable(&pdev->dev);
> +	pm_runtime_enable(dev);
>  
>  	ret = rzg2l_validate_csi2_lanes(csi2);
>  	if (ret)
>  		goto error_pm;
>  
> -	csi2->subdev.dev = &pdev->dev;
> +	csi2->subdev.dev = dev;
>  	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
>  	csi2->subdev.internal_ops = &rzg2l_csi2_internal_ops;
> -	v4l2_set_subdevdata(&csi2->subdev, &pdev->dev);
> +	v4l2_set_subdevdata(&csi2->subdev, dev);
>  	snprintf(csi2->subdev.name, sizeof(csi2->subdev.name),
> -		 "csi-%s", dev_name(&pdev->dev));
> +		 "csi-%s", dev_name(dev));
>  	csi2->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
>  
>  	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> @@ -852,7 +853,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&csi2->notifier);
>  	media_entity_cleanup(&csi2->subdev.entity);
>  error_pm:
> -	pm_runtime_disable(&pdev->dev);
> +	pm_runtime_disable(dev);
>  
>  	return ret;
>  }

-- 
Regards,

Laurent Pinchart

