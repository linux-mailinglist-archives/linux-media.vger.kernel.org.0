Return-Path: <linux-media+bounces-50551-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 106DDD18846
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 12:38:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F2C7301A71F
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 11:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D076A38BDC6;
	Tue, 13 Jan 2026 11:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NpBv9ocn"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235261E7C12;
	Tue, 13 Jan 2026 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768304304; cv=none; b=cSt3bAJEHRJF9cCaybOo1Sd5u/BHFVENr+qOxP1HhzWQCRQjlf+ZS2KgANldsp59kdhWCiDIxWN8pMCXdt/FiPExLrTLxHILxbknI5OGZyfp9r9y/CmaiwrlJVjflqt79kJkTm5zNXBAUJeTKd/zHdQtisiWAgoBTgSEZn58nUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768304304; c=relaxed/simple;
	bh=fJaHPuFEDihSEaz+1W2ZGym2aLOYWzJSXb2oElMTFnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULzbjbFbQ4HuBhWqLrNKOKL16tn+/LGjClTgWQIaQQrZ6CaPM9zEubqeK2T+gsYkYFJbdO+OR3garPxK99MfjtJNOe61/luOr4Z0U8T2pzyhTGz4EJyglMZH1Y69mCP55tyPIN557tyqGxe5z0pMeXtMRcEbbdFhYdP5qfhdx4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NpBv9ocn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768304302; x=1799840302;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fJaHPuFEDihSEaz+1W2ZGym2aLOYWzJSXb2oElMTFnA=;
  b=NpBv9ocnX+n8GD7UXqPCOMwWz/uIcxqWcQp/NvXBa3ZDoOIv1ZoeG+AE
   6t3+qGl890HNu+osHCWnrkDaDmYVQykaEyBCqKH5/i+U8pLyO2Nx8+J4h
   OSEeJB4adBpJIXTl5LhRylq/Dvinxoa6/pL7dc3P3HkD2ZACkw+ifuFQ3
   o0BquF6DOXADi0J6WdZc/7EncKNE+obWJS7yaia6w6Fz+e8ltwfZeE4HZ
   3+tBsQ65USI0xQnKmgo219NUcq8XoTLLccmOaYXv+jkpq4vvjA7qIxX1W
   EVMJ7oxFRxUzCIA1Mx801aMiO006S/LiKdXY6oCgLyptt7P4NVsD10in/
   A==;
X-CSE-ConnectionGUID: nTmif9u9SqWtxxCR5LPFhg==
X-CSE-MsgGUID: YocMNJ5iTSOq4DZXdz+JMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80232228"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80232228"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:38:21 -0800
X-CSE-ConnectionGUID: 279owJbJSFOvbzzy57NpIg==
X-CSE-MsgGUID: qJRB9onbQl6BQLAkxpTprw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204763491"
Received: from abityuts-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.182])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 03:38:15 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 6B48B11FB85;
	Tue, 13 Jan 2026 13:38:13 +0200 (EET)
Date: Tue, 13 Jan 2026 13:38:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Fend <matthias.fend@emfend.at>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
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
Message-ID: <aWYupZ3xp7-IycFD@kekkonen.localdomain>
References: <20260112-hm1246-v7-0-fee8587f2808@emfend.at>
 <20260112-hm1246-v7-2-fee8587f2808@emfend.at>
 <aWVFE-Y5HRi_XZRE@smile.fi.intel.com>
 <f2e77bb5-957e-4751-8304-d9fb94927417@emfend.at>
 <aWYQWAQnnFW0Kf9z@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aWYQWAQnnFW0Kf9z@smile.fi.intel.com>

Hi Andy, Matthias,

On Tue, Jan 13, 2026 at 11:28:56AM +0200, Andy Shevchenko wrote:
> On Tue, Jan 13, 2026 at 10:06:36AM +0100, Matthias Fend wrote:
> > Hi Andy,
> > Am 12.01.2026 um 20:01 schrieb Andy Shevchenko:
> > > On Mon, Jan 12, 2026 at 03:49:33PM +0100, Matthias Fend wrote:
> 
> ...
> 
> > > > +struct hm1246_mode {
> > > > +	u32 codes[4];
> > > > +	u32 clocks_per_pixel;
> > > 
> > > > +	u32 top;
> > > > +	u32 left;
> > > > +	u32 width;
> > > > +	u32 height;
> > > 
> > > Why not use struct v4l2_rect?
> > 
> > Valid question. I would save something in six places, but add something in
> > about 27 others. Because of this ratio, I opted for the current way.
> 
> It's more about standardization. Can you provide an example of the place where
> you need to add something?

We have around as many driver mode structs for more or less similar
purposes as we have register-list based drivers, so certainly some help
from the framework could be useful. But I don't think this problem is
solved by switching to struct v4l2_rect here (albeit I don't think it's a
bad idea as such either).

> 
> > > > +	u32 hts;
> > > > +	u32 vts_min;
> > > > +	const struct hm1246_reg_list reg_list;
> > > > +};
> 
> ...
> 
> > > > +static int hm1246_get_selection(struct v4l2_subdev *sd,
> > > > +				struct v4l2_subdev_state *state,
> > > > +				struct v4l2_subdev_selection *sel)
> > > > +{
> > > > +	const struct v4l2_mbus_framefmt *format;
> > > > +	const struct hm1246_mode *mode;
> > > > +
> > > > +	format = v4l2_subdev_state_get_format(state, 0);
> > > > +	mode = v4l2_find_nearest_size(hm1246_modes, ARRAY_SIZE(hm1246_modes),
> > > > +				      width, height, format->width,
> > > > +				      format->height);
> > > > +
> > > > +	switch (sel->target) {
> > > > +	case V4L2_SEL_TGT_CROP:
> > > > +		sel->r = *v4l2_subdev_state_get_crop(state, 0);
> > > > +		return 0;
> > > > +
> > > > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > > +		sel->r.top = 0;
> > > > +		sel->r.left = 0;
> > > > +		sel->r.width = HM1246_NATIVE_WIDTH;
> > > > +		sel->r.height = HM1246_NATIVE_HEIGHT;
> > > > +		return 0;
> > > > +
> > > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > > 
> > > > +		sel->r.top = mode->top;
> > > > +		sel->r.left = mode->left;
> > > > +		sel->r.width = mode->width;
> > > > +		sel->r.height = mode->height;
> > > 
> > > Seems in the same way here.
> > > 
> > > > +		return 0;
> > > > +	}
> > > 
> > > > +	return -EINVAL;
> > > 
> > > Why not making it a default case?
> > 
> > I prefer it when the return statement is at the end of the function. Do you
> > see a problem here?
> 
> For the matter of fact I do see a problem here. But it's not how code works
> right now, it's about maintenance. The disrupted returns like this may lead
> to subtle mistakes when the code gets changed (grows) and more cases added
> including ones that might want to share something as a success path.

I'd also move returning to the default case -- the function doesn't do
anything else after the switch.

> 
> > > > +}
> 
> ...
> 
> > > > +	hm1246->reset_gpio =
> > > > +		devm_gpiod_get_optional(hm1246->dev, "reset", GPIOD_OUT_HIGH);
> > > > +	if (IS_ERR(hm1246->reset_gpio))
> > > > +		return dev_err_probe(hm1246->dev, PTR_ERR(hm1246->reset_gpio),
> > > > +				     "failed to get reset GPIO\n");
> > > 
> > > Can it be GPIO reset driver used instead? (Note, it's made agnostic now.)
> > 
> > That would probably be possible, but I currently don't see any advantage for
> > I2C image sensors. If I understand correctly, you would first have to define
> > a reset controller that could then be used in the sensor – instead of simply
> > specifying the GPIO directly.
> 
> Again, standardization.
> 
> > The advantage of being able to share the reset line with other components
> > probably doesn't make sense for these sensors in most cases. That's perhaps
> > also the reason why it hasn't been used before.
> > 
> > Maybe the media maintainers have an opinion on this?

I think this is a good idea: the reset line is sometimes shared with
another device (VCM driver in this case). Right now we don't have a sensor
driver doing this however. Do you know of a driver that would serve as an
example?

That being said, I think adding this could be done on top of this set as
well.

-- 
Kind regards,

Sakari Ailus

