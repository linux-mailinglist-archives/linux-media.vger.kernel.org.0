Return-Path: <linux-media+bounces-40545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8390B2F3B9
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 11:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1BB1E5A16AF
	for <lists+linux-media@lfdr.de>; Thu, 21 Aug 2025 09:18:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C032EF648;
	Thu, 21 Aug 2025 09:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vu+ZS+8b"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19456286410;
	Thu, 21 Aug 2025 09:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755767927; cv=none; b=GmQ32ytlbEsFrsWBAzaFhqFXF4w02N2lF5y5Gv6VOlKjzO3UgFA5lsaAvqg2RGWWRotuU62VetkhXYCuvrVh2fJmITmPJWx58fIFjCbbieWxy9AbM7+PxUFYQsvZkcMXel5JJNZY8PLFmiZUeEJxWAU4rd3LD9piZ0ZYhQIl+/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755767927; c=relaxed/simple;
	bh=9wJUy2pIzz/eXObRyOLyevUA0C/y2nNe8ZHk9pUjyNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X/PldSDG4h7k3+mH3AqULnDHe16+Dn7VUktIo2OFlLJf5a8V6HBF4YKPfxYU6OnhkCUaKUwJuVLWxM1GNyyu7qjeuTc7SbPudgmr9GZSEJgpAdunETHsYjD/Zf22CioZxYEoebq8LD19n3X1YVtO8c7DSpok3UxWYNfsV4tN6Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vu+ZS+8b; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755767926; x=1787303926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9wJUy2pIzz/eXObRyOLyevUA0C/y2nNe8ZHk9pUjyNU=;
  b=Vu+ZS+8bC6HHN+JbmoU7lgBkCoabG1N7undVPqc6MuN9naB91/LPQpOm
   WGWAQKAaHkV6+Xg2OlhrlleN8qNgjjyK2Mq/epQxbNWhJsoBrxFPJYVLT
   iZh8QJgBIE/KiwPlwUTX+3XTrlNfPiHQySdA4KyxQ753iFJYTWO2n3goe
   yvGcmgQlwPpMoD0e9YICC6P78zeDGIhvNOpEswve1vx1ZtyWKN9gVu7VT
   xanCzEXdlyqekEUcV1kCv4vpGtaE6ZzazfbRpnw2DooxIY98G+AHXWJQ+
   BlxcrCGrbBMVtUfZkoquzVto8jf0f/NZn2EaTbOqmEzMOupbtRcMkszQm
   g==;
X-CSE-ConnectionGUID: uzEbot9FS3qoxbcuxXo5jw==
X-CSE-MsgGUID: F1G0qarkQ9CE0DUx/Ji6rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="75636262"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="75636262"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:18:45 -0700
X-CSE-ConnectionGUID: m5/DctAQS2WdFesJTtVVlg==
X-CSE-MsgGUID: ZKuCyK3FTX2ClJKLzE29Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="199341082"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.237])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 02:18:43 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6E87F11F738;
	Thu, 21 Aug 2025 12:18:40 +0300 (EEST)
Date: Thu, 21 Aug 2025 12:18:40 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/2] media: i2c: Add OmniVision OV6211 image sensor
 driver
Message-ID: <aKbkcL_j3LsdoMo4@kekkonen.localdomain>
References: <20250812213024.361267-1-vladimir.zapolskiy@linaro.org>
 <20250812213024.361267-3-vladimir.zapolskiy@linaro.org>
 <aKMXy_L0eBRJRcsn@kekkonen.localdomain>
 <03690367-aff0-4128-86aa-65a6d489b6cb@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03690367-aff0-4128-86aa-65a6d489b6cb@linaro.org>

Hi Vladimir,

On Wed, Aug 20, 2025 at 01:57:52AM +0300, Vladimir Zapolskiy wrote:
> Hi Sakari,
> 
> thank you so much for review. Please find a few comments below.
> 
> On 8/18/25 15:08, Sakari Ailus wrote:
> > Hi Vladimir,
> > 
> > Thanks for the update.
> > 
> > On Wed, Aug 13, 2025 at 12:30:24AM +0300, Vladimir Zapolskiy wrote:
> > > OmniVision OV6211 is a monochrome image sensor, which produces frames in
> > > 8/10-bit raw output format and supports 400x400, 200x200 and 100x100
> > > output image resolution modes.
> > > 
> > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> <snip>
> 
> > > +static int ov6211_set_ctrl(struct v4l2_ctrl *ctrl)
> > > +{
> > > +	struct ov6211 *ov6211 = container_of(ctrl->handler, struct ov6211,
> > > +					     ctrl_handler);
> > > +	int ret;
> > > +
> > > +	/* V4L2 controls values will be applied only when power is already up */
> > > +	if (!pm_runtime_get_if_in_use(ov6211->dev))
> > 
> > I think this should be pm_runtime_get_if_active() as no writes will now
> > take place even if the sensor is powered on.
> 
> Ack.
> 
> > > +		return 0;
> > > +
> > > +	switch (ctrl->id) {
> > > +	case V4L2_CID_ANALOGUE_GAIN:
> > > +		ret = cci_write(ov6211->regmap, OV6211_REG_ANALOGUE_GAIN,
> > > +				ctrl->val, NULL);
> > > +		break;
> > > +	case V4L2_CID_EXPOSURE:
> > > +		ret = cci_write(ov6211->regmap, OV6211_REG_EXPOSURE,
> > > +				ctrl->val << 4, NULL);
> > > +		break;
> > > +	default:
> > > +		ret = -EINVAL;
> > > +		break;
> > > +	}
> > > +
> > > +	pm_runtime_put(ov6211->dev);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static const struct v4l2_ctrl_ops ov6211_ctrl_ops = {
> > > +	.s_ctrl = ov6211_set_ctrl,
> > > +};
> > > +
> > > +static int ov6211_init_controls(struct ov6211 *ov6211)
> > > +{
> > > +	struct v4l2_ctrl_handler *ctrl_hdlr = &ov6211->ctrl_handler;
> > > +	const struct ov6211_mode *mode = &supported_modes[0];
> > > +	struct v4l2_fwnode_device_properties props;
> > > +	s64 exposure_max, pixel_rate, h_blank;
> > > +	struct v4l2_ctrl *ctrl;
> > > +	int ret;
> > > +
> > > +	ret = v4l2_ctrl_handler_init(ctrl_hdlr, 8);
> > > +	if (ret)
> > > +		return ret;
> > 
> > This check can be omitted. Up to you.
> 
> This check I would prefer to keep, otherwise I have a feeling that under
> ENOMEM the following code would make an attempt to insert the controls
> data over an NULL pointer...
> 
> I'll mock it to check it explicitly though, but I'm inclined to keep it.

The control framework will handle that internally.

> 
> <snip>
> 
> > > +
> > > +	ret = cci_write(ov6211->regmap, OV6211_REG_MODE_SELECT,
> > > +			OV6211_MODE_STREAMING, NULL);
> > > +	if (ret) {
> > > +		dev_err(ov6211->dev, "failed to start streaming: %d\n", ret);
> > > +		goto error;
> > > +	}
> > > +
> > > +	return 0;
> > > +
> > > +error:
> > > +	pm_runtime_mark_last_busy(ov6211->dev);
> > 
> > Please omit direct calls to pm_runtime_mark_last_busy(); this is now called
> > via the runtime PM put autosuspend etc. functions.
> > 
> 
> Ack.
> 
> <snip>
> 
> > > +	if (bus_cfg.nr_of_link_frequencies != 1 ||
> > > +	    bus_cfg.link_frequencies[0] != link_freq_menu_items[0]) {
> > 
> > Could you use v4l2_link_freq_to_bitmap()? I think it'd simplify the
> > function and possibly error handling, too.
> > 
> 
> Ack, let it be so.
> 
> > > +		dev_err(ov6211->dev, "Unsupported MIPI CSI2 link frequency\n");
> > > +		ret = -EINVAL;
> > > +		goto error;
> > > +	}
> > > +
> > > +error:
> > > +	v4l2_fwnode_endpoint_free(&bus_cfg);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int ov6211_power_on(struct device *dev)
> > > +{
> > > +	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > > +	struct ov6211 *ov6211 = to_ov6211(sd);
> > > +	int ret;
> > > +
> > > +	if (ov6211->avdd) {
> > > +		ret = regulator_enable(ov6211->avdd);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	if (ov6211->dovdd) {
> > > +		ret = regulator_enable(ov6211->dovdd);
> > > +		if (ret)
> > > +			goto avdd_disable;
> > > +	}
> > > +
> > > +	if (ov6211->dvdd) {
> > > +		ret = regulator_enable(ov6211->dvdd);
> > > +		if (ret)
> > > +			goto dovdd_disable;
> > > +	}
> > 
> > Can you use the regulator bulk functions? Or if the order is required, add
> > a comment about it? Otherwise someone will provide a "fix" soon afterwards.
> > :-)
> 
> I've already responded to a similar review comment from Krzysztof on v1,
> here the rationale is to follow a deliberately selected model of having
> some of regulators as optional. Moreover the "digital core" DVDD regulator
> is truly optional, there is a working sensor configuration to omit it.
> 
> Unfortunately so far there is no bulk regulator helper, which deals properly
> with optional regulators, so I would prefer to keep it registered this way.

Won't the regulator framework provide you a dummy regulator if a given
regulator isn't assigned to the device in DT?

E.g. the CCS driver unconditionally requests regulators and fails on error.
It still works on ACPI platforms without any regulators (as in terms of the
regulator framework).

> > > +	gpiod_set_value_cansleep(ov6211->reset_gpio, 0);
> > > +	usleep_range(10 * USEC_PER_MSEC, 15 * USEC_PER_MSEC);
> > > +
> > > +	ret = clk_prepare_enable(ov6211->xvclk);
> > 
> > Is the clock really supposed to be enabled here, and not e.g. before
> > lifting reset?
> > 
> 
> The so called "gated" mode of XVCLK clock says that is should be enabled
> after releasing XSHUTDOWN pin, so I don't see a mistake here.
> 
> Please note, it's basically a common part with other OmniVision sensors,
> for instance you may get a reference from OG01A1B product specification etc.
> 
> Thank you for review. Shortly I'll send another new but very similar
> image sensor driver acknowledging your given comments.

-- 
Regards,

Sakari Ailus

