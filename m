Return-Path: <linux-media+bounces-13165-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A42390664E
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 10:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB787283DE0
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 08:15:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A9EF13D287;
	Thu, 13 Jun 2024 08:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jeXfmCZy"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB6B57C8A
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 08:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718266520; cv=none; b=ugqDuG6Apm818G1TmwlbA7AC714XjVYSwKzltQZVWxLlkdtj5gdXLJOIrXnNcvU2Vy/uTefgkK0sHw3eDkdx1n+z/D5cUfO31x1a7JWFRs2NYgQw06hXHKxOdgrrmxEH1FtVTzSpE/+DW1pRHtNQ2R+WPjgc8xcDfhf99esFsgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718266520; c=relaxed/simple;
	bh=S1tQRsJ4TAFlICRPA8ljq9O2XshM68+1+bEDXuiuFCQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T6K2REDZArUQOQ+UJED2b10biDXIrmxccQRE8r2deJ03vbkBFjvpGwiX0IseolyKCc+xxC8/o1UlxATZx7EvNN+ywoQWTscdfaIqqst3a1G893J5BX4tr0QVn6ck2DU1Fva5fjtrCJk7tsWeCOv6jza2lV+wsvLEsDrKniXKhts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jeXfmCZy; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a6efae34c83so84773466b.0
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 01:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718266516; x=1718871316; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=05IzzbR1R83CbQtLh7qiRBA/a5p2WIzkbiJNLVLwuIo=;
        b=jeXfmCZyaLNvt6MNvNfPev/fkrnoIQvaputF3f7y/objjlw3JFmdmS0658GTovYAWw
         /6C/CDVkP1erdmEs9DjWjdKWZSSTQ9PgQu9TxpREUzoVU0mmsiNjzvdZskTOkTAOkd6x
         HyOXjOyh8WbwaEHIXunCimR14xnpqWl+ehvD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718266516; x=1718871316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=05IzzbR1R83CbQtLh7qiRBA/a5p2WIzkbiJNLVLwuIo=;
        b=tQVgJMV9Gf20m/V+bde8pYMpZH9uw7hShfjjEyP+oEj3n4CGswhk9bXd4VIsPVpYIG
         GPmCElsOOIgan2gAeTI/kxrYJf2C84pobmx6B0Xh5FvM2zUJT3pPuHF3ps7we+CG00Zs
         gctxKxtZXPQqOH8SrFa/JAvbHYTKP9eJtQRY6He/0pkpQGqDjDRA4+dVCIcl+VBlQz16
         epyYGcBs9SOzlPV8pybYlujUcWEjIfhCBihFyhYdWijJuPVjvRM6vrBIPQun7cjbGR5h
         G78Vlj9vplc3353XTcP320ahBkc4BBgkq+YvaT8KFLS0gtMzg9YsSKdJ30gldQL4pJ2x
         qQMA==
X-Forwarded-Encrypted: i=1; AJvYcCVX+3PDSIzc0q2X3GAqZmFHkjZJ1Uvukafzo2FvO+OnJbGkHgUFkgO5HSuz+yAVDxq6TY6Br6l5TrCgooBvMY0037f9SKv6YwD3OZE=
X-Gm-Message-State: AOJu0YzhBoWabNwU8sXDqbbw6fKVH1voH1eiOL0fznboAf8r2sxLVmAi
	QBcMgxuKlw4hiuGb7wbjh4DAzIm9EJhrU9kd4G30nXDWovfNCTNjdFy2jh9XY55ZATseNIeaqPm
	/uvzr
X-Google-Smtp-Source: AGHT+IFvaafqcPyBTVgiKM40567LECtaYuBWpSjkGIOR8EnObl50afH/8fX0WkaPlahUBUDqgNSWXw==
X-Received: by 2002:a17:906:4fc7:b0:a6f:5b5f:89ad with SMTP id a640c23a62f3a-a6f5b5f8c19mr38658866b.10.1718266515301;
        Thu, 13 Jun 2024 01:15:15 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56fa67d6sm44811066b.209.2024.06.13.01.15.14
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 01:15:14 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-57c68682d1aso557579a12.3
        for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 01:15:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWLkLp+mmEKHhGegEobB2Cd+oEq/nLYrZChfO2ZEwWdoatEH/aNk2/4LUeyWmVSrnTkfK8Zv3I+bBgKOaPB/w39+3mqLdur8wrTdoY=
X-Received: by 2002:a17:906:d96c:b0:a6f:e19:6fb2 with SMTP id
 a640c23a62f3a-a6f47d365aemr229471166b.29.1718266513591; Thu, 13 Jun 2024
 01:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com> <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl> <20240612095448.1e99b751@coco.lan>
 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
 <20240612223448.30f1e9cb@coco.lan> <3211e218-265d-47f5-858b-9b81b185eba7@xs4all.nl>
In-Reply-To: <3211e218-265d-47f5-858b-9b81b185eba7@xs4all.nl>
From: Tomasz Figa <tfiga@chromium.org>
Date: Thu, 13 Jun 2024 17:14:45 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Byb5MVNTzgvg7JD-CTX1KR59Osf0AGunBH1UxVYd6XMw@mail.gmail.com>
Message-ID: <CAAFQd5Byb5MVNTzgvg7JD-CTX1KR59Osf0AGunBH1UxVYd6XMw@mail.gmail.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Hidenori Kobayashi <hidenorik@chromium.org>, 
	Linux Media Mailing List <linux-media@vger.kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Sean Young <sean@mess.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Ricardo Ribalda <ribalda@chromium.org>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 13, 2024 at 4:38=E2=80=AFPM Hans Verkuil <hverkuil@xs4all.nl> w=
rote:
>
> On 12/06/2024 22:35, Mauro Carvalho Chehab wrote:
> > Em Wed, 12 Jun 2024 17:22:34 +0900
> > Tomasz Figa <tfiga@chromium.org> escreveu:
> >
> >> On Wed, Jun 12, 2024 at 4:54=E2=80=AFPM Mauro Carvalho Chehab
> >> <mchehab@kernel.org> wrote:
> >>>
> >>> Em Wed, 12 Jun 2024 08:46:50 +0200
> >>> Hans Verkuil <hverkuil@xs4all.nl> escreveu:
> >>>
> >>>> On 6/12/24 06:12, Tomasz Figa wrote:
> >>>>> On Wed, May 15, 2024 at 1:19=E2=80=AFAM Daniel Almeida
> >>>>> <daniel.almeida@collabora.com> wrote:
> >>>>>>
> >>>>>> Hi Hans, all,
> >>>>>>
> >>>>>> I=E2=80=99d like to attend in person and discuss the use of Rust i=
n the subsystem, especially in light of [0] and [1].
> >>>>>>
> >>>>>> Please note that these are new submissions that are unrelated with=
 what was discussed last year.
> >>>>>>
> >>>>>> 30 minutes will do.
> >>>>>>
> >>>>>> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.a=
lmeida@collabora.com/
> >>>>>> [1] https://lwn.net/Articles/970565
> >>>>>
> >>>>> Somewhat related to the topic: I see potential for a quite big
> >>>>> redesign of the videobuf2 framework going forward and recently with
> >>>>> more Rust adoption I'm starting to think it could benefit from bein=
g
> >>>>> implemented in Rust, since we would have to rewrite it quite a bit
> >>>>> anyway. Especially since it's a part of the subsystem that has to d=
eal
> >>>>> with memory management, object lifetime and asynchronousness quite =
a
> >>>>> lot and we had a history of issues there. So it could be interestin=
g
> >>>>> to hear everyone's thoughts.
> >>>>
> >>>> I think it is far too soon to write a framework like that in Rust.
> >>>
> >>> Agreed. I don't object redesigns in C to make it better - which could=
 have
> >>> some colateral effect of making things easier for a future Rust adopt=
ion,
> >>> but such changes should be justified by themselves, and not because o=
f a
> >>> language change.
> >>
> >> No, the thought of redesign doesn't come from the language change,
> >> it's the other way around. Since rewriting a lot of the code already,
> >> why not do it in a language that is generally considered better.
> >
> > As Hans said, Rast has experimental support. We can't have drivers
> > depending on experimental stuff.
>
> Indeed.
>
> While discussing Rust for experimental drivers or codec libraries is
> interesting (and I am doing a Rust course, so hopefully I have a better
> understanding of what's involved by the upcoming media summit), using
> it for core media frameworks is simply a hard NACK until Linus blesses
> Rust as a second kernel language.
>
> So don't spend your valuable time on that.
>

Alright. I'm fine with C as well, although it's a shame that
eventually when Rust becomes a first-class citizen we'll be left with
a lot of legacy code base. Anyway, I guess let's wait until that
happens first. :)

> >
> >>
> >>>
> >>> See: redesigns at the core will potentially affect lots of drivers,
> >>> so it needs very good technical reasons why doing it. Plus, it requir=
es
> >>> comprehensive tests with different types of hardware/drivers to reduc=
e the
> >>> risk of regressions. Depending on the changes, it may require extra t=
ests
> >>> with devices that are outside complex camera world: radio, analog and=
 digital
> >>> TV drivers - and even some input devices that use VB2 - to ensure tha=
t
> >>> nothing broke.
> >>
> >> We don't have to do it in an all-or-nothing way. We can start with an
> >> experimental new implementation in Rust, which could be gradually
> >> tested. It could even be done the same way as the vb -> vb2
> >> transition, although I suspect it wouldn't really be necessary, as I
> >> would like to see it more like a drop-in replacement. In general I
> >> think the API exposed outside of the framework wouldn't really change
> >> that much, it's more about the internal design.
>
> It makes no sense to have a C and a Rust version of vb2. This framework
> is critical to all drivers, and we're not going to support two versions
> and fix bugs/add features in two places. Again, it's a hard NACK. Don't
> waste time on that.
>
> If there are ideas to make vb2 better, then I am all for that.
>
> I just want to mention two things here:
>
> For most drivers, using vb2 is just fine: the work a driver needs to do i=
s
> quite straightforward. Exceptions are codec drivers and possibly complex
> camera drivers when they need to use requests (not certain yet).

Do we have any data that suggests that non-codec and non-complex
camera drivers are actually "most drivers"?

Anyway, I agree that "using" vb2 is indeed fine and I want us to keep
using it. But whether it actually works well is a different story.
Things become problematic as soon as someone intends to run something
more complex than yavta, e.g. exporting and importing DMA-bufs is
involved.

So putting aside the Rust discussion (that wasn't really the core
point), could I get 30 minutes to cover the vb2 pain points and how we
could fix them? Or should we just work on that and send patches?
Either works for me. (In fact we started already, e.g. via the
duplicate plane mapping patch series).

>
> Internally vb2 is quite complex, but that's because what it does is quite
> complex. And that's fine. If the internal structure can be improved to
> make it less complex, then I'm all for that, but there is no magic bullet
> (including using Rust instead of C) that suddenly makes everything simple=
.
>
> Generally I prefer to have the complexity in core frameworks, that will
> only make life easier for the driver developers.

I prefer complexity neither in drivers nor core frameworks, but we
can't have everything. ;)

I agree that buffer management is a complex problem, so we can't avoid
some level of complexity, although there is certainly room for
improvement in vb2. That also wasn't the core reason for the proposed
redesign. The core point is about the functional issues.

>
> To summarize:
>
> Until Rust is accepted by Linus as a second kernel language, as media
> maintainer I will NACK core media frameworks written in Rust. I won't
> spend time on it, it's an immediate NACK from me.
>
> Note that this doesn't imply that once Linus *does* accept Rust, that we
> are OK with core frameworks written in Rust. But that will be a separate
> discussion once that happens.

Ack.

Best regards,
Tomasz

>
> Regards,
>
>         Hans
>
> >
> > Having two implementations of the same logic doesn't sound reasonable,
> > as it doubles the maintainership effort: all changes done on one
> > implementation needs to be moved to the other one.
> >
> > Btw, we also have seem this problem before with VB and, up to some
> > sense, with VB2, as some drivers used to have their own buffer
> > handling implementation that usually started from a VB or VB2 fork.
> >
> > So, if VB2 has issues, let's fix it in C code.
> >
> >>>> To be
> >>>> honest, I won't even consider it until Linus officially accepts Rust=
 as a
> >>>> second language in the kernel, instead of as an experiment.
> >>>
> >>> This is not enough: if the core starts to use a second language, all =
media
> >>> developers will be affected and will be required to have expertise on=
 such
> >>> language.
> >>
> >> Let's be realistic, how many developers are actively touching vb2 thes=
e days?
> >
> > How many developers don't need VB2? Hopefully none :-)
> >
> >>> That's not something that should happen without careful
> >>> analysis and plans that should include a gradual roll-up, lost of tes=
ts
> >>> with the affected drivers including the legacy ones and some strategy=
 to
> >>> quickly solve regression issues.
> >>
> >> That said, I agree. It needs proper discussion and planning. That's
> >> why I'm proposing this as a topic. :)
> >> Moreover the redesign itself also needs proper discussion and is more
> >> of a long term goal, not something to land in the next few days.
> >>
> >>>
> >>> It is not a matter of what language is better. Instead, it is a matte=
r of
> >>> not affecting code maintenance during the (probably long) transition =
period
> >>> and beyond.
> >>>
> >>> If you see the past history, the transition from V4L to V4L2 took mor=
e than 10
> >>> years - being possible to be done only with the help of libv4l, plus =
a
> >>> lot of backward-compat code that we added. Still there were several
> >>> regressions and we even had to quickly patch the Kernel and/or some a=
pps
> >>> that were using the uAPI on different ways.
> >>
> >> That's a different situation, because UAPI is involved.
> >
> > It is different, but similar, up to some sense, as a change at VB2
> > implementation will likely affect its kAPI, its behavior or both.
> >
> > The point I'm underlining is that core redesigns do affect existing
> > drivers usually on unexpected ways.
> >
> >>
> >>>
> >>> Yet, the transition from VB1 to VB2 was also painful, and took a lot =
of time.
> >>>
> >>
> >> Yes, vb -> vb2 would be a more appropriate comparison.
> >>
> >>> On both cases, there were very good technical reasons for the transit=
ion,
> >>> in terms of missing needed features, broken memory models and serious
> >>> troubles that utterly causing VB1 to not work well on non-x86 hardwar=
e.
> >>>
> >>
> >> It's a very similar situation now, vb2 doesn't work well on modern
> >> hardware, but I still have hopes that it can be fixed without
> >> affecting the driver-facing behavior. (We would probably need to
> >> develop some unit tests that validate the driver-facing behavior to
> >> ensure that.)
> >>
> >>> In the end, the authors of the core changes need to acquire legacy ha=
rdware
> >>> and to do lots of driver-specific changes to avoid breaking existing =
stuff.
> >>> Hans and I had to dedicate a lot of time and efforts on such transiti=
ons,
> >>> as it required a lot of work.
> >>>
> >>> I can tell you: there's no fun on such changes: typically, companies =
won't
> >>> pay someone to do changes on drivers for legacy hardware, specially
> >>> when there are no real benefits, which is the case here, as the final=
 result
> >>> is just to keep the existing drivers to work with existing hardware,
> >>> usually without any new features. So, the ones behind such core chang=
es
> >>> have to commit fixing drivers usually on their spare time.
> >>>
> >>
> >> I don't get that argument. Wouldn't the same apply to any core change?
> >
> > It depends of the type of change. For instance, an addition of a new
> > V4L2 control should not cause regressions to existing drivers. The
> > same would be true if one adds a new memory allocation component for
> > VB2 (e. g. something similar to videobuf2-vmalloc.c/videobuf2-dma-sg.c/=
..):
> > only drivers using the new way would be affected.
> >
> >> I think the reason we have driver maintainers is that they can help
> >> with testing. Moreover, we need to invest into testing infrastructure
> >> (which is what people have been doing recently via Media CI) to make
> >> such changes less painful. Otherwise the subsystem will just bit-rot
> >> and become useful for modern use cases.
> >
> > Using CI to check for uAPI/kAPI changes is helpful, but it doesn't cove=
r
> > actual drivers. For that, we would need to invest on a CI solution
> > integrated with lots of different hardware pieces, to check for actual
> > driver regressions.
> >
> > On one of my previous work, the company I used to work had that: they
> > had some monitors display some things, and the camera captured input
> > were compared to what the monitor were actually displaying. Doable, but
> > expensive.
> >
> > Regards,
> > Mauro
> >
> > Thanks,
> > Mauro
>

