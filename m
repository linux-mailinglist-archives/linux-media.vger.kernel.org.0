Return-Path: <linux-media+bounces-40652-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BE634B3024E
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 20:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1226D7A3490
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 18:49:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13E1B340D93;
	Thu, 21 Aug 2025 18:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qKxU0Lzo"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5945E2EA489;
	Thu, 21 Aug 2025 18:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755802275; cv=none; b=n64I2lRJ+sm2nbvXEkJAotF1udz9FhIblaS5XGFSS0PfK3dM8aGUxtZ8qXFveW8J7EQ1o5tQ2L8kpGs8IEY3FNlUb0nK/LnYrkN3xABExnizL4p7PD2Nn0HU/7h4QZEZYyi3WMk3sLpc1BqWy/HXjrYjweDaKg4fvxMLAAW93rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755802275; c=relaxed/simple;
	bh=WfEAcJ0ggpc2omENZVpBGZxma8qNQPYbtD+Q6JaezKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hxh05adbaX5XdwjyhfTm8Wb+OdSpUrR/d3o7KJrbd5XkgzvH1z70nEDLSJkY25PX3a4o8jvp08Sc/AdJyZ2gnEXa9zSwigXDnUdXqgej8lNM5F3V75w+xo1oUiFrA7AXxH1B+jouvm2SDtHmmErMBHAlGvPEPZcUyx+s1fMCLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qKxU0Lzo; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-51-28.net.vodafone.it [5.90.51.28])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C7756DE;
	Thu, 21 Aug 2025 20:50:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755802211;
	bh=WfEAcJ0ggpc2omENZVpBGZxma8qNQPYbtD+Q6JaezKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qKxU0LzoXsDES1YemgzgBgdzznbXDriaIALnH0PXAnPP1WQw0c7OJdV7NwaCKcq0R
	 v8QNW8YRPzDDtbmjrSaOce1D5t4tUTxwD1eloC98rfp1fhz8xaztBW77I3XhNGcc/5
	 pp+QIa1CyNNlR9rykCL8C9TsFxjTCWrnBkKEHS+c=
Date: Thu, 21 Aug 2025 20:51:06 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, 
	Stefan Klug <stefan.klug@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev
Subject: Re: [PATCH 4/6] media: rkisp1: Acquire pclk clock on i.MX8MP
Message-ID: <xy4qvgjeu64cjvthi573vzngn6elhnnzgmkyqne2qlfu7hughh@euq6ffzr6tfn>
References: <20250616011115.19515-1-laurent.pinchart@ideasonboard.com>
 <20250616011115.19515-5-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250616011115.19515-5-laurent.pinchart@ideasonboard.com>

Hi Laurent

On Mon, Jun 16, 2025 at 04:11:13AM +0300, Laurent Pinchart wrote:
> The ISP instances in the NXP i.MX8MP need the input pixel clock to be
> enabled in order to access the HDR stitching registers. The clock should
> ideally be mandatory, but that would break backward compatibility with
> old DT. Try to acquire it as an optional clock instead.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-dev.c      | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index 0788b7a64ae9..fb4ccf497bad 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -584,6 +584,24 @@ static int rkisp1_init_clocks(struct rkisp1_device *rkisp1)
>  		return ret;
>
>  	rkisp1->clk_size = info->num_clocks;
> +
> +	/*
> +	 * On i.MX8MP the pclk clock is needed to access the HDR stitching
> +	 * registers, but wasn't required by DT bindings. Try to acquire it as
> +	 * an optional clock to avoid breaking backward compatibility.
> +	 */
> +	if (info->isp_ver == RKISP1_V_IMX8MP) {
> +		struct clk *clk;
> +
> +		clk = devm_clk_get_optional(rkisp1->dev, "pclk");
> +		if (IS_ERR(clk))
> +			return dev_err_probe(rkisp1->dev, PTR_ERR(clk),
> +					     "Failed to acquire pclk clock\n");
> +
> +		if (clk)
> +			rkisp1->clks[rkisp1->clk_size++].clk = clk;

Ah no, we still need rkisp1->clk_size!

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

> +	}
> +
>  	return 0;
>  }
>
> --
> Regards,
>
> Laurent Pinchart
>
>

