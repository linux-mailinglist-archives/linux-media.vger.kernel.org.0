Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2921D201B7A
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2020 21:41:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389801AbgFSTlK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 19 Jun 2020 15:41:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:46003 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389792AbgFSTlJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 19 Jun 2020 15:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592595667;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Klk9Yg7QmsaodI3YdZuK3PWnbqv8FErJIsczXrZ686s=;
        b=ZwbFgrdpM6CRdicj0GOzEg+Ufvv2MponnDaxoZagQvCViK1ZWHRJI3su5EcVt7C+lQYSBC
        8jhelLI7BYL7CfwHFt0h6B64/r98+azOsKDXNOt7O1UxxnQ/B9CyjyCQEwRTZ17J92pHHA
        bJcqWxOiZ2PEdXrS0gEad4jAyGJrkAc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-kZZ2RrShMPqb7khPp6FD2g-1; Fri, 19 Jun 2020 15:41:05 -0400
X-MC-Unique: kZZ2RrShMPqb7khPp6FD2g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EA8D41800D42;
        Fri, 19 Jun 2020 19:41:00 +0000 (UTC)
Received: from redhat.com (ovpn-112-200.rdu2.redhat.com [10.10.112.200])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 8665619D7B;
        Fri, 19 Jun 2020 19:40:58 +0000 (UTC)
Date:   Fri, 19 Jun 2020 15:40:56 -0400
From:   Jerome Glisse <jglisse@redhat.com>
To:     Felix Kuehling <felix.kuehling@amd.com>
Cc:     Alex Deucher <alexdeucher@gmail.com>,
        linux-rdma <linux-rdma@vger.kernel.org>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        LKML <linux-kernel@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        Thomas Hellstrom <thomas.hellstrom@intel.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Daniel Vetter <daniel.vetter@intel.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        Mika Kuoppala <mika.kuoppala@intel.com>
Subject: Re: [Linaro-mm-sig] [PATCH 04/18] dma-fence: prime lockdep
 annotations
Message-ID: <20200619194056.GA13117@redhat.com>
References: <20200618172338.GM6578@ziepe.ca>
 <CAKMK7uEbqTu4q-amkLXyd1i8KNtLaoO2ZFoGqYiG6D0m0FKpOg@mail.gmail.com>
 <20200619113934.GN6578@ziepe.ca>
 <CAKMK7uE-kWA==Cko5uenMrcnopEjq42HxoDTDywzBAbHqsN13g@mail.gmail.com>
 <20200619151551.GP6578@ziepe.ca>
 <CAKMK7uEvkshAM6KUYZu8_OCpF4+1Y_SM7cQ9nJWpagfke8s8LA@mail.gmail.com>
 <20200619172308.GQ6578@ziepe.ca>
 <20200619180935.GA10009@redhat.com>
 <CADnq5_Pw_85Kzh1of=MbDi4g9POeF3jO4AJ7p2FjY5XZW0=vsQ@mail.gmail.com>
 <86f7f5e5-81a0-5429-5a6e-0d3b0860cfae@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86f7f5e5-81a0-5429-5a6e-0d3b0860cfae@amd.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jun 19, 2020 at 03:30:32PM -0400, Felix Kuehling wrote:
> 
> Am 2020-06-19 um 3:11 p.m. schrieb Alex Deucher:
> > On Fri, Jun 19, 2020 at 2:09 PM Jerome Glisse <jglisse@redhat.com> wrote:
> >> On Fri, Jun 19, 2020 at 02:23:08PM -0300, Jason Gunthorpe wrote:
> >>> On Fri, Jun 19, 2020 at 06:19:41PM +0200, Daniel Vetter wrote:
> >>>
> >>>> The madness is only that device B's mmu notifier might need to wait
> >>>> for fence_B so that the dma operation finishes. Which in turn has to
> >>>> wait for device A to finish first.
> >>> So, it sound, fundamentally you've got this graph of operations across
> >>> an unknown set of drivers and the kernel cannot insert itself in
> >>> dma_fence hand offs to re-validate any of the buffers involved?
> >>> Buffers which by definition cannot be touched by the hardware yet.
> >>>
> >>> That really is a pretty horrible place to end up..
> >>>
> >>> Pinning really is right answer for this kind of work flow. I think
> >>> converting pinning to notifers should not be done unless notifier
> >>> invalidation is relatively bounded.
> >>>
> >>> I know people like notifiers because they give a bit nicer performance
> >>> in some happy cases, but this cripples all the bad cases..
> >>>
> >>> If pinning doesn't work for some reason maybe we should address that?
> >> Note that the dma fence is only true for user ptr buffer which predate
> >> any HMM work and thus were using mmu notifier already. You need the
> >> mmu notifier there because of fork and other corner cases.
> >>
> >> For nouveau the notifier do not need to wait for anything it can update
> >> the GPU page table right away. Modulo needing to write to GPU memory
> >> using dma engine if the GPU page table is in GPU memory that is not
> >> accessible from the CPU but that's never the case for nouveau so far
> >> (but i expect it will be at one point).
> >>
> >>
> >> So i see this as 2 different cases, the user ptr case, which does pin
> >> pages by the way, where things are synchronous. Versus the HMM cases
> >> where everything is asynchronous.
> >>
> >>
> >> I probably need to warn AMD folks again that using HMM means that you
> >> must be able to update the GPU page table asynchronously without
> >> fence wait. The issue for AMD is that they already update their GPU
> >> page table using DMA engine. I believe this is still doable if they
> >> use a kernel only DMA engine context, where only kernel can queue up
> >> jobs so that you do not need to wait for unrelated things and you can
> >> prioritize GPU page table update which should translate in fast GPU
> >> page table update without DMA fence.
> > All devices which support recoverable page faults also have a
> > dedicated paging engine for the kernel driver which the driver already
> > makes use of.  We can also update the GPU page tables with the CPU.
> 
> We have a potential problem with CPU updating page tables while the GPU
> is retrying on page table entries because 64 bit CPU transactions don't
> arrive in device memory atomically.
> 
> We are using SDMA for page table updates. This currently goes through a
> the DRM GPU scheduler to a special SDMA queue that's used by kernel-mode
> only. But since it's based on the DRM GPU scheduler, we do use dma-fence
> to wait for completion.

Yeah my worry is mostly that some cross dma fence leak into it but
it should never happen realy, maybe there is a way to catch if it
does and print a warning.

So yes you can use dma fence, as long as they do not have cross-dep.
Another expectation is that they complete quickly and usualy page
table update do.

Cheers,
J�r�me

