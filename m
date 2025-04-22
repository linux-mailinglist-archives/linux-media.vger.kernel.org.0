Return-Path: <linux-media+bounces-30720-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1E7A971D3
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 18:00:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C0593BE717
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 16:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F0A228936D;
	Tue, 22 Apr 2025 16:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KfkXWGFb"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD4618D63A
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745337643; cv=none; b=Ndv3ZKHsSpgPaRNjiLII93FrWSSO88X2pYV/tAOp/9xID4Sp1Q7+/Fo60auseUBWidrLGPpZe23AadebamfdTjmolf25ZB5iJmzRD3AXVkDBNPY4L/160fY42mknyISw0p1MHIqnNQIs5QmEer/1gC4O0Wm45WkyiCzlK4bOws8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745337643; c=relaxed/simple;
	bh=CXl6EWXSnPwP9mQoUHkJVLkdYnRUpjsNoUySVZfG87w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Poa9HhKiHIEGxvN+Xw8heJZB3r8LfYvy8YNtsMqecq3yi35sBxYIT44grBKB+IyE9Rfzcwa/swLv/Mwd5VqWbNd+57zj1/4LBxeECWgcZwbNhRN/8NJeJwatkuYGaKW+0vJtmAbArhycTGtWLg6y69D+dvPSe/TZsyOREn7nBOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KfkXWGFb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (mob-109-118-124-17.net.vodafone.it [109.118.124.17])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14B5B2AC;
	Tue, 22 Apr 2025 18:00:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745337633;
	bh=CXl6EWXSnPwP9mQoUHkJVLkdYnRUpjsNoUySVZfG87w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KfkXWGFbgdnnHW8rLzjJst/MjaOrTOleJarjyT+bem5T0DiiU6WO8gJ+FR1HS9mBm
	 zlRUSrXTbvx9HN5EHlzn/6FyRRSU5sYTuOIUdWO20Pdleln+fZRC8Z0zmQUc2ihrIk
	 MJCAZcVjGRydjcZFu6qPBgfckvufahBofPG4ZO/Q=
Date: Tue, 22 Apr 2025 18:00:29 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Michael Tretter <m.tretter@pengutronix.de>, Tomasz Figa <tfiga@chromium.org>, 
	"Hu, Jerry W" <jerry.w.hu@intel.com>, Steve Cho <stevecho@chromium.org>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Kevin Hilman <khilman@baylibre.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Arthur Vinchon <arthur.vinchon@allegrodvt.com>, 
	Marco Felsch <m.felsch@pengutronix.de>, Jackson Lee <jackson.lee@chipsnmedia.com>, 
	Mirela Rabulea <mirela.rabulea@nxp.com>, Hans de Goede <hdegoede@redhat.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, Devarsh Thakkar <devarsht@ti.com>, 
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v2)\
Message-ID: <o53sheu5bp4mqqddyjwj7yyedyhcgaygs2ymeufk5pbaplou3z@olrpr5h6k4ac>
References: <71a1ba46-04c3-4694-95e7-9e2906b1d899@jjverkuil.nl>
 <cnvl2vshkwxuyfuyvunmgdgpvuwaijl4im7c7jqwdm7sa3o7kw@fnsarnzh6blm>
 <b2c3472d-10d5-4573-879e-68b53426de0f@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b2c3472d-10d5-4573-879e-68b53426de0f@jjverkuil.nl>

Hi Hans

On Tue, Apr 22, 2025 at 05:12:09PM +0200, Hans Verkuil wrote:
> On 22/04/2025 17:07, Jacopo Mondi wrote:
> > Hi Hans
> >
> > On Mon, Apr 21, 2025 at 02:31:34PM +0200, Hans Verkuil wrote:
> >> Hi all,
> >>
> >> Here is my v2 of the draft agenda for the media summit. The only changes
> >> are dropping Sebastian's email and fixing Devarsh' email.
> >>
> >> As always, this draft agenda is subject to change and all times are guesstimates!
> >>
> >> Please note that I am transitioning from my old hverkuil@xs4all.nl email to
> >> my new hans@jjverkuil.nl email. If you have problems replying to that new email,
> >> please let me know and just send it to the old email (that won't go away).
> >>
> >> The Media Summit will be held Tuesday May 13th to coincide with
> >> the Embedded Recipes Conference in Nice, France:
> >>
> >> https://embedded-recipes.org/2025/
> >>
> >> Note that there are also some workshops held after this conference:
> >>
> >> https://embedded-recipes.org/2025/workshops/
> >>
> >> And a gStreamer hackfest:
> >>
> >> https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366
> >>
> >> The Media Summit will be held at Hotel Campanile:
> >>
> >> https://nice-aeroport.campanile.com/en-us/
> >>
> >> It is close to the Airport and to the Embedded Recipes venue.
> >>
> >> The meeting room can hold up to 30 people and has video conferencing support; it is
> >> sponsored by Collabora and Cisco Systems Norway.
> >>
> >> We currently have the following confirmed in-person attendees:
> >>
> >> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> >> Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
> >> Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
> >> Hans de Goede <hdegoede@redhat.com> (RedHat)
> >> Paul Kocialkowski <paulk@sys-base.io> (sys-base)
> >> Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
> >> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
> >> Ricardo Ribalda <ribalda@chromium.org> (Google)
> >> Maxime Ripard <mripard@redhat.com> (RedHat)
> >> Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
> >> Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
> >> Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)
> >>
> >> As you can see, there is enough room for more people, so don't hesitate to
> >> register by sending an email to me. The deadline is May 2nd.
> >>
> >> And the following remote participants:
> >>
> >> Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
> >> Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
> >> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
> >> jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
> >> Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
> >> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> >>
> >> Note: information on how to connect remotely will come later.
> >>
> >> If any information above is incorrect, or if I missed someone, then please let me know asap.
> >>
> >> Draft Agenda:
> >>
> >> 9:00-9:30: Get settled :-)
> >>
> >> 9:30-9:40: Hans Verkuil: Quick introduction
> >>
> >> 9:40-10:30: Jai Luthra: Per-stream V4L2 controls
> >>
> >> 10:30-11:15: Paul Kocialkowski: Stateless video encoding uAPI
> >>
> >> 11:15-11:30: break
> >>
> >> 11:30-12:15: Ricardo Ribalda: Openness Framework for ISPs
> >>
> >> 12:15-13:30: lunch TBD
> >>
> >> 13:30-14:00: Laurent Pinchart: Review of the status of staging drivers
> >>
> >> 14:00-15:00: Hans Verkuil: Status of Media CI/Multi-committers
> >>
> >> 15:00-17:00: TDB
> >>
> >> Please reply with corrections, questions, etc. to this email. I'll update the agenda
> >> over time. Again, these times are very preliminary.
> >>
> >> Also, as you can see we are light on topics, so don't hesitate to add more.
> >>
> >> Part of the reason for this is that we switched to co-locating from the ELCE to the
> >> Embedded Recipes conference, so it is only 8 months since the previous Media Summit.
> >
> > Ups sorry, seems like I'm late :)
> >
> > I procrastinated to these days as I would have liked to be able to
> > propose a well structured topic about multi-context support which was
> > presented 8 months ago. Since then I paused working on it but I should
> > be able to reserve time in the following months.
> >
> > Unfortunately I wasn't able to dedicate much time to that, however in
> > the weeks before the media summit I would like to explore a bit how to
> > unify the multi-context support with the m2m context handling, with
> > the aim to use a single mechanism to support both.
> >
> > If you have a tiny 15/20 minutes slot I would be glad to present a
> > plan to you, Nicolas and other more well versed in codec support than
> > me.
> >
> > Thanks and sorry for being late.
>
> No problem! I've added a slot for this topic. I think I can safely assume
> you'll be there in person?
>

Yeah sure, sorry if I haven't specified it

Thanks
  j

> In any case, both the agenda and the participants list are now nicely filling up :-)
>
> Regards,
>
> 	Hans
>
> >
> >>
> >> Regards,
> >>
> >> 	Hans
> >>
>

