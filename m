Return-Path: <linux-media+bounces-18573-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3D42986743
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 21:58:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A6AF1C23585
	for <lists+linux-media@lfdr.de>; Wed, 25 Sep 2024 19:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC046145A11;
	Wed, 25 Sep 2024 19:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="jw9ZAHtn"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D6585947
	for <linux-media@vger.kernel.org>; Wed, 25 Sep 2024 19:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727294329; cv=none; b=JsZYZWXKhlz2HJwSPL9NBLSGYB3H9VpyAcpGRP4TXspbyi8yCFy296PE8ZWtlpf/oMef47LYIaUH/pH7s5hLIba6dK3ccKWOMEpaLig8U5+2gpJ7aX1u5UdwO4WBpTljTVDcZTLvnJJqUmuq9JX1EMdSJUQoneyulYOzWv7Xbjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727294329; c=relaxed/simple;
	bh=lUBC7TpQ/ThmQdn9Ashmfm3RjA1EcJKNniJ9fxA7l4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2fDXoq2WhqMJrcBVjZPr+hdHFihLDR+YRhtTYHHnXZbSbpMxZwksQe0MYQ8p0TB3xeg8pnJBb6GIq5maUnNxWnw0M+d8FIOqFsNZ/ylaM/IKHEGGlk0ybiTLUXhg7K8DVeW7Z53l/QIHCKoFTJKrwg56r8h3RHMXZCfCUWEo5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=jw9ZAHtn; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7AC7B7E2;
	Wed, 25 Sep 2024 21:57:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1727294237;
	bh=lUBC7TpQ/ThmQdn9Ashmfm3RjA1EcJKNniJ9fxA7l4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jw9ZAHtnGDs8PFJsc6m8/2DI2HLjwQRFIz1GvCtcOWC7lX3GG1fTasAfwdzIMc/zL
	 TG7/o5wzWSZm4USBgMj8Ox2ikK9+XY61iu3kBkmkO205MKwBzhIFT+On5e7vN/+O4T
	 oQ6BU+Mpz62O3rsjZYwElaQCOUkky5/+rn2HyqQM=
Date: Wed, 25 Sep 2024 22:58:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Martin Hecht <martin.hecht@avnet.eu>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Alain Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>,
	Steve Cho <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	"Hu, Jerry W" <jerry.w.hu@intel.com>,
	Suresh Vankadara <svankada@qti.qualcomm.com>,
	Devarsh Thakkar <devarsht@ti.com>, r-donadkar@ti.com,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240925195843.GK30399@pendragon.ideasonboard.com>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
 <20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
 <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
 <20240918092454.21884920@sal.lan>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240918092454.21884920@sal.lan>

Hi Mauro,

On Wed, Sep 18, 2024 at 09:24:54AM +0200, Mauro Carvalho Chehab wrote:
> Em Tue, 17 Sep 2024 14:52:19 +0200 Hans Verkuil escreveu:
> > On 9/17/24 11:17 AM, Sebastian Fricke wrote:
> > > Greetings,
> > > 
> > > I remember that we wanted to still define a couple of processes for the
> > > multi-committer model for which we hadn't have the time on the media
> > > summit. Just would like to gather who would be interested to meet for
> > > that, where we meet (probably LPC venue) and when (Laurent just told me
> > > that Friday is probably a good slot for that).  
> > 
> > Can you refresh my memory which processes need more work?
> 
> I have the same doubt. As discussed during the summit, Hans and I had some
> discussions yesterday, to address a few details. For both of us the process
> sounds well defined.
> 
> From my personal notes, this will be the new process:
> 
> - committers will merge patches at media-committers.git tree at fdo,
>   provided that they'll follow the rules defined on a committers agreement
>   and (partially?) enforced by media-ci checks;
> - core committers follow the same rules, with a broader privilege of
>   changing kernel API/ABI;
> - committers will ensure that patchwork will reflect the review process of
>   the patches;
> - maintainers will double-check if everything is ok and, if ok, merge the
>   changes at linuxtv.org. We intend to rename the tree there to "media.git",
>   being the main tree to be used for development;
> - pull requests will keep using the same process as currently. The only
>   change is that the media-stage.git tree will be renamed to "media.git";
> - maintainers will periodically send patches upstream.
> 
> The media-commiters.git tree at fdo might be rebased if needed; the 
> media.git tree at linuxtv.org is stable. A large effort will be taken to
> avoid rebasing it.
> 
> We may need some helper scripts and/or use pwclient to keep patchwork
> updated after committers reviews.

What will happen if we update the status of patches in patchwork when
merging them to the fdo tree, and the tree is later rebased to drop
commits ? Will the person rebasing handle updating patchwork to move the
patches back from accepted to a different status ?

> Such process will start after -rc1. 
> 
> We intend to rename media-state to media at linuxtv after -rc1.
> 
> It is up to maintainers to invite and decide who will be a committer.
> 
> All committers/core-committers need to explicitly accept a committers
> agreement. We may end starting without it at the beginning, but as soon
> as a final version of such agreement is written, everyone with access to
> the media-committers tree have to explicitly accept to keep their
> commit rights on such tree.
> 
> The only part that still require some work is the committers
> agreement. I'm working on it together with Hans. As soon as we have
> a version, we'll submit a patch to the kernel, to add it to the
> media developer's profile[1].
> 
> [1] Documentation/driver-api/media/maintainer-entry-profile.rst
> 
> > For me I think Friday afternoon (probably after 14:00) is the only 
> > option, or perhaps Thursday after the Camera MC.
> 
> I can't meet on Friday afternoon. I probably will be on another
> event on Thursday (Openeuler MC).
> 
> > > On 11.09.2024 11:03, Hans Verkuil wrote:  
> > >> Hi all,
> > >>
> > >> Here is my seventh and final version of the agenda for the media 
> > >> summit. As always,
> > >> all times (except lunch time) are guesstimates!
> > >>
> > >> The media summit will be held on Monday September 16th. Avnet Silica 
> > >> has very
> > >> kindly offered to host this summit at their Vienna office, which is 
> > >> about 35
> > >> minutes by public transport from the Open Source Summit Europe venue
> > >> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
> > >>
> > >> Avnet Silica Office Location:
> > >>
> > >> Schönbrunner Str. 297/307, 1120 Vienna, Austria
> > >>
> > >> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH+(Silica)/@48.183203,16.3100937,15z/data=!4m6!3m5!1s0x476da80e20b26d5b:0x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=ttu
> > >>
> > >> Refreshments are available during the day.
> > >>
> > >> Lunch is held at Schönbrunner Stöckl 
> > >> (https://www.schoenbrunnerstoeckl.com/), close
> > >> to the Avnet Silica office. The lunch is sponsored by Ideas on Board 
> > >> and Cisco Systems
> > >> Norway.
> > >>
> > >> Regarding the face mask policy: we will follow the same guidance that the
> > >> Linux Foundation gives for the EOSS conference:
> > >>
> > >> https://events.linuxfoundation.org/open-source-summit-europe/attend/health-and-safety/#onsite-health-and-safety
> > >>
> > >>
> > >> In-Person Attendees:
> > >>
> > >> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> > >> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
> > >> Salahaldeen Altous <salahaldeen.altous@leica-camera.com> (Leica Camera 
> > >> AG)
> > >> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel 
> > >> Maintainer)
> > >> Steve Cho <stevecho@chromium.org> (Google)
> > >> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> > >> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> > >> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> > >> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> > >> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
> > >> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> > >> Ricardo Ribalda <ribalda@chromium.org> (Google)
> > >> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> > >> Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
> > >> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> > >> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
> > >> Sean Young <sean@mess.org>
> > >> Jerry W Hu <jerry.w.hu@intel.com> (Intel)
> > >>
> > >> Remote Attendees (using MS Teams):
> > >>
> > >> Mehdi Djait <mehdi.djait@linux.intel.com> (Intel)
> > >> Rishikesh Donadkar <r-donadkar@ti.com> (TI)
> > >> Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora)
> > >> Tomasz Figa <tfiga@chromium.org> (Google)
> > >> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> > >> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
> > >> Devarsh Thakkar <devarsht@ti.com> (TI)
> > >>
> > >> All remote participants listed above should have received an invite 
> > >> with connection details.
> > >> If not, please contact Martin Hecht <martin.hecht@avnet.eu> asap.
> > >>
> > >> If any information above is incorrect, or if I missed someone, then 
> > >> please let me know.
> > >>
> > >> We have 18 confirmed in-person participants, so we're full.
> > >> If you want to join remotely, then contact me and I'll add you to that 
> > >> list.
> > >>
> > >> Draft agenda:
> > >>
> > >> 8:45-9:15: Get settled :-)
> > >>
> > >> 9:15-9:25: Hans: Quick introduction
> > >>
> > >> 9:25-11:00: Ricardo: multi-committer model using gitlab
> > >>
> > >> 11:00-11:15: break
> > >>
> > >> 11:15-12:15: Jacopo: Multi-context support in V4L2
> > >>
> > >> 12:15-13:30: Lunch at Schönbrunner Stöckl
> > >>
> > >> 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and 
> > >> the paths forward.
> > >>
> > >> 14:00-14:45: Laurent: subdevs, state, and usage of the media 
> > >> controller device to submit requests.
> > >>
> > >> 14:45-15:00: break
> > >>
> > >> 15:00-15:30: Sean: new tooling for infrared:
> > >>
> > >> - What it is and what it can do (love to hear any feedback of course)
> > >> - Where it should be hosted? (I hope gitlab fdo, who do I ask)
> > >> - What needs to be in place for a release?
> > >> - This tool replaces ir-ctl and ir-keytable. How we phase them out?
> > >>
> > >> 15:30-16:00: Daniel: Rust in the media subsystem
> > >>
> > >> 16:00-16:15: break
> > >>
> > >> 16:15-16:30: Hans: UVC maintenance
> > >>
> > >> 16:30-17:00: Steve Cho:
> > >>
> > >> - V4L2 testing on Chromium using virtual video decode driver (visl)
> > >> - V4L2 video decoding testing with KernelCI
> > >>
> > >> 17:00-17:30: Laurent: Should media drivers depend on CONFIG_PM?
> > >> See here for more info:
> > >> https://lore.kernel.org/linux-media/20240825222455.GA24390@pendragon.ideasonboard.com/
> > >>
> > >> 17:30-18:00: Any other topics and feedback on what can be improved 
> > >> next media summit.
> > >>
> > >> Hope to see you all on Monday!

-- 
Regards,

Laurent Pinchart

