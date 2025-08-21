Return-Path: <linux-media+bounces-40655-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7119BB302B1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 21:14:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCA5858133A
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 19:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3820834AAE5;
	Thu, 21 Aug 2025 19:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="bBnhx21s"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0F12E2829;
	Thu, 21 Aug 2025 19:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803641; cv=none; b=Z91+LtBfZlLbj93zjxEikHzVNVmUaH1gRyMx5VcQk9Fi6qQkElq/emXO02DuHHj/YmFCf6atmQ9p9o9K/ZnabpzXv9aW43dwoZmBzJDsmRNDfNg32o/UyO8QEBLjYa07UyRgixAU84pQ7jtX75cPnhIA2od1qV5eAtRebPGdaI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803641; c=relaxed/simple;
	bh=VALJRwyrfUiY6oK20Qap1KBqdV9y/XRL9lk605FoEtY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eHGN6iklwFLznrbhaTnR6NkgXh45E0s1z9QhnTmBaerISu9rLeDCh2/rU7ePazD96rDApoCwJ3KPJWtBjHoG26jdAR+hNC5gqtXRg4ZQnaZ8xFsfF9QxuCqQW3dNS+l3ypAkc8Vgqj/Cw9RsuzZWNRYFFcanSGJD9PMmOQrCTlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=bBnhx21s; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-51-28.net.vodafone.it [5.90.51.28])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5611E6DE;
	Thu, 21 Aug 2025 21:12:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755803578;
	bh=VALJRwyrfUiY6oK20Qap1KBqdV9y/XRL9lk605FoEtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bBnhx21sFlDranw0HXVFjmUeby0THnRnv06iuJZPcOJAvm0zNHAcyMr9jqv21X5lC
	 wYk6P3o1R2MtbolozmM3Qq88e4OJyI1sCMDXp8U0zjnmdntooAhPBiKmf1dYk3rKal
	 sNp556NwkbnAXBhLXL/eFuR9fCeJbPgMt3DdXvUQ=
Date: Thu, 21 Aug 2025 21:13:54 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH 5/6] media: rkisp1: Add support for multiple power domains
Message-ID: <tlpa2umvbb6q2s2znrkk5d6vmwcsix7ijnib3ctprp3ct3ucmy@gqtuqfn5qhf4>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
 <20250616011115.19515-6-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616011115.19515-6-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Mon, Jun 16, 2025 at 04:11:14AM +0300, Laurent Pinchart wrote:
> The ISP instances in the NXP i.MX8MP need two power domains. While
> single power domains are managed automatically by the device core,
> support for multiple power domains requires manually attaching to the
> power domains. Do so based on platform data.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  9 ++++
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 45 +++++++++++++++++++
>  2 files changed, 54 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index c4af1277fc6b..ce900440c78d 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -24,6 +24,7 @@
>  #include "rkisp1-regs.h"
>
>  struct dentry;
> +struct dev_pm_domain_list;
>  struct regmap;
>
>  /*
> @@ -146,6 +147,8 @@ enum rkisp1_feature {
>   * @features: bitmask of rkisp1_feature features implemented by the ISP
>   * @max_width: maximum input frame width
>   * @max_height: maximum input frame height
> + * @pm_domains.names: name of the power domains
> + * @pm_domains.count: number of power domains
>   *
>   * This structure contains information about the ISP specific to a particular
>   * ISP model, version, or integration in a particular SoC.
> @@ -158,6 +161,10 @@ struct rkisp1_info {
>  	unsigned int features;
>  	unsigned int max_width;
>  	unsigned int max_height;
> +	struct {
> +		const char * const *names;
> +		unsigned int count;
> +	} pm_domains;
>  };
>
>  /*
> @@ -479,6 +486,7 @@ struct rkisp1_debug {
>   * @dev:	   a pointer to the struct device
>   * @clk_size:	   number of clocks
>   * @clks:	   array of clocks
> + * @pm_domains:    power domains
>   * @gasket:	   the gasket - i.MX8MP only
>   * @gasket_id:	   the gasket ID (0 or 1) - i.MX8MP only
>   * @v4l2_dev:	   v4l2_device variable
> @@ -503,6 +511,7 @@ struct rkisp1_device {
>  	struct device *dev;
>  	unsigned int clk_size;
>  	struct clk_bulk_data clks[RKISP1_MAX_BUS_CLK];
> +	struct dev_pm_domain_list *pm_domains;
>  	struct regmap *gasket;
>  	unsigned int gasket_id;
>  	struct v4l2_device v4l2_dev;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index fb4ccf497bad..1791c02a40ae 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -17,6 +17,7 @@
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <media/v4l2-fwnode.h>
>  #include <media/v4l2-mc.h>
> @@ -532,6 +533,11 @@ static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
>  	{ NULL, rkisp1_isr, BIT(RKISP1_IRQ_ISP) | BIT(RKISP1_IRQ_MI) },
>  };
>
> +static const char * const imx8mp_isp_pm_domains[] = {
> +	"isp",
> +	"csi2",
> +};
> +
>  static const struct rkisp1_info imx8mp_isp_info = {
>  	.num_clocks = 3,
>  	.isrs = imx8mp_isp_isrs,
> @@ -542,6 +548,10 @@ static const struct rkisp1_info imx8mp_isp_info = {
>  		  | RKISP1_FEATURE_COMPAND,
>  	.max_width = 4096,
>  	.max_height = 3072,
> +	.pm_domains = {
> +		.names = imx8mp_isp_pm_domains,
> +		.count = ARRAY_SIZE(imx8mp_isp_pm_domains),
> +	},
>  };
>
>  static const struct of_device_id rkisp1_of_match[] = {
> @@ -605,6 +615,37 @@ static int rkisp1_init_clocks(struct rkisp1_device *rkisp1)
>  	return 0;
>  }
>
> +static int rkisp1_init_pm_domains(struct rkisp1_device *rkisp1)
> +{
> +	const struct rkisp1_info *info = rkisp1->info;
> +	struct dev_pm_domain_attach_data pm_domain_data = {
> +		.pd_names = info->pm_domains.names,
> +		.num_pd_names = info->pm_domains.count,
> +	};
> +	int ret;
> +
> +	/*
> +	 * Most platforms have a single power domain, which the PM domain core
> +	 * automatically attaches at probe time. When that's the case there's
> +	 * nothing to do here.
> +	 */
> +	if (rkisp1->dev->pm_domain)
> +		return 0;

So if multiple domains are declated in dts the PM core ignores them ?
I presume so otherwise you would be getting the first power domain
twice...

> +
> +	if (!pm_domain_data.num_pd_names)
> +		return 0;

You could also only call this function for imx8mp and avoid the
checks, but I agree this version is probably more generic

> +
> +	ret = devm_pm_domain_attach_list(rkisp1->dev, &pm_domain_data,
> +					 &rkisp1->pm_domains);

I was wondering if the third argument could actually be a local
variable, but __devm_add_action() copies it to then be later passed
to devm_pm_domain_detach_list(), so it needs to be stored somewhere
and not declared on the stack..

No comments but just questions I gave myself an answer to already, so

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> +	if (ret < 0) {
> +		dev_err_probe(rkisp1->dev, ret,
> +			      "Failed to attach power domains\n");
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int rkisp1_probe(struct platform_device *pdev)
>  {
>  	const struct rkisp1_info *info;
> @@ -666,6 +707,10 @@ static int rkisp1_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> +	ret = rkisp1_init_pm_domains(rkisp1);
> +	if (ret)
> +		return ret;
> +
>  	if (info->isp_ver == RKISP1_V_IMX8MP) {
>  		unsigned int id;
>
> --
> Regards,
>
> Laurent Pinchart
>
>

