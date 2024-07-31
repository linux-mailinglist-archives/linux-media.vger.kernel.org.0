Return-Path: <linux-media+bounces-15632-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C25942B0B
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 11:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19E8F287F81
	for <lists+linux-media@lfdr.de>; Wed, 31 Jul 2024 09:45:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E3D1AD403;
	Wed, 31 Jul 2024 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b62FzbIZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1DB41AD3E9;
	Wed, 31 Jul 2024 09:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722418770; cv=none; b=qhf8MQxFRl1O3bpgPBUe2sF7C5iLGYtsMv+0SNi8JeKUxz8TPOURQzrrT8WRwcdgKyDEZo1khFOZMxcwi4Is+gzd2d1QqS28utWegL3Ld4AsxzAUHDUAQVxuZBjnORERVyhDUJl1A8rf7Et9kSuXg5UZGhmVhQkfn4jUR/7Oo9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722418770; c=relaxed/simple;
	bh=5ujX0aXhjVcZ++VxQ8+WAlrI00TCumU0UQ1Quewl8ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=orSe5XvzQqAKuoEaXVZgar0G0YbjypLl2PGmEDwxOMFGTAgamByhkXPJzTQ50Lxg3t5fOAq73+B7VX5JoLACu9MXBH/1BG1hiEskRd1HvABM526Dlj2PWWGFR4FvAXljpYtxDP038wkLajIQrlPVsYZZCYt7wcQaCp76iOIGqRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b62FzbIZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB937842;
	Wed, 31 Jul 2024 11:38:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1722418718;
	bh=5ujX0aXhjVcZ++VxQ8+WAlrI00TCumU0UQ1Quewl8ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b62FzbIZ1u9S0HjFk6UpU3LKK+ylkau7CgrV1lc0vzgMCTub5jg8+JXojuddkHcQP
	 /BYw+26Bvz1HzP284yoQoLBziBHVGcNdm8naBkc/sKf2pjl+BE81N+6/qGQGJpUecc
	 nOQFzcY5TiSTnDIiKfCQN/HZF1gYGGEJe60ErD4Y=
Date: Wed, 31 Jul 2024 12:39:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, stable@vger.kernel.org,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: Re: [PATCH v2 2/2] media: imx335: Fix reset-gpio handling
Message-ID: <20240731093905.GQ8146@pendragon.ideasonboard.com>
References: <20240729110437.199428-1-umang.jain@ideasonboard.com>
 <20240729110437.199428-3-umang.jain@ideasonboard.com>
 <ef05c39a-ad5c-4751-a758-f73a2d114823@kernel.org>
 <ZqijVf68ZQuFGKhU@kekkonen.localdomain>
 <729280cd-557f-43ba-b1a6-8d319977ca82@kernel.org>
 <20240730091011.GL300@pendragon.ideasonboard.com>
 <cefc0b19-f065-4023-a536-56b2762ac967@ideasonboard.com>
 <172241654546.392292.16164306008596010671@ping.linuxembedded.co.uk>
 <c4f697d7-16a0-46d2-be34-45f6a8efaec8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4f697d7-16a0-46d2-be34-45f6a8efaec8@kernel.org>

On Wed, Jul 31, 2024 at 11:06:38AM +0200, Krzysztof Kozlowski wrote:
> On 31/07/2024 11:02, Kieran Bingham wrote:
> > Quoting Umang Jain (2024-07-31 06:41:35)
> >> On 30/07/24 2:40 pm, Laurent Pinchart wrote:
> >>> On Tue, Jul 30, 2024 at 10:42:01AM +0200, Krzysztof Kozlowski wrote:
> >>>> On 30/07/2024 10:24, Sakari Ailus wrote:
> >>>>> Hi Krzysztof,
> >>>>>
> >>>>> On Mon, Jul 29, 2024 at 04:09:39PM +0200, Krzysztof Kozlowski wrote:
> >>>>>> On 29/07/2024 13:04, Umang Jain wrote:
> >>>>>>> Rectify the logical value of reset-gpio so that it is set to
> >>>>>>> 0 (disabled) during power-on and to 1 (enabled) during power-off.
> >>>>>>>
> >>>>>>> Meanwhile at it, set the reset-gpio to GPIO_OUT_HIGH at initialization
> >>>>>>> time to make sure it starts off in reset.
> >>>>>>>
> >>>>>>> Fixes: 45d19b5fb9ae ("media: i2c: Add imx335 camera sensor driver")
> >>>>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> >>>>>>> ---
> >>>>>>>   drivers/media/i2c/imx335.c | 8 ++++----
> >>>>>>>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>>>>>>
> >>>>>> This will break all the users, so no. At least not without mentioning
> >>>>>> ABI break and some sort of investigating how customers or users are
> >>>>>> affected.
> >>>>>
> >>>>> I know the original authors aren't using the driver anymore and it took
> >>>>> quite a bit of time until others started to contribute to it so I suspect
> >>>>> the driver hasn't been in use for that long. There are no instances of the
> >>>>> device in the in-kernel DTS either.
> >>>>>
> >>>>> Any DTS author should have also noticed the issue but of course there's a
> >>>>> risk someone could have just changed the polarity and not bothered to chech
> >>>>> what it was supposed to be.
> >>>>>
> >>>>> I agree the commit message should be more vocal about the effects on
> >>>>> existing DTS.
> >>>>
> >>>> I can imagine that all users (out of tree, in this case) inverted
> >>>> polarity in DTS based on what's implemented. You could go with some
> >>>> trivial hack, like I did for one of codecs - see 738455858a2d ("ASoC:
> >>>> codecs: wsa881x: Use proper shutdown GPIO polarity"), but I remember
> >>>> Mark Brown rejected similar commit for newer drivers.
> >>>
> >>> I don't think there's any out-of-tree user, because when we started
> >>> using the recently driver, it required lots of fixes to even work at
> >>> all. I'll let Kieran and Umang comment on that, I haven't follow the
> >>> development in details.
> >>
> >> indeed, initially we had to put up fixes like :
> >>
> >> 14a60786d72e ("media: imx335: Set reserved register to default value")
> >> 81495a59baeba ("media: imx335: Fix active area height discrepency")
> >>
> >> to make the sensor work properly on our platforms. Only after that we 
> >> had a base to support more capabilities on the sensor (multiple lanes 
> >> support, flips, TPG etc.)
> > 
> > I would also add that we had to provide control for the regulators to be
> > able to power the device as well in fea91ee73b7c ("media: i2c: imx335:
> > Enable regulator supplies").
> 
> Hm? That's not a proof of anything. Supplies are often turned on by default.
> 
> > Given the driver was posted from Intel, I would have anticipated perhaps
> > the driver was in fact only actually tested by Intel on ACPI platforms -
> > yet with no ACPI table registered in the driver - even that could likely
> > be considered broken.
> 
> Nope, that does not work like that. Their platforms and such sensors are
> often used on DT based boards.

What DT-platforms would that be ?

> Not mentioning even PRP0001.

I don't think PRP0001 is used by Intel for camera sensors.

Sakari, do you have any information about all this ? Do you think
there's a risk that the driver is currently used by anyone with a
mainline kernel ?

> > Based on that I have a high confidence that there are no current users
> > of this driver (except us).
> 
> Nope, wrong conclusions, not that many arguments.

-- 
Regards,

Laurent Pinchart

