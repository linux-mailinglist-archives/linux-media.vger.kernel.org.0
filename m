Return-Path: <linux-media+bounces-13111-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CFF905CDC
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 22:35:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5FC81F217AC
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 20:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 489DC84D2C;
	Wed, 12 Jun 2024 20:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p27RUE4A"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC67D57333
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 20:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718224507; cv=none; b=bpV4MIPcymgbvQkXGO8TmJgK63LqMzZUVtfBBmfZS6eIy4rCpVIP472lBgRXkZlckdarJ7I+bynQ9NmLVgSfOImLUswLkbYBj241JvWnC8aSpzP6X2slgBXaMkhu+ysJ0F9Hip9xHeeR/AWGnV3S3vKSfaJslxm7QislIBCl0NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718224507; c=relaxed/simple;
	bh=o0zdT3tf50UU/GF/vJj1lncZhS8iY4PUF7nbrL+w76c=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ca68nsCD+Ivh/EXTq7puiL6/un81rSVBKzFvXdXuAZcmWXQutX/F5NUGXspqtnafxnhDugcEnxG8bhYi/ckVYcyGGXSUJ5hLV2hmDDYXZRF7YhzFsHEOXsiewsLd1Qv9aeEMdEDfF3785KsgvH0e49wWke75DeaTB9q+ohWQDWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p27RUE4A; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D5AC116B1;
	Wed, 12 Jun 2024 20:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718224507;
	bh=o0zdT3tf50UU/GF/vJj1lncZhS8iY4PUF7nbrL+w76c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=p27RUE4AZh6pkJKGQ4HFdWXe178p5F23XH5pbjyNTmt711mTTveM7xiDFqT66h49d
	 pnW/3mvfi45PDb7BS7O37qCuA7uDTwZqKp5e6zoDefK4HdzivaJwZUALEcNRy4JLLb
	 aGXYgfWDYLaaHfhPJOePET3U22EaVSBYYqCpKTXkhEs/FYNEpLF6+nNjtmWjSRXdet
	 SaJJH6SttUkkkbw4ME5dAp5KcMO0T5v5kLksGdK0Bj/X/WuVsQY5TXJv9cpmK0HH0e
	 vu4OQIXXowRFJOS3V0cfEQhHWP67goBTkmno1+qqmKrnP6YIBgm5Fc9Glkxvlc4xr+
	 OU1DeU5yQDF4A==
Date: Wed, 12 Jun 2024 22:35:01 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil
 <hverkuil@xs4all.nl>, Daniel Almeida <daniel.almeida@collabora.com>,
 Hidenori Kobayashi <hidenorik@chromium.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <20240612223448.30f1e9cb@coco.lan>
In-Reply-To: <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
	<7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
	<CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
	<2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
	<20240612095448.1e99b751@coco.lan>
	<CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed, 12 Jun 2024 17:22:34 +0900
Tomasz Figa <tfiga@chromium.org> escreveu:

> On Wed, Jun 12, 2024 at 4:54=E2=80=AFPM Mauro Carvalho Chehab
> <mchehab@kernel.org> wrote:
> >
> > Em Wed, 12 Jun 2024 08:46:50 +0200
> > Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> > =20
> > > On 6/12/24 06:12, Tomasz Figa wrote: =20
> > > > On Wed, May 15, 2024 at 1:19=E2=80=AFAM Daniel Almeida
> > > > <daniel.almeida@collabora.com> wrote: =20
> > > >>
> > > >> Hi Hans, all,
> > > >>
> > > >> I=E2=80=99d like to attend in person and discuss the use of Rust i=
n the subsystem, especially in light of [0] and [1].
> > > >>
> > > >> Please note that these are new submissions that are unrelated with=
 what was discussed last year.
> > > >>
> > > >> 30 minutes will do.
> > > >>
> > > >> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.a=
lmeida@collabora.com/
> > > >> [1] https://lwn.net/Articles/970565 =20
> > > >
> > > > Somewhat related to the topic: I see potential for a quite big
> > > > redesign of the videobuf2 framework going forward and recently with
> > > > more Rust adoption I'm starting to think it could benefit from being
> > > > implemented in Rust, since we would have to rewrite it quite a bit
> > > > anyway. Especially since it's a part of the subsystem that has to d=
eal
> > > > with memory management, object lifetime and asynchronousness quite a
> > > > lot and we had a history of issues there. So it could be interesting
> > > > to hear everyone's thoughts. =20
> > >
> > > I think it is far too soon to write a framework like that in Rust. =20
> >
> > Agreed. I don't object redesigns in C to make it better - which could h=
ave
> > some colateral effect of making things easier for a future Rust adoptio=
n,
> > but such changes should be justified by themselves, and not because of a
> > language change. =20
>=20
> No, the thought of redesign doesn't come from the language change,
> it's the other way around. Since rewriting a lot of the code already,
> why not do it in a language that is generally considered better.

As Hans said, Rast has experimental support. We can't have drivers
depending on experimental stuff.

>=20
> >
> > See: redesigns at the core will potentially affect lots of drivers,
> > so it needs very good technical reasons why doing it. Plus, it requires
> > comprehensive tests with different types of hardware/drivers to reduce =
the
> > risk of regressions. Depending on the changes, it may require extra tes=
ts
> > with devices that are outside complex camera world: radio, analog and d=
igital
> > TV drivers - and even some input devices that use VB2 - to ensure that
> > nothing broke. =20
>=20
> We don't have to do it in an all-or-nothing way. We can start with an
> experimental new implementation in Rust, which could be gradually
> tested. It could even be done the same way as the vb -> vb2
> transition, although I suspect it wouldn't really be necessary, as I
> would like to see it more like a drop-in replacement. In general I
> think the API exposed outside of the framework wouldn't really change
> that much, it's more about the internal design.

Having two implementations of the same logic doesn't sound reasonable,
as it doubles the maintainership effort: all changes done on one
implementation needs to be moved to the other one.

Btw, we also have seem this problem before with VB and, up to some
sense, with VB2, as some drivers used to have their own buffer
handling implementation that usually started from a VB or VB2 fork.

So, if VB2 has issues, let's fix it in C code.

> > > To be
> > > honest, I won't even consider it until Linus officially accepts Rust =
as a
> > > second language in the kernel, instead of as an experiment. =20
> >
> > This is not enough: if the core starts to use a second language, all me=
dia
> > developers will be affected and will be required to have expertise on s=
uch
> > language. =20
>=20
> Let's be realistic, how many developers are actively touching vb2 these d=
ays?

How many developers don't need VB2? Hopefully none :-)

> > That's not something that should happen without careful
> > analysis and plans that should include a gradual roll-up, lost of tests
> > with the affected drivers including the legacy ones and some strategy to
> > quickly solve regression issues. =20
>=20
> That said, I agree. It needs proper discussion and planning. That's
> why I'm proposing this as a topic. :)
> Moreover the redesign itself also needs proper discussion and is more
> of a long term goal, not something to land in the next few days.
>=20
> >
> > It is not a matter of what language is better. Instead, it is a matter =
of
> > not affecting code maintenance during the (probably long) transition pe=
riod
> > and beyond.
> >
> > If you see the past history, the transition from V4L to V4L2 took more =
than 10
> > years - being possible to be done only with the help of libv4l, plus a
> > lot of backward-compat code that we added. Still there were several
> > regressions and we even had to quickly patch the Kernel and/or some apps
> > that were using the uAPI on different ways. =20
>=20
> That's a different situation, because UAPI is involved.

It is different, but similar, up to some sense, as a change at VB2=20
implementation will likely affect its kAPI, its behavior or both.

The point I'm underlining is that core redesigns do affect existing
drivers usually on unexpected ways.

>=20
> >
> > Yet, the transition from VB1 to VB2 was also painful, and took a lot of=
 time.
> > =20
>=20
> Yes, vb -> vb2 would be a more appropriate comparison.
>=20
> > On both cases, there were very good technical reasons for the transitio=
n,
> > in terms of missing needed features, broken memory models and serious
> > troubles that utterly causing VB1 to not work well on non-x86 hardware.
> > =20
>=20
> It's a very similar situation now, vb2 doesn't work well on modern
> hardware, but I still have hopes that it can be fixed without
> affecting the driver-facing behavior. (We would probably need to
> develop some unit tests that validate the driver-facing behavior to
> ensure that.)
>=20
> > In the end, the authors of the core changes need to acquire legacy hard=
ware
> > and to do lots of driver-specific changes to avoid breaking existing st=
uff.
> > Hans and I had to dedicate a lot of time and efforts on such transition=
s,
> > as it required a lot of work.
> >
> > I can tell you: there's no fun on such changes: typically, companies wo=
n't
> > pay someone to do changes on drivers for legacy hardware, specially
> > when there are no real benefits, which is the case here, as the final r=
esult
> > is just to keep the existing drivers to work with existing hardware,
> > usually without any new features. So, the ones behind such core changes
> > have to commit fixing drivers usually on their spare time.
> > =20
>=20
> I don't get that argument. Wouldn't the same apply to any core change?

It depends of the type of change. For instance, an addition of a new
V4L2 control should not cause regressions to existing drivers. The
same would be true if one adds a new memory allocation component for
VB2 (e. g. something similar to videobuf2-vmalloc.c/videobuf2-dma-sg.c/..):
only drivers using the new way would be affected.

> I think the reason we have driver maintainers is that they can help
> with testing. Moreover, we need to invest into testing infrastructure
> (which is what people have been doing recently via Media CI) to make
> such changes less painful. Otherwise the subsystem will just bit-rot
> and become useful for modern use cases.

Using CI to check for uAPI/kAPI changes is helpful, but it doesn't cover
actual drivers. For that, we would need to invest on a CI solution
integrated with lots of different hardware pieces, to check for actual
driver regressions.

On one of my previous work, the company I used to work had that: they
had some monitors display some things, and the camera captured input
were compared to what the monitor were actually displaying. Doable, but
expensive.=20

Regards,
Mauro

Thanks,
Mauro

