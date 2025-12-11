Return-Path: <linux-media+bounces-48631-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 84040CB59EB
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 12:16:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F9DB3027DB9
	for <lists+linux-media@lfdr.de>; Thu, 11 Dec 2025 11:15:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B4C83081B8;
	Thu, 11 Dec 2025 11:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DU5MWrgE"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF1A27B359;
	Thu, 11 Dec 2025 11:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765451731; cv=none; b=ZXtp6PgtCdPotCEQxZ3u8WOBwJ6CDP8VLXRIgxfphes1Iny0pNdDs1/CHiOgXQOMG4LQzwsTkQ+WIdevv46ZzpJLIgyTs+SBEX4I7Hq1uK7ncAwXEuUthdQ+UmPWB0b966s5tIhLN0Ep/uG0NO+bex74dfnhIAvuGT3pd4QZ8g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765451731; c=relaxed/simple;
	bh=3xxZObULqpdp4/XmsT6Ns470NNtIpAiZ0xdp3YmMDrM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T1xa7G1RDQHDMVBYCzuZAveXdxbrmXDpSk15NSL0uXo/TzUGwOpN03KlRUcg53fuK3Hm7K1WVSlIYyw2rMK/cbBcW+1huhD5WCpCWg/YOEDGQd0OlvtUhMLCyi7mgCftgFuUw0AtNgklYzrd0YGlybDDWX+OkAb9pbi82mfelEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DU5MWrgE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765451730; x=1796987730;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3xxZObULqpdp4/XmsT6Ns470NNtIpAiZ0xdp3YmMDrM=;
  b=DU5MWrgEEvyO2gasWLxUs1vdAszTi6fLpBPOkGFBhntjwwuqWZR+9Law
   qJO72VBTH25RQOjLVbbCRQnALQty4YP8J0kKyxOi/EXWl1nl+XvQriq9A
   gU3ZXdzv7HbnSANCzsq34jtRRgrnPhnheeNbO3diSS1OcQdigdLfOgGnV
   UzqO2W2Iju3wRxWux7cFvfZwaVd9Emd/eMMP1IV/EmjSqxEhvyYQZ7gG9
   RU6lRevSwPjANfj9yhdO1bvPzdnYomZFBNs05/ct/XaF35KFEl3k5AMy9
   A5pVqsFwTRTLu2ISKJPR730Uv28cA/0VLZ6UoKDB3q1o8FffYkNeZwoQB
   A==;
X-CSE-ConnectionGUID: eSaSHVxyS0mYjTpYpdLh/Q==
X-CSE-MsgGUID: YwAcqpVoQaqLE6gRJNuuxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71297664"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71297664"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 03:15:29 -0800
X-CSE-ConnectionGUID: UonadOHPR36dNa4PXn5Gjw==
X-CSE-MsgGUID: 57SuEswyTjiBeuguQHliiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="201197921"
Received: from abityuts-desk.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.244.238])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 03:15:24 -0800
Date: Thu, 11 Dec 2025 12:15:15 +0100
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: robh@kernel.org, krzk+dt@kernel.org, sakari.ailus@linux.intel.com, 
	Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Hans de Goede <hansg@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, =?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, 
	Dongcheng Yan <dongcheng.yan@intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: add os05b10 image sensor driver
Message-ID: <umcwwm4kqnh3cdgg65zxjhzlgbwh34yd55h2rwqe7xugmsz67d@3uvgtsp6lhgh>
References: <20251211105427.22374-1-himanshu.bhavani@siliconsignals.io>
 <20251211105427.22374-3-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211105427.22374-3-himanshu.bhavani@siliconsignals.io>

Hello Himanshu,

Thank you for the patch!

On Thu, Dec 11, 2025 at 04:24:07PM +0530, Himanshu Bhavani wrote:
> Add a v4l2 subdevice driver for the Omnivision OS05B10 sensor.
> 
> The Omnivision OS05B10 image sensor with an active
> array size of 2592 x 1944.
> 
> The following features are supported:
> - Manual exposure an gain control support
> - vblank/hblank control support
> - Supported resolution: 2592 x 1944 @ 60fps (SBGGR10)
> 
> Co-developed-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

[..]

> 
> +config VIDEO_OS05B10
> +        tristate "OmniVision OS05B10 sensor support"
> +        select V4L2_CCI_I2C
> +        help
> +          This is a Video4Linux2 sensor driver for Omnivision
> +          OS05B10 camera sensor.
> +
> +	  To compile this driver as a module, choose M here: the
> +          module's name is ov9734.

ov9734 ? copy-paste error ?

> +

[..]

> +static int os05b10_probe(struct i2c_client *client)
> +{
> +	struct os05b10 *os05b10;
> +	unsigned int xclk_freq;
> +	int ret;
> +
> +	os05b10 = devm_kzalloc(&client->dev, sizeof(*os05b10), GFP_KERNEL);
> +	if (!os05b10)
> +		return -ENOMEM;
> +
> +	os05b10->client = client;
> +	os05b10->dev = &client->dev;
> +
> +	v4l2_i2c_subdev_init(&os05b10->sd, client, &os05b10_subdev_ops);
> +
> +	os05b10->cci = devm_cci_regmap_init_i2c(client, 16);
> +	if (IS_ERR(os05b10->cci))
> +		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->cci),
> +				     "failed to initialize CCI\n");
> +
> +	/* Get system clock (xclk) */

I don't think this comment adds value

> +	os05b10->xclk = devm_clk_get(os05b10->dev, NULL);

Use devm_v4l2_sensor_clk_get() to get the clock

> +	if (IS_ERR(os05b10->xclk))
> +		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->xclk),
> +				     "failed to get xclk\n");
> +
> +	xclk_freq = clk_get_rate(os05b10->xclk);
> +	if (xclk_freq != OS05B10_XCLK_FREQ)
> +		return dev_err_probe(os05b10->dev, -EINVAL,
> +				     "xclk frequency not supported: %d Hz\n",
> +				     xclk_freq);
> +
> +	ret = os05b10_get_regulators(os05b10);
> +	if (ret)
> +		return dev_err_probe(os05b10->dev, ret, "failed to get regulators\n");
> +
> +	ret = os05b10_parse_endpoint(os05b10);
> +	if (ret) {
> +		dev_err_probe(os05b10->dev, ret,
> +			      "failed to parse endpoint configuration\n");
> +		return ret;

return dev_err_probe() like above.

> +	}
> +
> +	os05b10->reset_gpio = devm_gpiod_get(&client->dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(os05b10->reset_gpio))
> +		return dev_err_probe(os05b10->dev, PTR_ERR(os05b10->reset_gpio),
> +				     "failed to get reset GPIO\n");
> +

--
Kind Regards
Mehdi Djait

