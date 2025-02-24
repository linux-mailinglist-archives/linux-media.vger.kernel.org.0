Return-Path: <linux-media+bounces-26787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 167F4A419E0
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 10:59:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5C5BE7A6A0C
	for <lists+linux-media@lfdr.de>; Mon, 24 Feb 2025 09:57:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2FE224A072;
	Mon, 24 Feb 2025 09:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Raj5U/BX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 515D724A054;
	Mon, 24 Feb 2025 09:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740391018; cv=none; b=HhO06yA4WgJS5Fm6Z1FqRWrp/i2h6onx8Iwf6Qt3FnT+AQ8DX+cvhEqk47+vxAVTzHusCwwrayRlbiCtMgQezxeANbggtnbzTg5McI7670Ts5vkk8kDCXdnR79AAB/iOrs80xn7dMZo7EMak15u5dVg6U5sYciMwLE3NIaEc0mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740391018; c=relaxed/simple;
	bh=xwohPzXd4yqGNjSvLoT9+yYEf4t+0T+XAQhwGT3nHeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XN4IGs/9Igkoq/JeEupTRv9dJdqXEHjwA99EiNdApaomMU5srdp0n0CR98roqM3BmrGcNEJxiraXWzr43sPAgvbYUfLynm4vEXqU6sMMT23jmE1hw2mvwKiZ4WbSpkBx22wmT680Wgptfou+S/e/0eAvki0cWjDMmCmp0aEH1wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Raj5U/BX; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740391016; x=1771927016;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xwohPzXd4yqGNjSvLoT9+yYEf4t+0T+XAQhwGT3nHeQ=;
  b=Raj5U/BX3TRFMzOPPZMw794qLPewNpDlyQftR1zPSikzmQ56tV9CNAX7
   GLYew+uXvvn4DEua6ryIAEarw27mM5kgLsLsfC6Q9f829EaGssxMc+jq/
   2THhjG1r9cEDoUVQrFFXgQIDVvrO9CTgOqssfYqJTMsiDzrjwlzU/ZwMs
   AnPlmykKL2fkp4EgrwA6ADsdbUU7BW3lZCqp7CFpbMTUDaDfGZ4CS/WSO
   K3R1xIPA8iiT8QUzeKeFjbIFURvvEHSOxRh9BTTVmAPbFbFLXQXQbhYeC
   i4LL14CevAN2QtVkLKG6rUXxDgwwXPSlhjZPbypoPY9W/6Xa/exdqdoRp
   g==;
X-CSE-ConnectionGUID: Ozh30atfT5CW6f6RhFLPKA==
X-CSE-MsgGUID: ZYskxy36Q5C+rXmKlowrGQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="63607847"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="63607847"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 01:56:56 -0800
X-CSE-ConnectionGUID: rcQpvz3MT8+FuZTtjkZSkQ==
X-CSE-MsgGUID: LwzbxJGeTSm0AjYVpGmCmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="146866486"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2025 01:56:54 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 3049D11F944;
	Mon, 24 Feb 2025 11:56:51 +0200 (EET)
Date: Mon, 24 Feb 2025 09:56:51 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Shravan.Chippa@microchip.com
Cc: mchehab@kernel.org, kieran.bingham@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com,
	Praveen.Kumar@microchip.com
Subject: Re: [PATCH V4] media: i2c: imx334: Add support for 1280x720 &
 640x480 resolutions
Message-ID: <Z7xCY2c8AvdgFNfm@kekkonen.localdomain>
References: <20250218093356.3608409-1-shravan.chippa@microchip.com>
 <Z7cr8x6i8NZbdjIQ@kekkonen.localdomain>
 <PH0PR11MB5611074F959638A90A7160E381C02@PH0PR11MB5611.namprd11.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PH0PR11MB5611074F959638A90A7160E381C02@PH0PR11MB5611.namprd11.prod.outlook.com>

Hi Shravan,

On Mon, Feb 24, 2025 at 07:37:23AM +0000, Shravan.Chippa@microchip.com wrote:
> 
> 
> > -----Original Message-----
> > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Sent: Thursday, February 20, 2025 6:50 PM
> > To: shravan Chippa - I35088 <Shravan.Chippa@microchip.com>
> > Cc: mchehab@kernel.org; kieran.bingham@ideasonboard.com; linux-
> > media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley -
> > M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > I30718 <Praveen.Kumar@microchip.com>
> > Subject: Re: [PATCH V4] media: i2c: imx334: Add support for 1280x720 &
> > 640x480 resolutions
> > 
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > content is safe
> > 
> > Hi Shravan,
> > 
> > On Tue, Feb 18, 2025 at 03:03:56PM +0530, shravan kumar wrote:
> > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > >
> > > Added support for 1280x720@30 and 640x480@30 resolutions and
> > optimized
> > > the resolution arrays by incorporating a common register array.
> > >
> > > Updated the register array values for 1920x1080@30 and 3840x2160@30
> > > resolutions in accordance with the common register array values.
> > >
> > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > >
> > > ---
> > > changelog:
> > > v3 -> v4
> > > In response to the review request, the dependency of the common
> > > register value array on the 445M link frequency has been eliminated.
> > >
> > > Although I do not have a test setup for 4k resolution at an 819M link
> > > frequency, I have made adjustments based on the IMX334 data sheet, the
> > > latest 4k resolution, and the common register value array.
> > >
> > > Additionally, the 4k resolution has been switched to master mode to
> > > ensure consistency with other resolutions that also use master mode.
> > >
> > > changelog:
> > > v2 -> v3
> > > removied blank lines reported by media CI robot
> > >
> > > v1 -> v2
> > > Optimized the resolution arrays by added common register array
> > > ---
> > >
> > >  drivers/media/i2c/imx334.c | 214
> > > +++++++++++++++++++------------------
> > >  1 file changed, 109 insertions(+), 105 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > index a544fc3df39c..0172406780df 100644
> > > --- a/drivers/media/i2c/imx334.c
> > > +++ b/drivers/media/i2c/imx334.c
> > > @@ -167,8 +167,8 @@ static const s64 link_freq[] = {
> > >       IMX334_LINK_FREQ_445M,
> > >  };
> > >
> > > -/* Sensor mode registers for 1920x1080@30fps */ -static const struct
> > > imx334_reg mode_1920x1080_regs[] = {
> > > +/* Sensor common mode registers values */ static const struct
> > > +imx334_reg common_mode_regs[] = {
> > >       {0x3000, 0x01},
> > >       {0x3018, 0x04},
> > >       {0x3030, 0xca},
> > > @@ -176,26 +176,10 @@ static const struct imx334_reg
> > mode_1920x1080_regs[] = {
> > >       {0x3032, 0x00},
> > >       {0x3034, 0x4c},
> > >       {0x3035, 0x04},
> > > -     {0x302c, 0xf0},
> > > -     {0x302d, 0x03},
> > > -     {0x302e, 0x80},
> > > -     {0x302f, 0x07},
> > > -     {0x3074, 0xcc},
> > > -     {0x3075, 0x02},
> > > -     {0x308e, 0xcd},
> > > -     {0x308f, 0x02},
> > > -     {0x3076, 0x38},
> > > -     {0x3077, 0x04},
> > > -     {0x3090, 0x38},
> > > -     {0x3091, 0x04},
> > > -     {0x3308, 0x38},
> > > -     {0x3309, 0x04},
> > > -     {0x30C6, 0x00},
> > > +     {0x30c6, 0x00},
> > >       {0x30c7, 0x00},
> > >       {0x30ce, 0x00},
> > >       {0x30cf, 0x00},
> > > -     {0x30d8, 0x18},
> > > -     {0x30d9, 0x0a},
> > >       {0x304c, 0x00},
> > >       {0x304e, 0x00},
> > >       {0x304f, 0x00},
> > > @@ -210,7 +194,7 @@ static const struct imx334_reg
> > mode_1920x1080_regs[] = {
> > >       {0x300d, 0x29},
> > >       {0x314c, 0x29},
> > >       {0x314d, 0x01},
> > > -     {0x315a, 0x06},
> > > +     {0x315a, 0x0a},
> > 
> > What's the effect of this change and why is it done?
> 
> This change is to increase the horizontal blanking to get more time to process the image line by line.

That needs to be accompanied by similar changes to the horizontal blanking
control. What actually needs this?

Then the question is whether this should be user configurable. The current
users may well prefer keeping this as-is.

> 
> 
> > 
> > >       {0x3168, 0xa0},
> > >       {0x316a, 0x7e},
> > >       {0x319e, 0x02},
> > > @@ -330,116 +314,103 @@ static const struct imx334_reg
> > mode_1920x1080_regs[] = {
> > >       {0x3002, 0x00},
> > >  };
> > >
> > > +/* Sensor mode registers for 640x480@30fps */ static const struct
> > > +imx334_reg mode_640x480_regs[] = {
> > > +     {0x302c, 0x70},
> > > +     {0x302d, 0x06},
> > > +     {0x302e, 0x80},
> > > +     {0x302f, 0x02},
> > > +     {0x3074, 0x48},
> > > +     {0x3075, 0x07},
> > > +     {0x308e, 0x49},
> > > +     {0x308f, 0x07},
> > > +     {0x3076, 0xe0},
> > > +     {0x3077, 0x01},
> > > +     {0x3090, 0xe0},
> > > +     {0x3091, 0x01},
> > > +     {0x3308, 0xe0},
> > > +     {0x3309, 0x01},
> > > +     {0x30d8, 0x30},
> > > +     {0x30d9, 0x0b},
> > > +};
> > > +
> > > +/* Sensor mode registers for 1280x720@30fps */ static const struct
> > > +imx334_reg mode_1280x720_regs[] = {
> > > +     {0x302c, 0x30},
> > > +     {0x302d, 0x05},
> > > +     {0x302e, 0x00},
> > > +     {0x302f, 0x05},
> > > +     {0x3074, 0x84},
> > > +     {0x3075, 0x03},
> > > +     {0x308e, 0x85},
> > > +     {0x308f, 0x03},
> > > +     {0x3076, 0xd0},
> > > +     {0x3077, 0x02},
> > > +     {0x3090, 0xd0},
> > > +     {0x3091, 0x02},
> > > +     {0x3308, 0xd0},
> > > +     {0x3309, 0x02},
> > > +     {0x30d8, 0x30},
> > > +     {0x30d9, 0x0b},
> > > +};
> > > +
> > > +/* Sensor mode registers for 1920x1080@30fps */ static const struct
> > > +imx334_reg mode_1920x1080_regs[] = {
> > > +     {0x302c, 0xf0},
> > > +     {0x302d, 0x03},
> > > +     {0x302e, 0x80},
> > > +     {0x302f, 0x07},
> > > +     {0x3074, 0xcc},
> > > +     {0x3075, 0x02},
> > > +     {0x308e, 0xcd},
> > > +     {0x308f, 0x02},
> > > +     {0x3076, 0x38},
> > > +     {0x3077, 0x04},
> > > +     {0x3090, 0x38},
> > > +     {0x3091, 0x04},
> > > +     {0x3308, 0x38},
> > > +     {0x3309, 0x04},
> > > +     {0x30d8, 0x18},
> > > +     {0x30d9, 0x0a},
> > > +};
> > > +
> > >  /* Sensor mode registers for 3840x2160@30fps */  static const struct
> > > imx334_reg mode_3840x2160_regs[] = {
> > > -     {0x3000, 0x01},
> > > -     {0x3002, 0x00},
> > > -     {0x3018, 0x04},
> > > -     {0x37b0, 0x36},
> > > -     {0x304c, 0x00},
> > > -     {0x300c, 0x3b},
> > 
> > This was the only location this register was written to.
> 
> This register value is same for all link frequencies (default value 0x3b for 24Mhz crystal clock), 

Please do this in a separate patch.

> 
> > 
> > Please split this into two to make it more reviewable: splitting register lists
> > into two and then to adding new modes.
> 
> I will try to make one patch for common register values
> One more patch for new modes of 640x480 and 1280x720

Please add one for the hblank changes and more if there are similar cases.

> 
> Thanks,
> Shravan
> 
> > 
> > > -     {0x300d, 0x2a},
> > > -     {0x3034, 0x26},
> > > -     {0x3035, 0x02},
> > > -     {0x314c, 0x29},
> > > -     {0x314d, 0x01},
> > > -     {0x315a, 0x02},
> > > -     {0x3168, 0xa0},
> > > -     {0x316a, 0x7e},
> > > -     {0x3288, 0x21},
> > > -     {0x328a, 0x02},
> > >       {0x302c, 0x3c},
> > >       {0x302d, 0x00},
> > >       {0x302e, 0x00},
> > >       {0x302f, 0x0f},
> > > +     {0x3074, 0xb0},
> > > +     {0x3075, 0x00},
> > > +     {0x308e, 0xb1},
> > > +     {0x308f, 0x00},
> > >       {0x3076, 0x70},
> > >       {0x3077, 0x08},
> > >       {0x3090, 0x70},
> > >       {0x3091, 0x08},
> > > -     {0x30d8, 0x20},
> > > -     {0x30d9, 0x12},
> > >       {0x3308, 0x70},
> > >       {0x3309, 0x08},
> > > -     {0x3414, 0x05},
> > > -     {0x3416, 0x18},
> > > -     {0x35ac, 0x0e},
> > > -     {0x3648, 0x01},
> > > -     {0x364a, 0x04},
> > > -     {0x364c, 0x04},
> > > -     {0x3678, 0x01},
> > > -     {0x367c, 0x31},
> > > -     {0x367e, 0x31},
> > > -     {0x3708, 0x02},
> > > -     {0x3714, 0x01},
> > > -     {0x3715, 0x02},
> > > -     {0x3716, 0x02},
> > > -     {0x3717, 0x02},
> > > -     {0x371c, 0x3d},
> > > -     {0x371d, 0x3f},
> > > -     {0x372c, 0x00},
> > > -     {0x372d, 0x00},
> > > -     {0x372e, 0x46},
> > > -     {0x372f, 0x00},
> > > -     {0x3730, 0x89},
> > > -     {0x3731, 0x00},
> > > -     {0x3732, 0x08},
> > > -     {0x3733, 0x01},
> > > -     {0x3734, 0xfe},
> > > -     {0x3735, 0x05},
> > > -     {0x375d, 0x00},
> > > -     {0x375e, 0x00},
> > > -     {0x375f, 0x61},
> > > -     {0x3760, 0x06},
> > > -     {0x3768, 0x1b},
> > > -     {0x3769, 0x1b},
> > > -     {0x376a, 0x1a},
> > > -     {0x376b, 0x19},
> > > -     {0x376c, 0x18},
> > > -     {0x376d, 0x14},
> > > -     {0x376e, 0x0f},
> > > -     {0x3776, 0x00},
> > > -     {0x3777, 0x00},
> > > -     {0x3778, 0x46},
> > > -     {0x3779, 0x00},
> > > -     {0x377a, 0x08},
> > > -     {0x377b, 0x01},
> > > -     {0x377c, 0x45},
> > > -     {0x377d, 0x01},
> > > -     {0x377e, 0x23},
> > > -     {0x377f, 0x02},
> > > -     {0x3780, 0xd9},
> > > -     {0x3781, 0x03},
> > > -     {0x3782, 0xf5},
> > > -     {0x3783, 0x06},
> > > -     {0x3784, 0xa5},
> > > -     {0x3788, 0x0f},
> > > -     {0x378a, 0xd9},
> > > -     {0x378b, 0x03},
> > > -     {0x378c, 0xeb},
> > > -     {0x378d, 0x05},
> > > -     {0x378e, 0x87},
> > > -     {0x378f, 0x06},
> > > -     {0x3790, 0xf5},
> > > -     {0x3792, 0x43},
> > > -     {0x3794, 0x7a},
> > > -     {0x3796, 0xa1},
> > > -     {0x3e04, 0x0e},
> > > +     {0x30d8, 0x20},
> > > +     {0x30d9, 0x12},
> > >       {0x319e, 0x00},
> > >       {0x3a00, 0x01},
> > >       {0x3a18, 0xbf},
> > > -     {0x3a19, 0x00},
> > >       {0x3a1a, 0x67},
> > > -     {0x3a1b, 0x00},
> > >       {0x3a1c, 0x6f},
> > > -     {0x3a1d, 0x00},
> > >       {0x3a1e, 0xd7},
> > >       {0x3a1f, 0x01},
> > > +     {0x300d, 0x2a},
> > > +     {0x3034, 0x26},
> > > +     {0x3035, 0x02},
> > > +     {0x315a, 0x02},
> > >       {0x3a20, 0x6f},
> > >       {0x3a21, 0x00},
> > >       {0x3a22, 0xcf},
> > >       {0x3a23, 0x00},
> > >       {0x3a24, 0x6f},
> > >       {0x3a25, 0x00},
> > > +     {0x3a24, 0x6f},
> > > +     {0x3a25, 0x00},
> > >       {0x3a26, 0xb7},
> > >       {0x3a27, 0x00},
> > >       {0x3a28, 0x5f},
> > > @@ -505,6 +476,32 @@ static const struct imx334_mode
> > supported_modes[] = {
> > >                       .num_of_regs = ARRAY_SIZE(mode_1920x1080_regs),
> > >                       .regs = mode_1920x1080_regs,
> > >               },
> > > +     }, {
> > > +             .width = 1280,
> > > +             .height = 720,
> > > +             .hblank = 2480,
> > > +             .vblank = 1170,
> > > +             .vblank_min = 45,
> > > +             .vblank_max = 132840,
> > > +             .pclk = 297000000,
> > > +             .link_freq_idx = 1,
> > > +             .reg_list = {
> > > +                     .num_of_regs = ARRAY_SIZE(mode_1280x720_regs),
> > > +                     .regs = mode_1280x720_regs,
> > > +             },
> > > +     }, {
> > > +             .width = 640,
> > > +             .height = 480,
> > > +             .hblank = 2480,
> > > +             .vblank = 1170,
> > > +             .vblank_min = 45,
> > > +             .vblank_max = 132840,
> > > +             .pclk = 297000000,
> > > +             .link_freq_idx = 1,
> > > +             .reg_list = {
> > > +                     .num_of_regs = ARRAY_SIZE(mode_640x480_regs),
> > > +                     .regs = mode_640x480_regs,
> > > +             },
> > >       },
> > >  };
> > >
> > > @@ -989,6 +986,13 @@ static int imx334_start_streaming(struct imx334
> > *imx334)
> > >       const struct imx334_reg_list *reg_list;
> > >       int ret;
> > >
> > > +     ret = imx334_write_regs(imx334, common_mode_regs,
> > > +                             ARRAY_SIZE(common_mode_regs));
> > > +     if (ret) {
> > > +             dev_err(imx334->dev, "fail to write common registers");
> > > +             return ret;
> > > +     }
> > > +
> > >       /* Write sensor mode registers */
> > >       reg_list = &imx334->cur_mode->reg_list;
> > >       ret = imx334_write_regs(imx334, reg_list->regs,
> > 

-- 
Kind regards,

Sakari Ailus

