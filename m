Return-Path: <linux-media+bounces-38237-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 367ADB0EEAC
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 11:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABA8D582379
	for <lists+linux-media@lfdr.de>; Wed, 23 Jul 2025 09:44:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4D852857D7;
	Wed, 23 Jul 2025 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="exz+Z7Jk"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691F327FB16;
	Wed, 23 Jul 2025 09:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753263870; cv=none; b=GYk57Su3MSVkMbkMSe5NHgKJLdkBZ1tnEeaBENx6ywKylB37hSn9rHrY6yR8TjMlmUc54ZVRldnyzm9rmEj04lyOtN5Q9riVeidxw6m5TXqXQ+WNnu+zDNKUrgM7raUw2QKRWCbsbwhSczBB/IULSEQc+xrkjxQTbIWe3wv+btI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753263870; c=relaxed/simple;
	bh=KFVFHWpm934/QAZGp9+XxZle6EAU4Q20fO9IXytvIk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vAyWGKUWmxhGqICTA7H0D0hLGHCApeJ17tam6VHr9g1IzUhKY7ToOgekFz3ELOlZ3HaZJ7lEGR4/JCIKl/UUgL+bGJDlyZF05ut3fCTG5vq7t4IYcnPTVJnHYX7hUsgSw7b8R7Z+a8qgmaCCsJ8Dyr3L5HKM0OLFxrXqUgH/KOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=exz+Z7Jk; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 365D2E91;
	Wed, 23 Jul 2025 11:43:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1753263822;
	bh=KFVFHWpm934/QAZGp9+XxZle6EAU4Q20fO9IXytvIk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=exz+Z7Jk/C5p2V6i984Rlfyco9zOnoyMgmH3yj/Oh4Kw+bs81PtYeWw2ezS+6z7rL
	 7K+UNv3XacYSHTPBujSXqUPvmTNo/rV490w7PMqxJw77JE9UE1nGbjwzeuZHmgMDFp
	 IpzCEiO6Di8bpaGQ9X44pO8TntAzw7hqTvGvODOk=
Date: Wed, 23 Jul 2025 11:44:15 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Fabian Pfitzner <f.pfitzner@pengutronix.de>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	entwicklung@pengutronix.de
Subject: Re: [PATCH 0/2] parse horizontal/vertical flip properties
Message-ID: <mljx67lkcw4kh3cs344iprik244cm7hqfckmg4bj5j5atuyt62@lh2ht4mrtkjq>
References: <20250718-fpf-media-dt-flip-v1-0-75b3a938b4be@pengutronix.de>
 <ryuew3kxnocj6uqq4nadp3kyaxg27rxlrgnaieyy2hlpz5jkd3@iyetnsbfanee>
 <35debf21-bca7-480f-a61e-7b0494f10ca5@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <35debf21-bca7-480f-a61e-7b0494f10ca5@pengutronix.de>

On Wed, Jul 23, 2025 at 11:29:27AM +0200, Fabian Pfitzner wrote:
> On 7/23/25 11:17, Jacopo Mondi wrote:
> > Hi Fabian
> >
> > On Wed, Jul 23, 2025 at 10:58:28AM +0200, Fabian Pfitzner wrote:
> > > There are cameras containing a mirror on their optical path e. g. when
> > > mounted upside down.
> > How is this different from 'rotation = 180' ?
> If you simply want to flip the output (e. g. horizontally), you cannot do
> this with a rotation.
> The camera I'm referring to is not only upside down, but also flipped
> horizontally.

180 degress rotation = HFLIP + VFLIP

Yes, you can't express 'mirror' in DTS, because DTS are about the
physical mounting rotation of the camera. Sensor drivers shall not
apply any flip control automatically, it's userspace that by parsing
the rotation property through the associated v4l2 controls should decide
if it has to apply flips or not to correct the images.

What is the use case you had in mind ? Tell the driver through a DTS
property it has to apply flips to auto-compensate ? Because I think we
shouldn't and if I'm not mistaken we also document it:
https://www.kernel.org/doc/html/latest/userspace-api/media/drivers/camera-sensor.html#rotation-orientation-and-flipping

TL;DR drivers shall not flip, userspace should. Mirroring is an effect
of drivers applying an HFLIP, because unless I'm missing something
obvious, 'mirror' is not a physical mounting configuration of the camera
sensor.

FIY we're talking about something similar in libcamera
https://lists.libcamera.org/pipermail/libcamera-devel/2025-July/051533.html

> >
> > > Introduce two options to change the device's flip property via device tree.
> > >
> > > As there is already support for the panel-common driver [1], add it for cameras in the same way.
> > >
> > > [1] commit 3c0ecd83eee9 ("dt-bindings: display: panel: Move flip properties to panel-common")
> > >
> > > Signed-off-by: Fabian Pfitzner <f.pfitzner@pengutronix.de>
> > > ---
> > > Fabian Pfitzner (2):
> > >        media: dt-bindings: add flip properties
> > >        media: v4l: fwnode: parse horizontal/vertical flip properties
> > >
> > >   .../devicetree/bindings/media/video-interface-devices.yaml        | 8 ++++++++
> > >   drivers/media/v4l2-core/v4l2-fwnode.c                             | 3 +++
> > >   include/media/v4l2-fwnode.h                                       | 4 ++++
> > >   3 files changed, 15 insertions(+)
> > > ---
> > > base-commit: 6832a9317eee280117cd695fa885b2b7a7a38daf
> > > change-id: 20250718-fpf-media-dt-flip-7fcad30bcfb7
> > >
> > > Best regards,
> > > --
> > > Fabian Pfitzner <f.pfitzner@pengutronix.de>
> > >
> --
> Pengutronix e.K.                           | Fabian Pfitzner             |
> Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
>

