Return-Path: <linux-media+bounces-13184-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAF69069AB
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 12:09:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A5A31C2259E
	for <lists+linux-media@lfdr.de>; Thu, 13 Jun 2024 10:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996B71411E8;
	Thu, 13 Jun 2024 10:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XvEW5tGM"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2097713E3E4
	for <linux-media@vger.kernel.org>; Thu, 13 Jun 2024 10:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718273364; cv=none; b=fyDI+o0bKI5jj3TKW/02Di1hypyDePHntdig3bpqzZ8sFMDBSpSQedlGqCQ/bCmNYfo1As+4EuDKyvZs+11WB2xOkVrbeDAQtKojKgK+HV4hQzIupes96WUoNMpNfr87G9zOqRHEIZ/ZWR7LEnoNIJtYjJ+r3l5cJ2rANUgXHhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718273364; c=relaxed/simple;
	bh=YtUionCB/pIPU4E9Wne5fnhaD7H+8Q57H83aBfFFccw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bXJ6/nVkZbE+assJCkHmCfuyE2MnOB6esk784cxMk9H/I4JUI0nz+L3I6tNuN4ORshu3fxFwOqld/CfZ9UzeQy51lNnkOmtQRliRNMxh8PHL95XSGHhG/XVOeowAoItWFDbd9BAS5EdyweANDecscvUK7ZQjCRz6doFdaQWyKS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XvEW5tGM; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 78F1E4CC;
	Thu, 13 Jun 2024 12:09:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718273346;
	bh=YtUionCB/pIPU4E9Wne5fnhaD7H+8Q57H83aBfFFccw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XvEW5tGMhA1Os6cB9GFYE1h6obQFhJxhd/p+Y06Ja2xw0jP2cFlk+X+66N0pS2++Z
	 vOhS6sW0tzV2MQsPg8XRoXCjj/qp6WNmDnv1zvaqHpYqhRa07VwmU/dr/ARhY4T+Y3
	 hvwskyl3rhUYLkaM2+Qyq3bIXR3npXSO9756N6A8=
Date: Thu, 13 Jun 2024 13:08:59 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Hidenori Kobayashi <hidenorik@chromium.org>,
	Linux Media Mailing List <linux-media@vger.kernel.org>,
	Sean Young <sean@mess.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [ANN] Request for Topics and registration for a Media Summit
 September 16th
Message-ID: <20240613100859.GF7291@pendragon.ideasonboard.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
 <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
 <20240612095448.1e99b751@coco.lan>
 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
 <20240612223448.30f1e9cb@coco.lan>
 <3211e218-265d-47f5-858b-9b81b185eba7@xs4all.nl>
 <CAAFQd5Byb5MVNTzgvg7JD-CTX1KR59Osf0AGunBH1UxVYd6XMw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5Byb5MVNTzgvg7JD-CTX1KR59Osf0AGunBH1UxVYd6XMw@mail.gmail.com>

On Thu, Jun 13, 2024 at 05:14:45PM +0900, Tomasz Figa wrote:
> On Thu, Jun 13, 2024 at 4:38 PM Hans Verkuil wrote:
> > On 12/06/2024 22:35, Mauro Carvalho Chehab wrote:
> > > Em Wed, 12 Jun 2024 17:22:34 +0900 Tomasz Figa escreveu:
> > >> On Wed, Jun 12, 2024 at 4:54 PM Mauro Carvalho Chehab wrote:
> > >>> Em Wed, 12 Jun 2024 08:46:50 +0200 Hans Verkuil escreveu:
> > >>>> On 6/12/24 06:12, Tomasz Figa wrote:
> > >>>>> On Wed, May 15, 2024 at 1:19 AM Daniel Almeida wrote:
> > >>>>>>
> > >>>>>> Hi Hans, all,
> > >>>>>>
> > >>>>>> I’d like to attend in person and discuss the use of Rust in the subsystem, especially in light of [0] and [1].
> > >>>>>>
> > >>>>>> Please note that these are new submissions that are unrelated with what was discussed last year.
> > >>>>>>
> > >>>>>> 30 minutes will do.
> > >>>>>>
> > >>>>>> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.almeida@collabora.com/
> > >>>>>> [1] https://lwn.net/Articles/970565
> > >>>>>
> > >>>>> Somewhat related to the topic: I see potential for a quite big
> > >>>>> redesign of the videobuf2 framework going forward and recently with
> > >>>>> more Rust adoption I'm starting to think it could benefit from being
> > >>>>> implemented in Rust, since we would have to rewrite it quite a bit
> > >>>>> anyway. Especially since it's a part of the subsystem that has to deal
> > >>>>> with memory management, object lifetime and asynchronousness quite a
> > >>>>> lot and we had a history of issues there. So it could be interesting
> > >>>>> to hear everyone's thoughts.
> > >>>>
> > >>>> I think it is far too soon to write a framework like that in Rust.
> > >>>
> > >>> Agreed. I don't object redesigns in C to make it better - which could have
> > >>> some colateral effect of making things easier for a future Rust adoption,
> > >>> but such changes should be justified by themselves, and not because of a
> > >>> language change.
> > >>
> > >> No, the thought of redesign doesn't come from the language change,
> > >> it's the other way around. Since rewriting a lot of the code already,
> > >> why not do it in a language that is generally considered better.
> > >
> > > As Hans said, Rast has experimental support. We can't have drivers
> > > depending on experimental stuff.
> >
> > Indeed.
> >
> > While discussing Rust for experimental drivers or codec libraries is
> > interesting (and I am doing a Rust course, so hopefully I have a better
> > understanding of what's involved by the upcoming media summit), using
> > it for core media frameworks is simply a hard NACK until Linus blesses
> > Rust as a second kernel language.
> >
> > So don't spend your valuable time on that.
> 
> Alright. I'm fine with C as well, although it's a shame that
> eventually when Rust becomes a first-class citizen we'll be left with
> a lot of legacy code base. Anyway, I guess let's wait until that
> happens first. :)

You make it sound like any global acceptance of rust will automatically
make C a second class citizen. That may not help getting more people to
accept a second language :-)

> > >>> See: redesigns at the core will potentially affect lots of drivers,
> > >>> so it needs very good technical reasons why doing it. Plus, it requires
> > >>> comprehensive tests with different types of hardware/drivers to reduce the
> > >>> risk of regressions. Depending on the changes, it may require extra tests
> > >>> with devices that are outside complex camera world: radio, analog and digital
> > >>> TV drivers - and even some input devices that use VB2 - to ensure that
> > >>> nothing broke.
> > >>
> > >> We don't have to do it in an all-or-nothing way. We can start with an
> > >> experimental new implementation in Rust, which could be gradually
> > >> tested. It could even be done the same way as the vb -> vb2
> > >> transition, although I suspect it wouldn't really be necessary, as I
> > >> would like to see it more like a drop-in replacement. In general I
> > >> think the API exposed outside of the framework wouldn't really change
> > >> that much, it's more about the internal design.
> >
> > It makes no sense to have a C and a Rust version of vb2. This framework
> > is critical to all drivers, and we're not going to support two versions
> > and fix bugs/add features in two places. Again, it's a hard NACK. Don't
> > waste time on that.
> >
> > If there are ideas to make vb2 better, then I am all for that.
> >
> > I just want to mention two things here:
> >
> > For most drivers, using vb2 is just fine: the work a driver needs to do is
> > quite straightforward. Exceptions are codec drivers and possibly complex
> > camera drivers when they need to use requests (not certain yet).

For camera drivers, I plan to experiment with the request API at some
point, and I think the current way it's handled in helpers through the
subsystem, including in vb2, will not be a good match for the needs. As
far as I understand, when a request is queued, core code then dispatches
calls to vb2 and control operations corresponding to the request
contents. What we will likely need instead is using a top-level entry
point and getting data out of the request manually, not through
callbacks. I'll report more on this once I start experimenting.

> Do we have any data that suggests that non-codec and non-complex
> camera drivers are actually "most drivers"?
> 
> Anyway, I agree that "using" vb2 is indeed fine and I want us to keep
> using it. But whether it actually works well is a different story.
> Things become problematic as soon as someone intends to run something
> more complex than yavta, e.g. exporting and importing DMA-bufs is
> involved.
> 
> So putting aside the Rust discussion (that wasn't really the core
> point), could I get 30 minutes to cover the vb2 pain points and how we
> could fix them? Or should we just work on that and send patches?
> Either works for me. (In fact we started already, e.g. via the
> duplicate plane mapping patch series).
> 
> > Internally vb2 is quite complex, but that's because what it does is quite
> > complex. And that's fine. If the internal structure can be improved to
> > make it less complex, then I'm all for that, but there is no magic bullet
> > (including using Rust instead of C) that suddenly makes everything simple.
> >
> > Generally I prefer to have the complexity in core frameworks, that will
> > only make life easier for the driver developers.
> 
> I prefer complexity neither in drivers nor core frameworks, but we
> can't have everything. ;)
> 
> I agree that buffer management is a complex problem, so we can't avoid
> some level of complexity, although there is certainly room for
> improvement in vb2. That also wasn't the core reason for the proposed
> redesign. The core point is about the functional issues.
> 
> > To summarize:
> >
> > Until Rust is accepted by Linus as a second kernel language, as media
> > maintainer I will NACK core media frameworks written in Rust. I won't
> > spend time on it, it's an immediate NACK from me.
> >
> > Note that this doesn't imply that once Linus *does* accept Rust, that we
> > are OK with core frameworks written in Rust. But that will be a separate
> > discussion once that happens.
> 
> Ack.
> 
> > > Having two implementations of the same logic doesn't sound reasonable,
> > > as it doubles the maintainership effort: all changes done on one
> > > implementation needs to be moved to the other one.
> > >
> > > Btw, we also have seem this problem before with VB and, up to some
> > > sense, with VB2, as some drivers used to have their own buffer
> > > handling implementation that usually started from a VB or VB2 fork.
> > >
> > > So, if VB2 has issues, let's fix it in C code.
> > >
> > >>>> To be
> > >>>> honest, I won't even consider it until Linus officially accepts Rust as a
> > >>>> second language in the kernel, instead of as an experiment.
> > >>>
> > >>> This is not enough: if the core starts to use a second language, all media
> > >>> developers will be affected and will be required to have expertise on such
> > >>> language.
> > >>
> > >> Let's be realistic, how many developers are actively touching vb2 these days?
> > >
> > > How many developers don't need VB2? Hopefully none :-)
> > >
> > >>> That's not something that should happen without careful
> > >>> analysis and plans that should include a gradual roll-up, lost of tests
> > >>> with the affected drivers including the legacy ones and some strategy to
> > >>> quickly solve regression issues.
> > >>
> > >> That said, I agree. It needs proper discussion and planning. That's
> > >> why I'm proposing this as a topic. :)
> > >> Moreover the redesign itself also needs proper discussion and is more
> > >> of a long term goal, not something to land in the next few days.
> > >>
> > >>>
> > >>> It is not a matter of what language is better. Instead, it is a matter of
> > >>> not affecting code maintenance during the (probably long) transition period
> > >>> and beyond.
> > >>>
> > >>> If you see the past history, the transition from V4L to V4L2 took more than 10
> > >>> years - being possible to be done only with the help of libv4l, plus a
> > >>> lot of backward-compat code that we added. Still there were several
> > >>> regressions and we even had to quickly patch the Kernel and/or some apps
> > >>> that were using the uAPI on different ways.
> > >>
> > >> That's a different situation, because UAPI is involved.
> > >
> > > It is different, but similar, up to some sense, as a change at VB2
> > > implementation will likely affect its kAPI, its behavior or both.
> > >
> > > The point I'm underlining is that core redesigns do affect existing
> > > drivers usually on unexpected ways.
> > >
> > >>
> > >>>
> > >>> Yet, the transition from VB1 to VB2 was also painful, and took a lot of time.
> > >>>
> > >>
> > >> Yes, vb -> vb2 would be a more appropriate comparison.
> > >>
> > >>> On both cases, there were very good technical reasons for the transition,
> > >>> in terms of missing needed features, broken memory models and serious
> > >>> troubles that utterly causing VB1 to not work well on non-x86 hardware.
> > >>>
> > >>
> > >> It's a very similar situation now, vb2 doesn't work well on modern
> > >> hardware, but I still have hopes that it can be fixed without
> > >> affecting the driver-facing behavior. (We would probably need to
> > >> develop some unit tests that validate the driver-facing behavior to
> > >> ensure that.)
> > >>
> > >>> In the end, the authors of the core changes need to acquire legacy hardware
> > >>> and to do lots of driver-specific changes to avoid breaking existing stuff.
> > >>> Hans and I had to dedicate a lot of time and efforts on such transitions,
> > >>> as it required a lot of work.
> > >>>
> > >>> I can tell you: there's no fun on such changes: typically, companies won't
> > >>> pay someone to do changes on drivers for legacy hardware, specially
> > >>> when there are no real benefits, which is the case here, as the final result
> > >>> is just to keep the existing drivers to work with existing hardware,
> > >>> usually without any new features. So, the ones behind such core changes
> > >>> have to commit fixing drivers usually on their spare time.
> > >>>
> > >>
> > >> I don't get that argument. Wouldn't the same apply to any core change?
> > >
> > > It depends of the type of change. For instance, an addition of a new
> > > V4L2 control should not cause regressions to existing drivers. The
> > > same would be true if one adds a new memory allocation component for
> > > VB2 (e. g. something similar to videobuf2-vmalloc.c/videobuf2-dma-sg.c/..):
> > > only drivers using the new way would be affected.
> > >
> > >> I think the reason we have driver maintainers is that they can help
> > >> with testing. Moreover, we need to invest into testing infrastructure
> > >> (which is what people have been doing recently via Media CI) to make
> > >> such changes less painful. Otherwise the subsystem will just bit-rot
> > >> and become useful for modern use cases.
> > >
> > > Using CI to check for uAPI/kAPI changes is helpful, but it doesn't cover
> > > actual drivers. For that, we would need to invest on a CI solution
> > > integrated with lots of different hardware pieces, to check for actual
> > > driver regressions.
> > >
> > > On one of my previous work, the company I used to work had that: they
> > > had some monitors display some things, and the camera captured input
> > > were compared to what the monitor were actually displaying. Doable, but
> > > expensive.

-- 
Regards,

Laurent Pinchart

