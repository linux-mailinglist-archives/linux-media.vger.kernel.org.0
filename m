Return-Path: <linux-media+bounces-50485-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C61D14D8E
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 20:03:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3662A307BF77
	for <lists+linux-media@lfdr.de>; Mon, 12 Jan 2026 19:01:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83834313273;
	Mon, 12 Jan 2026 19:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="me6MpeTp"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AB1310630;
	Mon, 12 Jan 2026 19:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244512; cv=none; b=l8D9pMi+mypaQFETbX9St05+ZF26Wy/XV0N6r7/kdwjXFiorlQ2GT3v57zFY7DmyscSraamb638MzNjpXETmYlmZFlMeKJgzAowSgPzKtxMQTfyRNWU3XAg948iFC9uUTJH6BpIWytaoOTn+2eBnmiDSae/wZ2uQETBrP3W7rTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244512; c=relaxed/simple;
	bh=9FWpPlAvkKmeA4C/w9ba4SvWc0hjzE+jor589M/oRNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hLFI8g91tIxJZ3C5k0DESX+BKNVDsbBkXfse92fyIphALE7myLnIvO7Sknm6XFFT/lf071q2Ciko8vaI92jLKJb4c6vkYFLzHp2NvdirXW81buGQvPJ+oZv2deG65z20nieCW5+7eaTbv7V4EOjqNAHMJLd3hKDMtI2osmHn/8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=me6MpeTp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768244511; x=1799780511;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9FWpPlAvkKmeA4C/w9ba4SvWc0hjzE+jor589M/oRNc=;
  b=me6MpeTpCecEkMVOVMrfLPejBqZ3gqTCd4/fN7nQtWOpYFWhSZur8ffH
   hjaJBmAop2RXrZTms5o8skvn4r/XGqw5HOQLTj8KZJW/fo0VtOGEgqx5+
   7pwN8omu5OeMjUhr3g0dLgCOND1mdyJCKhlr0j7JNECurWXBWbo8hKXQG
   TvOSFO8Wm//Y0Gi8Qv1KidT3ePOTwvshFEySTXaeCkCYklZIDuQBfc9I8
   I29Z0sywGuOhzngI3Wjr12Oo1vHDp8M4DZGl/I9x8Eff/7XMO809vbD/C
   XMUKxNknLSfEbyxjRaPaESZaBmUI7dZ3w7X4PtuzWTSC6wpi/ysf511vl
   Q==;
X-CSE-ConnectionGUID: u4JcXMJ1TiunIS2wpN64kQ==
X-CSE-MsgGUID: YWf6jLqvQma1/w697m6GvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="57079618"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="57079618"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:01:48 -0800
X-CSE-ConnectionGUID: TLT71j8xRZKcPyj9K/70eQ==
X-CSE-MsgGUID: 4Z3SU7rcTcK3Dgz85IwZbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="203804606"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.37])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 11:01:42 -0800
Date: Mon, 12 Jan 2026 21:01:39 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Ricardo Ribalda <ribalda@chromium.org>,
	=?iso-8859-1?Q?Andr=E9?= Apitzsch <git@apitzsch.eu>,
	Tarang Raval <tarang.raval@siliconsignals.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	Svyatoslav Ryhel <clamor95@gmail.com>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hao Yao <hao.yao@intel.com>,
	Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v7 2/2] media: i2c: add Himax HM1246 image sensor driver
Message-ID: <aWVFE-Y5HRi_XZRE@smile.fi.intel.com>
References: <20260112-hm1246-v7-0-fee8587f2808@emfend.at>
 <20260112-hm1246-v7-2-fee8587f2808@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-hm1246-v7-2-fee8587f2808@emfend.at>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jan 12, 2026 at 03:49:33PM +0100, Matthias Fend wrote:
> Add a V4L2 sub-device driver for Himax HM1246 image sensor.
> 
> The Himax HM1246-AWD is a 1/3.7-Inch CMOS image sensor SoC with an active
> array size of 1296 x 976. It is programmable through an I2C interface and
> connected via parallel bus.
> 
> The sensor has an internal ISP with a complete image processing pipeline
> including control loops. However, this driver uses the sensor in raw mode
> and the entire ISP is bypassed.

...

> +struct hm1246_mode {
> +	u32 codes[4];
> +	u32 clocks_per_pixel;

> +	u32 top;
> +	u32 left;
> +	u32 width;
> +	u32 height;

Why not use struct v4l2_rect?

> +	u32 hts;
> +	u32 vts_min;
> +	const struct hm1246_reg_list reg_list;
> +};

...

> +static int hm1246_set_format(struct v4l2_subdev *sd,
> +			     struct v4l2_subdev_state *state,
> +			     struct v4l2_subdev_format *fmt)
> +{
> +	struct hm1246 *hm1246 = to_hm1246(sd);
> +	struct v4l2_mbus_framefmt *mbus_fmt;
> +	struct v4l2_rect *crop;
> +	const struct hm1246_mode *mode;
> +
> +	mode = hm1246_find_mode_by_mbus_code(hm1246, fmt->format.code);
> +	if (IS_ERR(mode))
> +		mode = &hm1246_modes[0];
> +
> +	crop = v4l2_subdev_state_get_crop(state, 0);

> +	crop->top = mode->top;
> +	crop->left = mode->left;
> +	crop->width = mode->width;
> +	crop->height = mode->height;

With the above done this becomes a one-liner:

	*crop = mode.<rect>; // <rect> is whatever name for the embedded field

> +	hm1246_update_pad_format(hm1246, mode, &fmt->format);
> +	mbus_fmt = v4l2_subdev_state_get_format(state, 0);
> +	*mbus_fmt = fmt->format;
> +
> +	return 0;
> +}

...

> +static int hm1246_get_selection(struct v4l2_subdev *sd,
> +				struct v4l2_subdev_state *state,
> +				struct v4l2_subdev_selection *sel)
> +{
> +	const struct v4l2_mbus_framefmt *format;
> +	const struct hm1246_mode *mode;
> +
> +	format = v4l2_subdev_state_get_format(state, 0);
> +	mode = v4l2_find_nearest_size(hm1246_modes, ARRAY_SIZE(hm1246_modes),
> +				      width, height, format->width,
> +				      format->height);
> +
> +	switch (sel->target) {
> +	case V4L2_SEL_TGT_CROP:
> +		sel->r = *v4l2_subdev_state_get_crop(state, 0);
> +		return 0;
> +
> +	case V4L2_SEL_TGT_NATIVE_SIZE:
> +		sel->r.top = 0;
> +		sel->r.left = 0;
> +		sel->r.width = HM1246_NATIVE_WIDTH;
> +		sel->r.height = HM1246_NATIVE_HEIGHT;
> +		return 0;
> +
> +	case V4L2_SEL_TGT_CROP_DEFAULT:
> +	case V4L2_SEL_TGT_CROP_BOUNDS:

> +		sel->r.top = mode->top;
> +		sel->r.left = mode->left;
> +		sel->r.width = mode->width;
> +		sel->r.height = mode->height;

Seems in the same way here.

> +		return 0;
> +	}

> +	return -EINVAL;

Why not making it a default case?

> +}

...

> +	hm1246->reset_gpio =
> +		devm_gpiod_get_optional(hm1246->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(hm1246->reset_gpio))
> +		return dev_err_probe(hm1246->dev, PTR_ERR(hm1246->reset_gpio),
> +				     "failed to get reset GPIO\n");

Can it be GPIO reset driver used instead? (Note, it's made agnostic now.)

-- 
With Best Regards,
Andy Shevchenko



