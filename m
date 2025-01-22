Return-Path: <linux-media+bounces-25156-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0DFA19670
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 17:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 81004188DDE9
	for <lists+linux-media@lfdr.de>; Wed, 22 Jan 2025 16:24:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AA7621504D;
	Wed, 22 Jan 2025 16:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="CcBjABUW"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7B12144A9
	for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 16:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737563071; cv=none; b=SPTyy4Dpakvw1lj1TY9g1Pfqtp5427uNCBBDFyqMKSDw0nwp6MeygpFBX3vr5bdHjyfHaJjfz1haOlXQQ6ttJSLOhylk+UY3oUTquu+TlZYFsfA5sFdWS2YTIeo7ars1+iNZRj15+bCI/HIRow4sFar3r4ZiI7HDkS/djq6cTIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737563071; c=relaxed/simple;
	bh=PS+1kNTMgfVWoVkFue3bZNlYg8OUh/kHGDNX47pjt8g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGplFnozMLrJgzj7ubugViazO/3J+t0bKpr2t69KscrreSGk8Rk4IqSRVgGxIlqlfmawTI0rPoASItIoxnK9qO1ANChunncEHujIgJrHbfo2IJxNoSjcDbUQq30lthD/Wtg1rFhO7GcdTCZ/U3jqEtPl5HldCiaDI/Dz99Np/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=CcBjABUW; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e53aa843a24so1932995276.0
        for <linux-media@vger.kernel.org>; Wed, 22 Jan 2025 08:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737563068; x=1738167868; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vsqHoSMgqv8h+ME/1+1YwmEhqehANfzjtzauCSdiuNs=;
        b=CcBjABUWH8dAgICXsdhfPsC1RP+fPVU4S+B9Fuv/5ZcCibIQaLViaedHmHUWEYQXk+
         LLn8pT/wkuiNKeo9LF4tlvvL6DULMoULlihoeSq2ZFGRcQcnVd2s6nDUZmcEliOOfHtv
         6PN/uGpm7jeTIVCX32qkGgt1VjqpcZ8HcDR2sS0gqXv5h1GcKyQiWPgAjWeWz7Ngxg9s
         v0VZs9UK6IANBR1QU3KpqMRc3AUWTQhJ8hifvUTUPZc4L8TpY5znf4FLVIQS0BkUPaDZ
         qzV3h7/3YNR+UItA5ugaScCbjJ/idXxBc6PpuKcMxEdwixRd2qJAVWrY9w5D2A9g3v2D
         KOhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737563068; x=1738167868;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsqHoSMgqv8h+ME/1+1YwmEhqehANfzjtzauCSdiuNs=;
        b=KcXJuXgdXUMgDykY82riApFD7jUjry4TeKF3PR5uLo7xVxj0rpCtuumznQBnd195le
         sEPZS8lJWbrcI2MN3KJC9+54ZjO1WQO0PP3bqUHD26YYexPayAHoSJgSY5JeEy6FmFgF
         4ja34a2YL4LU8xzikiLTFruQaL6z6XkMEX3UU6u95igOOu8S4PbkFObNgic/zpD9i4UD
         GAFqY9oAaPkX8fce5rb1WNuBT20bO2eDk4aG228eUd72zcK6L/CUogKB9qfQmAKyXBsC
         DLLsdJn4lCJbFnOiUEogYVEDM47VEmFWTobFkOlS2Wp0nwBXHKvGT4HmH8KB0UvFA9in
         hLPg==
X-Forwarded-Encrypted: i=1; AJvYcCW06YDxEbSxrHMyqQR9YGkL8Y9LjTJICw0h7FsBkBN6tH0CB9nZXiUkyVYH7tYTf9ZB8gv6mHykoL0eow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzDeqPda9sVMSBVO40kyWqCqnUdw+gglbAlRijeXLEo1gpvQDeV
	hNIkxrpr2D3SJMbqUo+PjFsJDwnlTyHG2EYoTVAVFbe830gal2I/uIPtQOiL5sw4ooTtcVDT5qJ
	2D2Tj/HrXJiXf/tPjcJ6hF/QYqzJCkaQIyDIfGg==
X-Gm-Gg: ASbGnctHX2k5i3gPd7wlBCwUEnIb6bAaU/o70Mr6UVNR3mMt++fFfa+5nlr3BFCnBhK
	ZlisT+3SMBoP+k4YaPM+7ayXrhq5FsSgL5ljTOlzQkJNcdH7eu7Ibo0BIWAcgPQyo7cO1xF69Jl
	C5LF8sGw==
X-Google-Smtp-Source: AGHT+IGXr78m/mptu0ikZ8DFSICcpd37uWJD45SjseySFtNulY0jkzaoV9WAognxuHhAtUJjoAkt4i6FJ/m4QIQrsOc=
X-Received: by 2002:a25:a503:0:b0:e57:3f93:c756 with SMTP id
 3f1490d57ef6-e578a272324mr24202519276.21.1737563067799; Wed, 22 Jan 2025
 08:24:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-media-imx219-4lane-v1-1-c7aa1a413ddc@raspberrypi.com> <Z5DeJ_-VWnE7vO8m@kekkonen.localdomain>
In-Reply-To: <Z5DeJ_-VWnE7vO8m@kekkonen.localdomain>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 22 Jan 2025 16:24:10 +0000
X-Gm-Features: AbW1kvYt-70Ad_-69XmKfajEiU8GNChRxI_A4erwNYtu_qLD9Jzwf4-9MknSkTY
Message-ID: <CAPY8ntDz7hxgBr1oeY9ccPJgxktm-kkTL93EM3XXp8kEOvqZ9A@mail.gmail.com>
Subject: Re: [PATCH] media: imx219: Adjust PLL settings based on the number of
 MIPI lanes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Adam Ford <aford173@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peyton Howe <peyton.howe@bellsouth.net>
Content-Type: text/plain; charset="UTF-8"

Hi Sakari

On Wed, 22 Jan 2025 at 12:01, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Mon, Jan 20, 2025 at 11:35:40AM +0000, Dave Stevenson wrote:
> > Commit ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
> > added support for device tree to allow configuration of the sensor to
> > use 4 lanes with a link frequency of 363MHz, and amended the advertised
> > pixel rate to 280.8MPix/s.
> >
> > However it didn't change any of the PLL settings, so actually it would
> > have been running overclocked in the MIPI block, and with the frame
> > rate and exposure calculations being wrong as the pixel rate was
> > unchanged.
> >
> > The pixel rate and link frequency advertised were taken from the "Clock
> > Setting Example" section of the datasheet. However those are based on an
> > external clock of 12MHz, and are unachievable with a clock of 24MHz - it
> > seems PREPLLCLK_VT_DIV and PREPLLCK_OP_DIV can ONLY be set via the
> > automatic configuration documented in "9-1-2 EXCK_FREQ setting depend on
> > INCK frequency", not by writing the registers.
> > The closest we can get with a 24MHz clock is 281.6MPix/s and 364MHz.
> >
> > Dropping all support for the 363MHz link frequency would cause problems
> > for existing users, so allow it, but log a warning that the requested
> > value is being changed to the supported one.
> >
> > Fixes: ceddfd4493b3 ("media: i2c: imx219: Support four-lane operation")
> > Co-developed-by: Peyton Howe <peyton.howe@bellsouth.net>
> > Signed-off-by: Peyton Howe <peyton.howe@bellsouth.net>
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> > This was fed back to us by Peyton Howe as giving image corruption
> > on a Raspberry Pi with DF Robot imx219 module, and confirmed with
> > a Soho Enterprises module.
> > Effectively the module was being overclocked and misbehaving.
> >
> > With this patch and the Soho Enterprises module no image corruption
> > is observed, and the frame rates are spot on. I haven't checked
> > exposure times, but those should follow frame rate as they are
> > based on the same clock.
> > ---
> >  drivers/media/i2c/imx219.c | 78 ++++++++++++++++++++++++++++++++++++----------
> >  1 file changed, 61 insertions(+), 17 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 2d54cea113e1..562b3eb0cb1e 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -133,10 +133,11 @@
> >
> >  /* Pixel rate is fixed for all the modes */
> >  #define IMX219_PIXEL_RATE            182400000
> > -#define IMX219_PIXEL_RATE_4LANE              280800000
> > +#define IMX219_PIXEL_RATE_4LANE              281600000
> >
> >  #define IMX219_DEFAULT_LINK_FREQ     456000000
> > -#define IMX219_DEFAULT_LINK_FREQ_4LANE       363000000
> > +#define IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED   363000000
> > +#define IMX219_DEFAULT_LINK_FREQ_4LANE       364000000
>
> This shows again the ill effects of register list based drivers. :-(

Seeing as it was the PLL setup that was wrong, I believe the only
drivers that may have avoided it are MT9P031, AR0521, and CCS assuming
they compute all PLL settings correctly off an arbitrary pixel clock.

Unfortunately I had no hardware to test the original patch adding 4
lane support, and as the datasheet doesn't lay out the actual PLL
configuration required for each option I hadn't twigged it was
required. I would have hoped that the author of that patch would have
noticed the frame rates were wrong, but things are never perfect.

And I assume that your comment means that we won't see Intel
submitting any register list based drivers in future? I'll be quite
happy not having to rework them due to only supporting a 19.2MHz clock
:-)

> >
> >  /* IMX219 native and active pixel array size. */
> >  #define IMX219_NATIVE_WIDTH          3296U
> > @@ -168,15 +169,6 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
> >       { CCI_REG8(0x30eb), 0x05 },
> >       { CCI_REG8(0x30eb), 0x09 },
> >
> > -     /* PLL Clock Table */
> > -     { IMX219_REG_VTPXCK_DIV, 5 },
> > -     { IMX219_REG_VTSYCK_DIV, 1 },
> > -     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 = AUTO set */
> > -     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 = AUTO set */
> > -     { IMX219_REG_PLL_VT_MPY, 57 },
> > -     { IMX219_REG_OPSYCK_DIV, 1 },
> > -     { IMX219_REG_PLL_OP_MPY, 114 },
> > -
> >       /* Undocumented registers */
> >       { CCI_REG8(0x455e), 0x00 },
> >       { CCI_REG8(0x471e), 0x4b },
> > @@ -201,6 +193,34 @@ static const struct cci_reg_sequence imx219_common_regs[] = {
> >       { IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(IMX219_XCLK_FREQ / 1000000) },
> >  };
> >
> > +static const struct cci_reg_sequence imx219_2lane_regs[] = {
> > +     /* PLL Clock Table */
> > +     { IMX219_REG_VTPXCK_DIV, 5 },
> > +     { IMX219_REG_VTSYCK_DIV, 1 },
> > +     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 = AUTO set */
> > +     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 = AUTO set */
> > +     { IMX219_REG_PLL_VT_MPY, 57 },
> > +     { IMX219_REG_OPSYCK_DIV, 1 },
> > +     { IMX219_REG_PLL_OP_MPY, 114 },
> > +
> > +     /* 2-Lane CSI Mode */
> > +     { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
> > +};
> > +
> > +static const struct cci_reg_sequence imx219_4lane_regs[] = {
> > +     /* PLL Clock Table */
> > +     { IMX219_REG_VTPXCK_DIV, 5 },
> > +     { IMX219_REG_VTSYCK_DIV, 1 },
> > +     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 = AUTO set */
> > +     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 = AUTO set */
> > +     { IMX219_REG_PLL_VT_MPY, 88 },
> > +     { IMX219_REG_OPSYCK_DIV, 1 },
> > +     { IMX219_REG_PLL_OP_MPY, 91 },
> > +
> > +     /* 4-Lane CSI Mode */
> > +     { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_4_LANE_MODE },
> > +};
> > +
> >  static const s64 imx219_link_freq_menu[] = {
> >       IMX219_DEFAULT_LINK_FREQ,
> >  };
> > @@ -662,9 +682,11 @@ static int imx219_set_framefmt(struct imx219 *imx219,
> >
> >  static int imx219_configure_lanes(struct imx219 *imx219)
> >  {
> > -     return cci_write(imx219->regmap, IMX219_REG_CSI_LANE_MODE,
> > -                      imx219->lanes == 2 ? IMX219_CSI_2_LANE_MODE :
> > -                      IMX219_CSI_4_LANE_MODE, NULL);
> > +     /* Write the appropriate PLL settings for the number of MIPI lanes */
> > +     return cci_multi_reg_write(imx219->regmap,
> > +                               imx219->lanes == 2 ? imx219_2lane_regs : imx219_4lane_regs,
> > +                               imx219->lanes == 2 ? ARRAY_SIZE(imx219_2lane_regs) :
> > +                               ARRAY_SIZE(imx219_4lane_regs), NULL);
> >  };
> >
> >  static int imx219_start_streaming(struct imx219 *imx219,
> > @@ -1036,6 +1058,7 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> >               .bus_type = V4L2_MBUS_CSI2_DPHY
> >       };
> >       int ret = -EINVAL;
> > +     bool link_frequency_valid = false;
> >
> >       endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
> >       if (!endpoint)
> > @@ -1062,9 +1085,30 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
> >               goto error_out;
> >       }
> >
> > -     if (ep_cfg.nr_of_link_frequencies != 1 ||
> > -        (ep_cfg.link_frequencies[0] != ((imx219->lanes == 2) ?
> > -         IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE))) {
> > +     if (ep_cfg.nr_of_link_frequencies == 1) {
> > +             switch (imx219->lanes) {
> > +             case 2:
> > +                     if (ep_cfg.link_frequencies[0] ==
> > +                                             IMX219_DEFAULT_LINK_FREQ)
> > +                             link_frequency_valid = true;
> > +                     break;
> > +             case 4:
> > +                     if (ep_cfg.link_frequencies[0] ==
> > +                                             IMX219_DEFAULT_LINK_FREQ_4LANE)
> > +                             link_frequency_valid = true;
> > +                     else if (ep_cfg.link_frequencies[0] ==
> > +                                IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED) {
> > +                             dev_warn(dev, "Link frequency of %d not supported, but has been incorrectly advertised previously\n",
> > +                                      IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED);
> > +                             dev_warn(dev, "Using link frequency of %d\n",
> > +                                      IMX219_DEFAULT_LINK_FREQ_4LANE);
>
> Would it be helpful to use v4l2_link_freq_to_bitmap() here? The old
> frequency requires separate handling but I guess you'll still want to
> expose the correct frequency to the user space so it should be just one
> condition.

I've done a quick prototype using it. I'm not sure it's any cleaner,
and possibly ends up being more verbose.

As I see it, either you end up with a call to v4l2_link_freq_to_bitmap
for each of the 2 and 4 lane cases (6 lines each due to the number of
parameters), or you combine both 2 & 4 lane frequency options into one
array and then handle that certain bit options are only valid for one
or other option, and pass the right value in when calling
v4l2_ctrl_new_int_menu(..., V4L2_CID_LINK_FREQ...).
Handling the unsupported link frequency requires knowledge of the
positions in the array, so either hard coded indices or needing an
enum for each index.

I've pushed my quick patch to
https://github.com/6by9/linux/tree/media_imx219_4lane.
Personally I think it detracts from readability in this case, but I'm
happy to switch to a cleaned up version of it if you view it as
better.

  Dave

> > +                             link_frequency_valid = true;
> > +                     }
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (!link_frequency_valid) {
> >               dev_err_probe(dev, -EINVAL,
> >                             "Link frequency not supported: %lld\n",
> >                             ep_cfg.link_frequencies[0]);
> >
>
> --
> Lomd regards,
>
> Sakari Ailus

