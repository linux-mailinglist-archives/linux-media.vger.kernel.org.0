Return-Path: <linux-media+bounces-18378-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B71AA97B884
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 09:25:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31EA01F223B1
	for <lists+linux-media@lfdr.de>; Wed, 18 Sep 2024 07:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B158166F25;
	Wed, 18 Sep 2024 07:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEVFssNF"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA03273DC
	for <linux-media@vger.kernel.org>; Wed, 18 Sep 2024 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726644306; cv=none; b=U4A4Ci+5SNUaULkZMFIwAICOLL5mOeOwWc0xuIl1NRAtux4nLFXZEcbTwOp84HxKRLYkAGjmbudjMLhoy7NSfED05pbrJNkAMCpSJfQkko+SVSgHhRkOCd1qSv5As9za6gG7udOTzHUU+FXhFc2vkYaGidFMZ5nxejprNF3rFow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726644306; c=relaxed/simple;
	bh=wUAu04B1Zx4MrIGemPQg7kse5uSBzoyMxxa59BuG+a4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sPS5G3bNvDkolYLcKjI5tHyOlKUBG2VFy+wfRQ91RC17sWue/CXVsOFnsYP66VnkGi8WAksHCGGFnRTgQxmDd8Rp4yR2g6eIy6sKSUJQ8vfgeGif+efnY08hrE2dkig2GeGL6ikfhAUrPBL5kTjei55y88J0oWQqtIS5TyI3LiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEVFssNF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CD06C4CEC3;
	Wed, 18 Sep 2024 07:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726644306;
	bh=wUAu04B1Zx4MrIGemPQg7kse5uSBzoyMxxa59BuG+a4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=AEVFssNFM59M6ADVnawUSUX0FoiY8SOsivMWazyUl2HZWF10cbNCSI3BOevacBUIu
	 9y3Kno8WMcyL0Eq8Ku4S8XLVAFIQ6oCseKs81wvOvuxzVJ5FA6NW1/m8OuRW0KAyHs
	 0DIFRpYUD3ApNd3EImOk8WlrDvv8qiE6fhLa70JUz1dj7XBsQFDSCC0lxnCuO/H5+j
	 p29udnrfBAyEgeWM3CCurk8fUaVJN97/vn4EOtQvL2D3JRemjfkPcxmJTq8p4RusP/
	 qEHSYtXkCy6sm7r/K/8ISjLiNDmUSbPSSW0LuDiYl+9gVDCo54Uj9AL7u0c9FnFpUm
	 YgJO7ItveMIWQ==
Date: Wed, 18 Sep 2024 09:24:54 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>, Linux Media Mailing
 List <linux-media@vger.kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai
 <tomm.merciai@gmail.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Michael Tretter <m.tretter@pengutronix.de>, Alain
 Volmat <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho
 <stevecho@chromium.org>, Tomasz Figa <tfiga@chromium.org>, Hidenori
 Kobayashi <hidenorik@chromium.org>, "Hu, Jerry W" <jerry.w.hu@intel.com>,
 Suresh Vankadara <svankada@qti.qualcomm.com>, Devarsh Thakkar
 <devarsht@ti.com>, r-donadkar@ti.com, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, Mehdi Djait
 <mehdi.djait@linux.intel.com>, Nicolas Dufresne <nicolas@ndufresne.ca>,
 Salahaldeen Altous <salahaldeen.altous@leica-camera.com>
Subject: Re: [ANN] Media Summit September 16th: Final Agenda (v7)
Message-ID: <20240918092454.21884920@sal.lan>
In-Reply-To: <bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
References: <98236d10-4024-4b96-a8ce-8e1dc2a34f1b@xs4all.nl>
	<20240917091744.qltmddftdy7bpgpg@basti-XPS-13-9310>
	<bb8c09c7-0eae-4e1a-8fb8-e325fcf326df@xs4all.nl>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Tue, 17 Sep 2024 14:52:19 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> Hi Sebastian,
>=20
> On 9/17/24 11:17 AM, Sebastian Fricke wrote:
> > Greetings,
> >=20
> > I remember that we wanted to still define a couple of processes for the
> > multi-committer model for which we hadn't have the time on the media
> > summit. Just would like to gather who would be interested to meet for
> > that, where we meet (probably LPC venue) and when (Laurent just told me
> > that Friday is probably a good slot for that). =20
>=20
> Can you refresh my memory which processes need more work?

I have the same doubt. As discussed during the summit, Hans and I had some
discussions yesterday, to address a few details. For both of us the process
sounds well defined.

=46rom my personal notes, this will be the new process:

- committers will merge patches at media-committers.git tree at fdo,
  provided that they'll follow the rules defined on a committers agreement
  and (partially?) enforced by media-ci checks;
- core committers follow the same rules, with a broader privilege of
  changing kernel API/ABI;
- committers will ensure that patchwork will reflect the review process of
  the patches;
- maintainers will double-check if everything is ok and, if ok, merge the
  changes at linuxtv.org. We intend to rename the tree there to "media.git",
  being the main tree to be used for development;
- pull requests will keep using the same process as currently. The only
  change is that the media-stage.git tree will be renamed to "media.git";
- maintainers will periodically send patches upstream.

The media-commiters.git tree at fdo might be rebased if needed; the=20
media.git tree at linuxtv.org is stable. A large effort will be taken to
avoid rebasing it.

We may need some helper scripts and/or use pwclient to keep patchwork
updated after committers reviews.

Such process will start after -rc1.=20

We intend to rename media-state to media at linuxtv after -rc1.

It is up to maintainers to invite and decide who will be a committer.

All committers/core-committers need to explicitly accept a committers
agreement. We may end starting without it at the beginning, but as soon
as a final version of such agreement is written, everyone with access to
the media-committers tree have to explicitly accept to keep their
commit rights on such tree.

The only part that still require some work is the committers
agreement. I'm working on it together with Hans. As soon as we have
a version, we'll submit a patch to the kernel, to add it to the
media developer's profile[1].

[1] Documentation/driver-api/media/maintainer-entry-profile.rst

>=20
> For me I think Friday afternoon (probably after 14:00) is the only=20
> option, or perhaps Thursday after the Camera MC.

I can't meet on Friday afternoon. I probably will be on another
event on Thursday (Openeuler MC).

>=20
> Regards,
>=20
> 	Hans
>=20
> >=20
> > Regards,
> > Sebastian
> >=20
> > On 11.09.2024 11:03, Hans Verkuil wrote: =20
> >> Hi all,
> >>
> >> Here is my seventh and final version of the agenda for the media=20
> >> summit. As always,
> >> all times (except lunch time) are guesstimates!
> >>
> >> The media summit will be held on Monday September 16th. Avnet Silica=20
> >> has very
> >> kindly offered to host this summit at their Vienna office, which is=20
> >> about 35
> >> minutes by public transport from the Open Source Summit Europe venue
> >> (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
> >>
> >> Avnet Silica Office Location:
> >>
> >> Sch=C3=B6nbrunner Str. 297/307, 1120 Vienna, Austria
> >>
> >> https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+Gmb=
H+(Silica)/@48.183203,16.3100937,15z/data=3D!4m6!3m5!1s0x476da80e20b26d5b:0=
x2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=3Dt=
tu
> >>
> >> Refreshments are available during the day.
> >>
> >> Lunch is held at Sch=C3=B6nbrunner St=C3=B6ckl=20
> >> (https://www.schoenbrunnerstoeckl.com/), close
> >> to the Avnet Silica office. The lunch is sponsored by Ideas on Board=20
> >> and Cisco Systems
> >> Norway.
> >>
> >> Regarding the face mask policy: we will follow the same guidance that =
the
> >> Linux Foundation gives for the EOSS conference:
> >>
> >> https://events.linuxfoundation.org/open-source-summit-europe/attend/he=
alth-and-safety/#onsite-health-and-safety
> >>
> >>
> >> In-Person Attendees:
> >>
> >> Sakari Ailus <sakari.ailus@linux.intel.com> (Intel)
> >> Daniel Almeida <daniel.almeida@collabora.com> (Collabora)
> >> Salahaldeen Altous <salahaldeen.altous@leica-camera.com> (Leica Camera=
=20
> >> AG)
> >> Mauro Carvalho Chehab <mchehab@kernel.org> (Huawei, Media Kernel=20
> >> Maintainer)
> >> Steve Cho <stevecho@chromium.org> (Google)
> >> Sebastian Fricke <sebastian.fricke@collabora.com> (Collabora)
> >> Martin Hecht <martin.hecht@avnet.eu> (Avnet)
> >> Tommaso Merciai <tomm.merciai@gmail.com> (Avnet)
> >> Jacopo Mondi <jacopo.mondi@ideasonboard.com> (Ideas On Board)
> >> Benjamin Mugnier <benjamin.mugnier@foss.st.com> (ST Electronics)
> >> Laurent Pinchart <laurent.pinchart@ideasonboard.com> (Ideas On Board)
> >> Ricardo Ribalda <ribalda@chromium.org> (Google)
> >> Michael Tretter <m.tretter@pengutronix.de> (Pengutronix)
> >> Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
> >> Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> >> Alain Volmat <alain.volmat@foss.st.com> (ST Electronics)
> >> Sean Young <sean@mess.org>
> >> Jerry W Hu <jerry.w.hu@intel.com> (Intel)
> >>
> >> Remote Attendees (using MS Teams):
> >>
> >> Mehdi Djait <mehdi.djait@linux.intel.com> (Intel)
> >> Rishikesh Donadkar <r-donadkar@ti.com> (TI)
> >> Nicolas Dufresne <nicolas@ndufresne.ca> (Collabora)
> >> Tomasz Figa <tfiga@chromium.org> (Google)
> >> Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> >> Dave Stevenson <dave.stevenson@raspberrypi.com> (Raspberry Pi)
> >> Devarsh Thakkar <devarsht@ti.com> (TI)
> >>
> >> All remote participants listed above should have received an invite=20
> >> with connection details.
> >> If not, please contact Martin Hecht <martin.hecht@avnet.eu> asap.
> >>
> >> If any information above is incorrect, or if I missed someone, then=20
> >> please let me know.
> >>
> >> We have 18 confirmed in-person participants, so we're full.
> >> If you want to join remotely, then contact me and I'll add you to that=
=20
> >> list.
> >>
> >> Draft agenda:
> >>
> >> 8:45-9:15: Get settled :-)
> >>
> >> 9:15-9:25: Hans: Quick introduction
> >>
> >> 9:25-11:00: Ricardo: multi-committer model using gitlab
> >>
> >> 11:00-11:15: break
> >>
> >> 11:15-12:15: Jacopo: Multi-context support in V4L2
> >>
> >> 12:15-13:30: Lunch at Sch=C3=B6nbrunner St=C3=B6ckl
> >>
> >> 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and=20
> >> the paths forward.
> >>
> >> 14:00-14:45: Laurent: subdevs, state, and usage of the media=20
> >> controller device to submit requests.
> >>
> >> 14:45-15:00: break
> >>
> >> 15:00-15:30: Sean: new tooling for infrared:
> >>
> >> - What it is and what it can do (love to hear any feedback of course)
> >> - Where it should be hosted? (I hope gitlab fdo, who do I ask)
> >> - What needs to be in place for a release?
> >> - This tool replaces ir-ctl and ir-keytable. How we phase them out?
> >>
> >> 15:30-16:00: Daniel: Rust in the media subsystem
> >>
> >> 16:00-16:15: break
> >>
> >> 16:15-16:30: Hans: UVC maintenance
> >>
> >> 16:30-17:00: Steve Cho:
> >>
> >> - V4L2 testing on Chromium using virtual video decode driver (visl)
> >> - V4L2 video decoding testing with KernelCI
> >>
> >> 17:00-17:30: Laurent: Should media drivers depend on CONFIG_PM?
> >> See here for more info:
> >> https://lore.kernel.org/linux-media/20240825222455.GA24390@pendragon.i=
deasonboard.com/
> >>
> >> 17:30-18:00: Any other topics and feedback on what can be improved=20
> >> next media summit.
> >>
> >> Hope to see you all on Monday!
> >>
> >> Regards,
> >>
> >> =C2=A0=C2=A0=C2=A0=C2=A0Hans
> >>
> >>
> >> =20
> > Sebastian Fricke
> > Consultant Software Engineer
> >=20
> > Collabora Ltd
> > Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
> > Registered in England & Wales no 5513718. =20

