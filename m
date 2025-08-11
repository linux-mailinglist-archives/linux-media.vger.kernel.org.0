Return-Path: <linux-media+bounces-39403-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 791ABB20154
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 10:07:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 515F17AD046
	for <lists+linux-media@lfdr.de>; Mon, 11 Aug 2025 08:05:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91482DAFAC;
	Mon, 11 Aug 2025 08:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J30ojhir"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 272E51DF977;
	Mon, 11 Aug 2025 08:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754899608; cv=none; b=W32UJ6WHASzWH8jCX8e+8N7Z0+o0RhSFNndcRQBSMyZY4Z+T/Mg2FTbl3Z1Uf8Q5FOhrT7XedOdsnfu6v58ngLSdpxsLCt8v5QO99O6SGg08neeYXeuh/qXSgpt9vRLuQlohgUjXgtipF5pPy9LzvNFB3v/42T32G95JHt55Dec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754899608; c=relaxed/simple;
	bh=99p1/Hcm7cvOf1qSQuU5BHYtUKVroVdIfTnJnDN3UHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGrwXxxZepAXuR9ruv4DCUBk4vrDfFpJviMJ4hjVys5vNWls3ymj6ncI28+bpHe8epdhFX1twG5rD4Lfx5grtyY9hiXIF+q+Oq5I3bc8tRUy7YFEpQiR9C4paCOhIZcHG/ylhK7W7OBTZ/4po4/2yX26FSq/sf/UjxP+XrxEqc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J30ojhir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D93C4CEED;
	Mon, 11 Aug 2025 08:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754899607;
	bh=99p1/Hcm7cvOf1qSQuU5BHYtUKVroVdIfTnJnDN3UHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J30ojhirgavjQuzhrbARZltg/1SE47SpS5zglLWvF2LyypjKcs2xk+skPrZugOM9e
	 Udkd3g/+P/CXqnMReqwmWBfOLfEXm+3dzzx4IHfDxdb5A5a4BVdj76L9BfsILqxl8A
	 L0U3mnMYXK18zrDinNrjqelxWo4lN/kztgdA7t+maFyccP69JobA9q17SCFn3mBAI+
	 O2qWU+b205esXb+X/A2fr/tEh3N9RD1UHyXYRrYxLPhWulD4HMdSrGHIEEtUfEdHJ7
	 htBtFM6/b08TQWbQuWTzSc+pyG/WjLPMEL5mFKWn4ISFSaA8OVsEXiOUaAydHNPwo6
	 o+S9W3ofzoCQw==
Date: Mon, 11 Aug 2025 10:06:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Will Whang <will@willwhang.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 3/4] media: i2c: imx585: Add Sony IMX585 image-sensor
 driver
Message-ID: <20250811-cinnamon-tapir-of-music-0bda96@kuoka>
References: <20250810220921.14307-1-will@willwhang.com>
 <20250810220921.14307-4-will@willwhang.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250810220921.14307-4-will@willwhang.com>

On Sun, Aug 10, 2025 at 11:09:20PM +0100, Will Whang wrote:
> +
> +/* --------------------------------------------------------------------------
> + * Power / runtime PM
> + * --------------------------------------------------------------------------
> + */
> +
> +static int imx585_power_on(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx585 *imx585 = to_imx585(sd);
> +	int ret;
> +
> +	dev_dbg(imx585->clientdev, "power_on\n");
> +
> +	ret = regulator_bulk_enable(IMX585_NUM_SUPPLIES, imx585->supplies);
> +	if (ret) {
> +		dev_err(imx585->clientdev, "Failed to enable regulators\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(imx585->xclk);
> +	if (ret) {
> +		dev_err(imx585->clientdev, "Failed to enable clock\n");
> +		goto reg_off;
> +	}
> +
> +	gpiod_set_value_cansleep(imx585->reset_gpio, 1);

You asserted reset gpio causing it to enter reset and you call this
"power on"?

> +	usleep_range(IMX585_XCLR_MIN_DELAY_US,
> +		     IMX585_XCLR_MIN_DELAY_US + IMX585_XCLR_DELAY_RANGE_US);
> +	return 0;
> +
> +reg_off:
> +	regulator_bulk_disable(IMX585_NUM_SUPPLIES, imx585->supplies);
> +	return ret;
> +}
> +
> +static int imx585_power_off(struct device *dev)
> +{
> +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> +	struct imx585 *imx585 = to_imx585(sd);
> +
> +	dev_dbg(imx585->clientdev, "power_off\n");
> +
> +	gpiod_set_value_cansleep(imx585->reset_gpio, 0);

And here device comes up, but you call it power off? Your functions or
reset gpio code are completely reversed/wrong.

Best regards,
Krzysztof


