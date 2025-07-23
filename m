Return-Path: <linux-media+bounces-38253-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26EA1B0F219
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 14:21:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E089818981BC
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 12:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B9B2E5B32;
	Wed, 23 Jul 2025 12:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="WpgNnSAK"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B56325A34F;
	Wed, 23 Jul 2025 12:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753273278; cv=none; b=pYvh7VMCB6HqbYPbiQCHKDG/BBf/qkz2t4OOPAY0H9wArCEYZw9y76veE7NhW6oripMtKVrEdYpPDoNaBSGjSCDW3lVZLyj8lvSNfqANfUMN7uUWBSWRjRKta+0mv1Pvfzcg+6sjZHSDrFOsR157UuJ64rT6LJoaGuNWoPXq0+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753273278; c=relaxed/simple;
	bh=GgZoqLPeuitrhx5PaJr/8XbVXKsJFtnCfPQOfvbkm0g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nUohQPim53d6UH+rdPzSSyUXoWTY6BRb9v+TA+wHBX2oaCL2MycBjtSmXIQzZC6JV6s1CRDdSjIi3gcD0KbG73pONRyk5BhG23vvqEHdhyH0gXOeKjj9HAqpTpy1OodCl5sULBp11UxevaCHdjj3qinYnEjqzzZ2tqheztZdtx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=WpgNnSAK; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 202B3E91;
	Wed, 23 Jul 2025 14:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753273236;
	bh=GgZoqLPeuitrhx5PaJr/8XbVXKsJFtnCfPQOfvbkm0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WpgNnSAKga2gUmxG1DcGIqq1qjaOLOJ8hvX1HYRHIddO0MQswZjYvdx7SR3FTnsHE
	 4616KoOuAlLQsaIxst+EuhceCgzuJcmQ/3Qnqk5tPZIYAKNrumQ77uDNPfnDFgOtFE
	 U2lczvUHcRfllih0/MzbiDNDc36yrRDRRTFiT7hM=
Date: Wed, 23 Jul 2025 14:21:10 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	entwicklung@pengutronix.de
Subject: Re: [PATCH 0/2] parse horizontal/vertical flip properties
Message-ID: <ffzxxsplmivvj7pib7n7lkutbyohl5npofdaxdxtoffo43yatw@gqm64zdgb4iy>
References: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>
 <ryuew3kxnocj6uqq4nadp3kyaxg27rxlrgnaieyy2hlpz5jkd3@iyetnsbfanee>
 <35debf21-bca7-480f-a61e-7b0494f10ca5@pengutronix.de>
 <mljx67lkcw4kh3cs344iprik244cm7hqfckmg4bj5j5atuyt62@lh2ht4mrtkjq>
 <3ac271c7-a67a-4f6f-935d-256937516068@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3ac271c7-a67a-4f6f-935d-256937516068@pengutronix.de>

Hi Fabian

On Wed, Jul 23, 2025 at 12:09:58PM +0200, Fabian Pfitzner wrote:
> On 7/23/25 11:44, Jacopo Mondi wrote:
> > On Wed, Jul 23, 2025 at 11:29:27AM +0200, Fabian Pfitzner wrote:
> > > On 7/23/25 11:17, Jacopo Mondi wrote:
> > > > Hi Fabian
> > > >
> > > > On Wed, Jul 23, 2025 at 10:58:28AM +0200, Fabian Pfitzner wrote:
> > > > > There are cameras containing a mirror on their optical path e. g. when
> > > > > mounted upside down.
> > > > How is this different from 'rotation = 180' ?
> > > If you simply want to flip the output (e. g. horizontally), you cannot do
> > > this with a rotation.
> > > The camera I'm referring to is not only upside down, but also flipped
> > > horizontally.
> > 180 degress rotation = HFLIP + VFLIP
> I do not want to do both. Only one of them.
> >
> > Yes, you can't express 'mirror' in DTS, because DTS are about the
> > physical mounting rotation of the camera. Sensor drivers shall not
> > apply any flip control automatically, it's userspace that by parsing
> > the rotation property through the associated v4l2 controls should decide
> > if it has to apply flips or not to correct the images.
> >
> > What is the use case you had in mind ? Tell the driver through a DTS
> > property it has to apply flips to auto-compensate ? Because I think we
> > shouldn't and if I'm not mistaken we also document it:
> > https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#rotation-orientation-and-flipping
> I have a camera that does a horizontal flip in its hardware, so the output

Sorry, I don't want to be annoying, but what does it mean "does a
horizontal flip in the hardware" ?

In my understanding either "in hardware" means you can't control it
from software (and so there's no point in telling drivers what to do)
or you can control it from software and it's a regular HFLIP.

> is not what I want. My example above was misleading. The rotation fixes the
> "upside down" problem, but does not fix the flip.
>
> Doing that in userspace might be a solution, but in my opinion it is a bit
> ugly to write a script that always sets the flip property from userspace
> when the device was started.
> A much cleaner way would be to simply set this property in the device tree
> such that the driver can be initially configured with the proper values.

Sorry, don't agree here. What if a sensor is mounted 90/270 degrees
rotated (typical for mobile devices in example) ? You can't compensate
it completely with flips, would you 270+HFLIP=90 ? would you leave it
unmodified ? Userspace has to know and act accordingly, doing things
in driver (will all drivers behave the same ? Will some compensate or
other won't ?) is a recipe for more complex behaviours to handle.

>
> PS: I have to send this email twice. The first one contained HTML parts that
> were rejected by some receivers...
>
> >
> > TL;DR drivers shall not flip, userspace should. Mirroring is an effect
> > of drivers applying an HFLIP, because unless I'm missing something
> > obvious, 'mirror' is not a physical mounting configuration of the camera
> > sensor.
> >
> > FIY we're talking about something similar in libcamera
> > https://lists.libcamera.org/pipermail/libcamera-devel/2025-July/051533.html
> >
> > > > > Introduce two options to change the device's flip property via device tree.
> > > > >
> > > > > As there is already support for the panel-common driver [1], add it for cameras in the same way.
> > > > >
> > > > > [1] commit 3c0ecd83eee9 ("dt-bindings: display: panel: Move flip properties to panel-common")
> > > > >
> > > > > Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
> > > > > ---
> > > > > Fabian Pfitzner (2):
> > > > >         media: dt-bindings: add flip properties
> > > > >         media: v4l: fwnode: parse horizontal/vertical flip properties
> > > > >
> > > > >    .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
> > > > >    drivers/media/v4l2-core/v4l2-fwnode.c                             | 3 +++
> > > > >    include/media/v4l2-fwnode.h                                       | 4 ++++
> > > > >    3 files changed, 15 insertions(+)
> > > > > ---
> > > > > base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> > > > > change-id: 20250718-fpf-media-dt-flip-7fcad30bcfb7
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Fabian Pfitzner <f.pfitzner@pengutronix.de>
> > > > >
> > > --
> > > Pengutronix e.K.                           | Fabian Pfitzner             |
> > > Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> > > 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> > > Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
> > >
> --
> Pengutronix e.K.                           | Fabian Pfitzner             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
>

