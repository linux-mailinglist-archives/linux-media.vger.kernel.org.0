Return-Path: <linux-media+bounces-25211-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8982FA1A715
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 16:29:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E4D13AAC7F
	for <lists+linux-media@lfdr.de>; Thu, 23 Jan 2025 15:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F4AE212F86;
	Thu, 23 Jan 2025 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="NHONfQUK"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C8D21147C
	for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 15:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646167; cv=none; b=lMgUk4lprNsQAPWsm7bUb2VbH2g8uW1Otn3kQ0D5RWxxeDELi3POHwIHA/1hRL0Rq5Z411jsjo3cF/Rez99ZjcWz+9NvFcK8oLI+RbvDh8paBjLFRVULV1JGN1FrtvbD4BcMgPkDBAg0Hmm1xY21XVs57U2eqq3ifhZ1s8lJouw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646167; c=relaxed/simple;
	bh=YsvoLm4ltjjn+OqmYxKWtcKnknrpCQapVEjupdORV9w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NPpgqR+BTpWOJShrW7qHS31CPEcbyH5MzmRfAIvvQxo/0jUm1erbQTBaT0eFARZHWYK9e2Qzx1vHXrT7pV01ax5E1LD9BWo24U+LUzW6I6t0BDOOuZOm0FjiB7fvRtnqdf1FseQDQ5h1OHoo8J7cdCRow5QYYrMtF0vn4CRHays=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=NHONfQUK; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e39f43344c5so1467156276.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jan 2025 07:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1737646164; x=1738250964; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASd3VHZe7w6yTuFJVqTeUCk4dvvcmN1rZwDdsAuISDQ=;
        b=NHONfQUK4xeru40JKAe16CaLfCqQ8Yf/hypCs1mnQkf04s8B9BCbSFKIXraG9z6C6/
         9S53+3bhOAx0RsM8lStgDrwYSuBLGIPORNScqnFdKn66F88dRPmmS6RhtnqZxzZ4xaHz
         7//t6cU6ZeuFOs5bK7hGIG8OI8Ax/Lek1DXNyP2bDSv6IOUQno/gd6sTTaR8qM26xoa1
         g1XWoPECorWBuP2f2coO0lVK+tmBPH6suJfJKfXe50O3R9dKFzxMekV5e5ovejj6Ovlp
         A2UY/ZtVCfhimBV+OqHK9N6i9Xc0puwMNRjOXm6kuKO6gxpzRNQTGf5pOfGJ4ssXOtTg
         BQMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646164; x=1738250964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ASd3VHZe7w6yTuFJVqTeUCk4dvvcmN1rZwDdsAuISDQ=;
        b=u7lSl6dOPIBHNRiPRiq9qLvUvwJ39NgZESuDb9yjNqNtiE89KAZqQWXxCGxSPeboaW
         8hp+9C6VfUnkdn2TXudze0gVQS0gu+3R0gx31BzcqYlbommUO8+ovA+2eR/VxPy//RJu
         sgiBfWxg62pJkn67jBSVmpgXyHs8qrYmPs3ZP3f1KqEZuZ/8KIrBOA0uWuqFuRL8ABCL
         cuTOzpeAckwf1G27x5z032dxHrlAu08/KftDsyrSWArZZCajOwKTwgQBzxBDGJtdqysc
         D8LVSQuwXpEUpswfqROctsgTJ+xGseThlRuXWyTMcGEYah01BTFN6KWV2lwJlfIGjr8I
         L+wg==
X-Forwarded-Encrypted: i=1; AJvYcCXvb7FxtLFhTKLuHGdBb6pKbOrt+GQXfMU+TZXcgDAYySUihVZLAL6LpheIrnlKB96YHTlk6j5oJgF00Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/5roPuVknAZmKhXH9CQqTq/hYYGLBvCXOTGsU0YCJOPabcakM
	sIgYnpDMPCZlqoDUB+SJ5+X+qS7OmASJcd0EYSnFuhBkKYiBGLLqN3ERHVReDKbaWs/IMPyx2Yl
	saJIK9SY6JwxrsqVjZR2Tc8HxhDj0VBIaKuushA==
X-Gm-Gg: ASbGncvEzUx8LxQoO+rsFvFuo2UCcvP3Vxu2zpXyjA3nYH5PjnK3rKp0+mIgu9GiAG2
	ZnO7tzGhQBfmnDlahBt6ceVMG5ndIlZtjDf5jfwiPq4nme2LCjsHRbZ8n5FmwEA==
X-Google-Smtp-Source: AGHT+IFYU4W8xMdAnNyOXz7xHqJXo/dH2IXV4F1ERqYVi/QJZsqX+Ti5VTyW4Kc8CbvmRbbhrKktsV/yR0F+en/Knbs=
X-Received: by 2002:a05:6902:1542:b0:e58:fd2:2cd6 with SMTP id
 3f1490d57ef6-e580fd23076mr7530046276.12.1737646163668; Thu, 23 Jan 2025
 07:29:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120-media-imx219-4lane-v1-1-c7aa1a413ddc@raspberrypi.com>
 <Z5DeJ_-VWnE7vO8m@kekkonen.localdomain> <CAPY8ntDz7hxgBr1oeY9ccPJgxktm-kkTL93EM3XXp8kEOvqZ9A@mail.gmail.com>
 <Z5H5Lf0YZlkxI1n4@kekkonen.localdomain> <CAHCN7xL+sQdt=kL_jM2W0LeoiRS7eEufbm5cwvNNtvxR-xDM5A@mail.gmail.com>
In-Reply-To: <CAHCN7xL+sQdt=kL_jM2W0LeoiRS7eEufbm5cwvNNtvxR-xDM5A@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 23 Jan 2025 15:29:04 +0000
X-Gm-Features: AbW1kvZhbLGT_nASS33zuf_yeRU7_EFrq3GE05TsjIAygm5L36BuNv4Wp0BzKLo
Message-ID: <CAPY8ntDAGMG0At+1+2f0Ddiwy5f6FCmNewSoxyXX6_5sNG51xg@mail.gmail.com>
Subject: Re: [PATCH] media: imx219: Adjust PLL settings based on the number of
 MIPI lanes
To: Adam Ford <aford173@gmail.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peyton Howe <peyton.howe@bellsouth.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adam

On Thu, 23 Jan 2025 at 14:10, Adam Ford <aford173@gmail.com> wrote:
>
> On Thu, Jan 23, 2025 at 2:09=E2=80=AFAM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Dave,
> >
> > On Wed, Jan 22, 2025 at 04:24:10PM +0000, Dave Stevenson wrote:
> > > Hi Sakari
> > >
> > > On Wed, 22 Jan 2025 at 12:01, Sakari Ailus <sakari.ailus@linux.intel.=
com> wrote:
> > > >
> > > > Hi Dave,
> > > >
> > > > On Mon, Jan 20, 2025 at 11:35:40AM +0000, Dave Stevenson wrote:
> > > > > Commit ceddfd4493b3 ("media: i2c: imx219: Support four-lane opera=
tion")
> > > > > added support for device tree to allow configuration of the senso=
r to
> > > > > use 4 lanes with a link frequency of 363MHz, and amended the adve=
rtised
> > > > > pixel rate to 280.8MPix/s.
> > > > >
> > > > > However it didn't change any of the PLL settings, so actually it =
would
> > > > > have been running overclocked in the MIPI block, and with the fra=
me
> > > > > rate and exposure calculations being wrong as the pixel rate was
> > > > > unchanged.
> > > > >
> > > > > The pixel rate and link frequency advertised were taken from the =
"Clock
> > > > > Setting Example" section of the datasheet. However those are base=
d on an
> > > > > external clock of 12MHz, and are unachievable with a clock of 24M=
Hz - it
> > > > > seems PREPLLCLK_VT_DIV and PREPLLCK_OP_DIV can ONLY be set via th=
e
> > > > > automatic configuration documented in "9-1-2 EXCK_FREQ setting de=
pend on
> > > > > INCK frequency", not by writing the registers.
> > > > > The closest we can get with a 24MHz clock is 281.6MPix/s and 364M=
Hz.
> > > > >
> > > > > Dropping all support for the 363MHz link frequency would cause pr=
oblems
> > > > > for existing users, so allow it, but log a warning that the reque=
sted
> > > > > value is being changed to the supported one.
> > > > >
> > > > > Fixes: ceddfd4493b3 ("media: i2c: imx219: Support four-lane opera=
tion")
> > > > > Co-developed-by: Peyton Howe <peyton.howe@bellsouth.net>
> > > > > Signed-off-by: Peyton Howe <peyton.howe@bellsouth.net>
> > > > > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > > > > ---
> > > > > This was fed back to us by Peyton Howe as giving image corruption
> > > > > on a Raspberry Pi with DF Robot imx219 module, and confirmed with
> > > > > a Soho Enterprises module.
> > > > > Effectively the module was being overclocked and misbehaving.
> > > > >
> > > > > With this patch and the Soho Enterprises module no image corrupti=
on
> > > > > is observed, and the frame rates are spot on. I haven't checked
> > > > > exposure times, but those should follow frame rate as they are
> > > > > based on the same clock.
> > > > > ---
> > > > >  drivers/media/i2c/imx219.c | 78 ++++++++++++++++++++++++++++++++=
++++----------
> > > > >  1 file changed, 61 insertions(+), 17 deletions(-)
> > > > >
> > > > > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx21=
9.c
> > > > > index 2d54cea113e1..562b3eb0cb1e 100644
> > > > > --- a/drivers/media/i2c/imx219.c
> > > > > +++ b/drivers/media/i2c/imx219.c
> > > > > @@ -133,10 +133,11 @@
> > > > >
> > > > >  /* Pixel rate is fixed for all the modes */
> > > > >  #define IMX219_PIXEL_RATE            182400000
> > > > > -#define IMX219_PIXEL_RATE_4LANE              280800000
> > > > > +#define IMX219_PIXEL_RATE_4LANE              281600000
> > > > >
> > > > >  #define IMX219_DEFAULT_LINK_FREQ     456000000
> > > > > -#define IMX219_DEFAULT_LINK_FREQ_4LANE       363000000
> > > > > +#define IMX219_DEFAULT_LINK_FREQ_4LANE_UNSUPPORTED   363000000
> > > > > +#define IMX219_DEFAULT_LINK_FREQ_4LANE       364000000
> > > >
> > > > This shows again the ill effects of register list based drivers. :-=
(
> > >
> > > Seeing as it was the PLL setup that was wrong, I believe the only
> > > drivers that may have avoided it are MT9P031, AR0521, and CCS assumin=
g
> > > they compute all PLL settings correctly off an arbitrary pixel clock.
> >
> > ov5640 does that, too, but it has a mode list.
> >
> > >
> > > Unfortunately I had no hardware to test the original patch adding 4
> > > lane support, and as the datasheet doesn't lay out the actual PLL
> > > configuration required for each option I hadn't twigged it was
> > > required. I would have hoped that the author of that patch would have
> > > noticed the frame rates were wrong, but things are never perfect.
>
> I didn't see video issues when I submitted the original patch.  I
> don't know if I just lucked out with having hardware that tolerated
> overclocking, or if it was due to the resolution or frame rate I was
> testing.

Video issues are probably down to the silicon lottery as you're
effectively overclocking. Some sensors will do it happily, and others
won't.

> > >
> > > And I assume that your comment means that we won't see Intel
> > > submitting any register list based drivers in future? I'll be quite
> > > happy not having to rework them due to only supporting a 19.2MHz cloc=
k
> > > :-)
>
> My original design for the IMX219 didn't use a 24MHz ref clock, but I
> noticed the datasheet supported different ref clocks.  I had
> considered adding support for the clock we originally designed, but I
> convinced the hardware guys to swap out the clock, so didn't spend a
> lot of time on the investigating the PLL's or clocking structure.
> Ironically, I was afraid to break something, which I apparently
> succeeded in doing anyway.  :-(
>
> Sorry about that.

As they say, s**t happens.
Most of the Sony sensors I've been working with over the last few
years keep the same pixel array PLL configuration for all modes, and
rely on HBLANK and the array to MIPI FIFO to match the difference. I
suspect my brain was thinking imx219 adopted that approach when I
originally looked at your patch, so it didn't ring alarm bells.

I am slightly surprised that you didn't see the frame rates being off,
but perhaps in your use case it doesn't matter. Measuring exposure
times is a bit more involved.

> >
> > I'd wish I could say I won't merge any new register list based drivers =
but
> > that would mean there would be very, very few new sensor drivers. :-(
> > Register list based are here to stay, I'm afraid.
> >
> > >
> > > > >
> > > > >  /* IMX219 native and active pixel array size. */
> > > > >  #define IMX219_NATIVE_WIDTH          3296U
> > > > > @@ -168,15 +169,6 @@ static const struct cci_reg_sequence imx219_=
common_regs[] =3D {
> > > > >       { CCI_REG8(0x30eb), 0x05 },
> > > > >       { CCI_REG8(0x30eb), 0x09 },
> > > > >
> > > > > -     /* PLL Clock Table */
> > > > > -     { IMX219_REG_VTPXCK_DIV, 5 },
> > > > > -     { IMX219_REG_VTSYCK_DIV, 1 },
> > > > > -     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 =3D AUTO se=
t */
> > > > > -     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 =3D AUTO se=
t */
> > > > > -     { IMX219_REG_PLL_VT_MPY, 57 },
> > > > > -     { IMX219_REG_OPSYCK_DIV, 1 },
> > > > > -     { IMX219_REG_PLL_OP_MPY, 114 },
> > > > > -
> > > > >       /* Undocumented registers */
> > > > >       { CCI_REG8(0x455e), 0x00 },
> > > > >       { CCI_REG8(0x471e), 0x4b },
> > > > > @@ -201,6 +193,34 @@ static const struct cci_reg_sequence imx219_=
common_regs[] =3D {
> > > > >       { IMX219_REG_EXCK_FREQ, IMX219_EXCK_FREQ(IMX219_XCLK_FREQ /=
 1000000) },
> > > > >  };
> > > > >
> > > > > +static const struct cci_reg_sequence imx219_2lane_regs[] =3D {
> > > > > +     /* PLL Clock Table */
> > > > > +     { IMX219_REG_VTPXCK_DIV, 5 },
> > > > > +     { IMX219_REG_VTSYCK_DIV, 1 },
> > > > > +     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 =3D AUTO se=
t */
> > > > > +     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 =3D AUTO se=
t */
> > > > > +     { IMX219_REG_PLL_VT_MPY, 57 },
> > > > > +     { IMX219_REG_OPSYCK_DIV, 1 },
> > > > > +     { IMX219_REG_PLL_OP_MPY, 114 },
> > > > > +
> > > > > +     /* 2-Lane CSI Mode */
> > > > > +     { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_2_LANE_MODE },
> > > > > +};
> > > > > +
> > > > > +static const struct cci_reg_sequence imx219_4lane_regs[] =3D {
> > > > > +     /* PLL Clock Table */
> > > > > +     { IMX219_REG_VTPXCK_DIV, 5 },
> > > > > +     { IMX219_REG_VTSYCK_DIV, 1 },
> > > > > +     { IMX219_REG_PREPLLCK_VT_DIV, 3 },      /* 0x03 =3D AUTO se=
t */
> > > > > +     { IMX219_REG_PREPLLCK_OP_DIV, 3 },      /* 0x03 =3D AUTO se=
t */
> > > > > +     { IMX219_REG_PLL_VT_MPY, 88 },
> > > > > +     { IMX219_REG_OPSYCK_DIV, 1 },
> > > > > +     { IMX219_REG_PLL_OP_MPY, 91 },
> > > > > +
> > > > > +     /* 4-Lane CSI Mode */
> > > > > +     { IMX219_REG_CSI_LANE_MODE, IMX219_CSI_4_LANE_MODE },
> > > > > +};
>
> Instead of having a few tables of registers, would it make sense to
> have one common table and a small function to dynamically calculate
> these registers based on the ref clock and the desired link rate?
> Several of these values appear to be duplicates anyway.

If we switched to using the PLL libraries to handle arbitrary clocks,
then that would be one thing.
In this case we only have the two configurations so IMHO the overhead
is minimal, and it keeps it clear.

We as Raspberry Pi are probably the main user of the driver, and we
have no need to develop the driver further for alternate clock, pixel,
or link frequencies.
If we did, then the alternative I'd propose is creating a struct with
each of the PLL parameters, and then a function to convert that into
register writes. I don't feel it's necessary at this point in time
though.

(Sakari's comment may have given me a little prod further to see if we
can do dynamic PLL configuration for future sensor drivers though)

> > > > > +
> > > > >  static const s64 imx219_link_freq_menu[] =3D {
> > > > >       IMX219_DEFAULT_LINK_FREQ,
> > > > >  };
> > > > > @@ -662,9 +682,11 @@ static int imx219_set_framefmt(struct imx219=
 *imx219,
> > > > >
> > > > >  static int imx219_configure_lanes(struct imx219 *imx219)
> > > > >  {
> > > > > -     return cci_write(imx219->regmap, IMX219_REG_CSI_LANE_MODE,
> > > > > -                      imx219->lanes =3D=3D 2 ? IMX219_CSI_2_LANE=
_MODE :
> > > > > -                      IMX219_CSI_4_LANE_MODE, NULL);
> > > > > +     /* Write the appropriate PLL settings for the number of MIP=
I lanes */
> > > > > +     return cci_multi_reg_write(imx219->regmap,
> > > > > +                               imx219->lanes =3D=3D 2 ? imx219_2=
lane_regs : imx219_4lane_regs,
> > > > > +                               imx219->lanes =3D=3D 2 ? ARRAY_SI=
ZE(imx219_2lane_regs) :
> > > > > +                               ARRAY_SIZE(imx219_4lane_regs), NU=
LL);
> > > > >  };
> > > > >
> > > > >  static int imx219_start_streaming(struct imx219 *imx219,
> > > > > @@ -1036,6 +1058,7 @@ static int imx219_check_hwcfg(struct device=
 *dev, struct imx219 *imx219)
> > > > >               .bus_type =3D V4L2_MBUS_CSI2_DPHY
> > > > >       };
> > > > >       int ret =3D -EINVAL;
> > > > > +     bool link_frequency_valid =3D false;
> > > > >
> > > > >       endpoint =3D fwnode_graph_get_next_endpoint(dev_fwnode(dev)=
, NULL);
> > > > >       if (!endpoint)
> > > > > @@ -1062,9 +1085,30 @@ static int imx219_check_hwcfg(struct devic=
e *dev, struct imx219 *imx219)
> > > > >               goto error_out;
> > > > >       }
> > > > >
> > > > > -     if (ep_cfg.nr_of_link_frequencies !=3D 1 ||
> > > > > -        (ep_cfg.link_frequencies[0] !=3D ((imx219->lanes =3D=3D =
2) ?
> > > > > -         IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LA=
NE))) {
> > > > > +     if (ep_cfg.nr_of_link_frequencies =3D=3D 1) {
> > > > > +             switch (imx219->lanes) {
> > > > > +             case 2:
> > > > > +                     if (ep_cfg.link_frequencies[0] =3D=3D
> > > > > +                                             IMX219_DEFAULT_LINK=
_FREQ)
> > > > > +                             link_frequency_valid =3D true;
> > > > > +                     break;
> > > > > +             case 4:
> > > > > +                     if (ep_cfg.link_frequencies[0] =3D=3D
> > > > > +                                             IMX219_DEFAULT_LINK=
_FREQ_4LANE)
> > > > > +                             link_frequency_valid =3D true;
> > > > > +                     else if (ep_cfg.link_frequencies[0] =3D=3D
> > > > > +                                IMX219_DEFAULT_LINK_FREQ_4LANE_U=
NSUPPORTED) {
> > > > > +                             dev_warn(dev, "Link frequency of %d=
 not supported, but has been incorrectly advertised previously\n",
> > > > > +                                      IMX219_DEFAULT_LINK_FREQ_4=
LANE_UNSUPPORTED);
> > > > > +                             dev_warn(dev, "Using link frequency=
 of %d\n",
> > > > > +                                      IMX219_DEFAULT_LINK_FREQ_4=
LANE);
>
> I grepped the code for 363000000 to see if anyone was using it in
> their device tree.  Maybe I missed something in linux-next, but I
> didn't see it.  I know I didn't push my camera device tree entries for
> the two devices I had tested, because I was going to use them as
> device tree overlays and never got around to pushing them upstream,
> but I do occasionally test them.  If nobody has a wrong device tree
> entry, it seems reasonable to me to simplify this code by just
> changing it from 363000000 to 364000000 and eliminate the stuff for
> the the unsupported value.

My view is that it would still be a regression to drop support, even
if it isn't against a mainline dt or overlay.
The handling of it is a total of about 7 lines of code, so it's not a
massive overhead.

  Dave

> > > >
> > > > Would it be helpful to use v4l2_link_freq_to_bitmap() here? The old
> > > > frequency requires separate handling but I guess you'll still want =
to
> > > > expose the correct frequency to the user space so it should be just=
 one
> > > > condition.
> > >
> > > I've done a quick prototype using it. I'm not sure it's any cleaner,
> > > and possibly ends up being more verbose.
> > >
> > > As I see it, either you end up with a call to v4l2_link_freq_to_bitma=
p
> > > for each of the 2 and 4 lane cases (6 lines each due to the number of
> > > parameters), or you combine both 2 & 4 lane frequency options into on=
e
> > > array and then handle that certain bit options are only valid for one
> > > or other option, and pass the right value in when calling
> > > v4l2_ctrl_new_int_menu(..., V4L2_CID_LINK_FREQ...).
> > > Handling the unsupported link frequency requires knowledge of the
> > > positions in the array, so either hard coded indices or needing an
> > > enum for each index.
> > >
> > > I've pushed my quick patch to
> > > https://github.com/6by9/linux/tree/media_imx219_4lane.
> > > Personally I think it detracts from readability in this case, but I'm
> > > happy to switch to a cleaned up version of it if you view it as
> > > better.
> >
>
> Thanks for looking at this.
>
> > I was thinking of separate frequency lists for all three cases. That wa=
y
> > you'd avoid almost all manual checks of the frequencies.
> >
> > The question I'd also have is whether we should try to continue to indi=
cate
> > the incorrect frequency or not. The values are not an integral part of =
the
> > ABI in my view as new ones can be added, even for the same board. And i=
n
> > this case there's just a single one in any given case.
> >
> > This information is also mainly used to configure the receiver timing a=
nd
> > wrong values here could lead to errors in reception.
> >
> > IOW, I'd just show the correct value, independently of what's in firmwa=
re.
> >
> > --
> > Kind regards,
> >
> > Sakari Ailus

