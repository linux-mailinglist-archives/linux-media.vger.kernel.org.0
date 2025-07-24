Return-Path: <linux-media+bounces-38363-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCAAB1071B
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 11:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3687DAA7D8D
	for <lists+linux-media@lfdr.de>; Thu, 24 Jul 2025 09:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A957F25A351;
	Thu, 24 Jul 2025 09:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uT3AWpc1"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA960257AC8;
	Thu, 24 Jul 2025 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350984; cv=none; b=YmWUfVidU2Qj/2PYuYGurmnjGCTRDcVADvabf1WnUAVDb2UHSXlCcOqK2YsjBi14eGd1n9ZpAsUl7PnOg90caNkx0wzDd6Gj/X0/Yaa9/wt7I4/obCohmFim695pFkQ7ngwi7k1FgnuTGoEU5ddiQdzj/BYXDen5iXg9j2seOKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350984; c=relaxed/simple;
	bh=xyHXozyV9qNNsHW6dYHKcTA7QTdjZuOPH/8XqofK8lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IDSwn94IXXq5kvLN9igPXhWVrRTXxaJRnIveTUBfFXjYDedxgnDiZ8p1gk3bmcXEPmELWceG/2OO2iEDh2slADncB7nXWPNtLbNTMEDCznY3gMSAlF4Vm5ytoN25mUS5eW+aS4DUf70udGJ379XALWj3NBpHCY/emAYrDY89rww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uT3AWpc1; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4F4C4C79;
	Thu, 24 Jul 2025 11:55:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753350933;
	bh=xyHXozyV9qNNsHW6dYHKcTA7QTdjZuOPH/8XqofK8lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uT3AWpc1WOTc+F7zf8Ag6Y2MzUsNbk3lkOqOehxZ6wJpBmUuezXR6B9T0q7Ihmscx
	 n3w3KMgCp5yBzLPLqkQqFzc5+sI0UUucAFY1kpHC1Eg8XEqXwGBWO7Gc6k7devzMwp
	 BukjUIXQwBw5bfPECeRzWJjMcTiEIfZ87tqH/6ac=
Date: Thu, 24 Jul 2025 12:56:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Fabian Pfitzner <f.pfitzner@pengutronix.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, Jacopo Mondi <jacopo@jmondi.org>,
	linux-kernel@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	entwicklung@pengutronix.de,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, hansg@kernel.org
Subject: Re: [PATCH 0/2] parse horizontal/vertical flip properties
Message-ID: <20250724095607.GA20849@pendragon.ideasonboard.com>
References: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>
 <ryuew3kxnocj6uqq4nadp3kyaxg27rxlrgnaieyy2hlpz5jkd3@iyetnsbfanee>
 <35debf21-bca7-480f-a61e-7b0494f10ca5@pengutronix.de>
 <mljx67lkcw4kh3cs344iprik244cm7hqfckmg4bj5j5atuyt62@lh2ht4mrtkjq>
 <3ac271c7-a67a-4f6f-935d-256937516068@pengutronix.de>
 <ffzxxsplmivvj7pib7n7lkutbyohl5npofdaxdxtoffo43yatw@gqm64zdgb4iy>
 <CAPY8ntDLPDmgmE8+VQ4jchfNKLLEK5bZ10ftham9bK-x_HL8Xw@mail.gmail.com>
 <a89dbe5d-a30b-455d-adaf-31eadf2b3751@pengutronix.de>
 <CAPY8ntC+t9miX2396=PuhF2LX-wwoyg4zhXsj4yKAbsCt7+muA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPY8ntC+t9miX2396=PuhF2LX-wwoyg4zhXsj4yKAbsCt7+muA@mail.gmail.com>

On Wed, Jul 23, 2025 at 03:33:48PM +0100, Dave Stevenson wrote:
> On Wed, 23 Jul 2025 at 14:48, Fabian Pfitzner wrote:
> > On 7/23/25 15:00, Dave Stevenson wrote:
> > > On Wed, 23 Jul 2025 at 13:21, Jacopo Mondi wrote:
> > >> On Wed, Jul 23, 2025 at 12:09:58PM +0200, Fabian Pfitzner wrote:
> > >>> On 7/23/25 11:44, Jacopo Mondi wrote:
> > >>>> On Wed, Jul 23, 2025 at 11:29:27AM +0200, Fabian Pfitzner wrote:
> > >>>>> On 7/23/25 11:17, Jacopo Mondi wrote:
> > >>>>>> Hi Fabian
> > >>>>>>
> > >>>>>> On Wed, Jul 23, 2025 at 10:58:28AM +0200, Fabian Pfitzner wrote:
> > >>>>>>> There are cameras containing a mirror on their optical path e. g. when
> > >>>>>>> mounted upside down.
> > >>>>>>
> > >>>>>> How is this different from 'rotation = 180' ?
> > >>>>>
> > >>>>> If you simply want to flip the output (e. g. horizontally), you cannot do
> > >>>>> this with a rotation.
> > >>>>> The camera I'm referring to is not only upside down, but also flipped
> > >>>>> horizontally.
> > >>>>
> > >>>> 180 degress rotation = HFLIP + VFLIP
> > >>>
> > >>> I do not want to do both. Only one of them.
> > >>>
> > >>>> Yes, you can't express 'mirror' in DTS, because DTS are about the
> > >>>> physical mounting rotation of the camera. Sensor drivers shall not
> > >>>> apply any flip control automatically, it's userspace that by parsing
> > >>>> the rotation property through the associated v4l2 controls should decide
> > >>>> if it has to apply flips or not to correct the images.
> > >>>>
> > >>>> What is the use case you had in mind ? Tell the driver through a DTS
> > >>>> property it has to apply flips to auto-compensate ? Because I think we
> > >>>> shouldn't and if I'm not mistaken we also document it:
> > >>>> https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#rotation-orientation-and-flipping
> > >>>
> > >>> I have a camera that does a horizontal flip in its hardware, so the output
> > >>
> > >> Sorry, I don't want to be annoying, but what does it mean "does a
> > >> horizontal flip in the hardware" ?
> > >>
> > >> In my understanding either "in hardware" means you can't control it
> > >> from software (and so there's no point in telling drivers what to do)
> > >> or you can control it from software and it's a regular HFLIP.
> > >
> > > Can you say what this sensor/module is?
> >
> > ClairPixel 8320
> >
> > > To change flips due to physical sensor orientation is a very unusual
> > > one. That would imply some weird mechanics in the sensor to add the
> > > mirror and some form of orientation sensor being built in.
> >
> > Really? Imagine a door bell where an arbitrary camera is mounted such
> > that it faces upwards (e. g. due to space limitations).
> > Then you need a mirror in order to point into the "correct" direction.
> 
> That's not a function of the sensor then. I'd interpreted what you'd
> written as the sensor itself magically changed the readout order to
> add flips based on how it was mounted.
> 
> I'll agree with Jacopo that it is up to userspace to set the required
> flips based on information provided by the driver. Userspace could
> choose to flip the displayed image when rendering instead, which may
> be necessary if the sensor driver doesn't support flip controls.
> 
> Your second patch parses these new properties into struct
> v4l2_fwnode_device_properties, but then does nothing further with
> them. I would have expected similar handling to V4L2_CID_ORIENTATION
> and V4L2_CID_ROTATION in v4l2_ctrl_new_fwnode_properties to convert
> them into V4L2 controls. Trying to change the behaviour in the driver
> would again require changes for each and every sensor driver.
> It does run the risk of conflicting with rotation though, so needs
> some careful thought and specification with regard operation order
> (rot 90 + HFLIP != HFLIP + rot 90).

I agree. If the optical path contains a mirror, that can be indicated in
DT, and should be reported to userspace through a new (and carefully
documented) control. Drivers must not flip automatically, the same way
they must not automatically rotate by 180° when the sensor is mounted
upside down.

> > Fixing the driver for an arbitrary camera driver does not seem to be a
> > good solution.
> >
> > > The closest instance I can think of would be ov5647 where the sense of
> > > the H & V flip register bits are in opposition, but that doesn't
> > > change based on how the sensor is mounted.
> > > In that case the driver just needs to account for it when programming
> > > those registers [1]. And I now note that I haven't upstreamed the
> > > patch adding flip controls - another one for the to-do list. The
> > > hardcoded register set in the mainline driver sets HFLIP (0x3821 bit
> > > 2) but not VFLIP (0x3820 bit 2) [2].
> > >
> > >    Dave
> > >
> > > [1] https://github.com/raspberrypi/linux/commit/9e5d3fd3f47e91806a5c26f96732284f39098a58
> > > [2] https://elixir.bootlin.com/linux/v6.15.7/source/drivers/media/i2c/ov5647.c#L153
> > >
> > >>> is not what I want. My example above was misleading. The rotation fixes the
> > >>> "upside down" problem, but does not fix the flip.
> > >>>
> > >>> Doing that in userspace might be a solution, but in my opinion it is a bit
> > >>> ugly to write a script that always sets the flip property from userspace
> > >>> when the device was started.
> > >>> A much cleaner way would be to simply set this property in the device tree
> > >>> such that the driver can be initially configured with the proper values.
> > >> Sorry, don't agree here. What if a sensor is mounted 90/270 degrees
> > >> rotated (typical for mobile devices in example) ? You can't compensate
> > >> it completely with flips, would you 270+HFLIP=90 ? would you leave it
> > >> unmodified ? Userspace has to know and act accordingly, doing things
> > >> in driver (will all drivers behave the same ? Will some compensate or
> > >> other won't ?) is a recipe for more complex behaviours to handle.
> > >>
> > >>> PS: I have to send this email twice. The first one contained HTML parts that
> > >>> were rejected by some receivers...
> > >>>
> > >>>> TL;DR drivers shall not flip, userspace should. Mirroring is an effect
> > >>>> of drivers applying an HFLIP, because unless I'm missing something
> > >>>> obvious, 'mirror' is not a physical mounting configuration of the camera
> > >>>> sensor.
> > >>>>
> > >>>> FIY we're talking about something similar in libcamera
> > >>>> https://lists.libcamera.org/pipermail/libcamera-devel/2025-July/051533.html
> > >>>>
> > >>>>>>> Introduce two options to change the device's flip property via device tree.
> > >>>>>>>
> > >>>>>>> As there is already support for the panel-common driver [1], add it for cameras in the same way.
> > >>>>>>>
> > >>>>>>> [1] commit 3c0ecd83eee9 ("dt-bindings: display: panel: Move flip properties to panel-common")
> > >>>>>>>
> > >>>>>>> Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
> > >>>>>>> ---
> > >>>>>>> Fabian Pfitzner (2):
> > >>>>>>>          media: dt-bindings: add flip properties
> > >>>>>>>          media: v4l: fwnode: parse horizontal/vertical flip properties
> > >>>>>>>
> > >>>>>>>     .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
> > >>>>>>>     drivers/media/v4l2-core/v4l2-fwnode.c                             | 3 +++
> > >>>>>>>     include/media/v4l2-fwnode.h                                       | 4 ++++
> > >>>>>>>     3 files changed, 15 insertions(+)
> > >>>>>>> ---
> > >>>>>>> base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> > >>>>>>> change-id: 20250718-fpf-media-dt-flip-7fcad30bcfb7

-- 
Regards,

Laurent Pinchart

