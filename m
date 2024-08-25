Return-Path: <linux-media+bounces-16738-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2AE95E58B
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 00:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D0091F21A84
	for <lists+linux-media@lfdr.de>; Sun, 25 Aug 2024 22:25:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E7C554BD8;
	Sun, 25 Aug 2024 22:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b0jVXr7+"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC11A59
	for <linux-media@vger.kernel.org>; Sun, 25 Aug 2024 22:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724624703; cv=none; b=HMP1dTNDJroxz20XjdJAr40RUrclNYt9hPB52ErVkiBIM5fMZcu1akOatCauVG88Zrvp/SnYwJPCcQ+0OaZgprbNna9cQdPaOy/ujYAdhpNm7Z5dQHnDb2OPoDpl0BMuGuGCfOjRJimnKUbnjjRZkqzpePzoTXkYulgfTGvjTFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724624703; c=relaxed/simple;
	bh=8xg4hRhiRfqfbtCCOB5KLt4wgW2BfWmBI2N4ZG0kaoE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VMbuGBDwSAsK7QkMzzIE496xtssXCPmaVFUZhyxVW4IPYL2eNvXTCiuZukTishgt0WJEhAuIJwLFNl5q7UGfX8pZM4H+8HT501RMfYq/3mA3kl532p82Z8CQXsvijFLYqhhT7kz6jcHkugI0cvKbpO3lDxQDrnFRWSiH7PRZ3Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b0jVXr7+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1623F3D5;
	Mon, 26 Aug 2024 00:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1724624633;
	bh=8xg4hRhiRfqfbtCCOB5KLt4wgW2BfWmBI2N4ZG0kaoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0jVXr7+FaGkyrjK8yogBQymwZR+v+7sgxLBXbC7HUVFUlKUKm86d1YUd8Yvj6bqD
	 NYYxF/bvq/BhJMjY1wBI2zH5/SKgsZ26teByWgrf+Uusk9JEuG7g5E0uR9y+yeK2uh
	 /8FA+ePUiXqqL6ro6pjAueIF9ACW3HWa1jc8uBh8=
Date: Mon, 26 Aug 2024 01:24:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Linux Media Mailing List <linux-media@vger.kernel.org>,
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
	Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	Jai Luthra <j-luthra@ti.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v3)
Message-ID: <20240825222455.GA24390@pendragon.ideasonboard.com>
References: <1bea3c06-4f9d-4bea-a036-9166fc75808e@xs4all.nl>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1bea3c06-4f9d-4bea-a036-9166fc75808e@xs4all.nl>

Hello,

On Tue, Aug 13, 2024 at 10:17:59AM +0200, Hans Verkuil wrote:
> (Apologies for posting a v3 right after v2, I forgot to add Suresh to the attendee list, that's corrected in v3)
> 
> Hi all,
> 
> Here is my third stab at an agenda for the media summit. As always, it
> is subject to change and all times are guesstimates!
> 
> The media summit will be held on Monday September 16th. Avnet Silica has very
> kindly offered to host this summit at their Vienna office, which is about 35
> minutes by public transport from the Open Source Summit Europe venue
> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
> 
> Avnet Silica Office Location:
> 
> Schönbrunner Str. 297/307, 1120 Vienna, Austria
> 
> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
> 
> Refreshments are available during the day.
> 
> The meeting room is sponsored by Avnet Silica. Much appreciated!
> 
> Regarding the face mask policy: we will follow the same guidance that the
> Linux Foundation gives for the EOSS conference:
> 
> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/#onsite-health-and-safety
> 
> 
> In-Person Attendees:
> 
> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
> Mauro Carvalho Chehab <mchehab@kernel.org> (Media Kernel Maintainer)
> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> Hu, Jerry W <jerry.w.hu@intel.com> (Intel)
> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> Ricardo Ribalda <ribalda@chromium.org> (Google)
> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics) (TBC)
> Sean Young <sean@mess.org>
> Jerry W Hu <jerry.w.hu@intel.com> (Intel)
> 
> Remote Attendees (using MS Teams):
> 
> Steve Cho <stevecho@chromium.org> (Google)
> Nas Chung <nas.chung@chipsnmedia.com> (Chips & Media)
> Tomasz Figa <tfiga@chromium.org> (Google)
> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> Jai Luthra <j-luthra@ti.com> (TI)
> 
> Note: information on how to connect remotely will come later.
> 
> If any information above is incorrect, or if I missed someone, then please let me know.
> 
> We are currently 16 confirmed in-person participants and one TBC. The maximum is 18 people,
> so we're almost full. If you want to join in-person, then contact me and I'll put you on a
> waitlist. The attendee list should be finalized by the end of August.
> 
> Draft agenda:
> 
> 8:45-9:15: get settled :-)
> 
> 9:15-9:25: Hans: Quick introduction
> 
> 9:25-10:00: Steve Cho:
> 
> - V4L2 testing on Chromium using virtual video decode driver (VISL)
> - V4L2 video decoding testing with KernelCI
> 
> 10:00-11:00: Ricardo: multi-committer model using gitlab
> 
> 11:00-11:15: break
> 
> 11:15-12:15: Jacopo: Multi-context support in V4L2
> 
> 12:15-13:30: Lunch
> 
> 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and the paths forward.
> 
> 14:00-14:45: Laurent: subdevs, state, and usage of the media controller device to submit requests.
> 
> 14:45-15:00: break
> 
> 15:00-15:30: Sean: new tooling for infrared:
> 
> - What it is and what it can do (love to hear any feedback of course)
> - Where it should be hosted? (I hope gitlab fdo, who do I ask)
> - What needs to be in place for a release?
> - This tool replaces ir-ctl and ir-keytable. How we phase them out?
> 
> 15:30-16:00: Daniel: Rust in the media subsystem
> 
> 16:00-16:15: break
> 
> 16:15-16:30: Hans: UVC maintenance
> 
> 16:30-18:00: TBD

Here's a candidate topic for this time slot:

Should media drivers depend on CONFIG_PM?

Supporting both CONFIG_PM and !CONFIG_PM in drivers requires cumbersome
constructs, most likely leading to bugs because !CONFIG_PM is hardly
ever tested. The issue can be at least partly attributed to deficiencies
in the runtime PM and driver core APIs that should make this task easier
for drivers, but that will not realistically change any time soon.

In !CONFIG_PM kernels, drivers using runtime PM power up the device at
probe time, and keep it powered until remove time. The increased power
consumption really makes !CONFIG_PM a niche use case, if a use case at
all.

For those reasons, I would like to propose depending on CONFIG_PM for
media drivers. In an ideal world this could be done for the whole
subsystem. However, some architectures don't support CONFIG_PM, namely

- alpha
- csky
- hexagon
- m68k
- microblaze
- nios2
- openrisc
- parisc
- s390
- sparc (32-bit version only, sparc64 supports CONFIG_PM)

I assume we would get complains of the media subsystem became unusable
on those architectures. The decision could be made per driver, or per
category of drivers. I'm in particular interested in avoiding the churn
of supporting !CONFIG_PM in camera sensor drivers, and in platform
drivers that are used only on platforms that support CONFIG_PM.

I'm aware that asking this question may open the door to a more annoying
one. If we decide that we need to keep supporting those platforms in
camera sensor drivers, and that keeping the camera sensor powered up
unconditionally is not good enough, then we will have to reconsider the
move to runtime PM for sensor drivers that we started years ago (and
haven't completed yet).

> Please reply with corrections, questions, etc. to this email. I'll update the agenda
> over time. Again, these times are very preliminary.

-- 
Regards,

Laurent Pinchart

