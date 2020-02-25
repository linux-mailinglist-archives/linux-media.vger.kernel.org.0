Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C574916EC4C
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2020 18:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730875AbgBYRQN (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Feb 2020 12:16:13 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37747 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730460AbgBYRQN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Feb 2020 12:16:13 -0500
Received: by mail-wr1-f65.google.com with SMTP id l5so11443663wrx.4
        for <linux-media@vger.kernel.org>; Tue, 25 Feb 2020 09:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GYk2QcDkuI7bY7Ycp3cPdTiIrqm0dU3EnOzwwnwFQVs=;
        b=fRc9PDmEUYQeHEUzQvneYMvmjv90szvmBucVnDjiWGAH/a4Vsu0ET6D63hAuFkYiWI
         JO/BZQWw6LI4ST8duwv0dBhbcIQS1MgY49RirpgpC1qrsulSlwAMOZ7DCH0uWyih3x6B
         l+jAPdM1kCwD7ZpNdJNPayRiukt7iX4VKeF1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GYk2QcDkuI7bY7Ycp3cPdTiIrqm0dU3EnOzwwnwFQVs=;
        b=ou5I0wrYBFRJHx9Uri7jH3jA77a+sa/kS4C+AwhzERIGIrBx6B89ff9W7+MgHONXso
         AjwziaJYDjTvknl0gQlGD/1NFV1ZV1FIqgRJ6vD8sgZfK5QpLUVBI9F5OBcOiMe9WW3n
         G84CzhHFo0xoqhoy3FgwE5WJbQ5kyeuR49GbgdJPGFQDSTDj6ufLZiZ4k2E+uDVAbXur
         H+Wb678qbHydNYdwx4nWX2CG4N1NkzJo+B5r18wUtcU64+wSw5QxC8lMVlEfwEFnCFci
         D8CTC0qHRHlZbn4doyg/6cA3wq3cTEJvy1eQgADuCtUDfT5WQESgzriGCWIYDvvHF6ae
         fCBg==
X-Gm-Message-State: APjAAAU7eLWQ2GKKBm8U40okK0eiK21LfSywWdMGkuLeME/YBuDpWWh/
        diWSTUZ5WjOtBzfY2V9gcKAsqlGiwmQ=
X-Google-Smtp-Source: APXvYqxPv758xs0rVGrzUYSuz3k0C21pnOuOE7Ko83tkL+3sFhQmpiLR2wPi5cGvO1eZDUIrFMyCag==
X-Received: by 2002:a5d:6344:: with SMTP id b4mr189846wrw.224.1582650971011;
        Tue, 25 Feb 2020 09:16:11 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id z19sm4925664wmi.35.2020.02.25.09.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 09:16:10 -0800 (PST)
Date:   Tue, 25 Feb 2020 18:16:08 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Thomas =?iso-8859-1?Q?Hellstr=F6m_=28VMware=29?= 
        <thomas_os@shipmail.org>, Daniel Vetter <daniel@ffwll.ch>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
Message-ID: <20200225171608.GN2363188@phenom.ffwll.local>
References: <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org>
 <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org>
 <20200220200831.GA2363188@phenom.ffwll.local>
 <501bf409-e4fe-a318-17b4-d5d050b09529@shipmail.org>
 <20200221171217.GD2363188@phenom.ffwll.local>
 <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com>
 <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
 <7d73bdfa-63d0-11af-7029-382ad1015c4c@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d73bdfa-63d0-11af-7029-382ad1015c4c@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 24, 2020 at 07:46:59PM +0100, Christian K�nig wrote:
> Am 23.02.20 um 17:54 schrieb Thomas Hellstr�m (VMware):
> > On 2/23/20 4:45 PM, Christian K�nig wrote:
> > > Am 21.02.20 um 18:12 schrieb Daniel Vetter:
> > > > [SNIP]
> > > > Yeah the Great Plan (tm) is to fully rely on ww_mutex slowly
> > > > degenerating
> > > > into essentially a global lock. But only when there's actual contention
> > > > and thrashing.
> > > 
> > > Yes exactly. A really big problem in TTM is currently that we drop
> > > the lock after evicting BOs because they tend to move in again
> > > directly after that.
> > > 
> > > From practice I can also confirm that there is exactly zero benefit
> > > from dropping locks early and reacquire them for example for the VM
> > > page tables. That's just makes it more likely that somebody needs to
> > > roll back and this is what we need to avoid in the first place.
> > 
> > If you have a benchmarking setup available it would be very interesting
> > for future reference to see how changing from WD to WW mutexes affects
> > the roll back frequency. WW is known to cause rollbacks much less
> > frequently but there is more work associated with each rollback.
> 
> Not of hand. To be honest I still have a hard time to get a grip on the
> difference between WD and WW from the algorithm point of view. So I can't
> judge that difference at all.
> 
> > > Contention on BO locks during command submission is perfectly fine
> > > as long as this is as lightweight as possible while we don't have
> > > trashing. When we have trashing multi submission performance is best
> > > archived to just favor a single process to finish its business and
> > > block everybody else.
> > 
> > Hmm. Sounds like we need a per-manager ww_rwsem protecting manager
> > allocation, taken in write-mode then there's thrashing. In read-mode
> > otherwise. That would limit the amount of "unnecessary" locks we'd have
> > to keep and reduce unwanted side-effects, (see below):
> 
> Well per-manager (you mean per domain here don't you?) doesn't sound like
> that useful because we rarely use only one domain, but I'm actually
> questioning for quite a while if the per BO lock scheme was the right
> approach.
> 
> See from the performance aspect the closest to ideal solution I can think of
> would be a ww_rwsem per user of a resource.
> 
> In other words we don't lock BOs, but instead a list of all their users and
> when you want to evict a BO you need to walk that list and inform all users
> that the BO will be moving.
> 
> During command submission you then have the fast path which rather just
> grabs the read side of the user lock and check if all BOs are still in the
> expected place.
> 
> If some BOs were evicted you back off and start the slow path, e.g. maybe
> even copy additional data from userspace then grab the write side of the
> lock etc.. etc...
> 
> That approach is similar to what we use in amdgpu with the per-VM BOs, but
> goes a step further. Problem is that we are so used to per BO locks in the
> kernel that this is probably not doable any more.

Yeah I think it'd be nice to have the same approach for shared bo too. I
guess what we could do is something like this (spinning your ww_rwmutex
idea a bit further):

dma_buf_read_lock(buf, vm)
{
	if (enabled(CONFIG_DEBUG_WW_MUTEX_SLOWPATH))
	{
		check that vm is indeed listed in buf and splat if not
	}

	/* for a buf that's not shared in multiple vm we'd have buf->resv
	 * == vm->resv here */
	return ww_mutex_lock(vm->resv);
}

dma_buf_write_lock(buf)
{
	for_each_vm_in_buf(buf, vm) {
		ww_mutex_lock(vm->resv);
	}
}

Ideally we'd track all these vms with something slightly less shoddy than
a linked list :-) Resizeable array is probably pretty good, I think we
only ever need to go from buf -> vm list, not the other way round. At
least in dma_resv/dma_buf code, driver code ofc needs to keep a list of
all bo bound to a vm somewhere. But that's probably a much bigger
datastructure for tracking vma offsets and mappings and other things on
top.

Ofc to even just get there we'd need something like the sublock list to
keep track of all the additional locks we'd need for the writer lock. And
we'd need the release callback for backoff, so that we could also go
through the slowpath on a vm object that we're not holding a full
reference on. That also means vm need to be refcounted.

And the list of vms on a buffer need to be protected with some lock and
the usual kref_get_unless_zero trickery.

But with all this I think we can make the dma_buf_write_lock lock 100%
like the old per-buffer lock for everyone. And execbuf could switch over
to dma_buf_read_lock for shared buffers. Bonus points when the gpu context
just keeps track of a list of shared vm used by buffers in that context
...

That way we could make vm fastpath locking a la amdgpu opt-in, while
keeping everyone else on the per-object locking juices.

Thoughts?

Cheers, Daniel

PS: Of course the write lock for these buffers is going to be terrible, so
every time you need to update fences for implicit sync on shared buffer
(well write fence at least) it's going to suck. We probably also want a
read_to_write_upgrade function, which also can be done easily with
ww_mutex magic.
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
