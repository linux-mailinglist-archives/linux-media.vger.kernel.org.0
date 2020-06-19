Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7B2201CCD
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 22:59:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391572AbgFSU7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 16:59:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:43563 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391056AbgFSU7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 16:59:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592600359;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3zQCeY2hg03c0w2Pqa3443YwJLYT6nkTcSltvd+Vi4A=;
        b=FomYuQC8Z4enCrXK/a53oyu4J6nPXwJeZ27S7SeaGt74Ov0JJ+/p+mP+9Z8eLSb+q019Uz
        zSyOUNw+l1SfN5pq6xWDuQrS4GT1FjKObtJ5y+V+QH6Dzxj/q3q8VZWE0Y+hT1IHbTDnFZ
        5EBkjB+Wwo+yhY5JSwo+dd6UuFpyDUQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-354-rrXxSD6nM6-QXDL_hIU0dg-1; Fri, 19 Jun 2020 16:59:17 -0400
X-MC-Unique: rrXxSD6nM6-QXDL_hIU0dg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D0E84193F560;
        Fri, 19 Jun 2020 20:59:14 +0000 (UTC)
Received: from redhat.com (ovpn-112-200.rdu2.redhat.com [10.10.112.200])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id A800B7C1E3;
        Fri, 19 Jun 2020 20:59:12 +0000 (UTC)
Date:   Fri, 19 Jun 2020 16:59:10 -0400
From:   Jerome Glisse <jglisse@redhat.com>
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Jason Gunthorpe <jgg@ziepe.ca>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep
 annotations
Message-ID: <20200619205910.GA14480@redhat.com>
References: <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca>
 <20200619180935.GA10009@redhat.com>
 <20200619181849.GR6578@ziepe.ca>
 <20200619201011.GB13117@redhat.com>
 <CAKMK7uFZgQH3bP4iC9MPArpngeSHESK62KFEeJvYyV9NSJ_GRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKMK7uFZgQH3bP4iC9MPArpngeSHESK62KFEeJvYyV9NSJ_GRw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 19, 2020 at 10:43:20PM +0200, Daniel Vetter wrote:
> On Fri, Jun 19, 2020 at 10:10 PM Jerome Glisse <jglisse@redhat.com> wrote:
> >
> > On Fri, Jun 19, 2020 at 03:18:49PM -0300, Jason Gunthorpe wrote:
> > > On Fri, Jun 19, 2020 at 02:09:35PM -0400, Jerome Glisse wrote:
> > > > On Fri, Jun 19, 2020 at 02:23:08PM -0300, Jason Gunthorpe wrote:
> > > > > On Fri, Jun 19, 2020 at 06:19:41PM +0200, Daniel Vetter wrote:
> > > > >
> > > > > > The madness is only that device B's mmu notifier might need to wait
> > > > > > for fence_B so that the dma operation finishes. Which in turn has to
> > > > > > wait for device A to finish first.
> > > > >
> > > > > So, it sound, fundamentally you've got this graph of operations across
> > > > > an unknown set of drivers and the kernel cannot insert itself in
> > > > > dma_fence hand offs to re-validate any of the buffers involved?
> > > > > Buffers which by definition cannot be touched by the hardware yet.
> > > > >
> > > > > That really is a pretty horrible place to end up..
> > > > >
> > > > > Pinning really is right answer for this kind of work flow. I think
> > > > > converting pinning to notifers should not be done unless notifier
> > > > > invalidation is relatively bounded.
> > > > >
> > > > > I know people like notifiers because they give a bit nicer performance
> > > > > in some happy cases, but this cripples all the bad cases..
> > > > >
> > > > > If pinning doesn't work for some reason maybe we should address that?
> > > >
> > > > Note that the dma fence is only true for user ptr buffer which predate
> > > > any HMM work and thus were using mmu notifier already. You need the
> > > > mmu notifier there because of fork and other corner cases.
> > >
> > > I wonder if we should try to fix the fork case more directly - RDMA
> > > has this same problem and added MADV_DONTFORK a long time ago as a
> > > hacky way to deal with it.
> > >
> > > Some crazy page pin that resolved COW in a way that always kept the
> > > physical memory with the mm that initiated the pin?
> >
> > Just no way to deal with it easily, i thought about forcing the
> > anon_vma (page->mapping for anonymous page) to the anon_vma that
> > belongs to the vma against which the GUP was done but it would
> > break things if page is already in other branch of a fork tree.
> > Also this forbid fast GUP.
> >
> > Quite frankly the fork was not the main motivating factor. GPU
> > can pin potentialy GBytes of memory thus we wanted to be able
> > to release it but since Michal changes to reclaim code this is
> > no longer effective.
> 
> What where how? My patch to annote reclaim paths with mmu notifier
> possibility just landed in -mm, so if direct reclaim can't reclaim mmu
> notifier'ed stuff anymore we need to know.
> 
> Also this would resolve the entire pain we're discussing in this
> thread about dma_fence_wait deadlocking against anything that's not
> GFP_ATOMIC ...

Sorry my bad, reclaim still works, only oom skip. It was couple
years ago and i thought that some of the things discuss while
back did make it upstream.

It is probably a good time to also point out that what i wanted
to do is have all the mmu notifier callback provide some kind
of fence (not dma fence) so that we can split the notification
into step:
    A- schedule notification on all devices/system get fences
       this step should minimize lock dependency and should
       not have to wait for anything also best if you can avoid
       memory allocation for instance by pre-allocating what
       you need for notification.
    B- mm can do things like unmap but can not map new page
       so write special swap pte to cpu page table
    C- wait on each fences from A
    ... resume old code ie replace pte or finish unmap ...

The idea here is that at step C the core mm can decide to back
off if any fence returned from A have to wait. This means that
every device is invalidating for nothing but if we get there
then it might still be a good thing as next time around maybe
the kernel would be successfull without a wait.

This would allow things like reclaim to make forward progress
and skip over or limit wait time to given timeout.

Also I thought to extend this even to multi-cpu tlb flush so
that device and CPUs follow same pattern and we can make //
progress on each.


Getting to such scheme is a lot of work. My plan was to first
get the fence as part of the notifier user API and hide it from
mm inside notifier common code. Then update each core mm path to
new model and see if there is any benefit from it. Reclaim would
be first candidate.

Cheers,
J�r�me

