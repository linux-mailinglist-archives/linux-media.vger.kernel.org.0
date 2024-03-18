Return-Path: <linux-media+bounces-7230-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8AC87F064
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 20:25:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD8E81F22787
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 19:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4266F56774;
	Mon, 18 Mar 2024 19:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hlhv1fsw"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E9E55C16;
	Mon, 18 Mar 2024 19:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710789913; cv=none; b=IuqK0wwOoPrT9ohHBigg3NCBFWatQ0jAZEwZnhjymqikzYuf+/9igNdcWhG45TO31h8/gfAc96asijQe3Dw1ugJ5Sqd30KuqhNSkk58wFfzoF4NlbqmdrGf1v9ckQcFoCidQWHxGslgvs5p6eu2vpKmqOxEk89Q7Sz3ipVR4z7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710789913; c=relaxed/simple;
	bh=OjrMC/xpq2oOnHAkNpVlozVOw4Jyoq81prV1dU1asjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWmZ2DwwgIbKSuAmy1UF5W86b7OYZCoGAx8IO4qOnDsE+640DPb29JR2b/voMzmfePIw8nmxeJPAYqTZe+nE2+nn2XPz2CebiBtRvL2xM0+hlBHq7tiip9S3n9zYtnkpGFGYBTrAejXWri9aHhkSTngkLvMieY1tG7dCSpMog5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hlhv1fsw; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B127F2A5;
	Mon, 18 Mar 2024 20:24:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710789883;
	bh=OjrMC/xpq2oOnHAkNpVlozVOw4Jyoq81prV1dU1asjQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hlhv1fswZJMjtYjQYZwhs2VjysxK2IiLmNAF+va8xikdyx0Wp7cMVaiw9iWMeaX1a
	 dOuLnswSOlbEkCb8sx6shkMPsmVykSJhpyHi5uBXwix93E3P9ewXOZTDFygkXYIaqO
	 fUZad0zyUWRzVQwR9AJNWVRJ1VmxV2OWw8N4eKuA=
Date: Mon, 18 Mar 2024 21:25:07 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: linux-media@vger.kernel.org,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 12/15] ARM: dts: bcm2711-rpi: Add pinctrl-based
 multiplexing for I2C0
Message-ID: <20240318192507.GQ13682@pendragon.ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-13-laurent.pinchart@ideasonboard.com>
 <CAPY8ntAYbb8oBOww5yR+7u8UA-V=zemJMkZ7SWySH3C2bqmFMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntAYbb8oBOww5yR+7u8UA-V=zemJMkZ7SWySH3C2bqmFMA@mail.gmail.com>

Hi Dave,

On Mon, Mar 18, 2024 at 02:56:33PM +0000, Dave Stevenson wrote:
> On Fri, 1 Mar 2024 at 21:32, Laurent Pinchart wrote:
> >
> > From: Uwe Kleine-König <uwe@kleine-koenig.org>
> >
> > BCM2711-based Raspberry Pi boards (4B, CM4 and 400) multiplex the I2C0
> > controller over two sets of pins, GPIO0+1 and GPIO44+45. The former is
> > exposed on the 40-pin header, while the latter is used for the CSI and
> > DSI connectors.
> 
> It's true for all Pis that I2C0 is exposed over 2 sets of gpios.
> Seeing as we want to support cameras on Pi0-3, is there a reason not
> to include the mux on those?

Simplicity :-) I got lost in the maze of differences in .dtsi files
between the upstream and downstream kernels. Given that not all Pi's
have device trees upstream, I decided to start simple(r).

> Looking back I had started this way back in [1] with all the variants.
> I thought I'd posted the v2 follow up, but can't find it.
> The original Pi 1 models A & B were the annoyances. The rev1 put the
> camera on i2c1 GPIOs 2&3, with the rev2 on i2c0 with GPIOs 0&1.
> 
> Whilst it would be nice to have support for all platforms, this
> doesn't stop us moving the mux into bcm283x-rpi.dtsi at a later date
> to add support for the other devices.
> I'm happy enough having the first step of getting Pi4 working, with
> others being done later.

Thanks :-) I would also be happy for other boards to get I2C0 mux
support later.

> [1] https://linux-rpi-kernel.infradead.narkive.com/lmzYlT3c/rfc-arm-dts-add-i2cmux-pinctrl-config-to-raspberry-pi-i2c-0
> 
> > Add a pinctrl-based I2C bus multiplexer to bcm2711-rpi.dtsi to model
> > this multiplexing. The two child buses are named i2c0_0 and i2c0_1.
> >
> > Note that if you modified the dts before to add devices to the i2c bus
> > appearing on pins gpio0 + gpio1 (either directly in the dts or using an
> > overlay), you have to put these into the i2c0_0 node introduced here
> > now.
> >
> > Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v3:
> >
> > - Split addition of the RTC to a separate patch
> > - Move the mux to bcm2711-rpi.dtsi
> > ---
> >  arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi | 31 +++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> > index 86188eabeb24..826ed6efa9ff 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> > +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi.dtsi
> > @@ -17,6 +17,32 @@ aliases {
> >                 pcie0 = &pcie0;
> >                 blconfig = &blconfig;
> >         };
> > +
> > +       i2c0mux: i2c0mux {
> > +               compatible = "i2c-mux-pinctrl";
> > +               #address-cells = <1>;
> > +               #size-cells = <0>;
> > +
> > +               i2c-parent = <&i2c0>;
> > +
> > +               pinctrl-names = "i2c0", "i2c0-vc";
> > +               pinctrl-0 = <&i2c0_gpio0>;
> > +               pinctrl-1 = <&i2c0_gpio44>;
> > +
> > +               status = "disabled";
> 
> Why defaulting to disabled?
> 
> The current mainline DT defaults to i2c0 being enabled on GPIOs 0&1
> (done via bcm2835-rpi.dtsi).
> If the mux is disabled, then this change has left i2c0 being enabled
> but with no pinctrl property, so it's not connected to the outside
> world.
> GPIOs 44&45 have never had any other user, therefore claiming them for
> the mux isn't a regression in my view.

I don't recall why I disabled it. Your explanation makes sense, I'll
drop the status property.

> As long as we can enable the other platforms later, and with the minor
> caveat over being enabled or not:
> 
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thank you. I'll send a new version of the series soon, Florian wanted to
pick the DT integration sooner than later.

> Minor point that CONFIG_I2C_MUX_PINCTRL appears not to be in the arm64
> defconfig. I don't know what the policy is there, but there seem to be
> many other SoCs throwing modules in there for their configurations.
> It is in arm/multi_v7_defconfig.

Good question.

> > +
> > +               i2c0_0: i2c@0 {
> > +                       reg = <0>;
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +               };
> > +
> > +               i2c0_1: i2c@1 {
> > +                       reg = <1>;
> > +                       #address-cells = <1>;
> > +                       #size-cells = <0>;
> > +               };
> > +       };
> >  };
> >
> >  &firmware {
> > @@ -49,6 +75,11 @@ &hvs {
> >         clocks = <&firmware_clocks 4>;
> >  };
> >
> > +&i2c0 {
> > +       /delete-property/ pinctrl-names;
> > +       /delete-property/ pinctrl-0;
> > +};
> > +
> >  &rmem {
> >         /*
> >          * RPi4's co-processor will copy the board's bootloader configuration

-- 
Regards,

Laurent Pinchart

