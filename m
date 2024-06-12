Return-Path: <linux-media+bounces-13000-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1627904D31
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 09:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79C5A1F23082
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 07:55:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F062916C69E;
	Wed, 12 Jun 2024 07:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t+ZXHdLh"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD8416B736
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 07:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718178895; cv=none; b=Y/vLM4PW+jVn4ukMsWZUBi1xNkeCXE2EDWhSS34Z5AmV30qefDlzwz2Hw5vHp4TUDuH6nWzKdI6m5qn9V3SXzDUUXNi40XYrq9iBQA9SA0iCJJwKFQQOyYUKcYruXfqgRHS9WZgp4SRl86HHbL3SHbAcfDvefdSXzV/L8Ae2N7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718178895; c=relaxed/simple;
	bh=/lEMc67NZdQLBOPaDgardSPjlSRm/W4yDz3mK4yOK/M=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TxjnZMvv6qkegpeOnPP9nWMUJhuDaWYOUBoj6ma1rPOiPk4+s5ezvrfwJTeZy29U2mTCF+Q2Jr9LoDH99nQoQqNcQN9k3UEv0ukBt6p6sqnVlRRYc4+2krOzbQcSPJNTyUD+8qynoT17iziBrxZbrqrCm0cRQStKjP6lgwEF3TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t+ZXHdLh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66756C3277B;
	Wed, 12 Jun 2024 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718178895;
	bh=/lEMc67NZdQLBOPaDgardSPjlSRm/W4yDz3mK4yOK/M=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t+ZXHdLhvYO29XtYwi8oXeVtkPDBcBgbhpeX42eEVwqwCDURFxgCY5iJzUkey53b8
	 Fq2JZivuJQg98UjhzByxV2bbDYKC2S876zni8s0KcPj/stsLuFE0JcUjxHt0t5ywn9
	 CMp/HxlgmeM8KuenYh51YlfZYZvNCXEkDofzYMJxpqVPooAOLTlLbDqLGvYpwVadvI
	 DyNvVb9QA1fHdHAh7nl9n3JavjQ/KOghQvlEJhHcXNjVJD4etiF/QfvP8OyD18gs7b
	 yawJO5ikePvV3pJQ9NJvE5Py7DrVuVXQYFGSpBlxuE+0vHtqnHggTGAafUiYS+yvT/
	 O+EzZhsPC5FOQ==
Date: Wed, 12 Jun 2024 09:54:48 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Tomasz Figa <tfiga@chromium.org>, Daniel Almeida
 <daniel.almeida@collabora.com>, Hidenori Kobayashi
 <hidenorik@chromium.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young
 <sean@mess.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sebastian
 Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda
 <ribalda@chromium.org>, Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <20240612095448.1e99b751@coco.lan>
In-Reply-To: <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
	<7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
	<CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
	<2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Em Wed, 12 Jun 2024 08:46:50 +0200
Hans Verkuil <hverkuil@xs4all.nl> escreveu:

> On 6/12/24 06:12, Tomasz Figa wrote:
> > On Wed, May 15, 2024 at 1:19=E2=80=AFAM Daniel Almeida
> > <daniel.almeida@collabora.com> wrote: =20
> >>
> >> Hi Hans, all,
> >>
> >> I=E2=80=99d like to attend in person and discuss the use of Rust in th=
e subsystem, especially in light of [0] and [1].
> >>
> >> Please note that these are new submissions that are unrelated with wha=
t was discussed last year.
> >>
> >> 30 minutes will do.
> >>
> >> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.almei=
da@collabora.com/
> >> [1] https://lwn.net/Articles/970565 =20
> >=20
> > Somewhat related to the topic: I see potential for a quite big
> > redesign of the videobuf2 framework going forward and recently with
> > more Rust adoption I'm starting to think it could benefit from being
> > implemented in Rust, since we would have to rewrite it quite a bit
> > anyway. Especially since it's a part of the subsystem that has to deal
> > with memory management, object lifetime and asynchronousness quite a
> > lot and we had a history of issues there. So it could be interesting
> > to hear everyone's thoughts. =20
>=20
> I think it is far too soon to write a framework like that in Rust.

Agreed. I don't object redesigns in C to make it better - which could have
some colateral effect of making things easier for a future Rust adoption,
but such changes should be justified by themselves, and not because of a
language change.

See: redesigns at the core will potentially affect lots of drivers,
so it needs very good technical reasons why doing it. Plus, it requires=20
comprehensive tests with different types of hardware/drivers to reduce the
risk of regressions. Depending on the changes, it may require extra tests
with devices that are outside complex camera world: radio, analog and digit=
al=20
TV drivers - and even some input devices that use VB2 - to ensure that
nothing broke.

> To be
> honest, I won't even consider it until Linus officially accepts Rust as a
> second language in the kernel, instead of as an experiment.

This is not enough: if the core starts to use a second language, all media
developers will be affected and will be required to have expertise on such
language. That's not something that should happen without careful
analysis and plans that should include a gradual roll-up, lost of tests
with the affected drivers including the legacy ones and some strategy to
quickly solve regression issues.

It is not a matter of what language is better. Instead, it is a matter of
not affecting code maintenance during the (probably long) transition period
and beyond.

If you see the past history, the transition from V4L to V4L2 took more than=
 10
years - being possible to be done only with the help of libv4l, plus a
lot of backward-compat code that we added. Still there were several
regressions and we even had to quickly patch the Kernel and/or some apps
that were using the uAPI on different ways.

Yet, the transition from VB1 to VB2 was also painful, and took a lot of tim=
e.

On both cases, there were very good technical reasons for the transition,
in terms of missing needed features, broken memory models and serious
troubles that utterly causing VB1 to not work well on non-x86 hardware.

In the end, the authors of the core changes need to acquire legacy hardware
and to do lots of driver-specific changes to avoid breaking existing stuff.
Hans and I had to dedicate a lot of time and efforts on such transitions,=20
as it required a lot of work.

I can tell you: there's no fun on such changes: typically, companies won't
pay someone to do changes on drivers for legacy hardware, specially
when there are no real benefits, which is the case here, as the final result
is just to keep the existing drivers to work with existing hardware,
usually without any new features. So, the ones behind such core changes
have to commit fixing drivers usually on their spare time.

> The vb2 framework can certainly use some more work, and esp. better suppo=
rt
> for codecs, since that's where the main pain is at the moment.
>=20
> But I would need to see a proper proposal first. I assume that's what you
> plan to present?
>=20
> > That said, I wouldn't be able to travel this time unfortunately, so it
> > would be nice if we could arrange this topic in a time slot friendly
> > for remote attendance from Japan. Also +Hidenori Kobayashi from my
> > team who would also be interested in joining remotely. =20
>=20
> That would mean a slot in the morning, right? Since Japan is 7 hours ahead
> of CEST.
>=20
> Regards,
>=20
> 	Hans
>=20
> >=20
> > Best,
> > Tomasz =20
>=20


Thanks,
Mauro

