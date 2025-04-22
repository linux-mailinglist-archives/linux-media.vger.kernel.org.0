Return-Path: <linux-media+bounces-30684-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E20A960BF
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 10:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4343C3A4987
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 08:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D402F1EB9F6;
	Tue, 22 Apr 2025 08:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="glHqG2Fd"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB94B2F3E
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 08:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309746; cv=none; b=mE8XeajptRFRYzeQv3aSun3vS8hHjyY6i8EWqO0qb2WOwzU8VNTaC5UGUFdRaSPA1ijfGu5r78XGPhtfsfZSczsUcC1D/hs1WAXumrBZKTwQU2FdZwMS0OL2Xqoqfyn3IHeRo4HKdoUW5VSrKtH6JwYz3osIrRFKq7t2t/9m/+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309746; c=relaxed/simple;
	bh=6Y28FCVl/hNQDRBWxa3zp9CVg6eJ8W0TQ6PnnvCyJqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qc/XrqP1/vZkVxSlsiVkUdVoQ67XvRW5eq0dKChlpsvEiT7j+wvR/MNxQR+h2lQjdwU72Xf977Mn2d+HlRCIAPLK6VrdJVyLKdteUtir6XI2Ch0pKM10qcGieZCsj59MfqizYnzqyrOxB1QVDTSpGxL3GrnQbrBrivfMpIuCjso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=glHqG2Fd; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 71CC6250;
	Tue, 22 Apr 2025 10:13:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745309612;
	bh=6Y28FCVl/hNQDRBWxa3zp9CVg6eJ8W0TQ6PnnvCyJqs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=glHqG2Fde75PDp13bL1r2AHTHhyZyMbpLcvSqrBCG3tkPDp7iWd7qti9qJCOBxwSt
	 hSx6+NNADT8B6I1bgvQNhZwQTED5/1XsHjpf49KucPJrmnETUL+ZIGdylk8AcRHERH
	 /raSsMLl3zP7u352RINOZGdOv6/bIb3DF3XrlmTA=
Date: Tue, 22 Apr 2025 11:15:36 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hans@jjverkuil.nl>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Tomasz Figa <tfiga@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Steve Cho <stevecho@chromium.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Arthur Vinchon <arthur.vinchon@allegrodvt.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Mirela Rabulea <mirela.rabulea@nxp.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Devarsh Thakkar <devarsht@ti.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [ANN] Media Summit May 13th: Draft Agenda (v2)
Message-ID: <20250422081536.GA16980@pendragon.ideasonboard.com>
References: <71a1ba46-04c3-4694-95e7-9e2906b1d899@jjverkuil.nl>
 <4fac2850-4a89-4917-a9ee-2518331d5bbf@redhat.com>
 <cb9be4d7-f74a-44b8-b480-6f7ae68d64b6@jjverkuil.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cb9be4d7-f74a-44b8-b480-6f7ae68d64b6@jjverkuil.nl>

On Tue, Apr 22, 2025 at 10:01:38AM +0200, Hans Verkuil wrote:
> On 21/04/2025 19:39, Hans de Goede wrote:
> > On 21-Apr-25 2:31 PM, Hans Verkuil wrote:
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
> > 
> > As discussed here:
> > 
> > https://lore.kernel.org/linux-media/6cf8d6db-c24e-461b-bd7d-a3dad25e4945@redhat.com/
> > 
> > there are a bunch of V4L2 (subdev) API things which need
> > to be specified better (without leaving room for interpretation)
> > surrounding sensors. One of these is how to calculate the pixelrate
> > (and thus the FPS) for sensors when e.g. binning is used.
> > 
> > For non binning the pixelrate in pixels/second is:
> > 
> > pixelrate = (format.width + hblank) * (format.height + vblank) * fps
> > 
> > But what about binning, should the sensor driver then report the
> > skipped pixels as extra vblank (AFAICT that is what it looks like
> > on the CSI-2 bus) or should userspace know binning is happening and do:
> > 
> > (format.width * hscale + hblank) * (format.height *vscale + vblank)
> > 
> > and in that case how can userspace know hscale / vscale since atm
> > it cannot explicitly set those, but this is determined by the sensor
> > drivers.
> > 
> > There are a number of questions like these surrounding the V4L2 subdev
> > API for sensors, which IMHO would be good to discuss.
> 
> Thank you. I added this topic to the draft agenda. Do you have a
> guesstimatefor the time you need for this?

We could spend the whole day discussing raw sensors :-) If time permits,
extending this topic to discuss how to standardize exposing binning and
skipping to userspace.

-- 
Regards,

Laurent Pinchart

