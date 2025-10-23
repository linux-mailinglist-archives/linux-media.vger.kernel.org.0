Return-Path: <linux-media+bounces-45380-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3A2C00D41
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 13:43:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01E621888135
	for <lists+linux-media@lfdr.de>; Thu, 23 Oct 2025 11:43:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92E02EC0AB;
	Thu, 23 Oct 2025 11:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZlJc4gg8"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4513C30C62E;
	Thu, 23 Oct 2025 11:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761219799; cv=none; b=s8LnuFMwUPhq7V6zlU0Xve5Go1dKAPoqlrz/mHQPL4UWtZOBYi6VRyfPS8VuU0UWdmH3XFPhmJx/GTsiQdg6vvyP6pCKLioXTJ9AP0xRqNk8dDTeQp97J+Fm3Y70wzWB5KWWMYHEbbP/5/biqj6ltcvz+xkRxmi0VE5iQmuahNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761219799; c=relaxed/simple;
	bh=3FvckJYclLaFpoM7rkCjwxmr22V2jI4eOwreLOBgF1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dwk2KHoA+a2RRLSyh5/qHrnlM0Ufnq18w4makbfWeH4KuOAu0U/aSqTMXubAxeAl/p+H7nSlhBl75et+a9uDWkGP9qbvq2FiI1txymLFXVuM+oKT3NZdTR9zCGfvR9EFRhVIW5xWGAbLYxiwgg1lLj/XeTcMCLuTBJDYqky+954=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZlJc4gg8; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761219797; x=1792755797;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=3FvckJYclLaFpoM7rkCjwxmr22V2jI4eOwreLOBgF1U=;
  b=ZlJc4gg8xlH/AUy+QcmFceoM6dQ/CXSLgCW/+pquQeQUVqbEIx/epFCw
   bd2tb/1yzsGoELCw8MxbuaMvZSEjjwwGv8lVkbT6EBNYVYqIX2X3efoXj
   VUhURIUaocpByCnm7ZLNH40O/EyFD7bqgBalYvrK9BJbkLCZnhw+KBK2h
   raTB/OMCZwJTCvbQ8IE6ZM8q9zBKnwNoIZtRe5v9glzvG3R3dFahjFGOZ
   hJ3CKOMwvEsE4L7nM8ErlohKiO1egXwK3yj3bQxcfPjAueQUyd7XnuCuc
   gvG6Y55eSsJWT5yKzVtUGyvlakwIuCgHXLMkqDHkS5Qdvsk7zi1cvFQuk
   g==;
X-CSE-ConnectionGUID: GubOxQtcSfSYaIN2kYeCqw==
X-CSE-MsgGUID: cWloxm5BQgi9iz04eLyJ4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62415559"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="62415559"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 04:43:17 -0700
X-CSE-ConnectionGUID: +P1tvMTYR3C8eUA2trkadA==
X-CSE-MsgGUID: Lz7Gau+SSb+jgZGrGaJvjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; 
   d="scan'208";a="189269028"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.193])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2025 04:43:14 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id EADAA1209C8;
	Thu, 23 Oct 2025 14:43:11 +0300 (EEST)
Date: Thu, 23 Oct 2025 14:43:11 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: add Samsung S5KJN1 image sensor
 device driver
Message-ID: <aPoUzwYYiECdHXSv@kekkonen.localdomain>
References: <20251016020419.2137290-1-vladimir.zapolskiy@linaro.org>
 <20251016020419.2137290-3-vladimir.zapolskiy@linaro.org>
 <aPiZjiXp8-uuPjjX@kekkonen.localdomain>
 <9f4c0032-39c7-4d78-b24f-2d85cb93734b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f4c0032-39c7-4d78-b24f-2d85cb93734b@linaro.org>

Hi Vladimir,

On Thu, Oct 23, 2025 at 03:13:15AM +0300, Vladimir Zapolskiy wrote:
> Hi Sakari,
> 
> thank you so much for review!
> 
> On 10/22/25 11:45, Sakari Ailus wrote:
> > Hi Vladimir,
> > 
> > On Thu, Oct 16, 2025 at 05:04:19AM +0300, Vladimir Zapolskiy wrote:
> > > Samsung S5KJN1 is a 50MP image sensor, it produces Bayer GRBG (2x2)
> > > frames in RAW10 output format, the maximum supported output resolution
> > > is 8160x6144 at 10 frames per second rate.
> > > 
> > > Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> 
> <snip>
> 
> > > +
> > > +#define S5KJN1_NUM_SUPPLIES	ARRAY_SIZE(s5kjn1_supply_names)
> > 
> > Please use ARRAY_SIZE() directly where you need this.
> > 
> 
> There are 6 places of the macro usage in the driver, but will do it.
> 
> <snip>
> 
> > > +
> > > +static u64 s5kjn1_mode_to_pixel_rate(const struct s5kjn1_mode *mode)
> > > +{
> > > +	u64 pixel_rate;
> > > +
> > > +	pixel_rate = s5kjn1_link_freq_menu[0] * 2 * S5KJN1_DATA_LANES;
> > > +	do_div(pixel_rate, 10);			/* bits per pixel */
> > 
> > You could also use div_u64().
> > 
> 
> Right, also it would make sense to change the argument from mode to freq,
> that's what I notice.

Ack.

...

> > > +static int s5kjn1_set_pad_format(struct v4l2_subdev *sd,
> > > +				 struct v4l2_subdev_state *state,
> > > +				 struct v4l2_subdev_format *fmt)
> > > +{
> > > +	struct s5kjn1 *s5kjn1 = to_s5kjn1(sd);
> > > +	s64 hblank, vblank, exposure_max;
> > > +	const struct s5kjn1_mode *mode;
> > > +
> > > +	mode = v4l2_find_nearest_size(s5kjn1_supported_modes,
> > > +				      ARRAY_SIZE(s5kjn1_supported_modes),
> > > +				      width, height,
> > > +				      fmt->format.width, fmt->format.height);
> > > +
> > > +	s5kjn1_update_pad_format(s5kjn1, mode, &fmt->format);
> > > +
> > > +	/* Format code can be updated with respect to flip controls */
> > > +	*v4l2_subdev_state_get_format(state, 0) = fmt->format;
> > > +
> > > +	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY)
> > > +		return 0;
> > > +
> > > +	if (s5kjn1->mode == mode)
> > > +		return 0;
> > > +
> > > +	s5kjn1->mode = mode;
> > > +
> > > +	/* Update limits and set FPS and exposure to default values */
> > > +	hblank = mode->hts - mode->width;
> > > +	__v4l2_ctrl_modify_range(s5kjn1->hblank, hblank, hblank, 1, hblank);
> > > +
> > > +	vblank = mode->vts - mode->height;
> > > +	__v4l2_ctrl_modify_range(s5kjn1->vblank, vblank,
> > > +				 S5KJN1_VTS_MAX - mode->height, 1, vblank);
> > > +	__v4l2_ctrl_s_ctrl(s5kjn1->vblank, vblank);
> > > +
> > > +	exposure_max = mode->vts - mode->exposure_margin;
> > > +	__v4l2_ctrl_modify_range(s5kjn1->exposure, S5KJN1_EXPOSURE_MIN,
> > > +				 exposure_max, S5KJN1_EXPOSURE_STEP,
> > > +				 mode->exposure);
> > > +	__v4l2_ctrl_s_ctrl(s5kjn1->exposure, mode->exposure);
> > 
> > Note that these can also fail. Assigning the format to the state should
> > thus be done as last.
> 
> Likely it could happen due to some obscure reasons, but it is not expected
> to happen due to the new applied mode settings, because the settings are
> the default ones for the selected mode. Anyway, I agree that in general
> an error could appear, I'll add the next check before changing the state:
> 
>         if (s5kjn1->sd.ctrl_handler->error)
>                 return s5kjn1->sd.ctrl_handler->error;

The control handler's error state is set when setting up the control
handler itself somehow fails, not when applying a value to a control fails.
I.e. you should check the return values from the above functions only.

E.g. setting the vertical blanking value typically results in an I²C write.

> 
> > > +
> > > +	return 0;
> > > +}
> > > +
> 
> <snip>
> 
> > > +
> > > +static const struct v4l2_subdev_pad_ops s5kjn1_pad_ops = {
> > > +	.set_fmt = s5kjn1_set_pad_format,
> > > +	.get_fmt = v4l2_subdev_get_fmt,
> > > +	.enum_mbus_code = s5kjn1_enum_mbus_code,
> > > +	.enum_frame_size = s5kjn1_enum_frame_size,
> > > +	.enable_streams = s5kjn1_enable_streams,
> > > +	.disable_streams = s5kjn1_disable_streams,
> > 
> > Could you also add selections support, even if they're all read-only?
> > 
> 
> Will it be sufficient to set
> 
>         sel->r.top = 0;
>         sel->r.left = 0;
>         sel->r.width = fmt->width;
>         sel->r.height = fmt->height;
> 
> for the crop selection targets like it's done in ov2640 case for instance?

Preferrably like e.g. imx219.

-- 
Kind regards,

Sakari Ailus

