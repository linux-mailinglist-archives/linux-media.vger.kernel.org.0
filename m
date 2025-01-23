Return-Path: <linux-media+bounces-25207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 28067A1A584
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 15:10:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BD5E160E40
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 14:10:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36603210F7E;
	Thu, 23 Jan 2025 14:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JprWiW9l"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6AD238F83;
	Thu, 23 Jan 2025 14:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737641452; cv=none; b=JHe/MrLn5xexDcPNRv8tD8zR+2w2qARGimtdBZjagVk3zV2A92Wo9Myc6vucDN2/BR2CcIcXAqM5EaQXERDetiE6gEWHaGfmFZnDSdb2vQjhB/t/5EYHyWgeFxsavBmSQHFJ1IREZeqrXPI20hjTOaMTUUuHdooV9faEtWF+fZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737641452; c=relaxed/simple;
	bh=fqze1BuohUZqvZbqRxbJSirnIBeoTX0x9KX/WWe80yc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tCb4PaMs6FIMm2VXhuu1jBQrdGGfs0K9wEhRWHuHP2viV/VeH879BIkfYsJaTTQDY5dDc7HQByv+APixizBpB2RmTYKHFyrmmzto9mIxMGLpeejJFTA70XnKdKIlAwqNZGxQ6e7so+xLBOz/J0ULhvcRVE50TRl0/CaEp54Neog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JprWiW9l; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so1884479a91.2;
        Thu, 23 Jan 2025 06:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737641450; x=1738246250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0IRMd5ISeb4Codonb5ae12BodDysjvP0m0ig+7L9Kg=;
        b=JprWiW9lfmMj3Cg1aUzsA+5haeJ3YmSGZBwCEd8MratijeOyJ9sd9W9XYh+wA39iZG
         DgORT8LoB+uk3eZJasBL9Aza3Dc/x6SHXGIAaHg0aTpqb0gg0lDvfwgaCpHQagbHpky4
         wqXYn6pWZQBLs8JKmolPHkTZrCvwqicjgUeS1aIkNtGVVzSSYq4+Wml7hXYYiuoj4no0
         W6v/azvKEzUHSmEcEyvgNVH9iAESHmvrJ4UOfW8Uu+NrLlCHDP1Y0okLjrzssDeNk+C6
         XQRsNulhVKEZZVr8UnMTQ/rFpxN/pqYkJc8dPTTKHvqEmMYDWKS+8KPHouMXPXgBnFuS
         vrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737641450; x=1738246250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0IRMd5ISeb4Codonb5ae12BodDysjvP0m0ig+7L9Kg=;
        b=BZ6uCGlYbU3JaRyRG1Fmmn8Fi6195HDmSvxeZR112UrKn8RUn+MkEfghJCpRerNHDt
         +u2nLBP0K2sgLaPjbV0h8z2ZWAX3uXPk9aYEqxcBlveO6migyrMs4cC64O5I5PuQySyG
         xbQ0k8mrheJC8HosufCwk3QcKbxZhL7niWTeYiGKIaOh4OQhJH8+1FINAtQ5psn5W63N
         3bkVuY/dVOTEFgnAN9BR7A4O+AhujsfVXRBFqkT7FBvZKFtJG+JImB5z6ovJmG8o2QzH
         Voh7D0MGW3kpsTVbh4fvbDL2Dm0q+KLhk0Bli0jaY04/rdUulT7uSaCNVEgUvQNVzxUF
         6k4A==
X-Forwarded-Encrypted: i=1; AJvYcCWW5q/0oWahyxzB0ivXKo43AR71jJXZ/f5GVzWUxrFIq8vD8wDrE9IQH+tQdEq9SECvxgGjz8kj7CROLQk=@vger.kernel.org, AJvYcCWcgaCChhBKC8H8YcaSDMKMPLcOmKlSJOOxVYIuBIovO9y9mHR40qPPbQuPqv9ZyxMeVyYbsIhXyOro6RY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoJfFr/4CzXFBJV74cTduILMSnkS3cPHdQFTin2j+QzfaQeonD
	q/LK9sMkLlzkTxztVvKAWHzrfLgh/nlegMfo7e3rKf52JOpl3eRhtAlUfcLAlWvZx0yVx5Rg0FA
	Tvaoodyq7zbLu37uoVOLjnnsv4yk=
X-Gm-Gg: ASbGncujr/fVgfgLYXVI+X4BHPMocDmjgY1h2X4k9Y1kAEDOKUPDpYXI2PWiLP1BPf3
	Bs3cB4PWNgSHmzmq3ZhdXB7m+qmmZZs1NP1wdkgo9r2tAoAz6o1/nZqdUjlZfWA==
X-Google-Smtp-Source: AGHT+IEJAMoKr8fkPq9nA8chQ4QWUd612N7ypTXx9qxQ/ebHDujTDPBXRczWRMOEG7m0rpaEZJ2uB/nVPo9ufAt5Cus=
X-Received: by 2002:a05:6a00:2184:b0:725:ef4b:de33 with SMTP id
 d2e1a72fcca58-72daf88b1b9mr40170377b3a.0.1737641449695; Thu, 23 Jan 2025
 06:10:49 -0800 (PST)
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
From: Adam Ford <aford173@gmail.com>
Date: Thu, 23 Jan 2025 08:10:38 -0600
X-Gm-Features: AbW1kvY1wa5gvVMBg7nQSfeZSqlvVpfrQi3mdSpM_wacVZXOwjSgziHBKRPTtyo
Message-ID: <CAHCN7xL+sQdt=kL_jM2W0LeoiRS7eEufbm5cwvNNtvxR-xDM5A@mail.gmail.com>
Subject: Re: [PATCH] media: imx219: Adjust PLL settings based on the number of
 MIPI lanes
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peyton Howe <peyton.howe@bellsouth.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 23, 2025 at 2:09=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Hi Dave,
>
> On Wed, Jan 22, 2025 at 04:24:10PM +0000, Dave Stevenson wrote:
> > Hi Sakari
> >
> > On Wed, 22 Jan 2025 at 12:01, Sakari Ailus <sakari.ailus@linux.intel.co=
m> wrote:
> > >
> > > Hi Dave,
> > >
> > > On Mon, Jan 20, 2025 at 11:35:40AM +0000, Dave Stevenson wrote:
> > > > Commit ceddfd4493b3 ("media: i2c: imx219: Support four-lane operati=
on")
> > > > added support for device tree to allow configuration of the sensor =
to
> > > > use 4 lanes with a link frequency of 363MHz, and amended the advert=
ised
> > > > pixel rate to 280.8MPix/s.
> > > >
> > > > However it didn't change any of the PLL settings, so actually it wo=
uld
> > > > have been running overclocked in the MIPI block, and with the frame
> > > > rate and exposure calculations being wrong as the pixel rate was
> > > > unchanged.
> > > >
> > > > The pixel rate and link frequency advertised were taken from the "C=
lock
> > > > Setting Example" section of the datasheet. However those are based =
on an
> > > > external clock of 12MHz, and are unachievable with a clock of 24MHz=
 - it
> > > > seems PREPLLCLK_VT_DIV and PREPLLCK_OP_DIV can ONLY be set via the
> > > > automatic configuration documented in "9-1-2 EXCK_FREQ setting depe=
nd on
> > > > INCK frequency", not by writing the registers.
> > > > The closest we can get with a 24MHz clock is 281.6MPix/s and 364MHz=
.
> > > >
> > > > Dropping all support for the 363MHz link frequency would cause prob=
lems
> > > > for existing users, so allow it, but log a warning that the request=
ed
> > > > value is being changed to the supported one.
> > > >
> > > > Fixes: ceddfd4493b3 ("media: i2c: imx219: Support four-lane operati=
on")
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
> > > >  drivers/media/i2c/imx219.c | 78 ++++++++++++++++++++++++++++++++++=
++----------
> > > >  1 file changed, 61 insertions(+), 17 deletions(-)
> > > >
> > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.=
c
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

I didn't see video issues when I submitted the original patch.  I
don't know if I just lucked out with having hardware that tolerated
overclocking, or if it was due to the resolution or frame rate I was
testing.

> >
> > And I assume that your comment means that we won't see Intel
> > submitting any register list based drivers in future? I'll be quite
> > happy not having to rework them due to only supporting a 19.2MHz clock
> > :-)

My original design for the IMX219 didn't use a 24MHz ref clock, but I
noticed the datasheet supported different ref clocks.  I had
considered adding support for the clock we originally designed, but I
convinced the hardware guys to swap out the clock, so didn't spend a
lot of time on the investigating the PLL's or clocking structure.
Ironically, I was afraid to break something, which I apparently
succeeded in doing anyway.  :-(

Sorry about that.

>
> I'd wish I could say I won't merge any new register list based drivers bu=
t
> that would mean there would be very, very few new sensor drivers. :-(
> Register list based are here to stay, I'm afraid.
>
> >
> > > >
> > > >  /* IMX219 native and active pixel array size. */
> > > >  #define IMX219_NATIVE_WIDTH          3296U
> > > > @@ -168,15 +169,6 @@ static const struct cci_reg_sequence imx219_co=
mmon_regs[] =3D {
> > > >       { CCI_REG8(0x30eb), 0x05 },
> > > >       { CCI_REG8(0x30eb), 0x09 },
> > > >
> > > > -     /* PLL Clock Table */
> > > > -     { IMX219_REG_VTPXCK_DIV, 5 },
> > > > -     { IMX219_REG_VTSYCK_DIV, 1 },
> > > > -     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 =3D AUTO set =
*/
> > > > -     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 =3D AUTO set =
*/
> > > > -     { IMX219_REG_PLL_VT_MPY, 57 },
> > > > -     { IMX219_REG_OPSYCK_DIV, 1 },
> > > > -     { IMX219_REG_PLL_OP_MPY, 114 },
> > > > -
> > > >       /* Undocumented registers */
> > > >       { CCI_REG8(0x455e), 0x00 },
> > > >       { CCI_REG8(0x471e), 0x4b },
> > > > @@ -201,6 +193,34 @@ static const struct cci_reg_sequence imx219_co=
mmon_regs[] =3D {
> > > >       { IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(IMX219_XCLK_FREQ / 1=
000000) },
> > > >  };
> > > >
> > > > +static const struct cci_reg_sequence imx219_2lane_regs[] =3D {
> > > > +     /* PLL Clock Table */
> > > > +     { IMX219_REG_VTPXCK_DIV, 5 },
> > > > +     { IMX219_REG_VTSYCK_DIV, 1 },
> > > > +     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 =3D AUTO set =
*/
> > > > +     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 =3D AUTO set =
*/
> > > > +     { IMX219_REG_PLL_VT_MPY, 57 },
> > > > +     { IMX219_REG_OPSYCK_DIV, 1 },
> > > > +     { IMX219_REG_PLL_OP_MPY, 114 },
> > > > +
> > > > +     /* 2-Lane CSI Mode */
> > > > +     { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
> > > > +};
> > > > +
> > > > +static const struct cci_reg_sequence imx219_4lane_regs[] =3D {
> > > > +     /* PLL Clock Table */
> > > > +     { IMX219_REG_VTPXCK_DIV, 5 },
> > > > +     { IMX219_REG_VTSYCK_DIV, 1 },
> > > > +     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 =3D AUTO set =
*/
> > > > +     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 =3D AUTO set =
*/
> > > > +     { IMX219_REG_PLL_VT_MPY, 88 },
> > > > +     { IMX219_REG_OPSYCK_DIV, 1 },
> > > > +     { IMX219_REG_PLL_OP_MPY, 91 },
> > > > +
> > > > +     /* 4-Lane CSI Mode */
> > > > +     { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_4_LANE_MODE },
> > > > +};

Instead of having a few tables of registers, would it make sense to
have one common table and a small function to dynamically calculate
these registers based on the ref clock and the desired link rate?
Several of these values appear to be duplicates anyway.

> > > > +
> > > >  static const s64 imx219_link_freq_menu[] =3D {
> > > >       IMX219_DEFAULT_LINK_FREQ,
> > > >  };
> > > > @@ -662,9 +682,11 @@ static int imx219_set_framefmt(struct imx219 *=
imx219,
> > > >
> > > >  static int imx219_configure_lanes(struct imx219 *imx219)
> > > >  {
> > > > -     return cci_write(imx219->regmap, IMX219_REG_CSI_LANE_MODE,
> > > > -                      imx219->lanes =3D=3D 2 ? IMX219_CSI_2_LANE_M=
ODE :
> > > > -                      IMX219_CSI_4_LANE_MODE, NULL);
> > > > +     /* Write the appropriate PLL settings for the number of MIPI =
lanes */
> > > > +     return cci_multi_reg_write(imx219->regmap,
> > > > +                               imx219->lanes =3D=3D 2 ? imx219_2la=
ne_regs : imx219_4lane_regs,
> > > > +                               imx219->lanes =3D=3D 2 ? ARRAY_SIZE=
(imx219_2lane_regs) :
> > > > +                               ARRAY_SIZE(imx219_4lane_regs), NULL=
);
> > > >  };
> > > >
> > > >  static int imx219_start_streaming(struct imx219 *imx219,
> > > > @@ -1036,6 +1058,7 @@ static int imx219_check_hwcfg(struct device *=
dev, struct imx219 *imx219)
> > > >               .bus_type =3D V4L2_MBUS_CSI2_DPHY
> > > >       };
> > > >       int ret =3D -EINVAL;
> > > > +     bool link_frequency_valid =3D false;
> > > >
> > > >       endpoint =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev), =
NULL);
> > > >       if (!endpoint)
> > > > @@ -1062,9 +1085,30 @@ static int imx219_check_hwcfg(struct device =
*dev, struct imx219 *imx219)
> > > >               goto error_out;
> > > >       }
> > > >
> > > > -     if (ep_cfg.nr_of_link_frequencies !=3D 1 ||
> > > > -        (ep_cfg.link_frequencies[0] !=3D ((imx219->lanes =3D=3D 2)=
 ?
> > > > -         IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE=
))) {
> > > > +     if (ep_cfg.nr_of_link_frequencies =3D=3D 1) {
> > > > +             switch (imx219->lanes) {
> > > > +             case 2:
> > > > +                     if (ep_cfg.link_frequencies[0] =3D=3D
> > > > +                                             IMX219_DEFAULT_LINK_F=
REQ)
> > > > +                             link_frequency_valid =3D true;
> > > > +                     break;
> > > > +             case 4:
> > > > +                     if (ep_cfg.link_frequencies[0] =3D=3D
> > > > +                                             IMX219_DEFAULT_LINK_F=
REQ_4LANE)
> > > > +                             link_frequency_valid =3D true;
> > > > +                     else if (ep_cfg.link_frequencies[0] =3D=3D
> > > > +                                IMX219_DEFAULT_LINK_FREQ_4LANE_UNS=
UPPORTED) {
> > > > +                             dev_warn(dev, "Link frequency of %d n=
ot supported, but has been incorrectly advertised previously\n",
> > > > +                                      IMX219_DEFAULT_LINK_FREQ_4LA=
NE_UNSUPPORTED);
> > > > +                             dev_warn(dev, "Using link frequency o=
f %d\n",
> > > > +                                      IMX219_DEFAULT_LINK_FREQ_4LA=
NE);

I grepped the code for 363000000 to see if anyone was using it in
their device tree.  Maybe I missed something in linux-next, but I
didn't see it.  I know I didn't push my camera device tree entries for
the two devices I had tested, because I was going to use them as
device tree overlays and never got around to pushing them upstream,
but I do occasionally test them.  If nobody has a wrong device tree
entry, it seems reasonable to me to simplify this code by just
changing it from 363000000 to 364000000 and eliminate the stuff for
the the unsupported value.


> > >
> > > Would it be helpful to use v4l2_link_freq_to_bitmap() here? The old
> > > frequency requires separate handling but I guess you'll still want to
> > > expose the correct frequency to the user space so it should be just o=
ne
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

Thanks for looking at this.

> I was thinking of separate frequency lists for all three cases. That way
> you'd avoid almost all manual checks of the frequencies.
>
> The question I'd also have is whether we should try to continue to indica=
te
> the incorrect frequency or not. The values are not an integral part of th=
e
> ABI in my view as new ones can be added, even for the same board. And in
> this case there's just a single one in any given case.
>
> This information is also mainly used to configure the receiver timing and
> wrong values here could lead to errors in reception.
>
> IOW, I'd just show the correct value, independently of what's in firmware=
.
>
> --
> Kind regards,
>
> Sakari Ailus

