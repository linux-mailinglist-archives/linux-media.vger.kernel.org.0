Return-Path: <linux-media+bounces-29131-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F54A777F7
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 11:42:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9503E1888721
	for <lists+linux-media@lfdr.de>; Tue,  1 Apr 2025 09:42:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECB7F1EF39A;
	Tue,  1 Apr 2025 09:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZEGmCALF"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72A41EEA5E;
	Tue,  1 Apr 2025 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743500542; cv=none; b=rW/yx6bSbmgRJtrAEGvsXF7L8SuMSVRa18wQaa+S/WZvpyAbKgfelnqH2nkUz1PW/LNuSUzH+ZUUiOB62t3w2s4NL/1A0cGPxY644BEnXL4NnOSEkXfCuMuqFIKWPwP7XCJf++pEs3L6gXtcM8WhVSpyyO+zGC/85R5OG0iSmp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743500542; c=relaxed/simple;
	bh=WWheB07CXjl+ZcZRCAGwPLKs5IwrbNbuBEqH+m2Rk1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K417Hqdr7mrjVVqyoP0bpjx1QPpqtBxRnvwcamKnGhGnaxVCvNR3/Gd39ix/wgZ7ntPv9w5OxXgkc7KPIGvPyvPY/9WTlFy7LwxtjrIvJIy0y3Jl9BikF7LImbRkcE54MwgUIKZgsi3o1OeQRE2jY8GHbaz22+IjQ3ami3rKuAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZEGmCALF; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743500540; x=1775036540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=WWheB07CXjl+ZcZRCAGwPLKs5IwrbNbuBEqH+m2Rk1I=;
  b=ZEGmCALF6Sg19D7HkTvh4E7J/CwQ4rYAEDfGg/b38vJ3bdWx7c0mU+nM
   4sNEPaCjDxbdxI7Q5UBzDtpcbwUgu0CGecSHJlUJitQuJKUZVKiHKopqm
   uy8QWJvPVV6H4lXn9Ze9QuuRRcmIHSXehBY3ly/Z37eGgFWLjZ6BOG9Vh
   rY2dys5smP8C++iy7KgIRJ2E/CBzymd3ON4bBiPHSvjHoWHl9ZsOfSHji
   LhO5D/dkU9GsXh52MsPVLeSwXv7fvrdj0RW5ZDAF5YYXztn06N7aRmMmh
   7hZ9WFACYnNRjUxMCbIpOXBGjp9UYwiLHTfeX0N5eAXPz38qQ+7nXSChK
   A==;
X-CSE-ConnectionGUID: BYCsbOYNQougZ2zrXkP+nQ==
X-CSE-MsgGUID: nvzu54qURwSgRSxmd/LXVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55009770"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="55009770"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:42:20 -0700
X-CSE-ConnectionGUID: gV2iRthmQfWsOdZY/J+ZRA==
X-CSE-MsgGUID: ujkJaPsFSzqlhgeN/5vVlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="131471741"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 02:42:16 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id A895211FA2C;
	Tue,  1 Apr 2025 12:42:13 +0300 (EEST)
Date: Tue, 1 Apr 2025 09:42:13 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Hao Yao <hao.yao@intel.com>, Jim Lai <jim.lai@intel.com>,
	You-Sheng Yang <vicamo.yang@canonical.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] media: i2c: ov02e10: add OV02E10 image sensor
 driver
Message-ID: <Z-u09dfEYfjqKhDQ@kekkonen.localdomain>
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
 <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>
 <Z-UAFkshOgeytfB4@kekkonen.localdomain>
 <47dd7daa-cce4-4ad0-ab57-4c76304b0aa6@linaro.org>
 <5fd2253f-0acb-4c95-b3bb-e7e065c92dd5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5fd2253f-0acb-4c95-b3bb-e7e065c92dd5@redhat.com>

Hi Hans, Bryan,

On Tue, Apr 01, 2025 at 10:12:35AM +0200, Hans de Goede wrote:
> Hi Bryan, Sakari,
> 
> On 1-Apr-25 2:34 AM, Bryan O'Donoghue wrote:
> > On 27/03/2025 07:36, Sakari Ailus wrote:
> >>> +static u64 to_pixel_rate(u32 f_index)
> >>> +{
> >>> +    u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OV02E10_DATA_LANES;
> >>> +
> >>> +    do_div(pixel_rate, OV02E10_RGB_DEPTH);
> >> The pixel rate control is for the pixel rate on the pixel array, not on the
> >> CSI-2 interface. Without binning or sub-sampling these may the same still,
> >> but this only works in special cases really.
> > 
> > Hmm computer says no, I don't think I have understood this comment..
> > 
> > Looking at other drivers, I'd say the above pattern is pretty common - taking ov8856 as an example that's pretty much equivalent logic to the above, ov08x40 does something similar.
> > 
> > =>
> > 
> > pixel_rate == link_freq * 2 * #oflanes / RGB_DEPTH
> >            => 360MHz * 2 * 2 / 10
> >            => 360000000 * 2 * 2 / 10
> >            => 144000000
> > 
> > If I'm understanding you though you mean the pixel rate for the control V4L2_CID_PIXEL_RATE expressed here should be the resolution * the FPS / bits_per_pixel
> 
> I have to agree with Bryan here that the pixelrate typically is const
> and directly derived from the link-frequency. Even the
> __v4l2_get_link_freq_ctrl() helper from drivers/media/v4l2-core/v4l2-common.c
> assumes this.

That is there to support old drivers that don't use the LINK_FREQ control.
All new ones do.

> 
> binning / subsampling does not change anything wrt the pixelrate it
> just means that either the blanking becomes much bigger keeping
> vts / hts the same, or that the FPS becomes much higher.
> 
> It is not like the sensor is sending an empty pixel on the CSI
> link every other pixel when binning, since there is no such
> thing as an empty pixel. So the sensor must go faster when doing
> horizontal binning to keep the CSI link filled effectively
> doubling the FPS, or requiring a much larger hblank after having
> taken only half the time sending pixels.

Please see
<URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/drivers/camera-sensor.html#raw-camera-sensors>
and
<URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/ext-ctrls-image-process.html#image-process-control-ids>.

As noted, this may be correct if the sensor doesn't use binning or
sub-sampling, but conceptually pixel rate on the pixel array and on the
CSI-2 bus are different. The PIXEL_RATE control is for the former albeit in
the past some drivers have presumably used it for the latter as well.

> 
> (and the same applies to vts when vertical binning)
> 
> > pixel_rate = wdith x height x fps / bpp
> >            => 1928 * 1088 * 30 / 10
> >            => 6292992
> > 
> > i.e. the pixel rate not related to the CSI2 link frequency ?
> 
> No the pixel-rate control includes vblank + hblank "pixels"
> and is in pixels/sec so no dividing by bpp, iow it is:
> 
> vts * hts * fps
> 
> and this must match
> 
> link_freq * 2 * #oflanes / RGB_DEPTH

-- 
Kind regards,

Sakari Ailus

