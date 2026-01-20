Return-Path: <linux-media+bounces-51098-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFF7D3C0D8
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 08:47:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8B63F501DF1
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 07:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1052333120C;
	Tue, 20 Jan 2026 07:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JMuXGQkh"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C443A63E7;
	Tue, 20 Jan 2026 07:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768894601; cv=none; b=jydBtOgwfRtzn+YAX6GSHw/3tJr4g5UPwvj1LAV0UTSvZFiKKGG7ZwO1jBWiLxvcLSzWOObihd5Cr9sEj7OziIMVd0uqLRJaQJad/KrddAq4ZZ3A1hbDbm+E0Ft7n/s1SiXEF8Bg6zh8t1Cxf2k1a65H/fx1WXNERLKfqRxs2aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768894601; c=relaxed/simple;
	bh=kflwB9hwIvmK+Oy08ll3v/Yug/n19dtiNekmWNd0qTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ow0pwXElihpaRG1YkRh30sdMmYFfWFS+ttt5aTv4U1yRAnjyMvRTtgpdbJqEGfGJT6UYI6QUB8AhBZNImlWaxXg+03I41Kzb83g00zrmFsMiakbMzSHzIVa54mr1i4kBz2rZ769vQyIezsxy3p4MvgcK/FnQ9h+UoTJgBZKo7L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JMuXGQkh; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768894599; x=1800430599;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kflwB9hwIvmK+Oy08ll3v/Yug/n19dtiNekmWNd0qTE=;
  b=JMuXGQkhwqqOPf+Cb3P77gkbZpCXx5W1DJssUQhZZtgB+wQGmabPZ+H2
   JEexzo2aP0aUzxDsDiE89ToI7PASLDeavFH361CCDi2raB/zJHaNbp9Wj
   tW5XzRw5pSGIwOUCZC9whpgINsYsd2MkX8nu1WOONaCDxkiYltPuz9j1x
   peN3H4B33iWMvvtySqAc10PflALrrgwHd+ZU/JKECqunMtFqSqOAXR+1E
   RXn0FpiljFwZ8MD/A5Ks/fjb2jctn6jonClFz7Zg+KPJNmlmveliIDZ4I
   X2cdKkunh5RGqdhulnDK4uYKrndRk6nZnRky82lDcSArBGOG5Bt2o/WPM
   A==;
X-CSE-ConnectionGUID: d2q5/AEaS6KfYk89+1ZxSg==
X-CSE-MsgGUID: dwYE0qjkTe23AIZof5mzeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="73961925"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="73961925"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:36:38 -0800
X-CSE-ConnectionGUID: N4UjKKQ+RhaaDr8lAETjgw==
X-CSE-MsgGUID: w4TotQL4Q/iUQn3gEvIL+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="206478182"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.188])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 23:36:35 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7DCDE11FCC8;
	Tue, 20 Jan 2026 09:36:38 +0200 (EET)
Date: Tue, 20 Jan 2026 09:36:38 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Robert Mader <robert.mader@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
Subject: Re: [PATCH v7 2/5] media: i2c: imx355: Support devicetree and power
 management
Message-ID: <aW8whjXGK-rXHhlc@kekkonen.localdomain>
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-3-mailingradian@gmail.com>
 <a29ff1e4-117c-4703-b0c7-73ad4e369201@linaro.org>
 <aW77kXzBjAlIMG1C@rdacayan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aW77kXzBjAlIMG1C@rdacayan>

On Mon, Jan 19, 2026 at 10:50:41PM -0500, Richard Acayan wrote:
> On Sat, Jan 17, 2026 at 02:03:02PM +0200, Vladimir Zapolskiy wrote:
> > On 1/17/26 06:06, Richard Acayan wrote:
> (snip)
> > > +static int imx355_power_on(struct device *dev)
> > > +{
> > > +	struct i2c_client *client = container_of(dev, struct i2c_client, dev);
> > > +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> > > +	struct imx355 *imx355 = to_imx355(sd);
> > > +	int ret;
> > > +
> > > +	ret = clk_prepare_enable(imx355->clk);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to enable clocks: %d\n", ret);
> > > +		return ret;
> > > +	}
> > > +
> > > +	ret = regulator_bulk_enable(ARRAY_SIZE(imx355_supplies),
> > > +				    imx355->supplies);
> > > +	if (ret) {
> > > +		dev_err(dev, "failed to enable regulators: %d\n", ret);
> > > +		goto error_disable_clocks;
> > > +	}
> > > +
> > > +	gpiod_set_value_cansleep(imx355->reset_gpio, 1);
> > > +	usleep_range(1000, 2000);
> > 
> > The deassert above is not needed IMO, anyway.
> 
> This assert is for clarity, otherwise it isn't obvious that the GPIO is
> asserted low when the function is called. It should stay.

I'd also remove it: it's redundant.

-- 
Sakari Ailus

