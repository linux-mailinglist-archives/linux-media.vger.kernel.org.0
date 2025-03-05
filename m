Return-Path: <linux-media+bounces-27619-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07806A4FF3C
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 14:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A2C973ACAEB
	for <lists+linux-media@lfdr.de>; Wed,  5 Mar 2025 13:00:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA42245036;
	Wed,  5 Mar 2025 13:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="crmADee2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F6D243361
	for <linux-media@vger.kernel.org>; Wed,  5 Mar 2025 13:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741179622; cv=none; b=qlbL6YEu8j73eHEFoZbzC4KvuZ1W4qHIkG+wLI2FZDGzroJ7V8cJVoUyT1O+oDKOAD5bhBUszLmnuJvsSO9bG760cQdctfOaAGDiiKObwBVh+o0UAILa21c4vfofxtOKWyRNI6Jy9v0JEogkQOvGTHA9MBocVtyTBI0o+9LwBSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741179622; c=relaxed/simple;
	bh=oDXTVw3eEEC3yng1vICnNZ71OXdSEj/QsNena9l7j6c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OeCGSSQEXuuA7MCNk4rf/KeBak9Y1lg6P2VrJEPoGnNYi3S+wZcH0yUoeOvg6PXAn2Vu60SbECAjFwgsT+uS8tW6WfX6MMi3zQ/seEs7zdITZhWZa59FmOzVFLzms8++b8sCgwCdv2Zt7vns4WgPPnzVYrs3Q8QwWAhfeMXR5LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=crmADee2; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e5dcc411189so5847490276.0
        for <linux-media@vger.kernel.org>; Wed, 05 Mar 2025 05:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1741179619; x=1741784419; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tbTRkPeLnT4t7RG89jSVZDnvU7AWOOoQFXkBGI6AsUU=;
        b=crmADee2isgmJ8lXrCvSHjt0kSJctlyAgC0emHrW6/PL/xA2aE5AMrgGOYUWw/pjo9
         kFuARwS8gACr+VyYxt9VVN2hihIhX+EkJ5rY6k7Fzr9M1PYL1tJPOv+B0TY/j8sxM0mC
         BHz8dkqLw2Au4+ID/YAu+LhJGHqqHcFgKUudVgoF5IceR556leyo7dTY6RREu1Eiwu8S
         FzpFvSievNNQzIs7w0rhg/HEpaHD9qPL+xrlfMgqJBMrFXG525ycuIxFAEHzsvLL+wtp
         jLV/QXse0JM/7QSWsG/TuamyZsX061C5Fjk0zGnllsB/JfDE/lnP3AXHlq/aDJVtKLfV
         R3Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741179619; x=1741784419;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tbTRkPeLnT4t7RG89jSVZDnvU7AWOOoQFXkBGI6AsUU=;
        b=GK3fkP9u2As6jx4suTuoAn+fRq4UP4rjQJt/VDHsEyPL2Ecca904LO+PcOHkOPe0Cv
         +CGQjWA//nAyk6mLI1ivwjYdVXvFX4e4L/gI3kbgIg2CgVIUeY5yEWiwcee+e9ZWctYj
         hpndUfIGOgJckg27uMmI7Cty3fAFeEdicxJ+ru+8fzKBj1JB9Zshm7+XzzTYIQhrap+P
         I1V2TUK2LOXPFfOiJJDCztvx7bNq5WDhZ979WwlMsbrnK8isjiK1FeNM9vLshvu293AO
         ClALWL5tn/gcgZz/rZdFK0+k+OHVWZcpbDVjbP+2HB8RVRTNYvBEFgIgRrtwZl8Ay0uu
         EboA==
X-Forwarded-Encrypted: i=1; AJvYcCWydUpLuXMglRXPq5kd/1KcN9oJJRnIIB9vDtODZo56bBSpk97YZ9JlISTqWVj0NmeMaB1/WWUIrKlFng==@vger.kernel.org
X-Gm-Message-State: AOJu0YxdA/LAZRJ3ug+kYYhrL/7wsRC2KW0hkrkDNVVRXlq+5b5JaBiM
	ySifyR+86HDIYsVI5AbNko827JFElsHD4ChXhbdtVRpPgE58JXNmL3dTj095s7GZQzwAQ3VF5f2
	PGKuv05eQy4UUWZLT4Gg/L8AunWLTNwgkzpI9sqPQGJfIXkUb
X-Gm-Gg: ASbGncss4FNGnGcLi/noco3bRvG/MBpDb8OLIHVP8KjfCOzWTpFRSPyL8ET4AIVmCUD
	rd6DSaigieiE4QZSXJMiqpI8lYM+xNVnqcZsFqV2QY95vm9SjLSR9dUBqgWxO+PVM6ZEeq9+psP
	J0x1VGhfbS8qVhkT6n2btRELDhn6oFWFEeUJYyhyEdOaIQRdsLkqDvw5F/9Q==
X-Google-Smtp-Source: AGHT+IFw6AUPeASwjb7EXKL+ooSQ218zFQKD/vfWZq92pVuKcMipQ2jIYfgwZypmF42qh9XMuqpoanJeZiqmSxboPjs=
X-Received: by 2002:a05:690c:3588:b0:6f9:7fe6:9d48 with SMTP id
 00721157ae682-6fda303799amr38246287b3.7.1741179619028; Wed, 05 Mar 2025
 05:00:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250305051442.3716817-1-shravan.chippa@microchip.com>
 <20250305051442.3716817-5-shravan.chippa@microchip.com> <174116732611.2914008.9738053002324304147@ping.linuxembedded.co.uk>
 <PH0PR11MB5611988F18EF02394E983AA881CB2@PH0PR11MB5611.namprd11.prod.outlook.com>
 <174117154242.2914008.10875320688605396953@ping.linuxembedded.co.uk>
 <Z8g6nWDe2cjumixt@kekkonen.localdomain> <174117701537.2914008.10570966567213022443@ping.linuxembedded.co.uk>
In-Reply-To: <174117701537.2914008.10570966567213022443@ping.linuxembedded.co.uk>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 5 Mar 2025 12:59:56 +0000
X-Gm-Features: AQ5f1Jr_i7cj-B9y9QSgwJDBmxkJp89iE8j6_doew5kmxSD2c9tdVqssH2vJmkc
Message-ID: <CAPY8ntCW+bRFMY4OxzKV2-NfzWb_g0dJoPW8_irkmLmNttBVQg@mail.gmail.com>
Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p resolutions
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Shravan.Chippa@microchip.com, 
	mchehab@kernel.org, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor.Dooley@microchip.com, Valentina.FernandezAlanis@microchip.com, 
	Praveen.Kumar@microchip.com
Content-Type: text/plain; charset="UTF-8"

Hi Kieran, Sakari, Shravan, and Tarang

On Wed, 5 Mar 2025 at 12:17, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Sakari Ailus (2025-03-05 11:50:53)
> > Hi Kieran, Shravan,
> >
> > On Wed, Mar 05, 2025 at 10:45:42AM +0000, Kieran Bingham wrote:
> > > Quoting Shravan.Chippa@microchip.com (2025-03-05 10:22:12)
> > > > Hi Kieran
> > > >
> > > > > -----Original Message-----
> > > > > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > > > Sent: Wednesday, March 5, 2025 3:05 PM
> > > > > To: mchehab@kernel.org; sakari.ailus@linux.intel.com; shravan Chippa -
> > > > > I35088 <Shravan.Chippa@microchip.com>
> > > > > Cc: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; Conor Dooley
> > > > > - M52691 <Conor.Dooley@microchip.com>; Valentina Fernandez Alanis -
> > > > > M63239 <Valentina.FernandezAlanis@microchip.com>; Praveen Kumar -
> > > > > I30718 <Praveen.Kumar@microchip.com>; shravan Chippa - I35088
> > > > > <Shravan.Chippa@microchip.com>
> > > > > Subject: Re: [PATCH V7 4/4] media: i2c: imx334: add modes for 720p and 480p
> > > > > resolutions
> > > > >
> > > > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the
> > > > > content is safe
> > > > >
> > > > > Quoting shravan kumar (2025-03-05 05:14:42)
> > > > > > From: Shravan Chippa <shravan.chippa@microchip.com>
> > > > > >
> > > > > > Added support for 1280x720@30 and 640x480@30 resolutions

Silly question - why is the frame rate specified here? Is that the
minimum, maximum, or default framerate, as we have V4L2_CID_VBLANK for
varying the frame rate.

> > > > > >
> > > > > > Signed-off-by: Shravan Chippa <shravan.chippa@microchip.com>
> > > > > > ---
> > > > > >  drivers/media/i2c/imx334.c | 66
> > > > > > ++++++++++++++++++++++++++++++++++++++
> > > > > >  1 file changed, 66 insertions(+)
> > > > > >
> > > > > > diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
> > > > > > index a7c0bd38c9b8..8cd1eecd0143 100644
> > > > > > --- a/drivers/media/i2c/imx334.c
> > > > > > +++ b/drivers/media/i2c/imx334.c
> > > > > > @@ -314,6 +314,46 @@ static const struct imx334_reg
> > > > > common_mode_regs[] = {
> > > > > >         {0x3002, 0x00},
> > > > > >  };
> > > > > >
> > > > > > +/* Sensor mode registers for 640x480@30fps */ static const struct
> > > > > > +imx334_reg mode_640x480_regs[] = {
> > > > > > +       {0x302c, 0x70},
> > > > > > +       {0x302d, 0x06},
> > > > >
> > > > > These two are a single 16 bit register HTRIMMING_START = 1648
> > > > >
> > > > > > +       {0x302e, 0x80},
> > > > > > +       {0x302f, 0x02},
> > > > >
> > > > > These two are a single 16 bit register HNUM = 640
> > > > >
> > > > > > +       {0x3074, 0x48},
> > > > > > +       {0x3075, 0x07},
> > > > >
> > > > > These two are a single 16 bit (well, 12 bit value) AREA3_ST_ADR_1 = 1864
> > > > >
> > > > > > +       {0x308e, 0x49},
> > > > > > +       {0x308f, 0x07},
> > > > >
> > > > > These two are a single 16 bit register AREA3_ST_ADR_2 = 1865
> > > > >
> > > > > > +       {0x3076, 0xe0},
> > > > > > +       {0x3077, 0x01},
> > > > >
> > > > > These two are a single 16 bit register AREA3_WIDTH_1 = 480
> > > > >
> > > > > > +       {0x3090, 0xe0},
> > > > > > +       {0x3091, 0x01},
> > > > >
> > > > > These two are a single 16 bit register AREA3_WIDTH_2 = 480
> > > > >
> > > > > > +       {0x3308, 0xe0},
> > > > > > +       {0x3309, 0x01},
> > > > >
> > > > > These two are a single 16 bit register Y_OUT_SIZE
> > > > >
> > > > > Don't you think
> > > > >         { Y_OUT_SIZE, 480 },
> > > > >
> > > > > Is so much more readable and easier to comprehend and maintain?
> > > > >
> > > > >
> > > > > > +       {0x30d8, 0x30},
> > > > > > +       {0x30d9, 0x0b},
> > > > >
> > > > > These two are a single 16 bit register UNREAD_ED_ADR = 2864
> > > > >
> > > > > > +};
> > > > >
> > > > > I'm still sad that we can all know the names of all these registers and yet this
> > > > > is writing new tables of hex values.
> > > >
> > > > Do you want me use call like bellow API with register names:
> > > > CCI_REG16_LE(0x30d8);
> > > > cci_write();
> > > > cci_multi_reg_write();
> > > > devm_cci_regmap_init_i2c();
> > >
> > >
> > > Yes please, I would want that very much. I'm not very good at reading
> > > and storing hex values in my head! That's why I broke down the above
> > > registers to strings and decimal values.
> >
> > I agree, it'd be good to do these while changing the driver now. I think it
> > could be done after adding the new modes, now that the patches already
> > exist.
>
> That's ok with me! Either way I'm happy to see the drivers are getting
> cleaned up!
>
> >
> > >
> > >
> > > The discussions at
> > > https://lore.kernel.org/all/PH0PR11MB5611FD22CF6E12F7226FA9C081E12@PH0PR11MB5611.namprd11.prod.outlook.com/
> > > reports the full datasheet, and I stated:
> > >
> > >
> > > > > > This is an enormous amount of duplicated data that could be factored
> > > > > > out.
> > > > > >
> > > > > > These are also /very/ common against the existing mode register
> > > > > > tables too.
> > > > > >
> > > > > > I think several things need to happen in this driver:
> > > > > >
> > > > > >  1. It should be converted to use the CCI helpers.
> > > > > >  2. Whereever identifiable, the register names should be used
> > > > > > instead of
> > > > > >     just the addresses.
> > > > > >  3. The common factors of these tables should be de-duplicated.
> > > > > >
> > > > > > In your additions you only have differences in the following
> > > > > > registers from those entire tables:
> > >
> > > You replied with
> > >
> > > > >
> > > > > I will try to optimize camera resolution array register value usage by
> > > > > writing common register array values.
> > >
> > > which you have done (point 3), and is great progress in the series.
> > >
> > > Further down in the thread I stated:
> > >
> > >
> > > > > >  4. And ideally - the differences which determine the modes should
> > > > > > be
> > > > > >     factored out to calculations so that we are not writing out
> > > > > > large
> > > > > >     tables just to write a parameterised frame size.
> > > > > >
> > > > > >
> > > > > > I would beleive that at least steps 1 and 3 would be achievable, 2
> > > > > > and 4 would depend upon access to the datasheet.
> > > > > >
> > >
> > >
> > > I still believe steps 1 is important to this development. You have done
> > > step 3 I think. And now both step 2 and (later) step 4 are possible as we
> > > have the datasheet.
> >
> > In this case the datasheet doesn't appear to be documenting the PLL.
>
> :-(
>
> But at least we will have enough to handle all the vmax/and cropping
> more directly.

I haven't fully analysed the datasheet, but isn't this just another
Sony Starvis sensor, working in the same way as imx415 and imx290?

I don't think you can reasonably treat it as generic PLLs without
effectively reverse engineering the hardware.
INCK gets handled by the registers as specified in "INCK Setting" to
get the source clocks consistent regardless of INCK.
Source clock vs link frequency registers need to be teased out of the
"INCK Setting Register" table. Quick analysis:
- BCWAIT_TIME, CP_WAIT, INCKSEL2, INCKSEL3, and INCKSEL4 only change with INCK.
- PLL_IF_GC and SYS_MODE only change with link frequency.
- INCKSEL1 is the awkward one if there is a need to support the
1188Mbit/s data rate, otherwise it only changes with INCK.

The pixel rate stays the same for all modes (binning may be the exception here)
HMAX (V4L2_CID_HBLANK) is changed to vary the line time.
Whilst VMAX is listed as a constant for each mode, it can be changed
to alter frame rate.

Link frequency is independent of resolution, but HMAX has to be set to
ensure that we don't overflow the FIFO between array and CSI block.


Is there anyone selling an IMX334 module for use with SBCs at a
sensible price? I'm always up for tinkering with sensors, even if I'm
not meant to be!

  Dave

> --
> Kieran
>
>
> >
> > --
> > Regards,
> >
> > Sakari Ailus
>

