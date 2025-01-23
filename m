Return-Path: <linux-media+bounces-25210-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEE4A1A6A8
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 16:07:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9FFB6188CA90
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 15:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E73BE212F8A;
	Thu, 23 Jan 2025 15:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="EXXlwj57"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31975212D7D
	for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 15:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737644711; cv=none; b=nsNcVD5ZvFPalIL89TkKChQsAjxcJbz5o32YV5lEV7eB0/Zl1+v8IDSKRByPLnSSLSkrf1boQH6ek1SY5oVu807nkhxoyfH/TZENQvSsquPCHATytwFsdPcmY69cFCAKy5QnlWxHrNPJPe2fUdQyLtKZpDdC9PFIwrmKDcf3ZAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737644711; c=relaxed/simple;
	bh=9A9oOeRM7u3jSfxHap+cKJ+hxXNglwVqUlQIH18MNKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tbnz+R4kbJFISJQC2l27fTwYgQfCbhTqnZbCee84/IOnhsMa2eVzoDSwvltIanXeB800KgZGjoRA03pW2IprC/3WKle8QUADy3Rwl4ZogxqpqUnNvQWLPxmWZvKQkXLFuR8xdNg/alxt0NazJd6BoCXGz2TAFJwgud18auhhYiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=EXXlwj57; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e549a71dd3dso1820738276.0
        for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 07:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737644708; x=1738249508; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jbTwRA5DNiclqECWmvp5V8qJCu+uSzUixbpRN72SN8o=;
        b=EXXlwj57VGWUXuB7CLOYiJFdto3I2UJbdHSXiQol5Ahhca8rTpBe2KeHaGjt1BEnUk
         aJx5Tmt/HO5hw/WBzvj8nub2ElrwhxELmeYR3g3HTeCxMlwSMuFv3EsHTRAolAnbdOOl
         WedVzj29Fayr/F0W8AQwlT24Xzq6YzZzG6JUdfz7Q20aH5epQorH0zLZ95Od7IHxBPFR
         mhiAPWnxl625d0mFC6t67U7Omffo6NWDpoxjlyS/XJCVbNbVKhrG27oNJ1iVcT0hTN/y
         eRBlJ0YJ/RL0VHiEjDpkYTNcjAIoNoPdtW98A9RBc4Wf49mZ/5ueVst91fhyttb1kHb1
         3znQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737644708; x=1738249508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jbTwRA5DNiclqECWmvp5V8qJCu+uSzUixbpRN72SN8o=;
        b=PRJ9gdxSBURy1RwS49VxK1DiOy+9tKgZr268UA3FOUJ2jG5xA/D/YgLZ3OkimXQCNV
         giErff1O379did66qhxWiFAvZo1KGZlYUgPVEa2pcbaj3UIQJLyvn8T3XTTUXzARA62D
         e+1bdq9jPHBWO0SvBGkCwVLTn3JzTVWXaqB0LSQbSR7DdSlIWdluV+kvq+jmmLw2TMOX
         m+qxT76pXeUt/jyNRIS+tRbTjSwXcXYFWLaNjKI5SiWWjEkVKvCXtWIS7GCtDlv4Cx+N
         CYI7rEY7iDd9ZBGNmwrU3Q7G6oF2rIegrDgeORpiOoqZNZWbZqwXk/HWnfnPay7BEiQX
         dEdw==
X-Forwarded-Encrypted: i=1; AJvYcCXgLrZhfiXQkU56lOgb8uLcgtJJc8lxPIxrhsUxBxvC5rA03FVTLkqmtiFN1svwEM+1hR/+nMSbA67wHw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyI72OZds1Opq41/mk0tlk8qLL9YTdq42ENecJIaGgltmekuull
	J3qeNq+cX0vxyihVMwB2IB5ELILNGR4SrygccE2o2EWHEpkeaFdiFF9DmcjTdE+g3JDQnb7Q93h
	D7rxhtkKkxGwcc92GgjTQYQmCZUo5ZAyx21dKuw==
X-Gm-Gg: ASbGncsJpkKk4ldgfCNWE5sjeKHr70kU3CwbMTpTtgCe13hKpqYo4Jmduulgj/zzx/e
	7nWULiv+50Cqvgl3wg6kMlNFH2yXYTAd1tH8By9H6tADI/dcIHcp3u7qU1JybXw==
X-Google-Smtp-Source: AGHT+IHSmGIiVVZkIMRTJQ9orIejgJ1hNYrkjRvYyZ9syfhLQ2i6e5jnwCHydKAjIh5s0ZH1cmM8ZjWI/9Jv7qYrxp4=
X-Received: by 2002:a05:6902:10c5:b0:e58:33ce:878b with SMTP id
 3f1490d57ef6-e5833ce887cmr927726276.19.1737644707828; Thu, 23 Jan 2025
 07:05:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-media-imx219-4lane-v1-1-c7aa1a413ddc@raspberrypi.com>
 <Z5DeJ_-VWnE7vO8m@kekkonen.localdomain> <CAPY8ntDz7hxgBr1oeY9ccPJgxktm-kkTL93EM3XXp8kEOvqZ9A@mail.gmail.com>
 <Z5H5Lf0YZlkxI1n4@kekkonen.localdomain>
In-Reply-To: <Z5H5Lf0YZlkxI1n4@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 23 Jan 2025 15:04:47 +0000
X-Gm-Features: AbW1kvYXYG2dcu0J4SHzBkXljxO7m8L_t9hvIabTKV7xuhG59Z3PLDIRgaHpj0o
Message-ID: <CAPY8ntDa4c_+rRxvjFGkLgm6LLYeeUPJd3_tgK_S+yPFqax1vw@mail.gmail.com>
Subject: Re: [PATCH] media: imx219: Adjust PLL settings based on the number of
 MIPI lanes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peyton Howe <peyton.howe@bellsouth.net>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Thu, 23 Jan 2025 at 08:09, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Wed, Jan 22, 2025 at 04:24:10PM +0000, Dave Stevenson wrote:
> > Hi Sakari
> >
> > On Wed, 22 Jan 2025 at 12:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > >
> > > Hi Dave,
> > >
> > > On Mon, Jan 20, 2025 at 11:35:40AM +0000, Dave Stevenson wrote:
> > > > Commit ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
> > > > added support for device tree to allow configuration of the sensor to
> > > > use 4 lanes with a link frequency of 363MHz, and amended the advertised
> > > > pixel rate to 280.8MPix/s.
> > > >
> > > > However it didn't change any of the PLL settings, so actually it would
> > > > have been running overclocked in the MIPI block, and with the frame
> > > > rate and exposure calculations being wrong as the pixel rate was
> > > > unchanged.
> > > >
> > > > The pixel rate and link frequency advertised were taken from the "Clock
> > > > Setting Example" section of the datasheet. However those are based on an
> > > > external clock of 12MHz, and are unachievable with a clock of 24MHz - it
> > > > seems PREPLLCLK_VT_DIV and PREPLLCK_OP_DIV can ONLY be set via the
> > > > automatic configuration documented in "9-1-2 EXCK_FREQ setting depend on
> > > > INCK frequency", not by writing the registers.
> > > > The closest we can get with a 24MHz clock is 281.6MPix/s and 364MHz.
> > > >
> > > > Dropping all support for the 363MHz link frequency would cause problems
> > > > for existing users, so allow it, but log a warning that the requested
> > > > value is being changed to the supported one.
> > > >
> > > > Fixes: ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
> > > > Co-developed-by: Peyton Howe <peyton.howe@bellsouth.net>
> > > > Signed-off-by: Peyton Howe <peyton.howe@bellsouth.net>
> > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > ---
> > > > This was fed back to us by Peyton Howe as giving image corruption
> > > > on a Raspberry Pi with DF Robot imx219 module, and confirmed with
> > > > a Soho Enterprises module.
> > > > Effectively the module was being overclocked and misbehaving.
> > > >
> > > > With this patch and the Soho Enterprises module no image corruption
> > > > is observed, and the frame rates are spot on. I haven't checked
> > > > exposure times, but those should follow frame rate as they are
> > > > based on the same clock.
> > > > ---
> > > >  drivers/media/i2c/imx219.c | 78 ++++++++++++++++++++++++++++++++++++----------
> > > >  1 file changed, 61 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > > > index 2d54cea113e1..562b3eb0cb1e 100644
> > > > --- a/drivers/media/i2c/imx219.c
> > > > +++ b/drivers/media/i2c/imx219.c
> > > > @@ -133,10 +133,11 @@
> > > >
> > > >  /* Pixel rate is fixed for all the modes */
> > > >  #define IMX219_PIXEL_RATE            182400000
> > > > -#define IMX219_PIXEL_RATE_4LANE              280800000
> > > > +#define IMX219_PIXEL_RATE_4LANE              281600000
> > > >
> > > >  #define IMX219_DEFAULT_LINK_FREQ     456000000
> > > > -#define IMX219_DEFAULT_LINK_FREQ_4LANE       363000000
> > > > +#define IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED   363000000
> > > > +#define IMX219_DEFAULT_LINK_FREQ_4LANE       364000000
> > >
> > > This shows again the ill effects of register list based drivers. :-(
> >
> > Seeing as it was the PLL setup that was wrong, I believe the only
> > drivers that may have avoided it are MT9P031, AR0521, and CCS assuming
> > they compute all PLL settings correctly off an arbitrary pixel clock.
>
> ov5640 does that, too, but it has a mode list.
>
> >
> > Unfortunately I had no hardware to test the original patch adding 4
> > lane support, and as the datasheet doesn't lay out the actual PLL
> > configuration required for each option I hadn't twigged it was
> > required. I would have hoped that the author of that patch would have
> > noticed the frame rates were wrong, but things are never perfect.
> >
> > And I assume that your comment means that we won't see Intel
> > submitting any register list based drivers in future? I'll be quite
> > happy not having to rework them due to only supporting a 19.2MHz clock
> > :-)
>
> I'd wish I could say I won't merge any new register list based drivers but
> that would mean there would be very, very few new sensor drivers. :-(
> Register list based are here to stay, I'm afraid.

That largely sums up my minor objection to your complaint.
If we lived in the utopia where all other drivers computed all
register values and imx219 was the exception, then I'd accept it.
Reality is that it is very rare, and there is no motivation for it to
change.

(With my other hat on, I'd like it if all HDMI monitors had valid
EDIDs and handled hotplug correctly, but that also isn't reality).

> >
> > > >
> > > >  /* IMX219 native and active pixel array size. */
> > > >  #define IMX219_NATIVE_WIDTH          3296U
> > > > @@ -168,15 +169,6 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
> > > >       { CCI_REG8(0x30eb), 0x05 },
> > > >       { CCI_REG8(0x30eb), 0x09 },
> > > >
> > > > -     /* PLL Clock Table */
> > > > -     { IMX219_REG_VTPXCK_DIV, 5 },
> > > > -     { IMX219_REG_VTSYCK_DIV, 1 },
> > > > -     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 = AUTO set */
> > > > -     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 = AUTO set */
> > > > -     { IMX219_REG_PLL_VT_MPY, 57 },
> > > > -     { IMX219_REG_OPSYCK_DIV, 1 },
> > > > -     { IMX219_REG_PLL_OP_MPY, 114 },
> > > > -
> > > >       /* Undocumented registers */
> > > >       { CCI_REG8(0x455e), 0x00 },
> > > >       { CCI_REG8(0x471e), 0x4b },
> > > > @@ -201,6 +193,34 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
> > > >       { IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(IMX219_XCLK_FREQ / 1000000) },
> > > >  };
> > > >
> > > > +static const struct cci_reg_sequence imx219_2lane_regs[] = {
> > > > +     /* PLL Clock Table */
> > > > +     { IMX219_REG_VTPXCK_DIV, 5 },
> > > > +     { IMX219_REG_VTSYCK_DIV, 1 },
> > > > +     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 = AUTO set */
> > > > +     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 = AUTO set */
> > > > +     { IMX219_REG_PLL_VT_MPY, 57 },
> > > > +     { IMX219_REG_OPSYCK_DIV, 1 },
> > > > +     { IMX219_REG_PLL_OP_MPY, 114 },
> > > > +
> > > > +     /* 2-Lane CSI Mode */
> > > > +     { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
> > > > +};
> > > > +
> > > > +static const struct cci_reg_sequence imx219_4lane_regs[] = {
> > > > +     /* PLL Clock Table */
> > > > +     { IMX219_REG_VTPXCK_DIV, 5 },
> > > > +     { IMX219_REG_VTSYCK_DIV, 1 },
> > > > +     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 = AUTO set */
> > > > +     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 = AUTO set */
> > > > +     { IMX219_REG_PLL_VT_MPY, 88 },
> > > > +     { IMX219_REG_OPSYCK_DIV, 1 },
> > > > +     { IMX219_REG_PLL_OP_MPY, 91 },
> > > > +
> > > > +     /* 4-Lane CSI Mode */
> > > > +     { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_4_LANE_MODE },
> > > > +};
> > > > +
> > > >  static const s64 imx219_link_freq_menu[] = {
> > > >       IMX219_DEFAULT_LINK_FREQ,
> > > >  };
> > > > @@ -662,9 +682,11 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> > > >
> > > >  static int imx219_configure_lanes(struct imx219 *imx219)
> > > >  {
> > > > -     return cci_write(imx219->regmap, IMX219_REG_CSI_LANE_MODE,
> > > > -                      imx219->lanes == 2 ? IMX219_CSI_2_LANE_MODE :
> > > > -                      IMX219_CSI_4_LANE_MODE, NULL);
> > > > +     /* Write the appropriate PLL settings for the number of MIPI lanes */
> > > > +     return cci_multi_reg_write(imx219->regmap,
> > > > +                               imx219->lanes == 2 ? imx219_2lane_regs : imx219_4lane_regs,
> > > > +                               imx219->lanes == 2 ? ARRAY_SIZE(imx219_2lane_regs) :
> > > > +                               ARRAY_SIZE(imx219_4lane_regs), NULL);
> > > >  };
> > > >
> > > >  static int imx219_start_streaming(struct imx219 *imx219,
> > > > @@ -1036,6 +1058,7 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> > > >               .bus_type = V4L2_MBUS_CSI2_DPHY
> > > >       };
> > > >       int ret = -EINVAL;
> > > > +     bool link_frequency_valid = false;
> > > >
> > > >       endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> > > >       if (!endpoint)
> > > > @@ -1062,9 +1085,30 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> > > >               goto error_out;
> > > >       }
> > > >
> > > > -     if (ep_cfg.nr_of_link_frequencies != 1 ||
> > > > -        (ep_cfg.link_frequencies[0] != ((imx219->lanes == 2) ?
> > > > -         IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE))) {
> > > > +     if (ep_cfg.nr_of_link_frequencies == 1) {
> > > > +             switch (imx219->lanes) {
> > > > +             case 2:
> > > > +                     if (ep_cfg.link_frequencies[0] ==
> > > > +                                             IMX219_DEFAULT_LINK_FREQ)
> > > > +                             link_frequency_valid = true;
> > > > +                     break;
> > > > +             case 4:
> > > > +                     if (ep_cfg.link_frequencies[0] ==
> > > > +                                             IMX219_DEFAULT_LINK_FREQ_4LANE)
> > > > +                             link_frequency_valid = true;
> > > > +                     else if (ep_cfg.link_frequencies[0] ==
> > > > +                                IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED) {
> > > > +                             dev_warn(dev, "Link frequency of %d not supported, but has been incorrectly advertised previously\n",
> > > > +                                      IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED);
> > > > +                             dev_warn(dev, "Using link frequency of %d\n",
> > > > +                                      IMX219_DEFAULT_LINK_FREQ_4LANE);
> > >
> > > Would it be helpful to use v4l2_link_freq_to_bitmap() here? The old
> > > frequency requires separate handling but I guess you'll still want to
> > > expose the correct frequency to the user space so it should be just one
> > > condition.
> >
> > I've done a quick prototype using it. I'm not sure it's any cleaner,
> > and possibly ends up being more verbose.
> >
> > As I see it, either you end up with a call to v4l2_link_freq_to_bitmap
> > for each of the 2 and 4 lane cases (6 lines each due to the number of
> > parameters), or you combine both 2 & 4 lane frequency options into one
> > array and then handle that certain bit options are only valid for one
> > or other option, and pass the right value in when calling
> > v4l2_ctrl_new_int_menu(..., V4L2_CID_LINK_FREQ...).
> > Handling the unsupported link frequency requires knowledge of the
> > positions in the array, so either hard coded indices or needing an
> > enum for each index.
> >
> > I've pushed my quick patch to
> > https://github.com/6by9/linux/tree/media_imx219_4lane.
> > Personally I think it detracts from readability in this case, but I'm
> > happy to switch to a cleaned up version of it if you view it as
> > better.
>
> I was thinking of separate frequency lists for all three cases. That way
> you'd avoid almost all manual checks of the frequencies.

Having a separate table for each means that in the 4 lane case we try
the correct frequency and then if that fails we try again with the
unsupported one. v4l2_link_freq_to_bitmap will log a dev_err("no
matching link frequencies found") to the first check, even though
we're going to work around it.
Personally I don't care as this is the first time I've looked at 4
lane mode on imx219, so my overlays will have the correct value.
Others may worry more.

However you have swung me round to using v4l2_link_freq_to_bitmap in
some shape or form though. It means I can always just list both link
frequencies and not have to update it when changing the number of
lanes :-)
I now have a patch that works out to be fairly clean, so I'll send that as a V2.

> The question I'd also have is whether we should try to continue to indicate
> the incorrect frequency or not. The values are not an integral part of the
> ABI in my view as new ones can be added, even for the same board. And in
> this case there's just a single one in any given case.
>
> This information is also mainly used to configure the receiver timing and
> wrong values here could lead to errors in reception.
>
> IOW, I'd just show the correct value, independently of what's in firmware.

I agree that we should advertise the frequency that will be used,
regardless of what's in the firmware.
In this case the difference is only 1MHz, so it's very unlikely to
cause a failure. The control is read-only, so it's not as if a
userspace app is likely to have been hard coded to try setting the old
value.
This v1 patch had that behaviour, and I'll keep it for v2.

Thanks
  Dave

> --
> Kind regards,
>
> Sakari Ailus

