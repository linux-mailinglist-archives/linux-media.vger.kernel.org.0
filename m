Return-Path: <linux-media+bounces-7229-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A7D87F062
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 20:24:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E9ED1F2283F
	for <lists+linux-media@lfdr.de>; Mon, 18 Mar 2024 19:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8492756B60;
	Mon, 18 Mar 2024 19:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DHvGcWT6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECBB5674B;
	Mon, 18 Mar 2024 19:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710789883; cv=none; b=miwZMauPZ71fM+7jxwqugiQKIzEQziea7TNEkzAD4ei8BGa2W/G9hb9cFm2ajHa4rY/q1+StQ+jMdRGmTpTH4xcPPKdPGa8DZAff6nEuJYaCPveFWlQeBS+ooHlNwPRpJSvmD/BeQoLGafMUprTSIWRoTLnIUyXblOfoZRCEEzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710789883; c=relaxed/simple;
	bh=245reqfaGPrTR8H/vjEO2m3uy0Mil/WIGndNjGATAJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cPwC+iNu0LYdeS55ucbDyIOSb4dj48vtVQ6QuIEgkOr9Osi/q++cMOdfYEe1M1VdabnGsJyEiQHzUkP8TCAWAcRtW3Mvq4MmIMUbrg/vDzfvZffsj3Agui1bLEo2H13X/HobbFmVzV5sVkkkLMoWdMj0JhvbIIDNs5VmBnx/MDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DHvGcWT6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 914D82A5;
	Mon, 18 Mar 2024 20:24:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710789852;
	bh=245reqfaGPrTR8H/vjEO2m3uy0Mil/WIGndNjGATAJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DHvGcWT6cRFzTojjQ7E6NF8NPxpoUNkD2lUm8QA5vbAx/6cNHGFOl3+xk7/pGU7JD
	 r3cyntz3jPuqgEVZSMHKMrEyP695IeGwDirHKgH2scs68ru/v1XfR7tWAQuuYeFTXM
	 uQdwb4XzrvTopgZX0f1KWZi2vqfGINYKiHPk0B4o=
Date: Mon, 18 Mar 2024 21:24:36 +0200
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
Subject: Re: [PATCH v6 13/15] ARM: dts: bcm2711-rpi-cm4-io: Add RTC on I2C0
Message-ID: <20240318192436.GC6052@pendragon.ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213231.10340-14-laurent.pinchart@ideasonboard.com>
 <CAPY8ntA+PSTfee=B8kZ0MkndCQ2iDErSPdm54bzgQAJ2RnwfcA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntA+PSTfee=B8kZ0MkndCQ2iDErSPdm54bzgQAJ2RnwfcA@mail.gmail.com>

Hi Dave,

On Mon, Mar 18, 2024 at 02:56:53PM +0000, Dave Stevenson wrote:
> On Fri, 1 Mar 2024 at 21:32, Laurent Pinchart wrote:
> >
> > From: Uwe Kleine-König <uwe@kleine-koenig.org>
> >
> > The cm4-io board comes with a PCF85063 on I2C0, connected to the GPIO44
> > and GPIO45 pins. Add it to the device tree.
> >
> > Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v4:
> >
> > - Use the right part number in the compatible string
> > - Add the quartz-load-femtofarads property
> >
> > Changes since v3:
> >
> > - Separate addition of the RTC to a patch of its own
> > ---
> >  .../boot/dts/broadcom/bcm2711-rpi-cm4-io.dts    | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
> > index d7ba02f586d3..d5ebb535afd2 100644
> > --- a/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
> > +++ b/arch/arm/boot/dts/broadcom/bcm2711-rpi-cm4-io.dts
> > @@ -101,6 +101,23 @@ &genet {
> >         status = "okay";
> >  };
> >
> > +&i2c0 {
> > +       status = "okay";
> > +};
> 
> This is already the default from bcm2835-rpi.dtsi

Indeed. I probably got lost in the maze of .dtsi files :-) I'll drop
this.

> > +
> > +&i2c0_1 {
> > +       rtc@51 {
> > +               /* Attention: An alarm resets the machine */
> > +               compatible = "nxp,pcf85063a";
> > +               reg = <0x51>;
> > +               quartz-load-femtofarads = <7000>;
> > +       };
> > +};
> > +
> > +&i2c0mux {
> > +       status = "okay";
> 
> Default status queried on patch 12/15.
> 
> With those clarified:
> 
> Acked-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> > +};
> > +
> >  &led_act {
> >         gpios = <&gpio 42 GPIO_ACTIVE_HIGH>;
> >  };

-- 
Regards,

Laurent Pinchart

