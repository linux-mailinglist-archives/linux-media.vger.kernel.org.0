Return-Path: <linux-media+bounces-16086-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8F994E2BD
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2024 21:02:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E91FA281355
	for <lists+linux-media@lfdr.de>; Sun, 11 Aug 2024 19:02:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9947C158541;
	Sun, 11 Aug 2024 19:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Me84JC8E"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3553A8F9
	for <linux-media@vger.kernel.org>; Sun, 11 Aug 2024 19:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723402958; cv=none; b=NP/SGy8wk9QkspreLvRlTAeS238gtsQIA/HyOWSvTNG7S2J7RBJNY0e17wXMZtmJzT7R++Te6ACq7GwwBkqDyGcBJhKD5xkUeYbIrpr2UhzWUTCP6HTUqjlkqI0zcDUPD3oO1ZpdFC2NwLu4fmYSofAG9Vgq9DXIQdG4AhYfBuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723402958; c=relaxed/simple;
	bh=9/0Zgj2p98sOlPbLsuv6swXbJoMQz5PgUEUWKpDiGMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o2jAfg5O6RQNDfFsIEJHmz8QZSHjSuiPjshkpPe6R6VCij4tAeYjLuqr9vScGRoET4LghsAFTHdtkBVb38G48tyrLLRUeSyzHptz4LEfsTc65jaQx7DnpyIvAz5nrMJZl885j1m5+vOEMyd+UJC0z3nV/mg91mbjgObCMwaeOFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Me84JC8E; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73D8245A;
	Sun, 11 Aug 2024 21:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1723402898;
	bh=9/0Zgj2p98sOlPbLsuv6swXbJoMQz5PgUEUWKpDiGMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Me84JC8EPAhucQzAUPbgIo1ce7YmY/HMosXgHtxLog/8CoM4eOpPwBqeuIJN4+Q0p
	 qqt1Ay+k8KREl5AcB79ZCcDxFxuaqY8VMhWAIRaxFWMT/sMsaO+FvMeQkyYFI48hE4
	 Bn+gfzbjrJ1N5o2aUpECGkejdIyLT+0+/JEOnanc=
Date: Sun, 11 Aug 2024 22:02:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>, jerry.w.hu@intel.com,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	Jai Luthra <j-luthra@ti.com>
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v1)
Message-ID: <20240811190210.GE9403@pendragon.ideasonboard.com>
References: <24b19434-5556-4f5a-a6fe-ce7538644404@xs4all.nl>
 <CAAFQd5BL2xOSbLOnJnJX7fgacgDHZhHq5VRzOW5hJoB0TsDwZA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5BL2xOSbLOnJnJX7fgacgDHZhHq5VRzOW5hJoB0TsDwZA@mail.gmail.com>

Hi Tomasz,

On Tue, Aug 06, 2024 at 06:41:55PM +0900, Tomasz Figa wrote:
> On Fri, Aug 2, 2024 at 10:13 PM Hans Verkuil wrote:
> 
> > Hi all,
> >
> > Here is my initial stab at an agenda for the media summit. As always, it
> > is subject to change and all times are guesstimates!
> 
> Thanks a lot Hans for organizing and Avnet for the venue!
> 
> Any chance that we could somehow stuff the `Multi-context support in V4L2`
> session from Jacopo before 15:00? I'm not sure if it's exactly what I'm
> thinking, but it sounds like something that we have also considered in
> ChromeOS for some of the ISP drivers that we had to bring up.

I'm not sure what you're thinking it is, but it probably is :-) It's a
proposal (with an implementation) to extend the concept of context in
V4L2 M2M devices to cover a media graph with multiple video nodes, to
allow for easy time multiplexing of more complex memory to memory
devices such as ISPs.

> > The media summit will be held on Monday September 16th. Avnet Silica has very
> > kindly offered to host this summit at their Vienna office, which is about 35
> > minutes by public transport from the Open Source Summit Europe venue
> > (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
> >
> > Avnet Silica Office Location:
> >
> > Schönbrunner Str. 297/307, 1120 Vienna, Austria
> >
> >
> > https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
> >
> > Refreshments are available during the day.
> >
> > The meeting room is sponsored by Avnet Silica. Much appreciated!
> >
> > Regarding the face mask policy: we will follow the same guidance that the
> > Linux Foundation gives for the EOSS conference:
> >
> >
> > https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/#onsite-health-and-safety
> >
> >
> > In-Person Attendees:
> >
> > Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> > Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
> > Mauro Carvalho Chehab <mchehab@kernel.org> (Media Kernel Maintainer)
> > Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> > Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> > Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
> > Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> > Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> > Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
> > Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> > Ricardo Ribalda <ribalda@chromium.org> (Google)
> > Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> > Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> > Alain Volmat <alain.volmat@foss.st.com> (ST Electronics) (TBC)
> > Sean Young <sean@mess.org>
> >
> > Remote Attendees (using MS Teams):
> >
> > Steve Cho <stevecho@chromium.org> (Google)
> > Nas Chung <nas.chung@chipsnmedia.com> (Chips & Media)
> > Tomasz Figa <tfiga@chromium.org> (Google)
> > Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> > Jai Luthra <j-luthra@ti.com> (TI)
> >
> > Note: information on how to connect remotely will come later.
> >
> > If any information above is incorrect, or if I missed someone, then please let me know.
> >
> > We are currently 14 confirmed in-person participants and one TBC. I prefer to limit the total
> > to 16 people, so if you want to join in-person, then contact me and I'll put you on a waitlist.
> > The attendee list should be finalized by the end of August.
> >
> > Draft agenda:
> >
> > 8:45-9:15: get settled :-)
> >
> > 9:15-9:25: Hans: Quick introduction
> >
> > 9:25-9:55: Steve Cho:
> >
> > - V4L2 testing on Chromium using virtual video decode driver (VISL)
> > - V4L2 video decoding testing with KernelCI
> >
> > 10:00-11:00: Ricardo: multi-committer model using gitlab
> >
> > 11:00-11:15: break
> >
> > 11:15-11:45: Sean: new tooling for infrared:
> >
> > - What it is and what it can do (love to hear any feedback of course)
> > - Where it should be hosted? (I hope gitlab fdo, who do I ask)
> > - What needs to be in place for a release?
> > - This tool replaces ir-ctl and ir-keytable. How we phase them out?
> >
> > 11:45-12:15: Daniel: Rust in the media subsystem
> >
> > 12:15-13:30: Lunch
> >
> > 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and the
> > paths forward.
> >
> > 14:00-14:45: Laurent: subdevs, state, and usage of the media controller
> > device to submit requests.
> >
> > 14:45-15:00: break
> >
> > 15:00-15:30: Tommaso/Martin: TBD
> >
> > 15:30-16:30: Jacopo: Multi-context support in V4L2
> >
> > 16:30-16:45: break
> >
> > 16:45-17:00: Hans: UVC maintenance
> >
> > 17:00-18:00: TBD
> >
> > Please reply with corrections, questions, etc. to this email. I'll update the agenda
> > over time. Again, these times are very preliminary.

-- 
Regards,

Laurent Pinchart

