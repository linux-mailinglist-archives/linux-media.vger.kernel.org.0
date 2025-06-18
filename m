Return-Path: <linux-media+bounces-35181-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF41BADEFF4
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 16:43:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 36F517A8343
	for <lists+linux-media@lfdr.de>; Wed, 18 Jun 2025 14:41:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 779012EBBA3;
	Wed, 18 Jun 2025 14:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XeWbH1Z7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9E72857C4;
	Wed, 18 Jun 2025 14:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750257771; cv=none; b=lzPJCSFZzDDRkZJmwCGU+b6gydXvbDH5N3WidIPbFiiDTfBZ24QpPChjM/EI5WpMeSyadHkSqjKQrfz0dHwsfEyBUeIJmCXT9oksaRwV6suaL/RxY++rI1doJD6BePb1qXQAaQb8c3eCFmtSlRGeAHFT5WmrWkd6Ck2m8Jzyo5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750257771; c=relaxed/simple;
	bh=fu330xSEk34myvXM2FmUcjDULCgUcx4Y2nO4pValKeA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JkyPye4mH78S1pVdO0hrwwUk9x/hXKGXfJEVEov5phD6zeWpDe02KoANp8I8/alZoVzFOsggfYw8iDB9neeFArQtf+3uyC7M0uDoPzccV6VCPZcd3mWBUku9+yqqO+4LrU7gWsrkELak6lF+S/KMNh+PYP7gBcsvgS7AsFr05uI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XeWbH1Z7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82F77C4CEE7;
	Wed, 18 Jun 2025 14:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750257771;
	bh=fu330xSEk34myvXM2FmUcjDULCgUcx4Y2nO4pValKeA=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=XeWbH1Z7/FOYjckEzkXXWfCyrsqbqJHQy1hVr+/QL4QC/T8XbL38fsjPrNa8fIu85
	 rV2zKebwa6scOsInM/7Yn3MaVvtB+MsTWv70KJVe9B3ISKgJZETDITg/3rdBn3AVzB
	 1rnIjOIvWl2ys6dLXmaFWVggpz8O3gdnmdz+eTwvjb7YkwW1MUbHEJw3CThw8mh/j5
	 RSpqep54aWEXc/W65XM143IV0jxO4rGSZItM4IQjgVbsiRmsAGexDNdbipQNCn3xBZ
	 dtVJsekb8mjpyB5saiBPto57MwnvaErVq3uU/IgCbA3lck7mpP8S56QBR2fcHhAGYG
	 t6XLivCl0U09g==
Date: Wed, 18 Jun 2025 16:42:46 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>,
	Matthew Brost <matthew.brost@intel.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v2] drm/sched: Clarify scenarios for separate workqueues
Message-ID: <aFLQZitx1NYcXcMB@pollux>
References: <20250612144953.111829-2-phasta@kernel.org>
 <aFFy5aG1eOeMU44S@phenom.ffwll.local>
 <aFF3YIAFkgsAKvQV@pollux>
 <aFF6xeu78cXTGFH0@phenom.ffwll.local>
 <aFGFCc7eiZJM8RKM@pollux>
 <aFLH8Us_e_U6gNHV@phenom.ffwll.local>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFLH8Us_e_U6gNHV@phenom.ffwll.local>

On Wed, Jun 18, 2025 at 04:06:41PM +0200, Simona Vetter wrote:
> On Tue, Jun 17, 2025 at 05:08:57PM +0200, Danilo Krummrich wrote:
> > On Tue, Jun 17, 2025 at 04:25:09PM +0200, Simona Vetter wrote:
> > > On Tue, Jun 17, 2025 at 04:10:40PM +0200, Danilo Krummrich wrote:
> > > > On Tue, Jun 17, 2025 at 03:51:33PM +0200, Simona Vetter wrote:
> > > > > On Thu, Jun 12, 2025 at 04:49:54PM +0200, Philipp Stanner wrote:
> > > > > > + * NOTE that sharing &struct drm_sched_init_args.submit_wq with the driver
> > > > > > + * theoretically can deadlock. It must be guaranteed that submit_wq never has
> > > > > > + * more than max_active - 1 active tasks, or if max_active tasks are reached at
> > > > > > + * least one of them does not execute operations that may block on dma_fences
> > > > > > + * that potentially make progress through this scheduler instance. Otherwise,
> > > > > > + * it is possible that all max_active tasks end up waiting on a dma_fence (that
> > > > > > + * can only make progress through this schduler instance), while the
> > > > > > + * scheduler's queued work waits for at least one of the max_active tasks to
> > > > > > + * finish. Thus, this can result in a deadlock.
> > > > > 
> > > > > Uh if you have an ordered wq you deadlock with just one misuse. I'd just
> > > > > explain that the wq must provide sufficient forward-progress guarantees
> > > > > for the scheduler, specifically that it's on the dma_fence signalling
> > > > > critical path and leave the concrete examples for people to figure out
> > > > > when the design a specific locking scheme.
> > > > 
> > > > This isn't a concrete example, is it? It's exactly what you say in slightly
> > > > different words, with the addition of highlighting the impact of the workqueue's
> > > > max_active configuration.
> > > > 
> > > > I think that's relevant, because N - 1 active tasks can be on the dma_fence
> > > > signalling critical path without issues.
> > > > 
> > > > We could change
> > > > 
> > > > 	"if max_active tasks are reached at least one of them must not execute
> > > > 	 operations that may block on dma_fences that potentially make progress
> > > > 	 through this scheduler instance"
> > > > 
> > > > to 
> > > > 
> > > > 	"if max_active tasks are reached at least one of them must not be on the
> > > > 	 dma_fence signalling critical path"
> > > > 
> > > > which is a bit more to the point I think.
> > > 
> > > My point was to more state that the wq must be suitable for the scheduler
> > > jobs as the general issue, and specifically then also highlight the
> > > dma_fence concurrency issue.
> > 
> > Sure, there are more guarantees the driver has to uphold, but this is one of
> > them, so I think we should explain it.
> > 
> > > But it's not the only one, you can have driver locks and other fun involved
> > > here too.
> > 
> > Yeah, but it boils down to the same issue, e.g. if a driver takes a lock in
> > active work, and this lock is taken elsewhere for activities that violate the
> > dma_fence signalling critical path.
> > 
> > All the cases I have in mind boil down to that we potentially, either directly
> > or indirectly (through some synchronization primitive), wait for things we are
> > not allowed to wait for in the dma_fence signalling critical path.
> > 
> > Or do you mean something different?
> 
> You could also grab a mutex in those driver work items that is held while
> waiting for a dma_fence somewhere. The dma_fence annotations should catch
> that, but at least in my reading of the text here it's not covered.

That's exactly one example of what I mean above with: "All the cases I have in
mind boil down to that we potentially, either directly or indirectly (through
some synchronization primitive), wait for things we are not allowed to wait for
in the dma_fence signalling critical path."

> But my main point is what I explain below, the text fails to clearly
> address the issues that all current drivers (maybe all reasonable drivers,
> but sometimes I lack imagination) can encounter, so to me it's too generic
> and not that directly applicable in practice.

I mean, the ordered workqueue isn't more limited than any other workqueue, it's
just that the likelyhood of hitting problems increases with max_active being
lower or even one.

But the error conditions are the exact same, aren't they? We always have to
ensure that at least one slot of the workqueue is not running a task that does
things that are not allowed to do in the dma_fence signalling critical path.

So, this part is technically covered. Do I understand you correctly that you say
you think it's covered too generically?

Do you propose to list the things we're not allowed to do explicitly?

> And then on the other hand
> dma_fence is definitely the big thing, but fundamtentally you tie anything
> you schedule on those wq to the drm/scheduler design in it's entirety. So
> for the general rule, it's not generic enough for my taste.

Sorry, I can't follow that. Can you please expand a bit on what you think is not
generic enough?

> > > Also since all the paragraphs above talk about ordered wq as the example
> > > where specifying your own wq makes sense, it's a bit confusing to now
> > > suddenly only talk about the concurrent wq case without again mentioned
> > > that the ordered wq case is really limited.
> > 
> > I mean, it talks about both cases in a generic way, i.e. if you set
> > max_active == 1 in the text it covers the ordered case.
> > 
> > Or do you mean to say that we should *only* allow ordered workqueues to be
> > shared with the driver?
> 
> Both examples talk about ordered wq, they don't make any sense with
> max_active > 1, and I can't come up with any example that would. So yeah
> I'm leaning in that direction, at least in the docs. Only discussing
> max_active > 1 for this specific issue is imo very confusing and not
> helping much. I guess we could even WARN_ON if a provided wq is not
> ordered, because that does smell funky for sure.

I think there is nothing wrong with sharing a workqueue with WQ_MAX_ACTIVE
between scheduler instances. In the firmware scheduler case we may have quite a
lot of them. So, why create a new workqueue for each of those, in case we can't
take advantage of the synchronization trick with ordered workqueues?

