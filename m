Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB7C517046F
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2020 17:32:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727225AbgBZQct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Feb 2020 11:32:49 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44427 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727060AbgBZQct (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Feb 2020 11:32:49 -0500
Received: by mail-oi1-f196.google.com with SMTP id d62so58719oia.11
        for <linux-media@vger.kernel.org>; Wed, 26 Feb 2020 08:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wykBEBzLTf7o144Hu66RsTRJ5xTL/6Bp3W7WvP/bIMo=;
        b=UZHZy2U3ob2BtejBKb0MdIQZGV0xfwmYLKErxCgJUMJn8V8V4fj07qWJfB2Ymr603z
         IrQnhLslyKzRjGyq9G5fZOjUDbtqXXU8LMp76s5JfXQ39/QA8gslGL6U1gUAm0zjtPgf
         Rf9YXdutOSs81Ura2T0cJaiNIVZYex6dOJ7p0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wykBEBzLTf7o144Hu66RsTRJ5xTL/6Bp3W7WvP/bIMo=;
        b=iLmI88i3XMs+YXrnO+8E8HcQZlnXLH4drA+y4ftEtU7K7oM4id6GrXC+MOC97NEWJD
         gXmUJkv+KleLRX+kyR8gIq3FvRzMfwcwi8gyHnXEag3fl51HcqAP3kaR39F4saxfTV4h
         mYho0SDFa4SEkZUvkTsI6zr/zNsWCGGutReoWzgECuib/mY66XfV8v3n6Mnzv1Aunpv/
         v3GxdiZErUuL25Iwj1ql8RohUIYkJfokOXYu6nllJWSzEV4WwXS2DyjT0bTGBq5q7zoe
         PFo4suoxE07sFq/C8u2hyB9a7wUQ3Ilx5xxGNS+L1taX5a8z6JbFf+Zl6BMLHejWy1yy
         VonA==
X-Gm-Message-State: APjAAAXuyJ5aZ9uPwpTbv6movQVtVaj2IwZKm7W4Hz+qE9EQt72wyF/r
        vFOjPbLVVrQoCgAiaoZ1Itt3x6NswKxs3yMjwINrkA3Y
X-Google-Smtp-Source: APXvYqyfU5h7Qq5+IQtwKNsiVXPlAemV0lFnoyKSDBMBmVqhNgTnhaECcC3GcHfMDbcJDUArqZuab9TMxJuW9mPlR1M=
X-Received: by 2002:a05:6808:10b:: with SMTP id b11mr3956956oie.110.1582734768065;
 Wed, 26 Feb 2020 08:32:48 -0800 (PST)
MIME-Version: 1.0
References: <79a0d79f-91bd-2481-740c-20e6c819c7c9@shipmail.org>
 <ee929c93-c9d7-7243-810e-94c6f0fc64b0@shipmail.org> <20200220180459.GS2363188@phenom.ffwll.local>
 <d1c37ec4-b63e-437a-a2be-80ba5192e048@shipmail.org> <20200220200831.GA2363188@phenom.ffwll.local>
 <501bf409-e4fe-a318-17b4-d5d050b09529@shipmail.org> <20200221171217.GD2363188@phenom.ffwll.local>
 <d9343617-9da8-5fea-a0f1-99db34a0cf2c@gmail.com> <8f29b152-9c7b-3427-efa2-4a39f0daced8@shipmail.org>
 <7d73bdfa-63d0-11af-7029-382ad1015c4c@amd.com> <20200225171608.GN2363188@phenom.ffwll.local>
In-Reply-To: <20200225171608.GN2363188@phenom.ffwll.local>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Wed, 26 Feb 2020 17:32:36 +0100
Message-ID: <CAKMK7uFrcRjjaDAwK73e3UYoONCz36k5SaUStGbjMz7q5FqTMQ@mail.gmail.com>
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

On Tue, Feb 25, 2020 at 6:16 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Feb 24, 2020 at 07:46:59PM +0100, Christian K=C3=B6nig wrote:
> > Am 23.02.20 um 17:54 schrieb Thomas Hellstr=C3=B6m (VMware):
> > > On 2/23/20 4:45 PM, Christian K=C3=B6nig wrote:
> > > > Am 21.02.20 um 18:12 schrieb Daniel Vetter:
> > > > > [SNIP]
> > > > > Yeah the Great Plan (tm) is to fully rely on ww_mutex slowly
> > > > > degenerating
> > > > > into essentially a global lock. But only when there's actual cont=
ention
> > > > > and thrashing.
> > > >
> > > > Yes exactly. A really big problem in TTM is currently that we drop
> > > > the lock after evicting BOs because they tend to move in again
> > > > directly after that.
> > > >
> > > > From practice I can also confirm that there is exactly zero benefit
> > > > from dropping locks early and reacquire them for example for the VM
> > > > page tables. That's just makes it more likely that somebody needs t=
o
> > > > roll back and this is what we need to avoid in the first place.
> > >
> > > If you have a benchmarking setup available it would be very interesti=
ng
> > > for future reference to see how changing from WD to WW mutexes affect=
s
> > > the roll back frequency. WW is known to cause rollbacks much less
> > > frequently but there is more work associated with each rollback.
> >
> > Not of hand. To be honest I still have a hard time to get a grip on the
> > difference between WD and WW from the algorithm point of view. So I can=
't
> > judge that difference at all.
> >
> > > > Contention on BO locks during command submission is perfectly fine
> > > > as long as this is as lightweight as possible while we don't have
> > > > trashing. When we have trashing multi submission performance is bes=
t
> > > > archived to just favor a single process to finish its business and
> > > > block everybody else.
> > >
> > > Hmm. Sounds like we need a per-manager ww_rwsem protecting manager
> > > allocation, taken in write-mode then there's thrashing. In read-mode
> > > otherwise. That would limit the amount of "unnecessary" locks we'd ha=
ve
> > > to keep and reduce unwanted side-effects, (see below):
> >
> > Well per-manager (you mean per domain here don't you?) doesn't sound li=
ke
> > that useful because we rarely use only one domain, but I'm actually
> > questioning for quite a while if the per BO lock scheme was the right
> > approach.
> >
> > See from the performance aspect the closest to ideal solution I can thi=
nk of
> > would be a ww_rwsem per user of a resource.
> >
> > In other words we don't lock BOs, but instead a list of all their users=
 and
> > when you want to evict a BO you need to walk that list and inform all u=
sers
> > that the BO will be moving.
> >
> > During command submission you then have the fast path which rather just
> > grabs the read side of the user lock and check if all BOs are still in =
the
> > expected place.
> >
> > If some BOs were evicted you back off and start the slow path, e.g. may=
be
> > even copy additional data from userspace then grab the write side of th=
e
> > lock etc.. etc...
> >
> > That approach is similar to what we use in amdgpu with the per-VM BOs, =
but
> > goes a step further. Problem is that we are so used to per BO locks in =
the
> > kernel that this is probably not doable any more.
>
> Yeah I think it'd be nice to have the same approach for shared bo too. I
> guess what we could do is something like this (spinning your ww_rwmutex
> idea a bit further):
>
> dma_buf_read_lock(buf, vm)
> {
>         if (enabled(CONFIG_DEBUG_WW_MUTEX_SLOWPATH))
>         {
>                 check that vm is indeed listed in buf and splat if not
>         }
>
>         /* for a buf that's not shared in multiple vm we'd have buf->resv
>          * =3D=3D vm->resv here */
>         return ww_mutex_lock(vm->resv);
> }
>
> dma_buf_write_lock(buf)
> {
>         for_each_vm_in_buf(buf, vm) {
>                 ww_mutex_lock(vm->resv);
>         }
> }
>
> Ideally we'd track all these vms with something slightly less shoddy than
> a linked list :-) Resizeable array is probably pretty good, I think we
> only ever need to go from buf -> vm list, not the other way round. At
> least in dma_resv/dma_buf code, driver code ofc needs to keep a list of
> all bo bound to a vm somewhere. But that's probably a much bigger
> datastructure for tracking vma offsets and mappings and other things on
> top.
>
> Ofc to even just get there we'd need something like the sublock list to
> keep track of all the additional locks we'd need for the writer lock. And
> we'd need the release callback for backoff, so that we could also go
> through the slowpath on a vm object that we're not holding a full
> reference on. That also means vm need to be refcounted.
>
> And the list of vms on a buffer need to be protected with some lock and
> the usual kref_get_unless_zero trickery.
>
> But with all this I think we can make the dma_buf_write_lock lock 100%
> like the old per-buffer lock for everyone. And execbuf could switch over
> to dma_buf_read_lock for shared buffers. Bonus points when the gpu contex=
t
> just keeps track of a list of shared vm used by buffers in that context
> ...
>
> That way we could make vm fastpath locking a la amdgpu opt-in, while
> keeping everyone else on the per-object locking juices.
>
> Thoughts?

One thing I just realized, which is nasty: The full (write) lock needs
ww_acquire_ctx with this, because it needs to take a bunch of locks.
Rolling that out everywhere is going to be nasty.

I guess though we could do a fallback and have a locally created
ww_acquire_ctx if there's none passed in, with backoff entirely
implemented within dma_resv_lock.
-Daniel

>
> Cheers, Daniel
>
> PS: Of course the write lock for these buffers is going to be terrible, s=
o
> every time you need to update fences for implicit sync on shared buffer
> (well write fence at least) it's going to suck. We probably also want a
> read_to_write_upgrade function, which also can be done easily with
> ww_mutex magic.
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
