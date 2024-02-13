Return-Path: <linux-media+bounces-5053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54234852A5A
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 08:58:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85C141C21AB2
	for <lists+linux-media@lfdr.de>; Tue, 13 Feb 2024 07:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 402FA17994;
	Tue, 13 Feb 2024 07:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mflom04T"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB91171AF;
	Tue, 13 Feb 2024 07:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707811084; cv=none; b=O4CIIeFkwj6LuJLUr9O6WJ9HUHo3g6kWbsFEBa2lWA3WLxvA7GfEyOlqcibEodWP/xaXVe1o2nHYq67+oauF410euObsgiH4lB+I+CQzVD76FL+duG/r22wyKir4pZFigX8UkI6tjGbVJG9dc0oQ1xG80PY0cURJG+UJOrG52HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707811084; c=relaxed/simple;
	bh=IlQIXZ0vuPM9VYTcGTSz+/Mswdp4GxOR03Z3jQ0NPR4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3dBPWoh5xxLAPrG0D3YrIEmjCM+p+qg0PnDQLxNF+EGDkBlwJS7lBrBF8zbPmcmSzgXv7MZh+PSJ26MKTQGOeB6ZGLRdRYLI4tqaG41xgcw4kcWWMnOh3SELAe/1M3p2pDAHyTuWRIcJl97I/3x7mHoyrrgjM9BzJloahdNGY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mflom04T; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 67C3D675;
	Tue, 13 Feb 2024 08:57:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707811078;
	bh=IlQIXZ0vuPM9VYTcGTSz+/Mswdp4GxOR03Z3jQ0NPR4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mflom04T5WlZzuwSJm2AoS6RELf0vijDmcDQcZbVO6mXARMijzqJBGhNs8InrLZNK
	 m+Y4EgjXgzTrTsd6/2Lk0zeOq5Qe5gR2j/Dm3hxSNBFFeBr5vlwuVD/9BvpYyXKFpo
	 uo5dGwau13HrsPshiMXfH1YjDhqg6/jGeSi/U+qA=
Date: Tue, 13 Feb 2024 08:57:56 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, David Plowman <david.plowman@raspberrypi.com>, 
	Naushir Patuck <naush@raspberrypi.com>, Nick Hollinghurst <nick.hollinghurst@raspberrypi.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	devicetree@vger.kernel.org
Subject: Re: Re: [PATCH 6/8] media: dt-bindings: Add bindings for Raspberry
 Pi PiSP Back End
Message-ID: <n4hxdf4clbsbvjau4khozf2p4kdgygvktriuo7knlv6xl3dncg@bcpaqag4fsgg>
References: <20240209164825.166800-1-jacopo.mondi@ideasonboard.com>
 <20240209164825.166800-7-jacopo.mondi@ideasonboard.com>
 <7f7979af-8eda-48cd-a334-bb64ddf5b9b8@linaro.org>
 <myfjzqh4wqa3lf4dcrgaswrarlh7sril6vz3mtnbz646rwxylt@oz75b5j5srot>
 <b55f4d1e-2e77-4539-8d18-8d8f2185b501@linaro.org>
 <5db2c830-2615-4416-9bb1-18fcd2a3a980@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5db2c830-2615-4416-9bb1-18fcd2a3a980@ideasonboard.com>

Hi Tomi

On Tue, Feb 13, 2024 at 09:28:33AM +0200, Tomi Valkeinen wrote:
> Hi,
>
> On 12/02/2024 11:05, Krzysztof Kozlowski wrote:
> > On 12/02/2024 09:50, Jacopo Mondi wrote:
> >
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    const: raspberrypi,pispbe
> > > >
> > > > Nothing more specific? No model name, no version? It's quite generic
> > > > compatible which in general should not be allowed. I would assume that
> > > > at least version of Pi could denote some sort of a model... unless
> > > > version is detectable?
> > > >
> > >
> > > The driver matches on a version register and that should be enough to
> > > handle quirks which are specific to an IP revision in the driver
> > > itself.
> > >
> > > Considering how minimal the integration with the SoC is (one clock, one
> > > interrupt and one optional iommu reference) even if we'll get future
> > > revisions of the SoC I don't think there will be any need to match on
> > > a dedicated compatible for bindings-validation purposes.
> > >
> > > However I understand that to be future-proof it's good practice to
> > > allow a more flexible scheme, so we can have a generic fallback and a
> > > revision-specific entry.
> > >
> > > Would
> > >
> > >    compatible:
> > >      items:
> > >        - enum:
> > >          - raspberrypi,pipspbe-bcm2712
> >
> > bcm2712 is manufactured by Broadcom, not Raspberry Pi, so it should be
> > rather Pi model?
>
> Indeed, this is something I don't get. If the BE is in the bcm2712, is it
> not a broadcom IP? Why is raspberrypi in the compatible name at all?
>
> Naush, Dave?
>
> > >        - const: raspberrypi,pispbe
> > >
> > > do in this case ?
> > >
> > > Also, let's see what RPi think as they are certainly more informed
> > > than me on what a good revision-specific match could be
> >
> > I am fine with auto-detection, though.
> >
> > ...
> >
> > > > > +
> > > > > +examples:
> > > > > +  - |
> > > > > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > > > > +
> > > > > +    rpi1 {
> > > >
> > > > soc {
> > > >
> > >
> > > Are you sure ? This will only ever live in the 'rp1' node.
> >
> > What is "rp1" node? Does not look like a generic name.
>
> I don't think this is right. RP1 is a separate chip, an IO controller, on
> raspberrypi 5. BE is not in the RP1.
>

Ah yes indeed, bad copy and paste from me. I'll s/rpi/soc as suggested
by Krzysztof

>  Tomi
>
>

