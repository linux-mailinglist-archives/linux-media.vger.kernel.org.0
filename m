Return-Path: <linux-media+bounces-16743-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2CB95E696
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 04:04:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9198A28126A
	for <lists+linux-media@lfdr.de>; Mon, 26 Aug 2024 02:04:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F9A65228;
	Mon, 26 Aug 2024 02:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mm6tYYLf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1561E567
	for <linux-media@vger.kernel.org>; Mon, 26 Aug 2024 02:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724637834; cv=none; b=WaQSX76MRIGHscU8s2bmBM+jCB+OpDdJNg9VopllSFZ3rxns55sp+UaT1clqS8KJK+O8Udac9KC9rnfdv0ICaOfmpZcx+9u0Sf+prRW0RcOO14HYd4kLcX1b2khDShYZOm5BN6jYye4q+0YCdoXN8gb27dUeUbVR403vcItCBpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724637834; c=relaxed/simple;
	bh=TVOjn4ntfIYjbywFmOfAAZboS7m5EF3Y8gCzFHBsoBE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b0tOk9G9Y1efM5lOp9goXIaLsNW14l7AP51zPPJWPiqiYIdcNVmWKLU0kp5oDhm7mfOqyWX4/Ue1fOHdN3xcUEVidauvcGLcACGmEvDYO7+1II38o8ZMFfG+2NltYBMNfN3bDHfzVgegy758s5Cb1iOKplvyEZbXtpkHIMYvA7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mm6tYYLf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B873C4FDE4;
	Mon, 26 Aug 2024 02:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724637833;
	bh=TVOjn4ntfIYjbywFmOfAAZboS7m5EF3Y8gCzFHBsoBE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Mm6tYYLfSBY8UdShirO54Zuv74WBsMQd0BxS0wHoKbq/4LWJz6LjCRi7kdFAvAtMk
	 tbhi9JpWi4C2SFAQdAMAcMUm2b21fsRS3tV88Pc7/wDKUFUrEKahKrW2+P8c+jX0CE
	 UHkueRWi3tKRRLEFbMF7qhHoJHx8JJlJ4iNpWUyWqejEWd277NanJv0mC214TxSOa1
	 jS5+LuGng2HcWDuw6YOsv41LvzdfRA2wgUB544QpSo3KkGu3UEOOgoDgP4FBkzy+3W
	 0h0RkjVfz342i100NSxv9LE9yqxGhOPQ64AWKuDy6QBD070/THrHFlTCBxBu8+H+kp
	 jRDc9+uzaeMpA==
Date: Mon, 26 Aug 2024 04:03:14 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans Verkuil <hverkuil@xs4all.nl>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sebastian Fricke <sebastian.fricke@collabora.com>,
 Martin Hecht <martin.hecht@avnet.eu>, Tommaso Merciai
 <tomm.merciai@gmail.com>, jerry.w.hu@intel.com, Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>, Benjamin Mugnier
 <benjamin.mugnier@foss.st.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Michael Tretter <m.tretter@pengutronix.de>, Alain Volmat
 <alain.volmat@foss.st.com>, Sean Young <sean@mess.org>, Steve Cho
 <stevecho@chromium.org>, Nas Chung <nas.chung@chipsnmedia.com>, Tomasz Figa
 <tfiga@chromium.org>, Hidenori Kobayashi <hidenorik@chromium.org>, Jai
 Luthra <j-luthra@ti.com>, Suresh Vankadara <svankada@qti.qualcomm.com>
Subject: Re: [ANN] Media Summit September 16th: Draft Agenda (v3)
Message-ID: <20240826040314.75ce2e2c@sal.lan>
In-Reply-To: <20240825222455.GA24390@pendragon.ideasonboard.com>
References: <1bea3c06-4f9d-4bea-a036-9166fc75808e@xs4all.nl>
	<20240825222455.GA24390@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Mon, 26 Aug 2024 01:24:55 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Hello,
>=20
> On Tue, Aug 13, 2024 at 10:17:59AM +0200, Hans Verkuil wrote:
> > (Apologies for posting a v3 right after v2, I forgot to add Suresh to t=
he attendee list, that's corrected in v3)
> >=20
> > Hi all,
> >=20
> > Here is my third stab at an agenda for the media summit. As always, it
> > is subject to change and all times are guesstimates!
> >=20
> > The media summit will be held on Monday September 16th. Avnet Silica ha=
s very
> > kindly offered to host this summit at their Vienna office, which is abo=
ut 35
> > minutes by public transport from the Open Source Summit Europe venue
> > (https://events.linuxfoundation.org/open-source-summit-europe/OSSE).
> >=20
> > Avnet Silica Office Location:
> >=20
> > Sch=C3=B6nbrunner Str. 297/307, 1120 Vienna, Austria
> >=20
> > https://www.google.com/maps/place/Avnet+EMG+Elektronische+Bauteile+GmbH=
+(Silica)/@48.183203,16.3100937,15z/data=3D!4m6!3m5!1s0x476da80e20b26d5b:0x=
2c5d2a77bbd43334!8m2!3d48.1832035!4d16.320372!16s%2Fg%2F1tcy32vt?entry=3Dttu
> >=20
> > Refreshments are available during the day.
> >=20
> > The meeting room is sponsored by Avnet Silica. Much appreciated!
> >=20
> > Regarding the face mask policy: we will follow the same guidance that t=
he
> > Linux Foundation gives for the EOSS conference:
> >=20
> > https://events.linuxfoundation.org/open-source-summit-europe/attend/hea=
lth-and-safety/#onsite-health-and-safety
> >=20
> >=20
> > In-Person Attendees:
> >=20
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
> > Suresh Vankadara <svankada@qti.qualcomm.com> (Qualcomm)
> > Hans Verkuil <hverkuil-cisco@xs4all.nl> (Cisco Systems Norway)
> > Alain Volmat <alain.volmat@foss.st.com> (ST Electronics) (TBC)
> > Sean Young <sean@mess.org>
> > Jerry W Hu <jerry.w.hu@intel.com> (Intel)
> >=20
> > Remote Attendees (using MS Teams):
> >=20
> > Steve Cho <stevecho@chromium.org> (Google)
> > Nas Chung <nas.chung@chipsnmedia.com> (Chips & Media)
> > Tomasz Figa <tfiga@chromium.org> (Google)
> > Hidenori Kobayashi <hidenorik@chromium.org> (Google)
> > Jai Luthra <j-luthra@ti.com> (TI)
> >=20
> > Note: information on how to connect remotely will come later.
> >=20
> > If any information above is incorrect, or if I missed someone, then ple=
ase let me know.
> >=20
> > We are currently 16 confirmed in-person participants and one TBC. The m=
aximum is 18 people,
> > so we're almost full. If you want to join in-person, then contact me an=
d I'll put you on a
> > waitlist. The attendee list should be finalized by the end of August.
> >=20
> > Draft agenda:
> >=20
> > 8:45-9:15: get settled :-)
> >=20
> > 9:15-9:25: Hans: Quick introduction
> >=20
> > 9:25-10:00: Steve Cho:
> >=20
> > - V4L2 testing on Chromium using virtual video decode driver (VISL)
> > - V4L2 video decoding testing with KernelCI
> >=20
> > 10:00-11:00: Ricardo: multi-committer model using gitlab
> >=20
> > 11:00-11:15: break
> >=20
> > 11:15-12:15: Jacopo: Multi-context support in V4L2
> >=20
> > 12:15-13:30: Lunch
> >=20
> > 13:30-14:00: Tomasz: Current state of videobuf2, its limitations and th=
e paths forward.
> >=20
> > 14:00-14:45: Laurent: subdevs, state, and usage of the media controller=
 device to submit requests.
> >=20
> > 14:45-15:00: break
> >=20
> > 15:00-15:30: Sean: new tooling for infrared:
> >=20
> > - What it is and what it can do (love to hear any feedback of course)
> > - Where it should be hosted? (I hope gitlab fdo, who do I ask)
> > - What needs to be in place for a release?
> > - This tool replaces ir-ctl and ir-keytable. How we phase them out?
> >=20
> > 15:30-16:00: Daniel: Rust in the media subsystem
> >=20
> > 16:00-16:15: break
> >=20
> > 16:15-16:30: Hans: UVC maintenance
> >=20
> > 16:30-18:00: TBD =20
>=20
> Here's a candidate topic for this time slot:
>=20
> Should media drivers depend on CONFIG_PM?
>=20
> Supporting both CONFIG_PM and !CONFIG_PM in drivers requires cumbersome
> constructs, most likely leading to bugs because !CONFIG_PM is hardly
> ever tested. The issue can be at least partly attributed to deficiencies
> in the runtime PM and driver core APIs that should make this task easier
> for drivers, but that will not realistically change any time soon.
>=20
> In !CONFIG_PM kernels, drivers using runtime PM power up the device at
> probe time, and keep it powered until remove time. The increased power
> consumption really makes !CONFIG_PM a niche use case, if a use case at
> all.
>=20
> For those reasons, I would like to propose depending on CONFIG_PM for
> media drivers. In an ideal world this could be done for the whole
> subsystem.=20

This is not an option. Not all drivers depend on it. Some of them will
never need it - like most USB and PCI tv/capture cards and digital tv ones.

> However, some architectures don't support CONFIG_PM, namely
>=20
> - alpha
> - csky
> - hexagon
> - m68k
> - microblaze
> - nios2
> - openrisc
> - parisc
> - s390
> - sparc (32-bit version only, sparc64 supports CONFIG_PM)

Well, arch-dependent drivers, like the ones made to run with ARM SoC
could depend on PM, but then there are sensor drivers and such which
are somewhat independent.
>=20
> I assume we would get complains of the media subsystem became unusable
> on those architectures. The decision could be made per driver, or per
> category of drivers. I'm in particular interested in avoiding the churn
> of supporting !CONFIG_PM in camera sensor drivers, and in platform
> drivers that are used only on platforms that support CONFIG_PM.

There are a couple of sensor drivers that are used by em28xx, which, as far
as I remember, doesn't use PM. So, even for sensors it could be problematic.

>=20
> I'm aware that asking this question may open the door to a more annoying
> one. If we decide that we need to keep supporting those platforms in
> camera sensor drivers, and that keeping the camera sensor powered up
> unconditionally is not good enough, then we will have to reconsider the
> move to runtime PM for sensor drivers that we started years ago (and
> haven't completed yet).

Having PM support for sensor drivers makes sense, provided that it won't
break support of the existing drivers using them.
>=20
> > Please reply with corrections, questions, etc. to this email. I'll upda=
te the agenda
> > over time. Again, these times are very preliminary. =20
>=20

