Return-Path: <linux-media+bounces-15429-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DA04893F0D3
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 11:19:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5309E1F2207C
	for <lists+linux-media@lfdr.de>; Mon, 29 Jul 2024 09:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927F213DDAF;
	Mon, 29 Jul 2024 09:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AIoD8F90"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47EA13DB92;
	Mon, 29 Jul 2024 09:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722244769; cv=none; b=jWitFSBZbPbksFhAUPcOqVmA2dT2udTrCwVRCp8thQ+81ISo702OAFXNBdYdv/UHWBSo3qh1+IstfBUQoMSpFC0ouuhtHqdxnUUgGzzyKRUbEplwMZOM4D79J/fMT4d4CUfaB4oESOb+cRbq0ctSNibDT/pHyxi/2y+xQdPEDTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722244769; c=relaxed/simple;
	bh=NmA4UnYG3ps2ZxJ6n5TCugcQhBXbGtG7XO01jZ7+OdA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKs7A5+kzrDmrjveg9YADdjuCvIV+E6mP5MMyqhy/Muh0x/oKwYeK0wtKQYsqhL0UHsoIgDmz32apUpBnzTmVTPzSiPS4ESOExJYpYPRhIMcajsg/dhxpcXtza9MetJ+enawwqt8XdO5S/WNCaD73u2v2ZJFyrnfHmtCTyVej7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AIoD8F90; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-5-90-63-112.net.vodafone.it [5.90.63.112])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AEAD145A;
	Mon, 29 Jul 2024 11:18:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722244718;
	bh=NmA4UnYG3ps2ZxJ6n5TCugcQhBXbGtG7XO01jZ7+OdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AIoD8F90Bb20zqs9/yFDFe76dwdlwm1S2Z2KU8aI+bkpkhzZ1UtgiiCmQFd8ZpHXo
	 dN9TJ/4x5t78sqFC4ZuoTU6XFu2TeuZXOnLMMN+QTZn/Djo9EYuA2oM7uCFdC9skoE
	 XjEqmfBHVw1AqYe3Ktqrz/crN11BsMcBSsWwUSJg=
Date: Mon, 29 Jul 2024 11:19:22 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Umang Jain <umang.jain@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	linux-media@vger.kernel.org, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, open list <linux-kernel@vger.kernel.org>, 
	Tommaso Merciai <tomm.merciai@gmail.com>
Subject: Re: [PATCH] media: imx335: Fix reset-gpio handling
Message-ID: <tyo5etjwsfznuk6vzwqmcphbu4pz4lskrg3fjieojq5qc3mg6s@6jbwavmapwmf>
References: <20240729060535.3227-1-umang.jain@ideasonboard.com>
 <4me3tw572feft3x4dn3ritpr6avss6ebupixrg7qrlsy5z6kny@mqeoqhr7uh2x>
 <f521ed1b-17ce-4ccb-b14e-53fe5fbfee64@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f521ed1b-17ce-4ccb-b14e-53fe5fbfee64@ideasonboard.com>

Hi Umang

On Mon, Jul 29, 2024 at 02:18:20PM GMT, Umang Jain wrote:
> Hi Jacopo
>
> On 29/07/24 1:42 pm, Jacopo Mondi wrote:
> > Hi Umang
> >
> > On Mon, Jul 29, 2024 at 11:35:35AM GMT, Umang Jain wrote:
> > > The imx335 reset-gpio is initialised with GPIO_OUT_LOW during probe.
> > How is this related to this change ? The value to which the GPIO is
> > initialized to in probe is the physical level.
> >
> > What matters is the gpio line active level, which should be described
> > in the sensor's datasheet. What's the active level of the reset gpio
> > line ?
>
> The XCLR active level is "Low" at the init time. It is set to "high" during
> power-on / normal operation
>

Sorry for not being clear, but the physical active level is a property
of the chip, and doesn't depend on the setting at init time made by
the driver.

According to the imx335 datasheet, the XCLR pin is said to be:
High: normal
Low: clear

Which I presume means a physical low level puts the chip in "reset"
state.

> >
> > > However, the reset-gpio logical value is set to 1 in during power-on
> > > and to 0 on power-off. This is incorrect as the reset line
> > > cannot be high during power-on and low during power-off.
> > If the line is physically high or low only depends on how the active
> > level is specified in DTS, not by the logical value provided to
> > gpiod_set_value[_cansleep]()
>
> True.
>
> AS far as I can see, the DT binding schema specifies 'reset-gpios:' -
> without the active level
>
> The active level is I suppose, intentionally left to the DT implementation ?

Not really a decision of the DT implementation, but rather a property
of the chip, so I guess the line should be described as active low in
bindings and initialized accordingly in DTS with the GPIO_ACTIVE_LOW
flag.

>
> > > Rectify the logical value of reset-gpio so that it is set to
> > > 0 during power-on and to 1 during power-off.
> > This is correct, the reset line should be set to logical 0 (inactive)
> > during power on and to logical 1 (active) when powering off. However
> > the GPIO active state should have been specified in bindings and as
> > this driver has been mainline quite some time, this change will break
> > .dtbo already used succesfully with previous kernel releases.
> >
> > Is this an issue ?
>
> Yes, if the patch is accepted, the Device-tree implementation for IMX335
> will need to be adjusted accordingly. This can be an issue definitely - but
> on the other hand, this attempts to rectify a mistake, no?
>

Indeed it does rectify a mistake, but I presume existing dtbos have the
gpio line described with GPIO_ACTIVE_HIGH, otherwise they wouldn't
work with the existing driver version. Now, you change (or rather,
fix) the driver, and existing dtbos in the wild (iow not in the
mainline code base (*)) won't work anymore. The
expectation is that we don't break working dtbos with new kernel
releases, however I'm not sure how much this is actually enforced.
I'll defer this call to maintainers.

In case it is fine to break existing dtbos, I think a patch to the
bindings to specify the gpio line active level would be required too ?

Thanks
  j

(*) as far as I can tell no dts in mainline uses imx335.

> >
> > > Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> > > ---
> > >   drivers/media/i2c/imx335.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > > index cd150606a8a9..878d88b5f476 100644
> > > --- a/drivers/media/i2c/imx335.c
> > > +++ b/drivers/media/i2c/imx335.c
> > > @@ -1171,7 +1171,7 @@ static int imx335_power_on(struct device *dev)
> > >   	usleep_range(500, 550); /* Tlow */
> > >
> > >   	/* Set XCLR */
> > > -	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
> > > +	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
> > >
> > >   	ret = clk_prepare_enable(imx335->inclk);
> > >   	if (ret) {
> > > @@ -1184,7 +1184,7 @@ static int imx335_power_on(struct device *dev)
> > >   	return 0;
> > >
> > >   error_reset:
> > > -	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
> > > +	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
> > >   	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
> > >
> > >   	return ret;
> > > @@ -1201,7 +1201,7 @@ static int imx335_power_off(struct device *dev)
> > >   	struct v4l2_subdev *sd = dev_get_drvdata(dev);
> > >   	struct imx335 *imx335 = to_imx335(sd);
> > >
> > > -	gpiod_set_value_cansleep(imx335->reset_gpio, 0);
> > > +	gpiod_set_value_cansleep(imx335->reset_gpio, 1);
> > >   	clk_disable_unprepare(imx335->inclk);
> > >   	regulator_bulk_disable(ARRAY_SIZE(imx335_supply_name), imx335->supplies);
> > >
> > > --
> > > 2.45.0
> > >
> > >
>

