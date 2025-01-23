Return-Path: <linux-media+bounces-25189-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB28A19F92
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 09:09:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C810188DBEE
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 08:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220CD20B80D;
	Thu, 23 Jan 2025 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MH034I63"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644BA1CAA64;
	Thu, 23 Jan 2025 08:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737619764; cv=none; b=t4wyj19ENDrc6bBtYT7bnduKm/Ij1K42UZc5Dhx/swHTuhNiRiqVmcIrdIQtvTiBVmzBBRa3/jomzDKrpdNR6rUMs1GgUBVPZ/adOiINlwjoEZ5m/SluN9R13NGRGGobPRmuP0efsIE79HDMIvCDjnCMA21QLuZDs2PqZLoIhzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737619764; c=relaxed/simple;
	bh=E8uc9cubPvyKKpXZjIkZIM7c0nUu03Cdqk8uIjs0gnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G1Gel9DO8UYb7pyZuXimyYrPKl4AC0qh2dULE/sZeKFXsxwwBKJXFAr8kXSivuKkiVTXoXKjg+K0KHgcjfPJmzpUUSm6z+5syQn6jiis54j6C81b/MssHETn5mzGjYqZ2ZZokV+mYlQE1m0jXkn1B19g+MK/bKtKGPimxXei20w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MH034I63; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737619763; x=1769155763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E8uc9cubPvyKKpXZjIkZIM7c0nUu03Cdqk8uIjs0gnE=;
  b=MH034I63zc2fStCM1jZXjiINnKB9nn7b0dTbbFs47800pM+qmNRjk3mW
   G45/dIsXw+/R3Fnczp87lVj8+Pj/4Wiqdn/3C6LCk3HSVQdugkjvstL+k
   Ex8b7uDtx7bnOXTayCWh4pb8GBDqdwQ57UsDG505DZQkgY7fSTOeRuAJY
   wUcdGnuPYtqRDkutc3ROiiP9252c7huleasIaOOWmJHFwj1h0axMjvScP
   FgWqgdRafk/B7Qu1eMpXBzYPteZQB8JrKwYqFa5d93JMq3zoYIBdt5jpY
   9U3+KIPEAibbT+0EUE6FBk41l1l5h9TO1YcOh6XKrYUIgXFmin75rbwGC
   Q==;
X-CSE-ConnectionGUID: upDboKHzThqS1t8sm9hLNQ==
X-CSE-MsgGUID: 0xy3WTDKRtqqpB4OZn1AQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="38357184"
X-IronPort-AV: E=Sophos;i="6.13,227,1732608000"; 
   d="scan'208";a="38357184"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 00:09:22 -0800
X-CSE-ConnectionGUID: rEym0YpYRvaFN/i1svcrag==
X-CSE-MsgGUID: z6vESQJ2Qbi+ov2+kSfxag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112035774"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 00:09:20 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7082011F95E;
	Thu, 23 Jan 2025 10:09:17 +0200 (EET)
Date: Thu, 23 Jan 2025 08:09:17 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peyton Howe <peyton.howe@bellsouth.net>
Subject: Re: [PATCH] media: imx219: Adjust PLL settings based on the number
 of MIPI lanes
Message-ID: <Z5H5Lf0YZlkxI1n4@kekkonen.localdomain>
References: <20250120-media-imx219-4lane-v1-1-c7aa1a413ddc@raspberrypi.com>
 <Z5DeJ_-VWnE7vO8m@kekkonen.localdomain>
 <CAPY8ntDz7hxgBr1oeY9ccPJgxktm-kkTL93EM3XXp8kEOvqZ9A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntDz7hxgBr1oeY9ccPJgxktm-kkTL93EM3XXp8kEOvqZ9A@mail.gmail.com>

Hi Dave,

On Wed, Jan 22, 2025 at 04:24:10PM +0000, Dave Stevenson wrote:
> Hi Sakari
> 
> On Wed, 22 Jan 2025 at 12:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dave,
> >
> > On Mon, Jan 20, 2025 at 11:35:40AM +0000, Dave Stevenson wrote:
> > > Commit ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
> > > added support for device tree to allow configuration of the sensor to
> > > use 4 lanes with a link frequency of 363MHz, and amended the advertised
> > > pixel rate to 280.8MPix/s.
> > >
> > > However it didn't change any of the PLL settings, so actually it would
> > > have been running overclocked in the MIPI block, and with the frame
> > > rate and exposure calculations being wrong as the pixel rate was
> > > unchanged.
> > >
> > > The pixel rate and link frequency advertised were taken from the "Clock
> > > Setting Example" section of the datasheet. However those are based on an
> > > external clock of 12MHz, and are unachievable with a clock of 24MHz - it
> > > seems PREPLLCLK_VT_DIV and PREPLLCK_OP_DIV can ONLY be set via the
> > > automatic configuration documented in "9-1-2 EXCK_FREQ setting depend on
> > > INCK frequency", not by writing the registers.
> > > The closest we can get with a 24MHz clock is 281.6MPix/s and 364MHz.
> > >
> > > Dropping all support for the 363MHz link frequency would cause problems
> > > for existing users, so allow it, but log a warning that the requested
> > > value is being changed to the supported one.
> > >
> > > Fixes: ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
> > > Co-developed-by: Peyton Howe <peyton.howe@bellsouth.net>
> > > Signed-off-by: Peyton Howe <peyton.howe@bellsouth.net>
> > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > ---
> > > This was fed back to us by Peyton Howe as giving image corruption
> > > on a Raspberry Pi with DF Robot imx219 module, and confirmed with
> > > a Soho Enterprises module.
> > > Effectively the module was being overclocked and misbehaving.
> > >
> > > With this patch and the Soho Enterprises module no image corruption
> > > is observed, and the frame rates are spot on. I haven't checked
> > > exposure times, but those should follow frame rate as they are
> > > based on the same clock.
> > > ---
> > >  drivers/media/i2c/imx219.c | 78 ++++++++++++++++++++++++++++++++++++----------
> > >  1 file changed, 61 insertions(+), 17 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > index 2d54cea113e1..562b3eb0cb1e 100644
> > > --- a/drivers/media/i2c/imx219.c
> > > +++ b/drivers/media/i2c/imx219.c
> > > @@ -133,10 +133,11 @@
> > >
> > >  /* Pixel rate is fixed for all the modes */
> > >  #define IMX219_PIXEL_RATE            182400000
> > > -#define IMX219_PIXEL_RATE_4LANE              280800000
> > > +#define IMX219_PIXEL_RATE_4LANE              281600000
> > >
> > >  #define IMX219_DEFAULT_LINK_FREQ     456000000
> > > -#define IMX219_DEFAULT_LINK_FREQ_4LANE       363000000
> > > +#define IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED   363000000
> > > +#define IMX219_DEFAULT_LINK_FREQ_4LANE       364000000
> >
> > This shows again the ill effects of register list based drivers. :-(
> 
> Seeing as it was the PLL setup that was wrong, I believe the only
> drivers that may have avoided it are MT9P031, AR0521, and CCS assuming
> they compute all PLL settings correctly off an arbitrary pixel clock.

ov5640 does that, too, but it has a mode list.

> 
> Unfortunately I had no hardware to test the original patch adding 4
> lane support, and as the datasheet doesn't lay out the actual PLL
> configuration required for each option I hadn't twigged it was
> required. I would have hoped that the author of that patch would have
> noticed the frame rates were wrong, but things are never perfect.
> 
> And I assume that your comment means that we won't see Intel
> submitting any register list based drivers in future? I'll be quite
> happy not having to rework them due to only supporting a 19.2MHz clock
> :-)

I'd wish I could say I won't merge any new register list based drivers but
that would mean there would be very, very few new sensor drivers. :-(
Register list based are here to stay, I'm afraid.

> 
> > >
> > >  /* IMX219 native and active pixel array size. */
> > >  #define IMX219_NATIVE_WIDTH          3296U
> > > @@ -168,15 +169,6 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
> > >       { CCI_REG8(0x30eb), 0x05 },
> > >       { CCI_REG8(0x30eb), 0x09 },
> > >
> > > -     /* PLL Clock Table */
> > > -     { IMX219_REG_VTPXCK_DIV, 5 },
> > > -     { IMX219_REG_VTSYCK_DIV, 1 },
> > > -     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 = AUTO set */
> > > -     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 = AUTO set */
> > > -     { IMX219_REG_PLL_VT_MPY, 57 },
> > > -     { IMX219_REG_OPSYCK_DIV, 1 },
> > > -     { IMX219_REG_PLL_OP_MPY, 114 },
> > > -
> > >       /* Undocumented registers */
> > >       { CCI_REG8(0x455e), 0x00 },
> > >       { CCI_REG8(0x471e), 0x4b },
> > > @@ -201,6 +193,34 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
> > >       { IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(IMX219_XCLK_FREQ / 1000000) },
> > >  };
> > >
> > > +static const struct cci_reg_sequence imx219_2lane_regs[] = {
> > > +     /* PLL Clock Table */
> > > +     { IMX219_REG_VTPXCK_DIV, 5 },
> > > +     { IMX219_REG_VTSYCK_DIV, 1 },
> > > +     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 = AUTO set */
> > > +     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 = AUTO set */
> > > +     { IMX219_REG_PLL_VT_MPY, 57 },
> > > +     { IMX219_REG_OPSYCK_DIV, 1 },
> > > +     { IMX219_REG_PLL_OP_MPY, 114 },
> > > +
> > > +     /* 2-Lane CSI Mode */
> > > +     { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
> > > +};
> > > +
> > > +static const struct cci_reg_sequence imx219_4lane_regs[] = {
> > > +     /* PLL Clock Table */
> > > +     { IMX219_REG_VTPXCK_DIV, 5 },
> > > +     { IMX219_REG_VTSYCK_DIV, 1 },
> > > +     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 = AUTO set */
> > > +     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 = AUTO set */
> > > +     { IMX219_REG_PLL_VT_MPY, 88 },
> > > +     { IMX219_REG_OPSYCK_DIV, 1 },
> > > +     { IMX219_REG_PLL_OP_MPY, 91 },
> > > +
> > > +     /* 4-Lane CSI Mode */
> > > +     { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_4_LANE_MODE },
> > > +};
> > > +
> > >  static const s64 imx219_link_freq_menu[] = {
> > >       IMX219_DEFAULT_LINK_FREQ,
> > >  };
> > > @@ -662,9 +682,11 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> > >
> > >  static int imx219_configure_lanes(struct imx219 *imx219)
> > >  {
> > > -     return cci_write(imx219->regmap, IMX219_REG_CSI_LANE_MODE,
> > > -                      imx219->lanes == 2 ? IMX219_CSI_2_LANE_MODE :
> > > -                      IMX219_CSI_4_LANE_MODE, NULL);
> > > +     /* Write the appropriate PLL settings for the number of MIPI lanes */
> > > +     return cci_multi_reg_write(imx219->regmap,
> > > +                               imx219->lanes == 2 ? imx219_2lane_regs : imx219_4lane_regs,
> > > +                               imx219->lanes == 2 ? ARRAY_SIZE(imx219_2lane_regs) :
> > > +                               ARRAY_SIZE(imx219_4lane_regs), NULL);
> > >  };
> > >
> > >  static int imx219_start_streaming(struct imx219 *imx219,
> > > @@ -1036,6 +1058,7 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> > >               .bus_type = V4L2_MBUS_CSI2_DPHY
> > >       };
> > >       int ret = -EINVAL;
> > > +     bool link_frequency_valid = false;
> > >
> > >       endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> > >       if (!endpoint)
> > > @@ -1062,9 +1085,30 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> > >               goto error_out;
> > >       }
> > >
> > > -     if (ep_cfg.nr_of_link_frequencies != 1 ||
> > > -        (ep_cfg.link_frequencies[0] != ((imx219->lanes == 2) ?
> > > -         IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE))) {
> > > +     if (ep_cfg.nr_of_link_frequencies == 1) {
> > > +             switch (imx219->lanes) {
> > > +             case 2:
> > > +                     if (ep_cfg.link_frequencies[0] ==
> > > +                                             IMX219_DEFAULT_LINK_FREQ)
> > > +                             link_frequency_valid = true;
> > > +                     break;
> > > +             case 4:
> > > +                     if (ep_cfg.link_frequencies[0] ==
> > > +                                             IMX219_DEFAULT_LINK_FREQ_4LANE)
> > > +                             link_frequency_valid = true;
> > > +                     else if (ep_cfg.link_frequencies[0] ==
> > > +                                IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED) {
> > > +                             dev_warn(dev, "Link frequency of %d not supported, but has been incorrectly advertised previously\n",
> > > +                                      IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED);
> > > +                             dev_warn(dev, "Using link frequency of %d\n",
> > > +                                      IMX219_DEFAULT_LINK_FREQ_4LANE);
> >
> > Would it be helpful to use v4l2_link_freq_to_bitmap() here? The old
> > frequency requires separate handling but I guess you'll still want to
> > expose the correct frequency to the user space so it should be just one
> > condition.
> 
> I've done a quick prototype using it. I'm not sure it's any cleaner,
> and possibly ends up being more verbose.
> 
> As I see it, either you end up with a call to v4l2_link_freq_to_bitmap
> for each of the 2 and 4 lane cases (6 lines each due to the number of
> parameters), or you combine both 2 & 4 lane frequency options into one
> array and then handle that certain bit options are only valid for one
> or other option, and pass the right value in when calling
> v4l2_ctrl_new_int_menu(..., V4L2_CID_LINK_FREQ...).
> Handling the unsupported link frequency requires knowledge of the
> positions in the array, so either hard coded indices or needing an
> enum for each index.
> 
> I've pushed my quick patch to
> https://github.com/6by9/linux/tree/media_imx219_4lane.
> Personally I think it detracts from readability in this case, but I'm
> happy to switch to a cleaned up version of it if you view it as
> better.

I was thinking of separate frequency lists for all three cases. That way
you'd avoid almost all manual checks of the frequencies.

The question I'd also have is whether we should try to continue to indicate
the incorrect frequency or not. The values are not an integral part of the
ABI in my view as new ones can be added, even for the same board. And in
this case there's just a single one in any given case.

This information is also mainly used to configure the receiver timing and
wrong values here could lead to errors in reception.

IOW, I'd just show the correct value, independently of what's in firmware.

-- 
Kind regards,

Sakari Ailus

