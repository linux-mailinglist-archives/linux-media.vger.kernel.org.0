Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D570B171436
	for <lists+linux-media@lfdr.de>; Thu, 27 Feb 2020 10:38:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728616AbgB0Ji5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Feb 2020 04:38:57 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:34985 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728555AbgB0Ji5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Feb 2020 04:38:57 -0500
Received: by mail-oi1-f194.google.com with SMTP id b18so2677072oie.2
        for <linux-media@vger.kernel.org>; Thu, 27 Feb 2020 01:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ygaa5UcOcAhuGJVtkLkE7p13UWcCwPlnAtozgazN0Hs=;
        b=RE5SgLDsWRkZg8EfYwnBhB2AvCKzUF0B6TLKnItgofj7u9wGwBiOfDvhymSztihNNL
         h/mdhrORtg4N/qf/C5taIZMtw5q7N5ZGrMecxus+b9NLSIvr74GubvPWlV+tEm8FcLKs
         y3IwsFrhsxylyTZm2tBeC0tYsEW0yFK5Qgeuw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ygaa5UcOcAhuGJVtkLkE7p13UWcCwPlnAtozgazN0Hs=;
        b=ZlnAf5rTOFlVVRP+fZAsSPd4hipD/UzyVq2CMNl+gTk/rUDR1Kjablb8Jo2hfr3wEl
         crCmvv++dZE4VHnycnt2EMDxHv9AFxg3wsW1RFNVZ3A/s1H+4BLUe1FYCSmiSD+4pCaU
         ipnrYSWjQbdfMUPM4FJTsa6sbKGQiMTsnMqapusPvCLeFqqcOxJq+t6PeBLY0CZvh8NA
         PKJA2OaVgpSbwlHM2YYnwza4hiCdYGhcm1/XUdeVIw4KdJ9xDI9fipj3Qaq/ADelCSB+
         /HSvi4CUpS4CSqj4GlDYwmdqCbaiRIQVOb5Vkki8SgpmeDUo6mmiMcDHd7ZxEYnVM0iH
         JUsw==
X-Gm-Message-State: APjAAAWovppJAO6lhT/E3kC8i6AaRGHv0SpWwt958pPRbh3rSshFqODf
        suWncLDfer1NAet6WCqXcqc84R/Fp5qtl5aLO7vZSA==
X-Google-Smtp-Source: APXvYqzYR3LJraVpN5KKcf7uLCuG/E5unpLaQhjsn2JN3GTWz3LxaIxZ71E/eDGF57VLJz0FmBOm3lqOaNMM90aYP+M=
X-Received: by 2002:a05:6808:319:: with SMTP id i25mr2607798oie.128.1582796334954;
 Thu, 27 Feb 2020 01:38:54 -0800 (PST)
MIME-Version: 1.0
References: <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org> <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org> <20200220200831.GA2363188@phenom.ffwll.local>
 <501bf409-e4fe-a318-17b4-d5d050b09529@shipmail.org> <20200221171217.GD2363188@phenom.ffwll.local>
 <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com> <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
 <7d73bdfa-63d0-11af-7029-382ad1015c4c@amd.com> <20200225171608.GN2363188@phenom.ffwll.local>
 <CAKMK7uFrcRjjaDAwK73e3UYoONCz36k5SaUStGbjMz7q5FqTMQ@mail.gmail.com> <d524ecc5-5a18-e20f-8d9e-7060d49cb12e@amd.com>
In-Reply-To: <d524ecc5-5a18-e20f-8d9e-7060d49cb12e@amd.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 27 Feb 2020 10:38:43 +0100
Message-ID: <CAKMK7uG3nk3k1yM5ObmuKuP=t5QYdsdknusknRPb871hQqmd0A@mail.gmail.com>
Subject: Re: [PATCH 5/5] drm/amdgpu: implement amdgpu_gem_prime_move_notify v2
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= 
        <thomas_os@shipmail.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 27, 2020 at 10:20 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 26.02.20 um 17:32 schrieb Daniel Vetter:
> > On Tue, Feb 25, 2020 at 6:16 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> >> On Mon, Feb 24, 2020 at 07:46:59PM +0100, Christian K=C3=B6nig wrote:
> >>> Am 23.02.20 um 17:54 schrieb Thomas Hellstr=C3=B6m (VMware):
> >>>> On 2/23/20 4:45 PM, Christian K=C3=B6nig wrote:
> >>>>> Am 21.02.20 um 18:12 schrieb Daniel Vetter:
> >>>>>> [SNIP]
> >>>>>> Yeah the Great Plan (tm) is to fully rely on ww_mutex slowly
> >>>>>> degenerating
> >>>>>> into essentially a global lock. But only when there's actual conte=
ntion
> >>>>>> and thrashing.
> >>>>> Yes exactly. A really big problem in TTM is currently that we drop
> >>>>> the lock after evicting BOs because they tend to move in again
> >>>>> directly after that.
> >>>>>
> >>>>>  From practice I can also confirm that there is exactly zero benefi=
t
> >>>>> from dropping locks early and reacquire them for example for the VM
> >>>>> page tables. That's just makes it more likely that somebody needs t=
o
> >>>>> roll back and this is what we need to avoid in the first place.
> >>>> If you have a benchmarking setup available it would be very interest=
ing
> >>>> for future reference to see how changing from WD to WW mutexes affec=
ts
> >>>> the roll back frequency. WW is known to cause rollbacks much less
> >>>> frequently but there is more work associated with each rollback.
> >>> Not of hand. To be honest I still have a hard time to get a grip on t=
he
> >>> difference between WD and WW from the algorithm point of view. So I c=
an't
> >>> judge that difference at all.
> >>>
> >>>>> Contention on BO locks during command submission is perfectly fine
> >>>>> as long as this is as lightweight as possible while we don't have
> >>>>> trashing. When we have trashing multi submission performance is bes=
t
> >>>>> archived to just favor a single process to finish its business and
> >>>>> block everybody else.
> >>>> Hmm. Sounds like we need a per-manager ww_rwsem protecting manager
> >>>> allocation, taken in write-mode then there's thrashing. In read-mode
> >>>> otherwise. That would limit the amount of "unnecessary" locks we'd h=
ave
> >>>> to keep and reduce unwanted side-effects, (see below):
> >>> Well per-manager (you mean per domain here don't you?) doesn't sound =
like
> >>> that useful because we rarely use only one domain, but I'm actually
> >>> questioning for quite a while if the per BO lock scheme was the right
> >>> approach.
> >>>
> >>> See from the performance aspect the closest to ideal solution I can t=
hink of
> >>> would be a ww_rwsem per user of a resource.
> >>>
> >>> In other words we don't lock BOs, but instead a list of all their use=
rs and
> >>> when you want to evict a BO you need to walk that list and inform all=
 users
> >>> that the BO will be moving.
> >>>
> >>> During command submission you then have the fast path which rather ju=
st
> >>> grabs the read side of the user lock and check if all BOs are still i=
n the
> >>> expected place.
> >>>
> >>> If some BOs were evicted you back off and start the slow path, e.g. m=
aybe
> >>> even copy additional data from userspace then grab the write side of =
the
> >>> lock etc.. etc...
> >>>
> >>> That approach is similar to what we use in amdgpu with the per-VM BOs=
, but
> >>> goes a step further. Problem is that we are so used to per BO locks i=
n the
> >>> kernel that this is probably not doable any more.
> >> Yeah I think it'd be nice to have the same approach for shared bo too.=
 I
> >> guess what we could do is something like this (spinning your ww_rwmute=
x
> >> idea a bit further):
> >>
> >> dma_buf_read_lock(buf, vm)
> >> {
> >>          if (enabled(CONFIG_DEBUG_WW_MUTEX_SLOWPATH))
> >>          {
> >>                  check that vm is indeed listed in buf and splat if no=
t
> >>          }
> >>
> >>          /* for a buf that's not shared in multiple vm we'd have buf->=
resv
> >>           * =3D=3D vm->resv here */
> >>          return ww_mutex_lock(vm->resv);
> >> }
> >>
> >> dma_buf_write_lock(buf)
> >> {
> >>          for_each_vm_in_buf(buf, vm) {
> >>                  ww_mutex_lock(vm->resv);
> >>          }
> >> }
> >>
> >> Ideally we'd track all these vms with something slightly less shoddy t=
han
> >> a linked list :-) Resizeable array is probably pretty good, I think we
> >> only ever need to go from buf -> vm list, not the other way round. At
> >> least in dma_resv/dma_buf code, driver code ofc needs to keep a list o=
f
> >> all bo bound to a vm somewhere. But that's probably a much bigger
> >> datastructure for tracking vma offsets and mappings and other things o=
n
> >> top.
> >>
> >> Ofc to even just get there we'd need something like the sublock list t=
o
> >> keep track of all the additional locks we'd need for the writer lock. =
And
> >> we'd need the release callback for backoff, so that we could also go
> >> through the slowpath on a vm object that we're not holding a full
> >> reference on. That also means vm need to be refcounted.
> >>
> >> And the list of vms on a buffer need to be protected with some lock an=
d
> >> the usual kref_get_unless_zero trickery.
> >>
> >> But with all this I think we can make the dma_buf_write_lock lock 100%
> >> like the old per-buffer lock for everyone. And execbuf could switch ov=
er
> >> to dma_buf_read_lock for shared buffers. Bonus points when the gpu con=
text
> >> just keeps track of a list of shared vm used by buffers in that contex=
t
> >> ...
> >>
> >> That way we could make vm fastpath locking a la amdgpu opt-in, while
> >> keeping everyone else on the per-object locking juices.
> >>
> >> Thoughts?
>
> At least to me that sounds like a plan.
>
> > One thing I just realized, which is nasty: The full (write) lock needs
> > ww_acquire_ctx with this, because it needs to take a bunch of locks.
> > Rolling that out everywhere is going to be nasty.
>
> Why? Take a single write lock shouldn't be different to taking a single
> ww_mutex, or am I missing something?

There's no single write lock in my proposal. The write lock for a
buffer is "take all the vm locks this buffer is mapped into". Which
means we need to take multiple ww_mutex locks, which means backoff and
everything.

Otherwise the read lock of just taking the per vm dma_resv lock won't
work. And doing an true rw lock on each buffer feels a bit pointless,
since then execbuf is back to O(num_buffers). And that's the suck
we're trying to avoid.

> > I guess though we could do a fallback and have a locally created
> > ww_acquire_ctx if there's none passed in, with backoff entirely
> > implemented within dma_resv_lock.
>
> How should that work? As far as I understand it the ww_acquire_ctx must
> be kept existing until after the last of the locks it was used with is
> unlocked. Or do I see this incorrectly?

Ugh right.

I guess we could put the ww_acquire_ctx into the dma_resv so it
survives until the unlock. But that's a rather gross hack.
-Daniel

> > -Daniel
> >
> >> Cheers, Daniel
> >>
> >> PS: Of course the write lock for these buffers is going to be terrible=
, so
> >> every time you need to update fences for implicit sync on shared buffe=
r
> >> (well write fence at least) it's going to suck. We probably also want =
a
> >> read_to_write_upgrade function, which also can be done easily with
> >> ww_mutex magic.
>
> I'm thinking that we probably sole want a read_to_write upgrade function.
>
> Regards,
> Christian.
>
> >> --
> >> Daniel Vetter
> >> Software Engineer, Intel Corporation
> >>
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
