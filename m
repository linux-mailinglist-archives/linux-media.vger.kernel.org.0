Return-Path: <linux-media+bounces-35470-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C14AE15C9
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 10:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3E0307ADFD3
	for <lists+linux-media@lfdr.de>; Fri, 20 Jun 2025 08:21:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E01002356B3;
	Fri, 20 Jun 2025 08:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CENAb40Z"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD9E12D758;
	Fri, 20 Jun 2025 08:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407750; cv=none; b=tMf1JmKmEz8xR7W3o8TcbYvC3Yw+ZYdCagdsPjX1KY98p+av+eVuhtgFVVFJtnmHrSv9mhkc/xgVUl2AsMwPSPf9qD2KGml9ZIQwkLAYqkwvms7c45qzvrIObfT/aircYLGCsIXriXg91Y888y2pM9NQAdMHVgA3eHk3dBVsEqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407750; c=relaxed/simple;
	bh=H5xdLvsboeL7dlRK+EBFcm4+UCVw3/qL8XO1zqk3X1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCkASB5ugYklvDZ0FlkOXhHY91WU+O0nb3p6IeUktWxFNul0uUZMNDaJn8Jub86iB+eLKdvXwv51Q3rXgJOaqvFNkecQxy+m+v/mR0I2WlJx+bmc1pyw1K6sRTIOJQJZv3jHRNumJyBJe6M8iO/UEKDp7TUCyKQ7vhwj6Sk35H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CENAb40Z; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750407749; x=1781943749;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H5xdLvsboeL7dlRK+EBFcm4+UCVw3/qL8XO1zqk3X1c=;
  b=CENAb40ZBEaUZIhqU6V1YsgjvgduJQmkZIWYE95JM5ouJiDkHRBLSqtP
   kYKMbbH5uYBqFUz1DNeeedw+gy160RAstP9vDibjZcnBdAu6vrDtVUThz
   nnv6GTugYKTIYS02YjlXD4GBwfqM0nv0gZD1txSBbH3SoevicaGNUJeUV
   hCBDspte4G8n2YhJFsnhJOKqoscDKD5N88v3IToVXCSjnN6jCc0hx5lBk
   x+3blkgwBC/Sp4QxTKXxE6L201kpDzrlzXgY88p8a0G4tzee9K8qPP2m0
   sSjb1OcQv92EKcc+unWAsJEvZ8jq2NsSG26voF5i3cz3/Sv3CaouiUp+C
   Q==;
X-CSE-ConnectionGUID: Sthr3gJfQlCD5ywHH/OnFg==
X-CSE-MsgGUID: 51UFuVBARNOanIS9Cr5FTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52752103"
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="52752103"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 01:22:28 -0700
X-CSE-ConnectionGUID: lCc1D+E/SoWU5sVJ0FxjrA==
X-CSE-MsgGUID: 0EqHp+/xSrCciscrR+1Vbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,251,1744095600"; 
   d="scan'208";a="150990090"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO mdjait-mobl) ([10.245.245.66])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 01:22:22 -0700
Date: Fri, 20 Jun 2025 10:22:14 +0200
From: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Michael Riesch <michael.riesch@collabora.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Gerald Loacker <gerald.loacker@wolfvision.net>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Markus Elfring <Markus.Elfring@web.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Kever Yang <kever.yang@rock-chips.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Collabora Kernel Team <kernel@collabora.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alexander Shiyan <eagle.alexander923@gmail.com>, Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	Mehdi Djait <mehdi.djait@bootlin.com>
Subject: Re: [PATCH v8 06/13] media: rockchip: add a driver for the rockchip
 camera interface
Message-ID: <xgycmti27be4ah64o4mflj6i2nzh34tbnlfqghiizqhtkusuif@ia3idwgrjoil>
References: <20240220-rk3568-vicap-v8-0-9d9cbc4b524d@collabora.com>
 <20240220-rk3568-vicap-v8-6-9d9cbc4b524d@collabora.com>
 <656zxutvwytnd5i5l3nknni47r3wofmmwtxycleekjtrkbgfeo@xm7xbzirh3ce>
 <5d3418a3-70f5-46d8-a538-72e6958d5d02@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d3418a3-70f5-46d8-a538-72e6958d5d02@collabora.com>

Hi Michael,

On Wed, Jun 18, 2025 at 02:21:51PM +0200, Michael Riesch wrote:
> Hi Mehdi,
> 
> On 6/13/25 14:33, Mehdi Djait wrote:
> > Hi Michael,
> > 
> > [...]
> 
> Let's cut the long story short, shall we :-)
> 

Yes, sorry for that :)

> >> +static void rkcif_stream_fill_format(struct rkcif_stream *stream,
> >> +				     struct v4l2_pix_format_mplane *pix)
> >> +{
> >> +	const struct rkcif_output_fmt *fmt;
> >> +	u32 height, width;
> >> +
> >> +	fmt = rkcif_stream_find_output_fmt(stream, true, pix->pixelformat);
> >> +	height = clamp_t(u32, pix->height, CIF_MIN_HEIGHT, CIF_MAX_HEIGHT);
> >> +	width = clamp_t(u32, pix->width, CIF_MIN_WIDTH, CIF_MAX_WIDTH);
> >> +	v4l2_fill_pixfmt_mp(pix, fmt->fourcc, width, height);
> > 
> > The rkcif supports the SRGGB10P: the packed version of the SRGGB10.
> > 
> > When you try to capture with SRGGB10P, the following fails in
> > v4l2_fill_pixfmt_mp()
> > 
> > 	info = v4l2_format_info(pixelformat);
> > 	if (!info)
> > 		return -EINVAL;
> > 
> > The return value is not checked in rkcif_stream_fill_format() resulting
> > in a call to queue_setup returning with sizes[0] = 0
> 
> Thanks for pointing that out. I failed to realize that this helper
> function may return an error. What I can do is to implement the error
> propagation correctly. Of course this will only avoid the kernel
> warning, you still won't be able to stream.
> 
> > This will cause a kernel Warning in the vb2_core_reqbufs() because
> > plane_size = 0
> > 
> > Exactly here:
> > 
> > 	for (i = 0; i < num_planes; i++)
> > 		if (WARN_ON(!plane_sizes[i])) {
> > 			ret = -EINVAL;
> > 			goto error;
> > 		}
> > 
> > I still don't have the solution here but wanted to let you know about
> > it.
> 
> I only had a quick look at it, but apparently the compact formats are
> missing in the format list here:
> https://elixir.bootlin.com/linux/v6.16-rc2/source/drivers/media/v4l2-core/v4l2-common.c#L244
> for whatever reason.
> 
> Have you by chance tried adding a line like
> {
> 	.format = V4L2_PIX_FMT_SRGGB10P,
> 	.pixel_enc = V4L2_PIXEL_ENC_BAYER,
> 	.mem_planes = 1,
> 	.comp_planes = 1,
> 	.bpp = { 5, 0, 0, 0 },
> 	.bpp_div = { 4, 1, 1, 1 },
> 	.hdiv = 1,
> 	.vdiv = 1,
> }
> ?
> 
> 
> Maybe we can fix this, but please note that this issue should not block
> merging this patch series.
> 

Of course! The solution from the driver side is to check the return
code.

I will investigate the issue with v4l2_fill_pixfmt_mp() separately.

> Best regards,
> Michael

--
Kind Regards
Mehdi Djait

