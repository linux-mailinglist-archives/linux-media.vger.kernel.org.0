Return-Path: <linux-media+bounces-23941-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA96F9F94E5
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 15:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADDD418834E1
	for <lists+linux-media@lfdr.de>; Fri, 20 Dec 2024 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C52521885D;
	Fri, 20 Dec 2024 14:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uZBizrab"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0334D208AD;
	Fri, 20 Dec 2024 14:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734706306; cv=none; b=uXSRtGS4Yt0fvYQ6zYbG+fhS/l4ACbsVfcDZ/JNOZ8l9VyI0t2rVwW27uPg5fEY65we2kk1YMJf/7jzHzw3yxaOyypINI3Va15jQJMwHDF4SODEfQaqFs7AhpEo7+Ptv63HTHtl3SyRenZU/S07dWxJeywukS8g3yBnnSzjgvPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734706306; c=relaxed/simple;
	bh=qs/++TQWUXMzgnAiF0WumtbqnQ5reqmLtqvmX0M8WRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8arRK1oucV4aOzA5zkFs9Vkr7Ba55LBekAo4btBH9FEBV1QUa1/6bGsO3/NqmboXgbwVxvO8WHAfg0G59Xk8xnBqI4huqHeVWrid8QbsSy8cojQIe3NLq7MsmIpcdx6WMujIN9w+r3wiIhJJFJFX0Su40CAZ4aknQ1aPo3DU/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uZBizrab; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06A1BC4CECD;
	Fri, 20 Dec 2024 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734706305;
	bh=qs/++TQWUXMzgnAiF0WumtbqnQ5reqmLtqvmX0M8WRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uZBizrabWzPh67mQhay6G+Ts1QyF9Jf115RLeY8PNe1ddV8BmqaxJB7gwDj015bm8
	 Z3Ukg2Q1IdSR9HbW2kN28JcYT2rCv2r+YsawPsX8PSOKSSCDxp4wZHWs6v4jCXr/KZ
	 pcLBLY9V7SrntxT0KDQd23y6gCurZ/+8ysdMogY8RISIaJHWhj6x1xEhYPv07KFsIA
	 c7gX/b3r9yi6bKoY9QoQNqV7oHctvZcDxNz8M+7E7h7/ts9AvcbPr1NIz9uZnwlSRe
	 lWyBFoCAMIMmEaJEF6JB5VFYy45fTNOCPziynWk7Q5tmWRDZ+GDByy2LMSkFRtkfMA
	 Cb87kRhWvAVFg==
Date: Fri, 20 Dec 2024 15:51:39 +0100
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
Message-ID: <Z2WEe-tgp5CDtk4w@pollux>
References: <20241220124515.93169-2-phasta@kernel.org>
 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>
 <Z2VunIJ4ltfW_xqD@pollux>
 <e366a206-9fa3-4c6b-b307-d48855a7b183@amd.com>
 <46f22193d960c0a0960c2ceaa525e9ff57fc09b6.camel@redhat.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <46f22193d960c0a0960c2ceaa525e9ff57fc09b6.camel@redhat.com>

On Fri, Dec 20, 2024 at 03:11:34PM +0100, Philipp Stanner wrote:
> On Fri, 2024-12-20 at 14:25 +0100, Christian König wrote:
> > Am 20.12.24 um 14:18 schrieb Danilo Krummrich:
> > > On Fri, Dec 20, 2024 at 01:53:34PM +0100, Christian König wrote:
> > > > Am 20.12.24 um 13:45 schrieb Philipp Stanner:
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > index 7ce25281c74c..d6f8df39d848 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > > +	 *
> > > > > +	 * @sched_job: the job to run
> > > > > +	 *
> > > > > +	 * Returns: dma_fence the driver must signal once the
> > > > > hardware has
> > > > > +	 *	completed the job ("hardware fence").
> > > > > +	 *
> > > > > +	 * Note that the scheduler expects to 'inherit' its
> > > > > own reference to
> > > > > +	 * this fence from the callback. It does not invoke an
> > > > > extra
> > > > > +	 * dma_fence_get() on it. Consequently, this callback
> > > > > must return a
> > > > > +	 * fence whose refcount is at least 2: One for the
> > > > > scheduler's
> > > > > +	 * reference returned here, another one for the
> > > > > reference kept by the
> > > > > +	 * driver.
> > > > Well the driver actually doesn't need any extra reference. The
> > > > scheduler
> > > > just needs to guarantee that this reference isn't dropped before
> > > > it is
> > > > signaled.
> > > I think he means the reference the driver's fence context has to
> > > have in order
> > > to signal that thing eventually.
> > 
> > Yeah, but this is usually a weak reference. IIRC most drivers don't 
> > increment the reference count for the reference they keep to signal a
> > fence.
> > 
> > It's expected that the consumers of the dma_fence keep the fence
> > alive 
> > at least until it is signaled.
> 
> So are you saying that the driver having an extra reference (without
> having obtained it with dma_fence_get()) is not an issue because the
> driver is the one who will signal the fence [and then be done with it]?

It's never a "real" issue if you have multiple pointers to a reference counted
object as long as you can ensure that you hold at least one reference for the
time you have pointers to the object.

But, that's bad design. For every pointer to an object a separate reference
should be taken.

