Return-Path: <linux-media+bounces-20672-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA8F9B8D72
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:10:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC4171C20DFB
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A631C158536;
	Fri,  1 Nov 2024 09:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="brpp5Ntm"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D989F3FF1;
	Fri,  1 Nov 2024 09:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730452203; cv=none; b=VK37Ukw5aTZWZ+TC/ddmnVEsu4DRuSHxIqjQZXnJeLnb9Nk4jxczNySiqog6B0VjB7rpxJHnCEsMIGVQLiAhUdGqpWiasRHoay+/UqpeGFL49RsM5c5XWkfXCHqipy2uwXjwFiHYQCU07MmVnTc1K2J+U0NuSVCl4dwyUzjb7SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730452203; c=relaxed/simple;
	bh=Hw2bsGqYFkX3pVT7OM445mjV0EuJxqxC/fYe9DfHaXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJqM0rV7v2hoK/hppMqLZXjr/IQ/21GZXdK2nNV+TeRY1NTHOAUp1dz4DAxwd81rVuy0Mr6FI4jusJrpyOIvuuJJzy/UUAwmxJKBIHi2Zj2qI0igfAe8cN96AnFMKfuxOb2/zH/nzNL3vKKU5K+yIkP/TNxWHN4l88RuYOPOifQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=brpp5Ntm; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730452201; x=1761988201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Hw2bsGqYFkX3pVT7OM445mjV0EuJxqxC/fYe9DfHaXE=;
  b=brpp5NtmJNusxq2p8ue2ARmrZ2r+9sF5nnpKv9YWjya4vSYKEEzAlito
   VrIEYU4amtbHOKlcB4ruT9XLjAfJctzKgkYPLQCCzwdpN2NneUtRxs076
   pRcjv0578AiRRxxJkbcFphlIA/DuT3cJmf2G9IrJ8b56sdnEvZoiugR/R
   UuGO4JnyukgR1c6EwPbApZd/GB+7irfNQAgKByodgQjyTU/d438tfEGKM
   mMvNZId+DUr2GmnlCMOQd/zUw5rLLXPaa80Yc1MFSnBJ+V/PyejPtWowG
   AE8GtEwjCSeUCweJPlI8sR7Fv9J+2kzRb9vkunBjJg9aoXsmy0QdgRrZs
   A==;
X-CSE-ConnectionGUID: Co0QrgqRQf+DMYJY3yD7pQ==
X-CSE-MsgGUID: nrY1L/EUSyOSd+S/MCp9IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30171408"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30171408"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 02:09:59 -0700
X-CSE-ConnectionGUID: YUd8flrVTKKWi6gQVv6b5g==
X-CSE-MsgGUID: MLNdPsS4RgOEr0m9sMJhmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="83248006"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 02:09:57 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 7ADE211FA28;
	Fri,  1 Nov 2024 11:09:54 +0200 (EET)
Date: Fri, 1 Nov 2024 09:09:54 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda Delgado <ribalda@kernel.org>
Cc: git@apitzsch.eu, Mauro Carvalho Chehab <mchehab@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH v2 01/13] media: i2c: imx214: Fix link frequency
Message-ID: <ZySa4gBDjJS7q-yI@kekkonen.localdomain>
References: <20241021-imx214-v2-0-fbd23e99541e@apitzsch.eu>
 <20241021-imx214-v2-1-fbd23e99541e@apitzsch.eu>
 <CAPybu_0o+csbkyS7bbMUjB+VSUwj2DK_STy=wubCT_frH0DzgA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPybu_0o+csbkyS7bbMUjB+VSUwj2DK_STy=wubCT_frH0DzgA@mail.gmail.com>

Hi Ricardo, André,

On Wed, Oct 30, 2024 at 12:25:25PM +0100, Ricardo Ribalda Delgado wrote:
> Hi Andre
> 
> On Mon, Oct 21, 2024 at 12:14 AM André Apitzsch via B4 Relay
> <devnull+git.apitzsch.eu@kernel.org> wrote:
> >
> > From: André Apitzsch <git@apitzsch.eu>
> >
> > The driver defines IMX214_DEFAULT_LINK_FREQ 480000000, and then
> > IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10),
> > which works out as 384MPix/s. (The 8 is 4 lanes and DDR.)
> >
> > Parsing the PLL registers with the defined 24MHz input. We're in single
> > PLL mode, so MIPI frequency is directly linked to pixel rate.  VTCK ends
> > up being 1200MHz, and VTPXCK and OPPXCK both are 120MHz.  Section 5.3
> > "Frame rate calculation formula" says "Pixel rate
> > [pixels/s] = VTPXCK [MHz] * 4", so 120 * 4 = 480MPix/s, which basically
> > agrees with my number above.
> >
> > 3.1.4. MIPI global timing setting says "Output bitrate = OPPXCK * reg
> > 0x113[7:0]", so 120MHz * 10, or 1200Mbit/s. That would be a link
> > frequency of 600MHz due to DDR.
> > That also matches to 480MPix/s * 10bpp / 4 lanes / 2 for DDR.
> >
> I think your calculations are correct and the value should be 600M...
> but if we land this change, there will be boards that will stop
> working until they update their dts.
> Not sure if we allow that.
> 
> Can we move this change to the last one of the series and add something like:
> 
> diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> index 2aca3d88a0a7..8b4ded4cb5ce 100644
> --- a/drivers/media/i2c/imx214.c
> +++ b/drivers/media/i2c/imx214.c
> @@ -1281,13 +1281,9 @@ static int imx214_parse_fwnode(struct device
> *dev, struct imx214 *imx214)
>                 if (bus_cfg.link_frequencies[i] == IMX214_DEFAULT_LINK_FREQ)
>                         break;
> 
> -       if (i == bus_cfg.nr_of_link_frequencies) {
> -               dev_err_probe(dev, -EINVAL,
> -                             "link-frequencies %d not supported,
> Please review your DT\n",
> +       if (i == bus_cfg.nr_of_link_frequencies)
> +               dev_warn(dev, "link-frequencies %d not supported,
> Please review your DT. Continuing anyway\n",
>                               IMX214_DEFAULT_LINK_FREQ);

I'd also add a check it's the frequency supported by the driver previously,
not any frequency. There will be problems if 480 MHz will be actually
supported in the future.

> -               ret = -EINVAL;
> -               goto done;
> -       }
> 
> 
> 
> > Signed-off-by: André Apitzsch <git@apitzsch.eu>
> > ---
> >  drivers/media/i2c/imx214.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/i2c/imx214.c b/drivers/media/i2c/imx214.c
> > index 4962cfe7c83d62425aeccb46a400fa93146f14ea..5d411452d342fdb177619cd1c9fd9650d31089bb 100644
> > --- a/drivers/media/i2c/imx214.c
> > +++ b/drivers/media/i2c/imx214.c
> > @@ -24,7 +24,7 @@
> >  #define IMX214_MODE_STREAMING          0x01
> >
> >  #define IMX214_DEFAULT_CLK_FREQ        24000000
> > -#define IMX214_DEFAULT_LINK_FREQ 480000000
> > +#define IMX214_DEFAULT_LINK_FREQ 600000000
> >  #define IMX214_DEFAULT_PIXEL_RATE ((IMX214_DEFAULT_LINK_FREQ * 8LL) / 10)
> >  #define IMX214_FPS 30
> >  #define IMX214_MBUS_CODE MEDIA_BUS_FMT_SRGGB10_1X10
> >

-- 
Kind regards,

Sakari Ailus

