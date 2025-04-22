Return-Path: <linux-media+bounces-30700-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6633BA96561
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 12:07:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35495189D0A8
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 10:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8CC20D4F8;
	Tue, 22 Apr 2025 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNhRSXXX"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F48C20127B
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745316446; cv=none; b=IzdzOf9ntBvYUx82E+F3PdOD1OWKG8Iq9VLx+6NAX1EYgzQ6etfv0dzzHBwlQhRk5Ax03sx+H7JJP2mqjtwGrG1ZDd32mYYOUJ3/T4WWMediDWHk7VXYQOvx59AI2D/32fnBQH418cN0lm+YScwvkQJwltu9NXjIg/nt0nWrqEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745316446; c=relaxed/simple;
	bh=LrBuehAh3FSvDmxcnNZmZDo9hIICsFwrGZpGj83xU+U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XxJzZwhLCp6jK4PDfAnd/Rwe4msSvMJRkJy9FNqDEs0QNoH8JsceqCp23zEBE2IVqmVOJ8Hmfon1iwdd0CmoAbgXNXIbLmjaM8RHNuUwEsn1sTayd8wQ8KYRKqz7OWa+K6e9U72ULSAlWlUnpo8LZTfHR/WGkWiwM0+nHzmwzpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNhRSXXX; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745316444; x=1776852444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LrBuehAh3FSvDmxcnNZmZDo9hIICsFwrGZpGj83xU+U=;
  b=BNhRSXXXUuL5YoCJ50nnlOjKZQBveOQdG1XUAad6RoI6uWpy0FF/Tzyi
   9FSJ7bxjPb/oOSaihltwuydHIE+O+1orL5sx+s58SuxcVBTsMRT70Y71W
   6xpZJHGExF8lWlJ7z3jDSfndoE0CxDXJKe2t95R1wQva/U/4cWHl8F7tz
   MP9zj5JAQjkMXknZeT0MHOCIhbM4gxoAJdqV51GEBlf9wEfcgNubXe9xY
   +//N/pBFpqaFw09nQS81eMnbMtBzmpdshqzxhP07P49B6QrIpC0FpwHYu
   K1hlRiTVzBnKgwBClA2+i9tCsB3NQFn0UZM9jJB26c+grgQagXnxxAwLi
   w==;
X-CSE-ConnectionGUID: uoLCgz0zQwCFFB3yFY0v3g==
X-CSE-MsgGUID: DUIqiV9ZS6+5jWJfDLzTTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="45988251"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="45988251"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 03:07:21 -0700
X-CSE-ConnectionGUID: ynPBZVYQSzCUnkNlwN3AnA==
X-CSE-MsgGUID: tAYsk0uLQW2kkRc9uzpO/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="136843899"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 03:07:14 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E0BF811FA2F;
	Tue, 22 Apr 2025 13:07:11 +0300 (EEST)
Date: Tue, 22 Apr 2025 10:07:11 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Hans Verkuil <hans@jjverkuil.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>, Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
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
Message-ID: <aAdqT1ufZnrRBH1j@kekkonen.localdomain>
References: <71a1ba46-04c3-4694-95e7-9e2906b1d899@jjverkuil.nl>
 <4fac2850-4a89-4917-a9ee-2518331d5bbf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fac2850-4a89-4917-a9ee-2518331d5bbf@redhat.com>

Hi Hans,

On Mon, Apr 21, 2025 at 07:39:15PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 21-Apr-25 2:31 PM, Hans Verkuil wrote:
> > Hi all,
> > 
> > Here is my v2 of the draft agenda for the media summit. The only changes
> > are dropping Sebastian's email and fixing Devarsh' email.
> > 
> > As always, this draft agenda is subject to change and all times are guesstimates!
> > 
> > Please note that I am transitioning from my old hverkuil@xs4all.nl email to
> > my new hans@jjverkuil.nl email. If you have problems replying to that new email,
> > please let me know and just send it to the old email (that won't go away).
> > 
> > The Media Summit will be held Tuesday May 13th to coincide with
> > the Embedded Recipes Conference in Nice, France:
> > 
> > https://embedded-recipes.org/2025/
> > 
> > Note that there are also some workshops held after this conference:
> > 
> > https://embedded-recipes.org/2025/workshops/
> > 
> > And a gStreamer hackfest:
> > 
> > https://discourse.gstreamer.org/t/gstreamer-spring-hackfest-2025-on-16-18-may-2025-in-nice-france/4366
> > 
> > The Media Summit will be held at Hotel Campanile:
> > 
> > https://nice-aeroport.campanile.com/en-us/
> > 
> > It is close to the Airport and to the Embedded Recipes venue.
> > 
> > The meeting room can hold up to 30 people and has video conferencing support; it is
> > sponsored by Collabora and Cisco Systems Norway.
> > 
> > We currently have the following confirmed in-person attendees:
> > 
> > Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> > Mauro Carvalho Chehab <mchehab+huawei@kernel.org> (Media Maintainer, Huawei)
> > Nicolas Dufresne <nicolas.dufresne@collabora.com> (Collabora)
> > Hans de Goede <hdegoede@redhat.com> (RedHat)
> > Paul Kocialkowski <paulk@sys-base.io> (sys-base)
> > Jai Luthra <jai.luthra@ideasonboard.com> (Ideas on Board)
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas on Board)
> > Ricardo Ribalda <ribalda@chromium.org> (Google)
> > Maxime Ripard <mripard@redhat.com> (RedHat)
> > Devarsh Thakkar <devarsht@ti.com> (Texas Instruments)
> > Hans Verkuil <hans@jjverkuil.nl> (Media Maintainer, Cisco Systems Norway)
> > Arthur Vinchon <arthur.vinchon@allegrodvt.com> (Allegro DVT)
> > 
> > As you can see, there is enough room for more people, so don't hesitate to
> > register by sending an email to me. The deadline is May 2nd.
> > 
> > And the following remote participants:
> > 
> > Marco Felsch <m.felsch@pengutronix.de> (Pengutronix)
> > Martin Hecht <mhecht73@googlemail.com> (Avnet Silica)
> > Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
> > jackson.lee <jackson.lee@chipsnmedia.com> (Chips 'n Media)
> > Mirela Rabulea <mirela.rabulea@nxp.com> (NXP)
> > Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> > 
> > Note: information on how to connect remotely will come later.
> > 
> > If any information above is incorrect, or if I missed someone, then please let me know asap.
> > 
> > Draft Agenda:
> > 
> > 9:00-9:30: Get settled :-)
> > 
> > 9:30-9:40: Hans Verkuil: Quick introduction
> > 
> > 9:40-10:30: Jai Luthra: Per-stream V4L2 controls
> > 
> > 10:30-11:15: Paul Kocialkowski: Stateless video encoding uAPI
> > 
> > 11:15-11:30: break
> > 
> > 11:30-12:15: Ricardo Ribalda: Openness Framework for ISPs
> > 
> > 12:15-13:30: lunch TBD
> > 
> > 13:30-14:00: Laurent Pinchart: Review of the status of staging drivers
> > 
> > 14:00-15:00: Hans Verkuil: Status of Media CI/Multi-committers
> > 
> > 15:00-17:00: TDB
> 
> As discussed here:
> 
> https://lore.kernel.org/linux-media/6cf8d6db-c24e-461b-bd7d-a3dad25e4945@redhat.com/
> 
> there are a bunch of V4L2 (subdev) API things which need
> to be specified better (without leaving room for interpretation)
> surrounding sensors. One of these is how to calculate the pixelrate
> (and thus the FPS) for sensors when e.g. binning is used.
> 
> For non binning the pixelrate in pixels/second is:
> 
> pixelrate = (format.width + hblank) * (format.height + vblank) * fps
> 
> But what about binning, should the sensor driver then report the
> skipped pixels as extra vblank (AFAICT that is what it looks like
> on the CSI-2 bus) or should userspace know binning is happening and do:
> 
> (format.width * hscale + hblank) * (format.height *vscale + vblank)
> 
> and in that case how can userspace know hscale / vscale since atm
> it cannot explicitly set those, but this is determined by the sensor
> drivers.
> 
> There are a number of questions like these surrounding the V4L2 subdev
> API for sensors, which IMHO would be good to discuss.

If we discuss this topic in the Media summit, then it be discussed in the
context of the metadata patch series
<URL:https://git.linuxtv.org/sailus/media_tree.git/log/?h=metadata> and
especially the Common raw sensor model rather than the current state of
affair. We know what's in upstream right now is insufficient and what is
documented there isn't fully supported in current drivers.

-- 
Regards,

Sakari Ailus

