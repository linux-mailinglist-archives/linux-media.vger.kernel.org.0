Return-Path: <linux-media+bounces-13015-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A74904F0D
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 11:20:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D83528A6F4
	for <lists+linux-media@lfdr.de>; Wed, 12 Jun 2024 09:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EED3416D9CF;
	Wed, 12 Jun 2024 09:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Xi3UCzzH"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D8516B72E
	for <linux-media@vger.kernel.org>; Wed, 12 Jun 2024 09:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718184025; cv=none; b=Ay1Wnxt2Dc99BuREI3GLqdeLUl8Xacsc/GIMtK/EkSPXCTGwQHfUsd26gxWMt1EdC+YC2cYMCLhxqfHCDobyikclNa2tyrMVC/fl0oqUMc18ULzjmVW9lgJXUMLQPke2pPSMpFWR2mPWR6++r2wHIpdmDYUXteFbjmiK1d00cH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718184025; c=relaxed/simple;
	bh=yWdU4H0ASG4rLFkXU3NvAz2S5QgTvbvnnXIJpBYDwbo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G+E1v87yLuMThiU7ek2xiVtzXl5/aHJfK2gDEr1DTt4NMfEHuYpGALnHfQsyNy8mgjDoXxJ+zmaOEZsY0JrtBgi/RnR7ss9uyxbbfvpRNYEj7tWnMyJDSxGUjS92cBeuEMs1WZMTsmkEdZ+uTyD1zjvtfKEkvvOyebuZxZ9sKOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Xi3UCzzH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CEE4230;
	Wed, 12 Jun 2024 11:20:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1718184008;
	bh=yWdU4H0ASG4rLFkXU3NvAz2S5QgTvbvnnXIJpBYDwbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xi3UCzzH/gNQlWs0KTcDOh6uNTVOR/HKCSTlQpqw76md56ZMle3B0Qcf9aNATzdRz
	 qO7f8p55Tky8aXEUx1H7qcdlT5tVp/LJuBkEFQEQhfDFCjgS1jzTZYssDCCEqd6d2G
	 n9gzhTElsRXyrfRgnuSK07v8NBu+UzuBQYEF31bc=
Date: Wed, 12 Jun 2024 12:20:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomasz Figa <tfiga@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
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
Message-ID: <20240612092001.GF28989@pendragon.ideasonboard.com>
References: <ae3b6b11-c3ec-4a3d-8fa1-c91ef2f8e151@xs4all.nl>
 <7CB6738E-DADE-4F4D-9501-C701B2F3F2B7@collabora.com>
 <CAAFQd5Ae7ctMiPWw1=ugeVCFhTJYbNQ_G2xnoOoc-EYRqp4B2A@mail.gmail.com>
 <2326f490-d9dc-4fa9-a9dd-86e56d7ba6d2@xs4all.nl>
 <20240612095448.1e99b751@coco.lan>
 <CAAFQd5BRJt7HB+=Xc8sq+xj1eLOoeUGnFp=Ndv6WJzcw_39wEg@mail.gmail.com>
 <20240612083430.GE28989@pendragon.ideasonboard.com>
 <CAAFQd5ApRq4WL_PcGKp+58u64yKfvyxgfCxXxiZjqzSugzV1FA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAFQd5ApRq4WL_PcGKp+58u64yKfvyxgfCxXxiZjqzSugzV1FA@mail.gmail.com>

On Wed, Jun 12, 2024 at 06:01:07PM +0900, Tomasz Figa wrote:
> On Wed, Jun 12, 2024 at 5:34 PM Laurent Pinchart wrote:
> > On Wed, Jun 12, 2024 at 05:22:34PM +0900, Tomasz Figa wrote:
> > > On Wed, Jun 12, 2024 at 4:54 PM Mauro Carvalho Chehab wrote:
> > > > Em Wed, 12 Jun 2024 08:46:50 +0200 Hans Verkuil escreveu:
> > > > > On 6/12/24 06:12, Tomasz Figa wrote:
> > > > > > On Wed, May 15, 2024 at 1:19 AM Daniel Almeida wrote:
> > > > > >>
> > > > > >> Hi Hans, all,
> > > > > >>
> > > > > >> I’d like to attend in person and discuss the use of Rust in the subsystem, especially in light of [0] and [1].
> > > > > >>
> > > > > >> Please note that these are new submissions that are unrelated with what was discussed last year.
> > > > > >>
> > > > > >> 30 minutes will do.
> > > > > >>
> > > > > >> [0] https://lwn.net/ml/linux-media/20240227215146.46487-1-daniel.almeida@collabora.com/
> > > > > >> [1] https://lwn.net/Articles/970565
> > > > > >
> > > > > > Somewhat related to the topic: I see potential for a quite big
> > > > > > redesign of the videobuf2 framework going forward and recently with
> > > > > > more Rust adoption I'm starting to think it could benefit from being
> > > > > > implemented in Rust, since we would have to rewrite it quite a bit
> > > > > > anyway. Especially since it's a part of the subsystem that has to deal
> > > > > > with memory management, object lifetime and asynchronousness quite a
> > > > > > lot and we had a history of issues there. So it could be interesting
> > > > > > to hear everyone's thoughts.
> > > > >
> > > > > I think it is far too soon to write a framework like that in Rust.
> > > >
> > > > Agreed. I don't object redesigns in C to make it better - which could have
> > > > some colateral effect of making things easier for a future Rust adoption,
> > > > but such changes should be justified by themselves, and not because of a
> > > > language change.
> > >
> > > No, the thought of redesign doesn't come from the language change,
> > > it's the other way around. Since rewriting a lot of the code already,
> > > why not do it in a language that is generally considered better.
> > >
> > > > See: redesigns at the core will potentially affect lots of drivers,
> > > > so it needs very good technical reasons why doing it. Plus, it requires
> > > > comprehensive tests with different types of hardware/drivers to reduce the
> > > > risk of regressions. Depending on the changes, it may require extra tests
> > > > with devices that are outside complex camera world: radio, analog and digital
> > > > TV drivers - and even some input devices that use VB2 - to ensure that
> > > > nothing broke.
> > >
> > > We don't have to do it in an all-or-nothing way. We can start with an
> > > experimental new implementation in Rust, which could be gradually
> > > tested. It could even be done the same way as the vb -> vb2
> > > transition, although I suspect it wouldn't really be necessary, as I
> > > would like to see it more like a drop-in replacement. In general I
> > > think the API exposed outside of the framework wouldn't really change
> > > that much, it's more about the internal design.
> > >
> > > > > To be
> > > > > honest, I won't even consider it until Linus officially accepts Rust as a
> > > > > second language in the kernel, instead of as an experiment.
> > > >
> > > > This is not enough: if the core starts to use a second language, all media
> > > > developers will be affected and will be required to have expertise on such
> > > > language.
> > >
> > > Let's be realistic, how many developers are actively touching vb2 these days?
> > >
> > > > That's not something that should happen without careful
> > > > analysis and plans that should include a gradual roll-up, lost of tests
> > > > with the affected drivers including the legacy ones and some strategy to
> > > > quickly solve regression issues.
> > >
> > > That said, I agree. It needs proper discussion and planning. That's
> > > why I'm proposing this as a topic. :)
> > > Moreover the redesign itself also needs proper discussion and is more
> > > of a long term goal, not something to land in the next few days.
> >
> > Focussing on this topic, if we're brainstorming memory management for
> > media devices, I'd like to throw in a controversial idea. In addition to
> > being clearer on the fact that USERPTR is deprecated,
> 
> Definitely. This has been long overdue.
> 
> >  I would like to
> > deprecate MMAP too and only focus on DMABUF. I believe Linux needs a
> > centralized buffer allocator, instead of having multiple allocation APIs
> > scattered in different places. There are design ideas in gralloc that we
> > could benefit from.
> 
> Given that we now have DMA-buf heaps in mainline, it sounds much more
> realistic. It would certainly help eliminate some issues in the vb2
> layer, such as vb2-dma-sg having its own open coded page allocation
> that can't handle DMA addressing limitations (which can be fixed with
> some additions to the DMA API, but eliminating the problem altogether
> is way better than any other solution.)

There are (at least) two issues we'll have to solve to make DMA heaps
more universally usable:

- Memory allocation from DMA heaps isn't accounted in the process
  resource limits. This is one of the blockers for getting distributions
  to enable the heaps. We'll have to fix that.

- We need a userspace library to pick the right heap based on the memory
  constraints of the devices that you'll want to share the buffer with.
  This will require exposing those constraints to userspace somehow.

I'm sure there will be more issues, but solving issues is what we do :-)

> That said, as we already use a centralized DMA-buf allocator in
> ChromeOS and don't really care about the MMAP mode, I'm definitely
> biased here. We would need to hear from people working on userspace
> which still uses it (if there is any).
> 
> > > > It is not a matter of what language is better. Instead, it is a matter of
> > > > not affecting code maintenance during the (probably long) transition period
> > > > and beyond.
> > > >
> > > > If you see the past history, the transition from V4L to V4L2 took more than 10
> > > > years - being possible to be done only with the help of libv4l, plus a
> > > > lot of backward-compat code that we added. Still there were several
> > > > regressions and we even had to quickly patch the Kernel and/or some apps
> > > > that were using the uAPI on different ways.
> > >
> > > That's a different situation, because UAPI is involved.
> > >
> > > > Yet, the transition from VB1 to VB2 was also painful, and took a lot of time.
> > >
> > > Yes, vb -> vb2 would be a more appropriate comparison.
> > >
> > > > On both cases, there were very good technical reasons for the transition,
> > > > in terms of missing needed features, broken memory models and serious
> > > > troubles that utterly causing VB1 to not work well on non-x86 hardware.
> > >
> > > It's a very similar situation now, vb2 doesn't work well on modern
> > > hardware, but I still have hopes that it can be fixed without
> > > affecting the driver-facing behavior. (We would probably need to
> > > develop some unit tests that validate the driver-facing behavior to
> > > ensure that.)
> > >
> > > > In the end, the authors of the core changes need to acquire legacy hardware
> > > > and to do lots of driver-specific changes to avoid breaking existing stuff.
> > > > Hans and I had to dedicate a lot of time and efforts on such transitions,
> > > > as it required a lot of work.
> > > >
> > > > I can tell you: there's no fun on such changes: typically, companies won't
> > > > pay someone to do changes on drivers for legacy hardware, specially
> > > > when there are no real benefits, which is the case here, as the final result
> > > > is just to keep the existing drivers to work with existing hardware,
> > > > usually without any new features. So, the ones behind such core changes
> > > > have to commit fixing drivers usually on their spare time.
> > >
> > > I don't get that argument. Wouldn't the same apply to any core change?
> > > I think the reason we have driver maintainers is that they can help
> > > with testing. Moreover, we need to invest into testing infrastructure
> > > (which is what people have been doing recently via Media CI) to make
> > > such changes less painful. Otherwise the subsystem will just bit-rot
> > > and become useful for modern use cases.
> >
> > I've recently seen an increase in people experimenting with sourdough,
> > kombucha, kimchi and other fermentation techniques, so rotting isn't
> > always negative [*], but I assume you meant useless here, not useful :-)
> 
> Yeah, definitely. I'd love it if bit-rotting led to computer software
> becoming more useful, but sadly it's rarely the case.
> 
> > * I'll draw the line at surströmming.
> >
> > > > > The vb2 framework can certainly use some more work, and esp. better support
> > > > > for codecs, since that's where the main pain is at the moment.
> > > > >
> > > > > But I would need to see a proper proposal first. I assume that's what you
> > > > > plan to present?
> > > > >
> > > > > > That said, I wouldn't be able to travel this time unfortunately, so it
> > > > > > would be nice if we could arrange this topic in a time slot friendly
> > > > > > for remote attendance from Japan. Also +Hidenori Kobayashi from my
> > > > > > team who would also be interested in joining remotely.
> > > > >
> > > > > That would mean a slot in the morning, right? Since Japan is 7 hours ahead
> > > > > of CEST.

-- 
Regards,

Laurent Pinchart

