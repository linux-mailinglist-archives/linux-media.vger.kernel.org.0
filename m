Return-Path: <linux-media+bounces-15919-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 385D094A6A2
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 13:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C9F01C21857
	for <lists+linux-media@lfdr.de>; Wed,  7 Aug 2024 11:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB7A1E2884;
	Wed,  7 Aug 2024 11:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfOa/7ux"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB1C1E2104;
	Wed,  7 Aug 2024 11:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723028859; cv=none; b=SazBSW64NiwjfQV1rz+nRqtbjRiHeeyEqoEXwy3xe33VB3h/my66dgbl+nB5DQy3t039tHCfFVCzUB1xfICS7kueqxYa3uM58Lbe9c0F4vwe78uvPQ0LKqVVB6Ru+txAU4WfOs06DeO13+uNT4t6VVmKj2jK+S6YohPJ5W52v1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723028859; c=relaxed/simple;
	bh=yzU3YfaxJ1eQUaJAaAEbaleY565ufZrHEKMAOcSYLds=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eCpW5Vyxd5vMSfq+qLQuLRJbOZeS3o2JAcMfiDXJTiogrG6ZkU3sNobJJHuIBSnLXE5rYDKJhUkuH9amVuAI1SsCzk/X00yxTkfYM/chtoLVjHSG88YOIuv/Nq0l/KKoo/EPSdP+S6CUeCv+X/JJvszxyFT/hmGi6Gio0S9S3DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfOa/7ux; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5bb477e3a6dso2023843a12.0;
        Wed, 07 Aug 2024 04:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723028856; x=1723633656; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Wfj4dgFAY6gAZ+Np+um9sk/jLkqhSgbNL79yILpP9+w=;
        b=QfOa/7uxxQNC1nPnRi3g8QRSYqYTIPlGN5USzfcGz0YfR0tSmVKljuhI6cgx2CQaN6
         6rpZiFXgc9qz12I89lMTmHbp6uYoeBKSr+P+KxVQDHg/qOvI62U1nd8DooJIv2h7zUBQ
         c30h48iwxsMrwKaogc2n/DKkkh+DKN1AaHQiWtKXhCTSqtzqv59V3T2DL56kPX3xZ2ru
         gg4MPecUcatH9a2basW8WW4I3Vg7UvYscZBfksb/XO2JANy43QxpgqFckM2ZRrOG6xDV
         UXSGNAl0hyRUyNfawMiIqA7ithSNPZokPDwogxEy9AQJ7MfUaysdk0gkCPFaNiMyozVn
         /8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723028856; x=1723633656;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wfj4dgFAY6gAZ+Np+um9sk/jLkqhSgbNL79yILpP9+w=;
        b=dHqpACVv1zwIReyz8f6zxaDkTI/3INCESL5DZKz7Yy27bWte6DbDCf3W0mKmhBVeEU
         9U5FIUCndTRK8zgf7ndy3zokNAWgvmWz3T4JNICvDy9RJ3aocU3WQ2iVO64zmUlPWiAR
         gKS8v73BY8ppu/Oattip3Y7kzFX6vzoCuv9vy52mfJo97NlyBgWkAU1LPH46klW2NwHw
         l4pQBXm8XYSTQeu7Ea91QfpYk/5rEtiK1V9ODzeV6Kb1btVEgrtprujzYr4rkEdl7nHC
         8hCRmb1fr+TYdSl/73BRkK3bX0LhzfnP1gDJ1wcdFyGS0AJyfbLC44VAoRR21NQT5R0o
         T6zA==
X-Forwarded-Encrypted: i=1; AJvYcCUmVPsKvv9ffcF7Q/qOi2lT7kTgq9CwoxLaWIzH2EJwqu1cTiLL5jDnRdp4zkrAyeLDLtLdzsd1c6yY1MkBqM5d0UhD3vPApYj4Bpt2zSvv4tJVGyG3XMLG56wfCVjv9OykQBQ8+7H3ePA=
X-Gm-Message-State: AOJu0YyeFQNBnDBpImRJmrp3or2qPKOMPiD/FvIz6121856JSQbWC96Y
	HSz3fXLCCs4AZuMSwu5/INR4C0tw8UcbzAeUlWiX1p7ZD3H0GbJ18/jOiRdBcaQJkUo1xDAzFH9
	RnJAjQabvHL3hJMcAjkf7I5kcKC0=
X-Google-Smtp-Source: AGHT+IFn9LAL6VSx+4Kcd/BNdWRcZp5CYL/F3w2vwzKOTWuGyV3447wxSIpmcWjbYApHzVTVNA6GA3SwpFkIXsV/Z2c=
X-Received: by 2002:a05:6402:b11:b0:5a1:32d1:91a6 with SMTP id
 4fb4d7f45d1cf-5b7f4295746mr12603040a12.22.1723028855775; Wed, 07 Aug 2024
 04:07:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240807-imx290-avail-v1-0-666c130c7601@skidata.com>
 <20240807-imx290-avail-v1-2-666c130c7601@skidata.com> <6072611.lOV4Wx5bFT@steina-w>
 <CAJpcXm6Bv37GUsttdGDDgX1Do+KC_xVSwHV7M5_aEuvhuv6u3A@mail.gmail.com> <20240807094957.GE21319@pendragon.ideasonboard.com>
In-Reply-To: <20240807094957.GE21319@pendragon.ideasonboard.com>
From: Benjamin Bara <bbara93@gmail.com>
Date: Wed, 7 Aug 2024 13:07:24 +0200
Message-ID: <CAJpcXm6Ey9xMX2btO+xH3MF3z39hqP5ZjkOgEUcaNY822urJ5w@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: imx290: Check for availability in probe()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Benjamin Bara <benjamin.bara@skidata.com>, arne.caspari@theimagingsource.com
Content-Type: text/plain; charset="UTF-8"

Hi!

On Wed, 7 Aug 2024 at 11:50, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Wed, Aug 07, 2024 at 10:47:39AM +0200, Benjamin Bara wrote:
> > On Wed, 7 Aug 2024 at 10:33, Alexander Stein wrote:
> > > Am Mittwoch, 7. August 2024, 10:10:28 CEST schrieb Benjamin Bara:
> > > > Currently, the V4L2 subdevice is also created when the device is not
> > > > available/connected. In this case, dmesg shows the following:
> > > >
> > > > [   10.419510] imx290 7-001a: Error writing reg 0x301c: -6
> > > > [   10.428981] imx290 7-001a: Error writing reg 0x3020: -6
> > > > [   10.442712] imx290 7-001a: Error writing reg 0x3018: -6
> > > > [   10.454018] imx290 7-001a: Error writing reg 0x3020: -6
> > > >
> > > > which seems to come from imx290_ctrl_update() after the subdev init is
> > > > finished. However, as the errors are ignored, the subdev is initialized
> > > > but simply does not work. From userspace perspective, there is no
> > > > visible difference between a working and not-working subdevice (except
> > > > when trying it out or watching for the error message).
> > > >
> > > > This commit adds a simple availability check before starting with the
> > > > subdev initialization to error out instead.
> > >
> > > There is already a patch reading the ID register at [1]. This also reads the
> > > ID register. But I don't have any documentation regarding that register,
> > > neither address nor values definitions. If there is known information about
> > > that I would prefer reading the ID and compare it to expected values.
> >
> > Thanks for the link - it seems like Laurent has dropped the patch for
> > the more recent kernel versions on their GitLab.
>
> It was a patch that I wrote as a test, and I decided not to upstream it
> as it had limited value to me. The downside with reading registers at
> probe time is that you have to power up the sensor. This can have
> undesired side effects, such as flashing a privacy LED on at boot time
> in devices that have one. There's also the increase in boot time due to
> the power up sequence, which one may want to avoid.
>
> The imx290 driver already powers up the device unconditionally at probe
> time, so reading the version register wouldn't be much of an issue I
> suppose. I would be fine merging that patch.
>
> > This was also my initial intention, but similar to you, I don't have a
> > docu describing this register, so I am not sure where the info is coming
> > from and if it really contains the identification/type info. Probably
> > Laurent has more infos on that.
>
> That's a good question. I don't see a mention of that register in the
> IMX290 datasheet I've found online
> (https://static6.arrow.com/aropdfconversion/c0c7efde6571c768020a72f59b226308b9669e45/sony_imx290lqr-c_datasheet.pdf).
> Looking at the git history, the IMX290_CHIP_ID register macro was
> introduced in an unrelated commit, without an explanation. I don't
> recall where it comes from, but I don't think I've added it randomly. It
> may have come from an out-of-tree driver.

Thanks for the info!

> I don't have an IMX290 plugged in at the moment, what's the value of the
> register ?

I currently have an imx462 available, which is not "officially supported" yet,
but basically an imx290 derivative. With your patch applied:

[   10.424187] imx290 7-001a: chip ID 0x07d0

Best regards
Benjamin

>
> > > [1] https://gitlab.com/ideasonboard/nxp/linux/-/commit/85ce725f1de7c16133bfb92b2ab0d3d84efcdb47
> > >
> > > > Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
> > > > ---
> > > >  drivers/media/i2c/imx290.c | 5 +++++
> > > >  1 file changed, 5 insertions(+)
> > > >
> > > > diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> > > > index 4150e6e4b9a6..a86076e42a36 100644
> > > > --- a/drivers/media/i2c/imx290.c
> > > > +++ b/drivers/media/i2c/imx290.c
> > > > @@ -1580,6 +1580,11 @@ static int imx290_probe(struct i2c_client *client)
> > > >       pm_runtime_set_autosuspend_delay(dev, 1000);
> > > >       pm_runtime_use_autosuspend(dev);
> > > >
> > > > +     /* Make sure the sensor is available before V4L2 subdev init. */
> > > > +     ret = cci_read(imx290->regmap, IMX290_STANDBY, NULL, NULL);
> > > > +     if (ret)
> > > > +             goto err_pm;
> > > > +
> > > >       /* Initialize the V4L2 subdev. */
> > > >       ret = imx290_subdev_init(imx290);
> > > >       if (ret)

