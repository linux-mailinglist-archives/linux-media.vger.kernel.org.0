Return-Path: <linux-media+bounces-29324-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CF3A7A35B
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 15:07:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E2E2B17339C
	for <lists+linux-media@lfdr.de>; Thu,  3 Apr 2025 13:07:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58AEE24E015;
	Thu,  3 Apr 2025 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CpE0lx1T"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF99A25776;
	Thu,  3 Apr 2025 13:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685620; cv=none; b=nTvn51XHHliebhrVbm8H66IMPpAQyv4hAD+3xTbks+RuoVpL8MBAM+qNlxHJLALXXGO+45VYHLJZwpgCx1CdlQqgM6HOMJ/weZih6BjfiKbSMISHO8YrXT1mNz9jDiYQBztAoIDSRIoNzNWPrJoU8jRotphDCqFk/7Gxa2Ot/Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685620; c=relaxed/simple;
	bh=ccgaxAtOrxadionPRcF5eo1R9WdRgpYc66EzmqUNUuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f1XsKGy7pfI+jCVcGS74RcRA0MDpxBF7CDracVHdAszz6Wo0io/Y6cQ1O2In0QNFpljssb75koLBi6mUTATLF+3V4AJyaqapWZtHks0arhbkmCNlSnPVRIpJl+cWPf+LGuYvRGKmROUpwKOI/7DscYa16/sGjKi3OdAU+9LcW6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CpE0lx1T; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743685619; x=1775221619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ccgaxAtOrxadionPRcF5eo1R9WdRgpYc66EzmqUNUuI=;
  b=CpE0lx1T7DqWDbv2CEoMIRM2h3La55nTF+als1ZGEV9IkKIC/QurhEUb
   5juEGTfv9Fz6eGT4iqGU1pLjaSpiyH9ZUeoElYo5ee9aZ6ir+qh18f9Tv
   G6yDqkiLcTFbjvjnz8K6FTCeAIrmooYGM+ZztFXEcHHgWEP6uf1LlIo4F
   18k1VzkatvOctkzKex8awLf4XBxIytKkcY0Q8os8NHyXMeRlrKl4HD18T
   ifw7yN153ZNshnkutNs2idG28fshfzKruC8CWPAC4ipOFp38VRpdEbrG7
   j1F/Bb1C1VaIiuS90D1CG/6h8gnQg8ZJwW2WgTXqY8VnOsRuK1iyqB0D6
   A==;
X-CSE-ConnectionGUID: vEfaGbn2T4e+uNbu4GDFdw==
X-CSE-MsgGUID: R/OwmgkkSpK6mu6ZtoSGJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="55721166"
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="55721166"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:06:58 -0700
X-CSE-ConnectionGUID: Rxx7D3UoQfSn85lxnAUMtA==
X-CSE-MsgGUID: +WtkS6jMQz2sJVOQm9eQVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,184,1739865600"; 
   d="scan'208";a="126910156"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 06:06:54 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id ACF1511F964;
	Thu,  3 Apr 2025 16:06:50 +0300 (EEST)
Date: Thu, 3 Apr 2025 13:06:50 +0000
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
Message-ID: <Z-6H6r0FIAbRtxwQ@kekkonen.localdomain>
References: <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-0-4d933ac8cff6@linaro.org>
 <20250325-b4-media-comitters-next-25-03-13-ov02e10-v2-2-4d933ac8cff6@linaro.org>
 <Z-UAFkshOgeytfB4@kekkonen.localdomain>
 <47dd7daa-cce4-4ad0-ab57-4c76304b0aa6@linaro.org>
 <5fd2253f-0acb-4c95-b3bb-e7e065c92dd5@redhat.com>
 <Z-u09dfEYfjqKhDQ@kekkonen.localdomain>
 <6cf8d6db-c24e-461b-bd7d-a3dad25e4945@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6cf8d6db-c24e-461b-bd7d-a3dad25e4945@redhat.com>

Hi Hans,

On Tue, Apr 01, 2025 at 03:34:39PM +0200, Hans de Goede wrote:
> Hi Sakari,
> 
> On 1-Apr-25 11:42 AM, Sakari Ailus wrote:
> > Hi Hans, Bryan,
> > 
> > On Tue, Apr 01, 2025 at 10:12:35AM +0200, Hans de Goede wrote:
> >> Hi Bryan, Sakari,
> >>
> >> On 1-Apr-25 2:34 AM, Bryan O'Donoghue wrote:
> >>> On 27/03/2025 07:36, Sakari Ailus wrote:
> >>>>> +static u64 to_pixel_rate(u32 f_index)
> >>>>> +{
> >>>>> +    u64 pixel_rate = link_freq_menu_items[f_index] * 2 * OV02E10_DATA_LANES;
> >>>>> +
> >>>>> +    do_div(pixel_rate, OV02E10_RGB_DEPTH);
> >>>> The pixel rate control is for the pixel rate on the pixel array, not on the
> >>>> CSI-2 interface. Without binning or sub-sampling these may the same still,
> >>>> but this only works in special cases really.
> >>>
> >>> Hmm computer says no, I don't think I have understood this comment..
> >>>
> >>> Looking at other drivers, I'd say the above pattern is pretty common - taking ov8856 as an example that's pretty much equivalent logic to the above, ov08x40 does something similar.
> >>>
> >>> =>
> >>>
> >>> pixel_rate == link_freq * 2 * #oflanes / RGB_DEPTH
> >>>            => 360MHz * 2 * 2 / 10
> >>>            => 360000000 * 2 * 2 / 10
> >>>            => 144000000
> >>>
> >>> If I'm understanding you though you mean the pixel rate for the control V4L2_CID_PIXEL_RATE expressed here should be the resolution * the FPS / bits_per_pixel
> >>
> >> I have to agree with Bryan here that the pixelrate typically is const
> >> and directly derived from the link-frequency. Even the
> >> __v4l2_get_link_freq_ctrl() helper from drivers/media/v4l2-core/v4l2-common.c
> >> assumes this.
> > 
> > That is there to support old drivers that don't use the LINK_FREQ control.
> > All new ones do.
> > 
> >>
> >> binning / subsampling does not change anything wrt the pixelrate it
> >> just means that either the blanking becomes much bigger keeping
> >> vts / hts the same, or that the FPS becomes much higher.
> >>
> >> It is not like the sensor is sending an empty pixel on the CSI
> >> link every other pixel when binning, since there is no such
> >> thing as an empty pixel. So the sensor must go faster when doing
> >> horizontal binning to keep the CSI link filled effectively
> >> doubling the FPS, or requiring a much larger hblank after having
> >> taken only half the time sending pixels.
> > 
> > Please see
> > <URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/drivers/camera-sensor.html#raw-camera-sensors>
> > and
> > <URL:https://hverkuil.home.xs4all.nl/spec/userspace-api/v4l/ext-ctrls-image-process.html#image-process-control-ids>.
> > 
> > As noted, this may be correct if the sensor doesn't use binning or
> > sub-sampling, but conceptually pixel rate on the pixel array and on the
> > CSI-2 bus are different. The PIXEL_RATE control is for the former albeit in
> > the past some drivers have presumably used it for the latter as well.
> 
> Ok, so here is what is written there:
> 
> "V4L2_CID_PIXEL_RATE (64-bit integer)
> 
>     Pixel sampling rate in the device’s pixel array. This control is read-only and its unit is pixels / second.
> 
>     Some devices use horizontal and vertical blanking to configure the frame rate. The frame rate can be calculated from the pixel rate, analogue crop rectangle as well as horizontal and vertical blanking. The pixel rate control may be present in a different sub-device than the blanking controls and the analogue crop rectangle configuration.
> 
>     The configuration of the frame rate is performed by selecting the desired horizontal and vertical blanking. The unit of this control is Hz."
> 
> So when not bin-/skip-/averag-ing this matches with my understanding
> which is that:
> 
> FPS = pixelrate / ((mode.width + hblank) * (mode.height + vblank))
> 
> and also pixelrate = link_freq * 2 * #oflanes / RGB_DEPTH.
> 
> Since the ov02e10 driver does not do bin-/skip-/avera-ging,
> this definitely is correct for the ov02e10, so I don't really
> think there is an issue with the ov02e10 driver here.
> 
> I've been assuming in drivers which do do binning like the ov2680
> that this also holds true when binning. But what I'm hearing
> you say here is that the reported pixelrate should change when
> binning?

The pixel rate could be different in binned modes and non-binned modes. On
some devices (and configurations) it could be the same, but primarily it
depends on what the driver does.

> 
> I see how the calculation of the FPS should change, reading
> the V4L2 API using mode.width / mode.height is wrong and instead
> the analog crop should be used which is e.g. (2 * mode.width) x
> (2 * mode.height) when doing binning and I can see how this is
> sensible because this way when just disabling/enabling binning
> without changing the blanks the fps does not change.
> 
> Except that we don't have a proper API to select binning and
> instead is done transparently by drivers like the ov2680 driver ...
> 
> And I believe that e.g. libcamera atm simply implements:
> 
> FPS = pixelrate / ((mode.width + hblank) * (mode.height + vblank))
> 
> and thus assumes that the driver updates the hblank / vblank
> values it reports by adding width/height to the reported value
> to compensate for binning but I might be mistaken there.

The line length and frame values appear to be miscalculated but there are
driver bugs, too, and right now not all drivers expose the information
anyway. Register list based drivers will continue to be poor in this
respect though. But see below.

> 
> This also begs the question what a driver with arbitrary mode
> support like the ov2680 driver should do on a set_fmt() call
> where fmt.width / height don't match (either 1:1 or 1:2)
> with the analog crop. Should the driver then update the analog
> crop? ATM for modes smaller then the current analog crop,
> the ov2680 code simply adds extra in driver cropping on top of
> the selection API crop, without updating the selection API crop.
> Since the driver clamps the max accepted fmt width/height to
> the crop updating the selection API crop would be troublesome
> and break non selection API users when they want to switch back
> to a higher resolution mode ...
> 
> I don't think we really have properly specified (as in written down)
> how all this is supposed to work, especially as soon as binning comes
> into play. I think discussing all possible corner cases and trying
> to hammer out how this all is supposed to fit together would be
> a good summit for the media maintainers summit in Nice ?

I've been working on more elaborate camera sensor control recently, it's
related to streams support. The current set is here
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata>. That
does not yet provide a solution for changing the mode for mode-based
drivers though.

> 
> Eitherway I believe that the current code in ov02e10 is fine as
> is for now since the ov02e10 driver only supports a single fixed
> mode with no binning.

Yes, I think so as well.

> 
> BTW the last sentence of the control description clearly needs work,
> framerate indeed is in Hz, but framerate is indirectly controlled through
> setting the blanking times, which are in pixels not Hz, so that last
> sentence is confusing.

"This" refers to the PIXEL_RATE control, not to the blanking controls. The
sentence could be moved to a separate paragraph to make it clearer it's
unrelated. Adding a reference to further driver API documentation in
camera-sensor.rst could be useful, too.

-- 
Regards,

Sakari Ailus

