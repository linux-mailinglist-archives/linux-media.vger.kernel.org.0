Return-Path: <linux-media+bounces-26966-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 32950A444E6
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 16:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2003742047E
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 15:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3169E17BB16;
	Tue, 25 Feb 2025 15:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Vm8jpCp2"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7425156F3A;
	Tue, 25 Feb 2025 15:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740498391; cv=none; b=cNfByMIOGyP69Z3cq/RfukX7V4jfKxfaE9OOUD9vb8xeWcdffYrzt+E7Hktxl3X5+awfFfSE4RboYNRnnxYZXyWKwFXRtLDyu2And7e6dGSG7YJPt5EChW1EwCHs9EwLPhUxug2ZjBjHpO4JXxAJG/jLsBGbi+S803ZTs8xqo7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740498391; c=relaxed/simple;
	bh=RLEyNw4p0IjCU146brG7GSEawkup6y5x3nH2i+FMet0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s842XgJjGU9qR4Ym517NDO7Az/fGYUePZ8i5018EHrQPJTZivUFyIJRIv2Zsag+X/nE36wGcA7ZDTu+JfYusvG29lF4VpEo9OfWnm3/1DLvt0MFo4/NA6/rcgful6oCnugg6JoxZsFGK1ZOyMQUto5FCR3T9wBV+v1vdm+dxdfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Vm8jpCp2; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 833E282E;
	Tue, 25 Feb 2025 16:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740498300;
	bh=RLEyNw4p0IjCU146brG7GSEawkup6y5x3nH2i+FMet0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vm8jpCp2ozlRiYp9yEnZeN9pDF8gmlJ3pEroM1P40CuyV9C9j79KOzuu5/5pjt2Wq
	 3bf+RwsLHqi8DuswwQ6Acs3Q1db1TFONBTd0KancqMjPHibSlB2XGPsb047mkQFEIb
	 Dj7Fi4CTknlti0ufmAzrOm+wfJU9mvnRHghj2MJg=
Date: Tue, 25 Feb 2025 17:46:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Richard Leitner <richard.leitner@linux.dev>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: i2c: ov9282: fix analogue gain maximum
Message-ID: <20250225154607.GA18426@pendragon.ideasonboard.com>
References: <20250225-b4-ov9282-gain-v1-0-a24af2820dde@linux.dev>
 <20250225-b4-ov9282-gain-v1-3-a24af2820dde@linux.dev>
 <CAPY8ntCLUVX91+QYbFk-bHQumuvs70CuDLe85VZRTS2wW-tYHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPY8ntCLUVX91+QYbFk-bHQumuvs70CuDLe85VZRTS2wW-tYHw@mail.gmail.com>

On Tue, Feb 25, 2025 at 03:30:16PM +0000, Dave Stevenson wrote:
> On Tue, 25 Feb 2025 at 13:09, Richard Leitner wrote:
> >
> > The sensors analogue gain is stored within two "LONG GAIN" registers
> > (0x3508 and 0x3509) where the first one holds the upper 5 bits of the
> > value. The second register (0x3509) holds the lower 4 bits of the gain
> > value in its upper 4 bits. The lower 4 register bits are fraction bits.
> >
> > This patch changes the gain control to adhere to the datasheet and
> > make the "upper gain register" (0x3508) accessible via the gain control,
> > resulting in a new maximum of 0x1fff instead of 0xff.
> >
> > As the "upper gain register" is now written during exposure/gain update
> > remove the hard-coded 0x00 write to it from common_regs.
> >
> > We cover only the "real gain format" use-case. The "sensor gain
> > format" one is ignored as based on the hard-coded "AEC MANUAL" register
> > configuration it is disabled.
> >
> > All values are based on the OV9281 datasheet v1.01 (09.18.2015).
> 
> My web searches turn up a 1.53 from Jan 2019 -
> http://www.sinotimes-tech.com/product/20220217221034589.pdf
> That lists 0x3508 as DEBUG, not LONG_GAIN.
> 
> The current range allows analogue gain to x15.9375.
> Expanding it to 0x1ff.f would be up to x511.9375. I believe that
> equates to ~54dB as we're scaling voltages, not power. The spec sheet
> for the sensor lists S/N of 38dB and dynamic range of 68dB, so x511
> will be almost pure noise.
> 
> Doing a very basic test using i2ctransfer to set gain values whilst
> the sensor is running suggests that the image is the same regardless
> of bits 2-4 of 0x3508. Setting either bits 0 or 1 increases the gain
> by around x8.5, but they don't combine.
> 
> Overall can I ask how you've tested that a range up to 0x1fff works,
> and on which module? I currently don't believe this works as intended.
> 
>   Dave
> 
> > Signed-off-by: Richard Leitner <richard.leitner@linux.dev>
> > ---
> >  drivers/media/i2c/ov9282.c | 17 ++++++++++-------
> >  1 file changed, 10 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov9282.c b/drivers/media/i2c/ov9282.c
> > index c882a021cf18852237bf9b9524d3de0c5b48cbcb..e6effb2b42d4d5d0ca3d924df59c60512f9ce65d 100644
> > --- a/drivers/media/i2c/ov9282.c
> > +++ b/drivers/media/i2c/ov9282.c
> > @@ -54,11 +54,11 @@
> >  #define OV9282_AEC_MANUAL_DEFAULT      0x00
> >
> >  /* Analog gain control */
> > -#define OV9282_REG_AGAIN       0x3509
> > -#define OV9282_AGAIN_MIN       0x10
> > -#define OV9282_AGAIN_MAX       0xff
> > -#define OV9282_AGAIN_STEP      1
> > -#define OV9282_AGAIN_DEFAULT   0x10
> > +#define OV9282_REG_AGAIN       0x3508
> > +#define OV9282_AGAIN_MIN       0x0010
> > +#define OV9282_AGAIN_MAX       0x1fff
> > +#define OV9282_AGAIN_STEP      0x0001
> > +#define OV9282_AGAIN_DEFAULT   0x0010
> >
> >  /* Group hold register */
> >  #define OV9282_REG_HOLD                0x3308
> > @@ -226,7 +226,6 @@ static const struct ov9282_reg common_regs[] = {
> >         {OV9282_REG_AEC_MANUAL, OV9282_GAIN_PREC16_EN},
> >         {0x3505, 0x8c},
> >         {0x3507, 0x03},
> > -       {0x3508, 0x00},
> >         {0x3610, 0x80},
> >         {0x3611, 0xa0},
> >         {0x3620, 0x6e},
> > @@ -605,7 +604,11 @@ static int ov9282_update_exp_gain(struct ov9282 *ov9282, u32 exposure, u32 gain)
> >         if (ret)
> >                 goto error_release_group_hold;
> >
> > -       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, gain);
> > +       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN, 1, (gain >> 8) & 0x1f);
> > +       if (ret)
> > +               goto error_release_group_hold;
> > +
> > +       ret = ov9282_write_reg(ov9282, OV9282_REG_AGAIN + 1, 1, gain & 0xff);

Ignoring Dave's functional review for a moment to focus on the code:
16-bit registers should ideally use the v4l2-cci helpers. It would be
nice to convert the driver to them.

> >
> >  error_release_group_hold:
> >         ov9282_write_reg(ov9282, OV9282_REG_HOLD, 1, 0);
> >

-- 
Regards,

Laurent Pinchart

