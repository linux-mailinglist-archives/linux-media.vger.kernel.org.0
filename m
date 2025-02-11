Return-Path: <linux-media+bounces-25980-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id ED958A30406
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 08:00:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A0A3188A0B2
	for <lists+linux-media@lfdr.de>; Tue, 11 Feb 2025 07:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B6251E9B39;
	Tue, 11 Feb 2025 07:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FhYcjiWc"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCBA1E9B23;
	Tue, 11 Feb 2025 06:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739257200; cv=none; b=sVtpinLieetoPryvWdzJGK6+qBWF47768yuekwhfVgwCE/A1gzqo7yVTidu8IttL5k6gea3/LX2loMLz0OadZmT7iQLHeUFTCH/00lbDsnYLtYBdUkTQzfCR9DJycKXJ2c08c+4X7mNQfzbgKblCfEE8SuwD9UY0EggjEygbR50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739257200; c=relaxed/simple;
	bh=4ZxTpLZh94MUWcy7Vpqzh6DT9p5a11eKjzi8y1Zclnc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7Asd6V7Bi7AjWXzNXgfsub/inbLGls5WvW2nCSLNWuGz4tGEFg/hp6nQruEIcz6qeGMW5NN+IYL/BBVSsl+RninbBfJ4gXl8zE/8DL35aebwfm71Zr7V9W4gSX0Vw8yU1ojdhzxyee7gGKZRbsGuZgB00i3Zv2sTWEwl6LiieI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FhYcjiWc; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:30ee:391a:e4dd:1a49:e64:7c19])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2B0876DF;
	Tue, 11 Feb 2025 07:58:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739257119;
	bh=4ZxTpLZh94MUWcy7Vpqzh6DT9p5a11eKjzi8y1Zclnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FhYcjiWcIc5RSF33NY1rBBvn74JlHe0MHIVBMLFdWHxybveTL/tBkC8+ocsPHepKE
	 JOD6ilGGtRIhXyvzUPFZouVsHx/LeCtY/6zjR9HbfrE4uJv+8KMiV3w7ZSSisK5SFF
	 srbIDixb7CYcOsA9ovebd8/xn/ztF78bnBKeXluI=
Date: Tue, 11 Feb 2025 12:29:44 +0530
From: Jai Luthra <jai.luthra@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v6 4/5] media: i2c: imx219: Increase minimum LLP to fix
 blocky artefacts
Message-ID: <vtxgyzvlp4tpxzeiblfi5rm25brvbgbfnfzequ3ln4ete7rigv@jit72nqfv3ya>
X-PGP-Key: http://jailuthra.in/files/public-key.asc
References: <20250204-imx219_fixes-v6-0-84ffa5030972@ideasonboard.com>
 <20250204-imx219_fixes-v6-4-84ffa5030972@ideasonboard.com>
 <CAPY8ntC1-S6zKtDvmc6EgyxP+j6rTShuG8Dr8PKb9XQr2PeS_w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPY8ntC1-S6zKtDvmc6EgyxP+j6rTShuG8Dr8PKb9XQr2PeS_w@mail.gmail.com>

Hi Dave

On Feb 10, 2025 at 19:05:52 +0000, Dave Stevenson wrote:
> Hi Jai
> 
> Thanks for the patch
> 
> On Tue, 4 Feb 2025 at 07:05, Jai Luthra <jai.luthra@ideasonboard.com> wrote:
> >
> > The sensor's internal ADC supports a minimum line length of 3448 pixels,
> > which may be too small to use with analog binning, where ADC operates on
> > two lines together. Switch to a higher minimum line length of 3560
> > pixels to fix the blocky artefacts seen with analog binning [1].
> >
> > To keep the same default framerate as before for all the modes, lower
> > the default fll value to compensate for the increase in llp.
> 
> Extending the line length as you've done reduces the maximum frame
> rate of all modes by ~3%.
> Why do we need to reduce the max frame rate for non-binned modes which
> have no artefacts?
> 
> Default frame rate is a relatively useless setting - any sensible
> application should be setting the blanking controls to configure the
> frame rate that it wants.
> 
> The datasheet does list line_length_pix default value as 3448 (0xd78),
> and 3448 is mentioned numerous times throughout the datasheet for
> calculations. Deviating from it for all modes is a brave move IMHO.
> 

I changed the minimum because 3% didn't seem like a big difference and 
it kept the driver simple. But if there are usecases that rely on the 
maximum framerate, or the default 3448 value, I think it would make 
sense to just change the minimum for binned modes.

I can do that in the next revision.

>   Dave
> 
> > [1]: https://github.com/raspberrypi/rpicam-apps/issues/281#issuecomment-1082894118
> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> >  drivers/media/i2c/imx219.c | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
> > index 8239e7ea8ec03849b339c1f314485266d4c4d8bd..e4aa6e66b673bb7a8942bf8daf27267c2884ec95 100644
> > --- a/drivers/media/i2c/imx219.c
> > +++ b/drivers/media/i2c/imx219.c
> > @@ -74,7 +74,7 @@
> >  #define IMX219_FLL_MAX                 0xffff
> >  #define IMX219_VBLANK_MIN              32
> >  #define IMX219_REG_LINE_LENGTH_A       CCI_REG16(0x0162)
> > -#define IMX219_LLP_MIN                 0x0d78
> > +#define IMX219_LLP_MIN                 0x0de8
> >  #define IMX219_LLP_MAX                 0x7ff0
> >
> >  #define IMX219_REG_X_ADD_STA_A         CCI_REG16(0x0164)
> > @@ -286,25 +286,25 @@ static const struct imx219_mode supported_modes[] = {
> >                 /* 8MPix 15fps mode */
> >                 .width = 3280,
> >                 .height = 2464,
> > -               .fll_def = 3526,
> > +               .fll_def = 3415,
> >         },
> >         {
> >                 /* 1080P 30fps cropped */
> >                 .width = 1920,
> >                 .height = 1080,
> > -               .fll_def = 1763,
> > +               .fll_def = 1707,
> >         },
> >         {
> >                 /* 2x2 binned 30fps mode */
> >                 .width = 1640,
> >                 .height = 1232,
> > -               .fll_def = 1763,
> > +               .fll_def = 1707,
> >         },
> >         {
> >                 /* 640x480 30fps mode */
> >                 .width = 640,
> >                 .height = 480,
> > -               .fll_def = 1763,
> > +               .fll_def = 1707,
> >         },
> >  };
> >
> >
> > --
> > 2.48.1
> >

