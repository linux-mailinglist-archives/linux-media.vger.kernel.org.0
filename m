Return-Path: <linux-media+bounces-40653-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A635B3028F
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 21:03:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 397A5723BD1
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 19:03:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCA96345741;
	Thu, 21 Aug 2025 19:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XyaBG7Ri"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8926A3451BA;
	Thu, 21 Aug 2025 19:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755803009; cv=none; b=h0P1li0aytQ6aE0fpSGn8RG7L3rIkcK6fgk2Yk8OMueZnWurU21WwLJN5TU5QrsntkZLjGRCSlu/8vycJ/8nIx3xhD9FHlWDQZAQd39+3cEeCFprP8I0MHAABww3eDRnstRTD6weUCP/3ylLRSvJwwdQrISaXHCZy4Pe8sggFJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755803009; c=relaxed/simple;
	bh=K7ta94DpLE6fw+AXw4ZZg5vvLwhliWaim3CJ8FB5U5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nES22PiKE5gTpImo6kruY87IzMtQ0a9gq2Ru2vB2g93/uAdYrshB9PUqAkl7rdoehEiYw9RBnebJYh46RT5bjaoNX40YVUEItqOtorrDtU8C3xiIOJAJBuXKjaFOaNkIibqoupFAUvI5TVRMp+DVprktQG4yofyU7m7KDTcopUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XyaBG7Ri; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 23F2C6DE;
	Thu, 21 Aug 2025 21:02:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755802946;
	bh=K7ta94DpLE6fw+AXw4ZZg5vvLwhliWaim3CJ8FB5U5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XyaBG7Rinfr0E+pwsKG5H450l56Ng/3nOU+0zi4zHgEgyyghRhwQDQ6xEo8dNK11Q
	 oovohHEbGCCPgkAIFwR5yZLk4cVauAZjlfUnAb0cEtAr9ipNdXZdptMs+M4Slvp1fU
	 OHQsAlj5VO9aGoz40yy7GSZspTLVI346419qOMPs=
Date: Thu, 21 Aug 2025 22:02:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Stefan Klug <stefan.klug@ideasonboard.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 3/6] media: rkisp1: Refactor clocks initialization
Message-ID: <20250821190259.GD25098@pendragon.ideasonboard.com>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
 <20250616011115.19515-4-laurent.pinchart@ideasonboard.com>
 <lmv4bhe2xf55ogmvzqcv4hrqwlzsyxaycg3u45ein4kppbnqxa@rw6gnoxydosq>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <lmv4bhe2xf55ogmvzqcv4hrqwlzsyxaycg3u45ein4kppbnqxa@rw6gnoxydosq>

On Thu, Aug 21, 2025 at 08:48:23PM +0200, Jacopo Mondi wrote:
> On Mon, Jun 16, 2025 at 04:11:12AM +0300, Laurent Pinchart wrote:
> > ISP instances in different SoCs differ in the number of clocks they use,
> > but not in the clock names. Refactor clocks initialization to avoid
> > duplicating the clock names per platform, and lower the total number of
> > clocks from 8 to 4 as no platform uses more than 4 clocks. Use a static
> > assert to ensure at build time that the size of the arrays match.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  .../platform/rockchip/rkisp1/rkisp1-common.h  |  8 +--
> >  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 60 ++++++++++---------
> >  2 files changed, 34 insertions(+), 34 deletions(-)
> >
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > index ca952fd0829b..c4af1277fc6b 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> > @@ -55,7 +55,7 @@ struct regmap;
> >  #define RKISP1_BUS_INFO				"platform:" RKISP1_DRIVER_NAME
> >
> >  /* maximum number of clocks */
> > -#define RKISP1_MAX_BUS_CLK			8
> > +#define RKISP1_MAX_BUS_CLK			4
> >
> >  /* a bitmask of the ready stats */
> >  #define RKISP1_STATS_MEAS_MASK			(RKISP1_CIF_ISP_AWB_DONE |	\
> > @@ -139,8 +139,7 @@ enum rkisp1_feature {
> >  /*
> >   * struct rkisp1_info - Model-specific ISP Information
> >   *
> > - * @clks: array of ISP clock names
> > - * @clk_size: number of entries in the @clks array
> > + * @num_clocks: number of clocks
> >   * @isrs: array of ISP interrupt descriptors
> >   * @isr_size: number of entries in the @isrs array
> >   * @isp_ver: ISP version
> > @@ -152,8 +151,7 @@ enum rkisp1_feature {
> >   * ISP model, version, or integration in a particular SoC.
> >   */
> >  struct rkisp1_info {
> > -	const char * const *clks;
> > -	unsigned int clk_size;
> > +	unsigned int num_clocks;
> >  	const struct rkisp1_isr_data *isrs;
> >  	unsigned int isr_size;
> >  	enum rkisp1_cif_isp_version isp_ver;
> > diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > index dc65a7924f8a..0788b7a64ae9 100644
> > --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> > @@ -8,6 +8,7 @@
> >   * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
> >   */
> >
> > +#include <linux/build_bug.h>
> >  #include <linux/clk.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/mfd/syscon.h>
> > @@ -491,13 +492,6 @@ static irqreturn_t rkisp1_isr(int irq, void *ctx)
> >  	return ret;
> >  }
> >
> > -static const char * const px30_isp_clks[] = {
> > -	"isp",
> > -	"aclk",
> > -	"hclk",
> > -	"pclk",
> > -};
> > -
> >  static const struct rkisp1_isr_data px30_isp_isrs[] = {
> >  	{ "isp", rkisp1_isp_isr, BIT(RKISP1_IRQ_ISP) },
> >  	{ "mi", rkisp1_capture_isr, BIT(RKISP1_IRQ_MI) },
> > @@ -505,8 +499,7 @@ static const struct rkisp1_isr_data px30_isp_isrs[] = {
> >  };
> >
> >  static const struct rkisp1_info px30_isp_info = {
> > -	.clks = px30_isp_clks,
> > -	.clk_size = ARRAY_SIZE(px30_isp_clks),
> > +	.num_clocks = 4,
> >  	.isrs = px30_isp_isrs,
> >  	.isr_size = ARRAY_SIZE(px30_isp_isrs),
> >  	.isp_ver = RKISP1_V12,
> > @@ -518,19 +511,12 @@ static const struct rkisp1_info px30_isp_info = {
> >  	.max_height = 2448,
> >  };
> >
> > -static const char * const rk3399_isp_clks[] = {
> > -	"isp",
> > -	"aclk",
> > -	"hclk",
> > -};
> > -
> >  static const struct rkisp1_isr_data rk3399_isp_isrs[] = {
> >  	{ NULL, rkisp1_isr, BIT(RKISP1_IRQ_ISP) | BIT(RKISP1_IRQ_MI) | BIT(RKISP1_IRQ_MIPI) },
> >  };
> >
> >  static const struct rkisp1_info rk3399_isp_info = {
> > -	.clks = rk3399_isp_clks,
> > -	.clk_size = ARRAY_SIZE(rk3399_isp_clks),
> > +	.num_clocks = 3,
> >  	.isrs = rk3399_isp_isrs,
> >  	.isr_size = ARRAY_SIZE(rk3399_isp_isrs),
> >  	.isp_ver = RKISP1_V10,
> > @@ -542,19 +528,12 @@ static const struct rkisp1_info rk3399_isp_info = {
> >  	.max_height = 3312,
> >  };
> >
> > -static const char * const imx8mp_isp_clks[] = {
> > -	"isp",
> > -	"hclk",
> > -	"aclk",
> 
> it seems to me that clk_bulk_prepare_enable() guarantees ordering
> of the clock sources enablement (I know regulators do not, if
> I'm not mistaken).
> 
> Is it a problem that imx8mp used to declare hclk before aclk as the
> other platforms do ?

No, I don't think the order matters.

> > -};
> > -
> >  static const struct rkisp1_isr_data imx8mp_isp_isrs[] = {
> >  	{ NULL, rkisp1_isr, BIT(RKISP1_IRQ_ISP) | BIT(RKISP1_IRQ_MI) },
> >  };
> >
> >  static const struct rkisp1_info imx8mp_isp_info = {
> > -	.clks = imx8mp_isp_clks,
> > -	.clk_size = ARRAY_SIZE(imx8mp_isp_clks),
> > +	.num_clocks = 3,
> >  	.isrs = imx8mp_isp_isrs,
> >  	.isr_size = ARRAY_SIZE(imx8mp_isp_isrs),
> >  	.isp_ver = RKISP1_V_IMX8MP,
> > @@ -582,6 +561,32 @@ static const struct of_device_id rkisp1_of_match[] = {
> >  };
> >  MODULE_DEVICE_TABLE(of, rkisp1_of_match);
> >
> > +static const char * const rkisp1_clk_names[] = {
> 
> You could also presize the array with RKISP1_MAX_BUS_CLK so that you
> won't need an assertion ? It's true however that if RKISP1_MAX_BUS_CLK
>  > the number of declared elements you won't get a warning..

Yes, that's why I didn't do it.

> > +	"isp",
> > +	"aclk",
> > +	"hclk",
> > +	"pclk",
> > +};
> > +
> > +static int rkisp1_init_clocks(struct rkisp1_device *rkisp1)
> > +{
> > +	const struct rkisp1_info *info = rkisp1->info;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	static_assert(ARRAY_SIZE(rkisp1_clk_names) == ARRAY_SIZE(rkisp1->clks));
> > +
> > +	for (i = 0; i < info->num_clocks; i++)
> > +		rkisp1->clks[i].id = rkisp1_clk_names[i];
> > +
> > +	ret = devm_clk_bulk_get(rkisp1->dev, info->num_clocks, rkisp1->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	rkisp1->clk_size = info->num_clocks;
> 
> rkisp1->clk_size is now only used in rkisp1_runtime_suspend() which
> can easily access rkisp->info->num_clocks. Would it be better to not
> duplicate the information in your opinion ?

You've now found in 4/6 that we still need it :-)

> > +	return 0;
> > +}
> > +
> >  static int rkisp1_probe(struct platform_device *pdev)
> >  {
> >  	const struct rkisp1_info *info;
> > @@ -639,12 +644,9 @@ static int rkisp1_probe(struct platform_device *pdev)
> >  		}
> >  	}
> >
> > -	for (i = 0; i < info->clk_size; i++)
> > -		rkisp1->clks[i].id = info->clks[i];
> > -	ret = devm_clk_bulk_get(dev, info->clk_size, rkisp1->clks);
> > +	ret = rkisp1_init_clocks(rkisp1);
> >  	if (ret)
> >  		return ret;
> > -	rkisp1->clk_size = info->clk_size;
> >
> >  	if (info->isp_ver == RKISP1_V_IMX8MP) {
> >  		unsigned int id;

-- 
Regards,

Laurent Pinchart

