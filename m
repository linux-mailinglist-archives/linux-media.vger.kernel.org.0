Return-Path: <linux-media+bounces-5062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5EC852E3D
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 11:44:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E8911C20A90
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 10:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B97250E2;
	Tue, 13 Feb 2024 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="qo3NUzbF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227922C69C;
	Tue, 13 Feb 2024 10:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707821047; cv=none; b=ulGdH8uhv0mIC7eALczfVlYpkyqvBSeUnWuji3/FNwJay45mLbRf6cGi0Y6jYpuE8T5V44vRyGxuYkseBLhjqfFChUSpJ0lUS07ubgOiI/KGH26sMH3wzS8on8qzd4mKkuEHWuL51Q9w+i6c70WNFXrsM8QA0jBkqgiCvjZEKgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707821047; c=relaxed/simple;
	bh=lr23qGBwdprFgxx9vqmDLO+mmrKrYyZedQFodyW1Usg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+7HEI9JxfGGhbhsk2WXBU1GZVrBkUMUqTbn4z/LS3rMxUI8j/QTqPt8Gq6/oZpmLG3Eih9Pw5LebVWjauIZxE/Ip/uqvXNdlJhT4ILCUQy/9thGXYHrtkJ6spLMV9q4KcngMXT+VycggwNhWoi24PhDRoFbRzS23Q56H6+Pq3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=qo3NUzbF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (unknown [109.130.69.237])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9219F675;
	Tue, 13 Feb 2024 11:44:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707821040;
	bh=lr23qGBwdprFgxx9vqmDLO+mmrKrYyZedQFodyW1Usg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qo3NUzbF4SQc9cDzgrxdlt+wVyMIdyO1PW+nW1XsbhIdT3cn0X2Hpt2qCFWTVkRIg
	 6GSFKeeOaqILTK1Y1+++InjrvpWFwhy9SBaSrFVHvSULOHLKTd3sxOfnrbcYIp0E3F
	 ZPxMXzK+r/oLObkPdnMc7E8rp6jZ97GkZNvRjtZk=
Date: Tue, 13 Feb 2024 12:44:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Naushir Patuck <naush@raspberrypi.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Plowman <david.plowman@raspberrypi.com>,
	Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 6/8] media: dt-bindings: Add bindings for Raspberry Pi
 PiSP Back End
Message-ID: <20240213104405.GB5012@pendragon.ideasonboard.com>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-7-jacopo.mondi@ideasonboard.com>
 <7f7979af-8eda-48cd-a334-bb64ddf5b9b8@linaro.org>
 <myfjzqh4wqa3lf4dcrgaswrarlh7sril6vz3mtnbz646rwxylt@oz75b5j5srot>
 <b55f4d1e-2e77-4539-8d18-8d8f2185b501@linaro.org>
 <5db2c830-2615-4416-9bb1-18fcd2a3a980@ideasonboard.com>
 <CAEmqJPo-A4wiAiuCa2pb84UU_rTTo9i5P9Kj6eo78MFEs1Y45w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAEmqJPo-A4wiAiuCa2pb84UU_rTTo9i5P9Kj6eo78MFEs1Y45w@mail.gmail.com>

On Tue, Feb 13, 2024 at 08:35:39AM +0000, Naushir Patuck wrote:
> On Tue, 13 Feb 2024 at 07:28, Tomi Valkeinen wrote:
> > On 12/02/2024 11:05, Krzysztof Kozlowski wrote:
> > > On 12/02/2024 09:50, Jacopo Mondi wrote:
> > >
> > >>>> +properties:
> > >>>> +  compatible:
> > >>>> +    const: raspberrypi,pispbe
> > >>>
> > >>> Nothing more specific? No model name, no version? It's quite generic
> > >>> compatible which in general should not be allowed. I would assume that
> > >>> at least version of Pi could denote some sort of a model... unless
> > >>> version is detectable?
> > >>
> > >> The driver matches on a version register and that should be enough to
> > >> handle quirks which are specific to an IP revision in the driver
> > >> itself.
> > >>
> > >> Considering how minimal the integration with the SoC is (one clock, one
> > >> interrupt and one optional iommu reference) even if we'll get future
> > >> revisions of the SoC I don't think there will be any need to match on
> > >> a dedicated compatible for bindings-validation purposes.
> > >>
> > >> However I understand that to be future-proof it's good practice to
> > >> allow a more flexible scheme, so we can have a generic fallback and a
> > >> revision-specific entry.
> > >>
> > >> Would
> > >>
> > >>    compatible:
> > >>      items:
> > >>        - enum:
> > >>          - raspberrypi,pipspbe-bcm2712
> > >
> > > bcm2712 is manufactured by Broadcom, not Raspberry Pi, so it should be
> > > rather Pi model?
> >
> > Indeed, this is something I don't get. If the BE is in the bcm2712, is
> > it not a broadcom IP? Why is raspberrypi in the compatible name at all?
> >
> > Naush, Dave?
> 
> The Backend (and Frontend) IP are both owned solely by Raspberry Pi,
> and the BE is instantiated on the BCM2712.  So I think "raspberry" in
> the compatible string is correct here.

Following what we do with other SoCs, we could have

	compatible = "brcm,pispbe-bcm2712", "raspberrypi,pispbe";

However, that scheme is mostly used when SoC vendor license IP cores
from third parties. Here, while the SoC is indeed manufactured by
Broadcom, it's a Raspberry Pi-specific SoC.

I don't have a personal preference.

> > >>        - const: raspberrypi,pispbe
> > >>
> > >> do in this case ?
> > >>
> > >> Also, let's see what RPi think as they are certainly more informed
> > >> than me on what a good revision-specific match could be
> > >
> > > I am fine with auto-detection, though.
> > >
> > > ...
> > >
> > >>>> +
> > >>>> +examples:
> > >>>> +  - |
> > >>>> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > >>>> +
> > >>>> +    rpi1 {
> > >>>
> > >>> soc {
> > >>>
> > >>
> > >> Are you sure ? This will only ever live in the 'rp1' node.
> > >
> > > What is "rp1" node? Does not look like a generic name.
> >
> > I don't think this is right. RP1 is a separate chip, an IO controller,
> > on raspberrypi 5. BE is not in the RP1.
> 
> Oops, missed this.  Yes, I think it should be the "soc" node.

-- 
Regards,

Laurent Pinchart

