Return-Path: <linux-media+bounces-13076-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D83905A67
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:09:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E3BF2B20FD0
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 18:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839591836C1;
	Wed, 12 Jun 2024 18:09:11 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71922180A99;
	Wed, 12 Jun 2024 18:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718215751; cv=none; b=kXCpjTucJ42aII5eYk7uKD7582o7sGogmUMt4itPLKDwQ79Dmhw6k1H1p5p/Krl0eB0LR1/VphjxnPUohv4yEtSN8+G7sHPt6MXmEYopILtk2co8D0GtP47BLmhW3tmYCvsBNxNZS3AVm7zoyzi0lPtDDIW3lB2TrN4XVzOuAv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718215751; c=relaxed/simple;
	bh=RJNEvCAGIRZVQUyhqg15HbW6QCiKD5U3VFi2YuLgGgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rGsWa9eY0D22A8IRDSt212F64uVxu+ws4cl6BsVeZQJavT62p8A2xCcc8N+mA0YMLS3pRbmIXavpHAUBKnbWWPsmimaWuyyqRMOD16AnVPi4wa+SJw54AUQfmRke0HTpPZNK8H/3CqZtlRGqtALNN7SrEuioBF/DcltsSwYZGNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875be5.versanet.de ([83.135.91.229] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sHSOy-00025Y-8s; Wed, 12 Jun 2024 20:08:52 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jianfeng Liu <liujianfeng1994@gmail.com>,
 Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>, kernel@collabora.com
Subject: Re: [PATCH v5 3/5] media: hantro: Add RK3588 VEPU121 support
Date: Wed, 12 Jun 2024 20:08:51 +0200
Message-ID: <1739853.izSxrag8PF@diego>
In-Reply-To: <20240612173213.42827-4-sebastian.reichel@collabora.com>
References:
 <20240612173213.42827-1-sebastian.reichel@collabora.com>
 <20240612173213.42827-4-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Mittwoch, 12. Juni 2024, 19:15:43 CEST schrieb Sebastian Reichel:
> Avoid exposing each of the 4 Hantro H1 cores separately to userspace.
> For now just expose the first one.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  .../media/platform/verisilicon/hantro_drv.c   | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
> index 34b123dafd89..b722a20c5fe3 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -722,6 +722,7 @@ static const struct of_device_id of_hantro_match[] = {
>  	{ .compatible = "rockchip,rk3399-vpu", .data = &rk3399_vpu_variant, },
>  	{ .compatible = "rockchip,rk3568-vepu", .data = &rk3568_vepu_variant, },
>  	{ .compatible = "rockchip,rk3568-vpu", .data = &rk3568_vpu_variant, },
> +	{ .compatible = "rockchip,rk3588-vepu121", .data = &rk3568_vpu_variant, },
>  	{ .compatible = "rockchip,rk3588-av1-vpu", .data = &rk3588_vpu981_variant, },
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
> @@ -992,6 +993,39 @@ static const struct media_device_ops hantro_m2m_media_ops = {
>  	.req_queue = v4l2_m2m_request_queue,
>  };
>  
> +/*
> + * Some SoCs, like RK3588 have multiple identical Hantro cores, but the
> + * kernel is currently missing support for multi-core handling. Exposing
> + * separate devices for each core to userspace is bad, since that does
> + * not allow scheduling tasks properly (and creates ABI). With this workaround
> + * the driver will only probe for the first core and early exit for the other
> + * cores. Once the driver gains multi-core support, the same technique
> + * for detecting the main core can be used to cluster all cores together.
> + */
> +static int hantro_disable_multicore(struct hantro_dev *vpu)
> +{
> +	const char *compatible;
> +	struct device_node *node;
> +	int ret;
> +
> +	/* Intentionally ignores the fallback strings */
> +	ret = of_property_read_string(vpu->dev->of_node, "compatible", &compatible);
> +	if (ret)
> +		return ret;
> +
> +	/* first compatible node found from the root node is considered the main core */
> +	node = of_find_compatible_node(NULL, NULL, compatible);
> +	if (!node)
> +		return -EINVAL; /* broken DT? */
> +
> +	if (vpu->dev->of_node != node) {
> +		dev_info(vpu->dev, "missing multi-core support, ignoring this instance\n");
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
>  static int hantro_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *match;
> @@ -1011,6 +1045,10 @@ static int hantro_probe(struct platform_device *pdev)
>  	match = of_match_node(of_hantro_match, pdev->dev.of_node);
>  	vpu->variant = match->data;
>  
> +	ret = hantro_disable_multicore(vpu);
> +	if (ret)
> +		return ret;
> +

I think this might be better as two patches?

As this patch stands, the disable-multicore handling is done for _all_
hantro variants, so part of me wants this to be labeled as such.

The whole reasoning is completely ok, but somehow having this under
the "add rk3588" umbrella feels strange ;-)


Heiko




