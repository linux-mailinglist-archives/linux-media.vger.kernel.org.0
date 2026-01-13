Return-Path: <linux-media+bounces-50532-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 220EDD17A15
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 10:31:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CBF46300217E
	for <lists+linux-media@lfdr.de>; Tue, 13 Jan 2026 09:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 463E138A721;
	Tue, 13 Jan 2026 09:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="htDAx1B5"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CCE387589;
	Tue, 13 Jan 2026 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768296551; cv=none; b=HcYbP37zhVIMFtEbcVL8oY+0oYCreRbfaqJT5Bl7d62RsecczLC/jcLgwA//LioLU/cm769K5A9ZgCbzOD+YM9LaQhcgc0RtrZu1sdSKu4TwgabM8fU+StwyDySoK0/zVJ8Zaykzn94TcwJC7FKgHpMGZUy3cTbkxGioh9u2eC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768296551; c=relaxed/simple;
	bh=kQMGQJt3EWSe0u3U839AQ9IRNSi4mm7LKDLeTyueEOY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOB8aWLtaVxsWlLn4FHzs+cB1OE2lTXk7+SZ0VMGVXiPjLnER2PsXr18cM8PzBAI07mfN0jfzcplwTbpq92kCTckSwonldE27MDAxHLOc5kXzOAiu6PT1t6V/4EliMwAtSSsWb7Qo0zgtr8ZMAwB5PCPMlQte4doLZUY13yKNoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=htDAx1B5; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768296549; x=1799832549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=kQMGQJt3EWSe0u3U839AQ9IRNSi4mm7LKDLeTyueEOY=;
  b=htDAx1B5PrcKx7Tuin+u2kn1nPmbp2PLHhPxne2Z2Fpx6HxQc0rcyqdH
   VSxAkbY8vbBve0OeRMJ2lrfAW4AUQdlqLyb1WLZJJ5CcJ05sFxMhCvgMc
   xyJC/wLIR4m4B1PeJG5iQ4UC1NbdV8E/PIBFRPLJkQ0zbxRkFFbuUbo9U
   0PwLl6FyW6rD4t3jXu6+r1Jwi/qqTktuXsfm5DwCEU0enB6814/k8jKIZ
   ZD4RskskK0sslOSiGBa/g8hLm5CatZn1v75doJbFrAlSbBQTzRMWxoUpp
   Qw0q9o7viUbnQaJck1c4TtVvar6s1MGSc8pi5+qfCjkI0nBEkTA485E2q
   g==;
X-CSE-ConnectionGUID: PdF+/WN8QReZ/cd6n1RSKA==
X-CSE-MsgGUID: fZIsDEU/QraplTJJojL+5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80298205"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80298205"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:29:05 -0800
X-CSE-ConnectionGUID: xGYGW6cpT7m2vKG8s5vKcw==
X-CSE-MsgGUID: HwnBLT8/S1CG/FeRRl7THg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204419013"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.245.177])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 01:28:59 -0800
Date: Tue, 13 Jan 2026 11:28:56 +0200
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
Message-ID: <aWYQWAQnnFW0Kf9z@smile.fi.intel.com>
References: <20260112-hm1246-v7-0-fee8587f2808@emfend.at>
 <20260112-hm1246-v7-2-fee8587f2808@emfend.at>
 <aWVFE-Y5HRi_XZRE@smile.fi.intel.com>
 <f2e77bb5-957e-4751-8304-d9fb94927417@emfend.at>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f2e77bb5-957e-4751-8304-d9fb94927417@emfend.at>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 13, 2026 at 10:06:36AM +0100, Matthias Fend wrote:
> Hi Andy,
> Am 12.01.2026 um 20:01 schrieb Andy Shevchenko:
> > On Mon, Jan 12, 2026 at 03:49:33PM +0100, Matthias Fend wrote:

...

> > > +struct hm1246_mode {
> > > +	u32 codes[4];
> > > +	u32 clocks_per_pixel;
> > 
> > > +	u32 top;
> > > +	u32 left;
> > > +	u32 width;
> > > +	u32 height;
> > 
> > Why not use struct v4l2_rect?
> 
> Valid question. I would save something in six places, but add something in
> about 27 others. Because of this ratio, I opted for the current way.

It's more about standardization. Can you provide an example of the place where
you need to add something?

> > > +	u32 hts;
> > > +	u32 vts_min;
> > > +	const struct hm1246_reg_list reg_list;
> > > +};

...

> > > +static int hm1246_get_selection(struct v4l2_subdev *sd,
> > > +				struct v4l2_subdev_state *state,
> > > +				struct v4l2_subdev_selection *sel)
> > > +{
> > > +	const struct v4l2_mbus_framefmt *format;
> > > +	const struct hm1246_mode *mode;
> > > +
> > > +	format = v4l2_subdev_state_get_format(state, 0);
> > > +	mode = v4l2_find_nearest_size(hm1246_modes, ARRAY_SIZE(hm1246_modes),
> > > +				      width, height, format->width,
> > > +				      format->height);
> > > +
> > > +	switch (sel->target) {
> > > +	case V4L2_SEL_TGT_CROP:
> > > +		sel->r = *v4l2_subdev_state_get_crop(state, 0);
> > > +		return 0;
> > > +
> > > +	case V4L2_SEL_TGT_NATIVE_SIZE:
> > > +		sel->r.top = 0;
> > > +		sel->r.left = 0;
> > > +		sel->r.width = HM1246_NATIVE_WIDTH;
> > > +		sel->r.height = HM1246_NATIVE_HEIGHT;
> > > +		return 0;
> > > +
> > > +	case V4L2_SEL_TGT_CROP_DEFAULT:
> > > +	case V4L2_SEL_TGT_CROP_BOUNDS:
> > 
> > > +		sel->r.top = mode->top;
> > > +		sel->r.left = mode->left;
> > > +		sel->r.width = mode->width;
> > > +		sel->r.height = mode->height;
> > 
> > Seems in the same way here.
> > 
> > > +		return 0;
> > > +	}
> > 
> > > +	return -EINVAL;
> > 
> > Why not making it a default case?
> 
> I prefer it when the return statement is at the end of the function. Do you
> see a problem here?

For the matter of fact I do see a problem here. But it's not how code works
right now, it's about maintenance. The disrupted returns like this may lead
to subtle mistakes when the code gets changed (grows) and more cases added
including ones that might want to share something as a success path.

> > > +}

...

> > > +	hm1246->reset_gpio =
> > > +		devm_gpiod_get_optional(hm1246->dev, "reset", GPIOD_OUT_HIGH);
> > > +	if (IS_ERR(hm1246->reset_gpio))
> > > +		return dev_err_probe(hm1246->dev, PTR_ERR(hm1246->reset_gpio),
> > > +				     "failed to get reset GPIO\n");
> > 
> > Can it be GPIO reset driver used instead? (Note, it's made agnostic now.)
> 
> That would probably be possible, but I currently don't see any advantage for
> I2C image sensors. If I understand correctly, you would first have to define
> a reset controller that could then be used in the sensor – instead of simply
> specifying the GPIO directly.

Again, standardization.

> The advantage of being able to share the reset line with other components
> probably doesn't make sense for these sensors in most cases. That's perhaps
> also the reason why it hasn't been used before.
> 
> Maybe the media maintainers have an opinion on this?

-- 
With Best Regards,
Andy Shevchenko



