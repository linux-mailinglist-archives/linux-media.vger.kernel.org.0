Return-Path: <linux-media+bounces-15623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6328C9429D7
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 11:02:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 199E6282BF1
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27EEF1A8BED;
	Wed, 31 Jul 2024 09:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kK7J7VAe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95FD1CF93;
	Wed, 31 Jul 2024 09:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722416552; cv=none; b=q0HYst0TgUFbRpM8q/Tcdum3nyYDyScOIQiYKxvTjHIWYzBG/ArMDB9KIFoyKeZnQqJEnSMnMUZUhUfaMV8mVzAfZvxH6cZcmnHdFC1hRuoSXldJptsdS4w5jyh2vkAZ08+cR5Uo6QdCYgM4YwU+FNOz1Z5X+JEL9mLlucnQtWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722416552; c=relaxed/simple;
	bh=AB2p6wGJjXid3HdQ0XFK5dg77scNWUczy0gxuj1MWjU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oHOknmiDRQxwMMaDt776FrHG+hm7rkBRxSuDjkJh/TmGAhyk5yt8sFGQudqg5n8rb6igdqBlkW0PBsb2bPsG0KQqOTFRNKC2t3p1gHJ/93RkxR1fuKvEkCgrug3AtsYx2V/LwHw9b8YNvAiqW2pyykrjASPTP5lqgv3LtJknB6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kK7J7VAe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id BE54C842;
	Wed, 31 Jul 2024 11:01:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722416500;
	bh=AB2p6wGJjXid3HdQ0XFK5dg77scNWUczy0gxuj1MWjU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=kK7J7VAeYxjrX8yUi76juI/Y+cxD45n9oJxi6ywK8xvW1++5xbyBwxcs3AlROGNvN
	 kuk37VO6B4LtHK44FZo5fWewQVVuQB1kgI8bNQsHI2WrhaxL/+yOEMfoWs84TqeYRR
	 WZ3xY+PmnCDG351Rd6FuEIUnyQtQv4CGlXQeyaIc=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <cefc0b19-f065-4023-a536-56b2762ac967@ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com> <20240729110437.199428-3-umang.jain@ideasonboard.com> <ef05c39a-ad5c-4751-a758-f73a2d114823@kernel.org> <ZqijVf68ZQuFGKhU@kekkonen.localdomain> <729280cd-557f-43ba-b1a6-8d319977ca82@kernel.org> <20240730091011.GL300@pendragon.ideasonboard.com> <cefc0b19-f065-4023-a536-56b2762ac967@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org, stable@vger.kernel.org, Tommaso Merciai <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Umang Jain <umang.jain@ideasonboard.com>
Date: Wed, 31 Jul 2024 10:02:25 +0100
Message-ID: <172241654546.392292.16164306008596010671@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Umang Jain (2024-07-31 06:41:35)
> Hi all,
>=20
> On 30/07/24 2:40 pm, Laurent Pinchart wrote:
> > On Tue, Jul 30, 2024 at 10:42:01AM +0200, Krzysztof Kozlowski wrote:
> >> On 30/07/2024 10:24, Sakari Ailus wrote:
> >>> Hi Krzysztof,
> >>>
> >>> On Mon, Jul 29, 2024 at 04:09:39PM +0200, Krzysztof Kozlowski wrote:
> >>>> On 29/07/2024 13:04, Umang Jain wrote:
> >>>>> Rectify the logical value of reset-gpio so that it is set to
> >>>>> 0 (disabled) during power-on and to 1 (enabled) during power-off.
> >>>>>
> >>>>> Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initializat=
ion
> >>>>> time to make sure it starts off in reset.
> >>>>>
> >>>>> Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
> >>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >>>>> ---
> >>>>>   drivers/media/i2c/imx335.c | 8 ++++----
> >>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>>
> >>>> This will break all the users, so no. At least not without mentioning
> >>>> ABI break and some sort of investigating how customers or users are
> >>>> affected.
> >>> I know the original authors aren't using the driver anymore and it to=
ok
> >>> quite a bit of time until others started to contribute to it so I sus=
pect
> >>> the driver hasn't been in use for that long. There are no instances o=
f the
> >>> device in the in-kernel DTS either.
> >>>
> >>> Any DTS author should have also noticed the issue but of course there=
's a
> >>> risk someone could have just changed the polarity and not bothered to=
 chech
> >>> what it was supposed to be.
> >>>
> >>> I agree the commit message should be more vocal about the effects on
> >>> existing DTS.
> >> I can imagine that all users (out of tree, in this case) inverted
> >> polarity in DTS based on what's implemented. You could go with some
> >> trivial hack, like I did for one of codecs - see 738455858a2d ("ASoC:
> >> codecs: wsa881x: Use proper shutdown GPIO polarity"), but I remember
> >> Mark Brown rejected similar commit for newer drivers.
> > I don't think there's any out-of-tree user, because when we started
> > using the recently driver, it required lots of fixes to even work at
> > all. I'll let Kieran and Umang comment on that, I haven't follow the
> > development in details.
>=20
> indeed, initially we had to put up fixes like :
>=20
> 14a60786d72e ("media: imx335: Set reserved register to default value")
> 81495a59baeba ("media: imx335: Fix active area height discrepency")
>=20
> to make the sensor work properly on our platforms. Only after that we=20
> had a base to support more capabilities on the sensor (multiple lanes=20
> support, flips, TPG etc.)

I would also add that we had to provide control for the regulators to be
able to power the device as well in fea91ee73b7c ("media: i2c: imx335:
Enable regulator supplies").

Given the driver was posted from Intel, I would have anticipated perhaps
the driver was in fact only actually tested by Intel on ACPI platforms -
yet with no ACPI table registered in the driver - even that could likely
be considered broken.

Based on that I have a high confidence that there are no current users
of this driver (except us).

Umang, I see we need an updated patch with commit message to cover this,
please consider the above to add in there too.
--
Kieran

