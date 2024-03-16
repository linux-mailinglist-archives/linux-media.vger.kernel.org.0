Return-Path: <linux-media+bounces-7176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB2F87DB63
	for <lists+linux-media@lfdr.de>; Sat, 16 Mar 2024 21:07:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8AE8B212C7
	for <lists+linux-media@lfdr.de>; Sat, 16 Mar 2024 20:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2D01C2A1;
	Sat, 16 Mar 2024 20:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="shsp9n5R"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD361C280;
	Sat, 16 Mar 2024 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710619630; cv=none; b=eWovkaGTznJDNbXU5FKZHoa0JxXprALroOxXPBKGGrBKU3IobFoWGG6OI+fv4Vqvxg/roAlEl5vWz21LYKqQLXzLHloV4o6RkqR8OpT1bENwD2ts/Wzj6HWzUooe5q5x+n3LIZW38fDtbqj12u0x8uH9pZVM9Waaz3uK9vTctBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710619630; c=relaxed/simple;
	bh=n8VYe7pPPXPaYaXKPPOW9Bb0UqIlFA7DZeGD5dCwJHM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kuxmmM7Qyhl4VusJztWu2Gcs3Tg6T9LEJLEqp/BdYJ2QP2fU7T9SgW7IzMu0SPX3kBL551/LxfZXwTNgiMMQpGuB+blV/rNEeMSdwN5hSjrPItG3OjaJkFQPSfeNxN35+jCs2uwPWcdKFbyACgQs/Mc27NRXLjVjbQyAdWj7Log=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=shsp9n5R; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0837A5AA;
	Sat, 16 Mar 2024 21:06:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710619595;
	bh=n8VYe7pPPXPaYaXKPPOW9Bb0UqIlFA7DZeGD5dCwJHM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=shsp9n5RmnQtnklDw/OSh+YTXJFjns2rDCniHiiw/EDrwwh8Zhw6p6I+j2MS6xGSy
	 V96wHUn1qUtVSwtYAy5e1wDYh0zM6CIlYI3pGw/Ef1p3Lvax2gdA8kaKKPhjVxsSj0
	 gqKkO4YhVpnGEYskNRkcke/PHHLVydoZU76MHCP4=
Date: Sat, 16 Mar 2024 22:06:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	David Plowman <david.plowman@raspberrypi.com>,
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Naushir Patuck <naush@raspberrypi.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	kernel-list@raspberrypi.com, linux-rpi-kernel@lists.infradead.org,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
	Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 00/15] media: Add driver for the Raspberry Pi <5 CSI-2
 receiver
Message-ID: <20240316200657.GB9082@pendragon.ideasonboard.com>
References: <20240301213231.10340-1-laurent.pinchart@ideasonboard.com>
 <20240301213840.GC25826@pendragon.ideasonboard.com>
 <51510f4f-67aa-4f7a-bf6d-c09f8bddb85d@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <51510f4f-67aa-4f7a-bf6d-c09f8bddb85d@broadcom.com>

Hi Florian,

On Fri, Mar 15, 2024 at 07:02:38AM -0700, Florian Fainelli wrote:
> On 3/1/2024 1:38 PM, Laurent Pinchart wrote:
> > The subject line should obviously have read 'PATCH v6', and I should
> > have updated Jean-Michel's e-mail address instead of blindly relying on
> > get-maintainer.pl. Maybe sending patches on a Friday evening isn't he
> > best idea after all. Sorry about that.
> > 
> > On Fri, Mar 01, 2024 at 11:32:15PM +0200, Laurent Pinchart wrote:
> >> Hello everybody,
> >>
> >> This patch series adds a new driver for the BCM2835 (and derivative)
> >> CCP2/CSI2 camera interface named Unicam. This IP core is found in the
> >> VC4-based Raspberry Pi, namely the Pi Zero, Pi 3 and Pi 4.
> >>
> >> Camera support for Raspberry Pi 4 currently relies on a downstream
> >> Unicam driver that live in the Raspberry Pi kernel tree ([1]). The
> >> driver uses the V4L2 API, but works around the lack of features in V4L2
> >> to properly support sensor embedded data. Since the Unicam driver
> >> development by Raspberry Pi, some of those features have been merged in
> >> the kernel (namely the V4L2 streams API) or are being developed (namely
> >> generic metadata formats and subdev internal pads), with patches posted
> >> for review on the linux-media mailing list ([2]).
> >>
> >> This new upstream driver is based on the downstream code, extensively
> >> reworked to use the new V4L2 APIs.
> >>
> >> The series is based on top of a merge of
> >>
> >> - v7 of the generic metadata and internal pads, rebased on v6.8-rc5 ([3])
> >> - the downstream ISP driver ported to mainline ([4])
> >>
> >> For convenience, it can be found in [5]. Note that the ISP driver is
> >> getting upstreamed separately.
> >>
> >> The series starts with five patches that add support for streams and
> >> embedded data to the imx219 driver (01/15 to 05/15). Patches 06/15 to
> >> 09/15 then add the Unicam driver, with new V4L2 pixel formats (06/15 and
> >> 07/15) and DT bindings (08/15) The remaining patches cover DT
> >> integration (10/15 to 14/15) with a sample DT overlay for the IMX219
> >> camera module (15/15).
> 
> I am really keen on taking the DTS patches now so you know those are 
> taken care of, make it to linux-next shortly and then we can focus on 
> the drivers/media aspects. Stefan, does that work for you?

10/15 and 11/15 should be fine to merge already, although 11/15 depends
on the DT bindings in 08/15. Even if the unicam driver needs a respin, I
think the bindings are safe to merge already. Do you plan to take them
in your tree with the corresponding DTS patches ?

For 12/15 (the pinctrl-based I2C multiplexing), I'd really like an ack
from Dave. 13/15 is pretty straightforward but depends on 12/15. 14/15
is independent from all the other patches and can safely be merged I
think.

-- 
Regards,

Laurent Pinchart

