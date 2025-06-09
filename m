Return-Path: <linux-media+bounces-34356-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F758AD20EB
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 16:34:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D27DB1695D5
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 14:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 967BB25CC49;
	Mon,  9 Jun 2025 14:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="mFIGm8cz"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794BB259CBA
	for <linux-media@vger.kernel.org>; Mon,  9 Jun 2025 14:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479633; cv=none; b=TzcZdgXjr7NbZvZ3hhX0faEYFjuHT5fS81pTYjEgP4uYpAxjRthiHufVGYig/C0pAJV78PEP0/s0znB7XXWcXActkMevJOvNAzpePWTwUekv0Q4kUFgdNcyxzwwrstR3sBhy/vVC9HF/kvRExmDGTlYbJB5n+6iLv7QUseJ9RXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479633; c=relaxed/simple;
	bh=i3wBGBn4gVrChGX5tMas+8u9RupFJTSeeGp5dq6Xf24=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZAB0Fm4LoYub4atAExq3tjUoZPUnFityyzbyV1qHpIFijhPLbck29ez1RolQDXqLhZZBvXOZCNzqcnfT4CUpYzYyM5VUKA/2YtNLgdHfVLo7bRYspp3mLcZCADrBfsJw7ophZb6meara3ltiPSZUBpM7Hq3IJ8YTs1DzQR/cvUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=mFIGm8cz; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e81cf6103a6so1176147276.3
        for <linux-media@vger.kernel.org>; Mon, 09 Jun 2025 07:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1749479629; x=1750084429; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sRem6DUXALCMBVMdkPkqunnXTIQihy9/t+dbXKMENhA=;
        b=mFIGm8cz1X+IgEcioS0MntgCwtbTXK7W/A3QVjOsP+vVG6dC4L066d9k9DP84ilClA
         NJ6GZQm4Cs+wb2Zx/MOtRk6+b8Ysg0t/m+1QwF84Y2Ixvol3foR9B8u+xr+qwDKpwYrh
         792TP+jQRDi80Z5uFZCXjBcyTTiTz9/i07nJq/07Ztko2gxPdCMkfb3NbS2Un4n0mG0D
         sfxRF2IKDqjyDqYsh40RwjURQGMM6u/34YrgcY0ikcDI4ARqgRVFmzVz7ZRWjV3kqbBU
         PB+FB2utVyMD6po7LNAZ7fEDh54ybatStyHCjSM5pw46SzJrulXvxRn70KkzWCI4KnZ3
         TEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479629; x=1750084429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRem6DUXALCMBVMdkPkqunnXTIQihy9/t+dbXKMENhA=;
        b=TlYdyAEGLj1qvIa2bJkf6wLFJcvL00vLUSLVb0ZBrgaI/ptAmdM5PUlaKSNhBMpod0
         QS9IKgs2fev06uuOeFfyzVgfhW7pYnlUp+kq/J3iTJKzIuBTaSkRIcU6WHO1k5RCdbtR
         0ooSi4oFb37bxB5+tDjmYvYDr8M5dehgpSEq4N+r2of1W1wgJpJdOXUQF8dDobwsc9bM
         SOGnzycixVjr0GxIWhgXzKeodrvUkc7Jc/WRz8aH9PXe7YtRwCYCE1+ZRCUrQHJCBlIR
         pcqqqcVR3aIRiLdD/qFicUc1x2ThkZQMyAwaYv/KvCvYMaFKD8zO+Q+RLmnnJUewrb/Z
         LbWA==
X-Forwarded-Encrypted: i=1; AJvYcCXkRiMWYj+Tv6JnZTGx7hHfIRO/3lsxngrxGUacAS6kuOXInRxiOohst63Ea8bcH3RFwWhiVrLhBVHEqw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyekpeZUf1K0ypi7kvER695XFILzu0MYQv/vK3aY4slNkjeUB4c
	CcM8JfyBFV5pPYf+RmIC7kaGTqMeQIIv09bwgvXnAdbr3kyDxJn/vK6yRFz/mAw3c7jjm6R+hw4
	2iE9hFP+1x7JfLco/oDHw8q8LuhkyFK7BYmmVseK1MA==
X-Gm-Gg: ASbGncsa1yNfdAHbTvgWJCqVpxBf6UUFIlynMrAumfuBfgcS5ftMuWdKNIvgFOws91O
	ps3yXSvdeguyrjynlTmRukWlivVG4Ny5RO2Gx+hqNw89U3vEvgSdXUgyOOQmHCCef6X9+xPpzy/
	/PL32s8m9j6D+5/kE3iE9DY4ujHPotu3ucGodffwMCarjvjZLfvIyuviAGjgDD3vPy
X-Google-Smtp-Source: AGHT+IG1XJVR1tbSdYVEWb4FS9GgmPTyeQbC5abWxdU05n6qKza4L8IcMKs32v/CHUtfg34znpezTvSPYt1ejigyCiQ=
X-Received: by 2002:a05:6902:100a:b0:e7d:c56f:a871 with SMTP id
 3f1490d57ef6-e81a21ee9f8mr16917604276.31.1749479629037; Mon, 09 Jun 2025
 07:33:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606-rpi-unicam-rgb-bgr-fix-v1-1-9930b963f3eb@kernel.org> <20250609003751.GD14545@pendragon.ideasonboard.com>
In-Reply-To: <20250609003751.GD14545@pendragon.ideasonboard.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Mon, 9 Jun 2025 15:33:29 +0100
X-Gm-Features: AX0GCFtDywSf6GaR04ACAWb_r7XEMRsKC-bKUld6TILW38C8e_WYvs7YAoWpTFY
Message-ID: <CAPY8ntCnz6nkJSredd-sgMr87=0vuZ0OtfiMoPOfCZisKkzTHg@mail.gmail.com>
Subject: Re: [PATCH] media: bcm2835-unicam: Remove RGB24 support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, 
	Naushir Patuck <naush@raspberrypi.com>, linux-media@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Laurent & Maxime

On Mon, 9 Jun 2025 at 01:38, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Maxime,
>
> Thank you for the patch.
>
> On Fri, Jun 06, 2025 at 04:53:03PM +0200, Maxime Ripard wrote:
> > The RGB24 V4L2 format is defined as a pixel format with 8 bits per
> > components, with the components being in the red, green, and blue order
> > from left to right.
> >
> > The RGB MIPI-CSI2 is defined in the specification (Section 11.3.1,
> > RGB888) with blue coming first, then green, then red. So the opposite of
> > what V4L2 means by RGB.
> >
> > Since the hardware cannot reorder the components, this means that when
> > selecting the RGB24 format, you get inverted red and blue components
> > compared to what you'd expect.
> >
> > The driver already supports BGR24, so we can simply remove the RGB24
> > format from the driver.
>
> The only reason I could think of to explain why the driver exposes
> V4L2_PIX_FMT_RGB24 is to support CSI-2 sources that transfer RGB888 data
> with a non-standard order. I don't know what hardware would do that.
> Dave, Naush, do you recall why this pixel format is supported by the
> unicam driver ?

I've lost track of exactly what gets validated along the pipeline.
unicam_video_link_validate [1] looks to ensure that the V4L2 pixel
format and media bus codes match as listed in the table.

tc358743, adv7604, adv7511, and adv748x are all saying they produce
MEDIA_BUS_FMT_RGB888_1X24
ov5640 says it produces MEDIA_BUS_FMT_BGR888_1X24.

Is that an error in the ov5640 driver? If not, then both entries have
to be in the table to support all those drivers.

Looking at alvium-csi2.c and st-mipid02.c, both mappings are included
there (and RBG888 in the case of alvium).
Unicam's hardware doesn't care about the ordering as it just writes
the incoming data to memory, so having all the sensible mappings
between MEDIA_BUS_FMT_* and V4L2_PIX_FMT_* values makes sense.


My initial reaction though is that simply removing the entry won't
solve the problem anyway. You won't get a match between the
MEDIA_BUS_FMT_RGB888_1X24 requested by tc358743 and a supported V4L2
pixel format, so the link_validate will fail.
Swapping either fourcc or code between the two entries would be the
fix I was expecting.

  Dave

[1] https://github.com/torvalds/linux/blob/master/drivers/media/platform/broadcom/bcm2835-unicam.c#L2151-L2169

> > Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  drivers/media/platform/broadcom/bcm2835-unicam.c | 5 -----
> >  1 file changed, 5 deletions(-)
> >
> > diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > index f10064107d543caf867249d0566a0f42d6d8c4c6..1f549019efd53c9aae83193e74f1a3601ebf274d 100644
> > --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> > +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> > @@ -338,15 +338,10 @@ static const struct unicam_format_info unicam_image_formats[] = {
> >       /* RGB Formats */
> >               .fourcc         = V4L2_PIX_FMT_RGB565, /* gggbbbbb rrrrrggg */
> >               .code           = MEDIA_BUS_FMT_RGB565_1X16,
> >               .depth          = 16,
> >               .csi_dt         = MIPI_CSI2_DT_RGB565,
> > -     }, {
> > -             .fourcc         = V4L2_PIX_FMT_RGB24, /* rgb */
> > -             .code           = MEDIA_BUS_FMT_RGB888_1X24,
> > -             .depth          = 24,
> > -             .csi_dt         = MIPI_CSI2_DT_RGB888,
> >       }, {
> >               .fourcc         = V4L2_PIX_FMT_BGR24, /* bgr */
> >               .code           = MEDIA_BUS_FMT_BGR888_1X24,
> >               .depth          = 24,
> >               .csi_dt         = MIPI_CSI2_DT_RGB888,
> >
> > ---
> > base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> > change-id: 20250606-rpi-unicam-rgb-bgr-fix-d1b6f46a75ad
>
> --
> Regards,
>
> Laurent Pinchart

