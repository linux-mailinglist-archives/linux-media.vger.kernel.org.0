Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27D98300445
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 14:35:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727354AbhAVNfM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 08:35:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbhAVNfJ (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 08:35:09 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9373CC06174A
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:34:28 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id v21so5055914otj.3
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=rPcRhgeVdArKqXyhU+wwx+JQN9tA9iSQeJI0bQ6mEAM=;
        b=Q3gbf6tHGBi1aELuh/q5PZAsncHo0rGTT4J/yt+Dj0jCgcna5xfEGbdVGjurIAfyu7
         rF330nm/EN/e2R+m+257mAT+dkNh8TgtE6YjlxH9BjA5sf3ZggTqBhzhDDJZ2m3Fq7ZA
         F22KnwNyPwU8UbF/Z54RRvGQHItEOmUP4BNo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=rPcRhgeVdArKqXyhU+wwx+JQN9tA9iSQeJI0bQ6mEAM=;
        b=STzhBGC5qWkJWixZ59PUty6G9wQ9fgE5oFn3z229xcv/LkTAYcoY32E4azMef3ftcI
         6ExUJfpFvHxU+MrCRnPd6EMR27AFww5+mmRnios2++JRXnsfdqAWzg0/U09m/zgBr0b8
         u0kcZLbU9HMbOKiM7ypVYD1gOkF0E71nuWNDRCV4rE9WJ5vuwjFAJr5kl9EnVH29YUt4
         NMag5hH2SkBNUX4oqsrryg95E/fiL4jNQn8FNdJ36mzXkBxoGPFUAxXCyvS/c/w7rpd6
         JpDhVDk0Fxe41ZAEYIVC1/jguvkIvIVxooYqKR9OT59OPhMA+RGKRcE9/0wrHHr04pj+
         0dog==
X-Gm-Message-State: AOAM5336g7PIg1tdp8aQNAyW38FYOWGLj/2t+mL1lX7aULAmzMyi50Ad
        sCBm0ual9WyFd1GcVtY5NpsMVWLN/NLZvKY3rFOodQ==
X-Google-Smtp-Source: ABdhPJwAoVmvc/akU8mnIGYGCcu6qLIh7FCoAgoVA7WFdXBRMzSCCQoJ2taw1qDsBpQd18XD4+W2+4LE6QmukWzZIxk=
X-Received: by 2002:a9d:6c96:: with SMTP id c22mr3224759otr.303.1611322467908;
 Fri, 22 Jan 2021 05:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch>
 <38322325-d6c7-cbf9-9361-e2da2fac0451@amd.com> <CAKMK7uF4w6igeFv9QmZ69u2J0vC0X2-LJQGervA-XpLmAYEDGg@mail.gmail.com>
 <93b1fa50-d667-dfb8-2fe5-e8163df78432@amd.com>
In-Reply-To: <93b1fa50-d667-dfb8-2fe5-e8163df78432@amd.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 22 Jan 2021 14:34:16 +0100
Message-ID: <CAKMK7uFhK5X5mL7SyoJn8kRdDgYL0V=f4ePi3N7QdV1rW8kS0g@mail.gmail.com>
Subject: Re: [PATCH] RFC: dma-fence: Document recoverable page fault implications
To:     =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Felix Kuehling <felix.kuehling@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 22, 2021 at 2:24 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 22.01.21 um 14:18 schrieb Daniel Vetter:
> > On Fri, Jan 22, 2021 at 2:10 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 21.01.21 um 20:40 schrieb Daniel Vetter:
> >>> Recently there was a fairly long thread about recoreable hardware pag=
e
> >>> faults, how they can deadlock, and what to do about that.
> >>>
> >>> While the discussion is still fresh I figured good time to try and
> >>> document the conclusions a bit.
> >>>
> >>> References: https://nam11.safelinks.protection.outlook.com/?url=3Dhtt=
ps%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehl=
ing%40amd.com%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C25c2b659=
bc8f47e0bace08d8bed83728%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63746=
9183153437091%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiL=
CJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DGlEKsPLRRRO%2BI1JSDpvNeBFb=
nFacmymxkj8e7QqM5SA%3D&amp;reserved=3D0
> >>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> >>> Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@intel.com>
> >>> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> >>> Cc: Jerome Glisse <jglisse@redhat.com>
> >>> Cc: Felix Kuehling <felix.kuehling@amd.com>
> >>> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >>> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> >>> Cc: linux-media@vger.kernel.org
> >>> Cc: linaro-mm-sig@lists.linaro.org
> >>> --
> >>> I'll be away next week, but figured I'll type this up quickly for som=
e
> >>> comments and to check whether I got this all roughly right.
> >>>
> >>> Critique very much wanted on this, so that we can make sure hw which
> >>> can't preempt (with pagefaults pending) like gfx10 has a clear path t=
o
>
> One more comment here: You should probably mention that gfx10 is
> referring to AMD GPUs.

Oh that was just the single-patch cover letter. I'll drop it for the
next round since that's not going to be part of the real patch.

> >>> support page faults in upstream. So anything I missed, got wrong or
> >>> like that would be good.
> >>> -Daniel
> >>> ---
> >>>    Documentation/driver-api/dma-buf.rst | 66 ++++++++++++++++++++++++=
++++
> >>>    1 file changed, 66 insertions(+)
> >>>
> >>> diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/dri=
ver-api/dma-buf.rst
> >>> index a2133d69872c..e924c1e4f7a3 100644
> >>> --- a/Documentation/driver-api/dma-buf.rst
> >>> +++ b/Documentation/driver-api/dma-buf.rst
> >>> @@ -257,3 +257,69 @@ fences in the kernel. This means:
> >>>      userspace is allowed to use userspace fencing or long running co=
mpute
> >>>      workloads. This also means no implicit fencing for shared buffer=
s in these
> >>>      cases.
> >>> +
> >>> +Recoverable Hardware Page Faults Implications
> >>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >>> +
> >>> +Modern hardware supports recoverable page faults, which has a lot of
> >>> +implications for DMA fences.
> >>> +
> >>> +First, a pending page fault obviously holds up the work that's runni=
ng on the
> >>> +accelerator and a memory allocation is usually required to resolve t=
he fault.
> >>> +But memory allocations are not allowed to gate completion of DMA fen=
ces, which
> >>> +means any workload using recoverable page faults cannot use DMA fenc=
es for
> >>> +synchronization. Synchronization fences controlled by userspace must=
 be used
> >>> +instead.
> >>> +
> >>> +On GPUs this poses a problem, because current desktop compositor pro=
tocols on
> >>> +Linus rely on DMA fences, which means without an entirely new usersp=
ace stack
> >>> +built on top of userspace fences, they cannot benefit from recoverab=
le page
> >>> +faults. The exception is when page faults are only used as migration=
 hints and
> >>> +never to on-demand fill a memory request. For now this means recover=
able page
> >>> +faults on GPUs are limited to pure compute workloads.
> >>> +
> >>> +Furthermore GPUs usually have shared resources between the 3D render=
ing and
> >>> +compute side, like compute units or command submission engines. If b=
oth a 3D
> >>> +job with a DMA fence and a compute workload using recoverable page f=
aults are
> >>> +pending they could deadlock:
> >>> +
> >>> +- The 3D workload might need to wait for the compute job to finish a=
nd release
> >>> +  hardware resources first.
> >>> +
> >>> +- The compute workload might be stuck in a page fault, because the m=
emory
> >>> +  allocation is waiting for the DMA fence of the 3D workload to comp=
lete.
> >>> +
> >>> +There are a few ways to prevent this problem:
> >>> +
> >>> +- Compute workloads can always be preempted, even when a page fault =
is pending
> >>> +  and not yet repaired. Not all hardware supports this.
> >>> +
> >>> +- DMA fence workloads and workloads which need page fault handling h=
ave
> >>> +  independent hardware resources to guarantee forward progress. This=
 could be
> >>> +  achieved through e.g. through dedicated engines and minimal comput=
e unit
> >>> +  reservations for DMA fence workloads.
> >>> +
> >>> +- The reservation approach could be further refined by only reservin=
g the
> >>> +  hardware resources for DMA fence workloads when they are in-flight=
. This must
> >>> +  cover the time from when the DMA fence is visible to other threads=
 up to
> >>> +  moment when fence is completed through dma_fence_signal().
> >> Up till here it makes perfect sense, but what should this paragraph me=
an ?
> > Instead of reserving a few CU at driver load, to guarantee that
> > dma-fence workloads can always complete, we only do the reservatation
> > while a problematic dma_fence is in the system, and note yet
> > signalled. Of course that approach needs to be very careful, to really
> > make sure you can't ever deadlock by accident because the dynamic
> > reservation at runtime was done a notch too late.
> >
> > This allows us to use all CUs on pure compute workloads (on servers,
> > and on desktop as long as nothing gets rendered).
> >
> > If that clicks, got ideas for how to improve the text?
>
> Yeah, that makes much more sense.
>
> But if I'm not totally mistaken AMD GPUs can't change the CU config on
> the fly.
>
> I mean you could be in the middle of a compute calculation on the CU
> when a 3d job comes in.
>
> So from my perspective I think we could just drop that.

Yeah, I don't expect a single driver to implement everything :-) I
just wanted to go through all the options, because hw is tricky and
tends to change. My idea is also that I can use this here and go to
(our) hw people, if they don't like the consequences, with a list of
options where they can pick the one they like the most. That's why I
want to cover the entire palette of options, down to the pretty big
"full flush" hammer.

I think for the polished version I'll want to give each option some
good name, like "preemptible page-fault" "shared resource
reservation", "dynamic shared resource reservation" and "full flush".
Just so we have some good names to talk about these concepts, instead
of me giving them confusion names like the "gang schedule" thing :-)

> >>> +- As a last resort, if the hardware provides no useful reservation m=
echanics,
> >>> +  all workloads must be flushed from the GPU when switching between =
jobs
> >>> +  requiring DMA fences or jobs requiring page fault handling: This m=
eans all DMA
> >>> +  fences must complete before a compute job with page fault handling=
 can be
> >>> +  inserted into the scheduler queue. And vice versa, before a DMA fe=
nce can be
> >>> +  made visible anywhere in the system, all compute workloads must be=
 preempted
> >>> +  to guarantee all pending GPU page faults are flushed.
> >>> +
> >>> +Note that workloads that run on independent hardware like copy engin=
es or other
> >>> +GPUs do not have any impact. This allows us to keep using DMA fences=
 internally
> >>> +in the kernel even for resolving hardware page faults, e.g. by using=
 copy
> >>> +engines to clear or copy memory needed to resolve the page fault.
> >>> +
> >>> +In some ways this page fault problem is a special case of the `Infin=
ite DMA
> >>> +Fences` discussions: Infinite fences from compute workloads are allo=
wed to
> >>> +depend on DMA fences, but not the other way around. And not even the=
 page fault
> >>> +problem is new, because some other CPU thread in userspace might
> >>> +hit a page fault which holds up a userspace fence - supporting page =
faults on
> >>> +GPUs doesn't anything fundamentally new.
> >> Maybe worth noting that it just doesn't work with the implicit
> >> synchronization we have for existing userspace.
> > At the very beginning I covered that already with ".... they cannot
> > benefit from recoverable page faults." Should I hammer that home more
> > that with implicit sync, it's really not going to happen? The thing
> > is, this is just a special case from dma_fence sync, and we also have
> > some protocols (I think only android) which use sync_file for that,
> > and that also is not going to work. I guess we could do the same trick
> > as with timeline fence objects for waiting for the actual dma_fence to
> > materialize there. But given how much trouble rolling out timeline
> > syncobj was I don't think that'll happen. So maybe just specifically
> > include implicitly synced protocols?
>
> A one line reference to the stuff above should be enough.
>
> Alternatively merge this into the stuff above as well.

Yeah I'll try to make this clearer in the paragraph in the beginning.

I'll send out some polished version when I'm back after next week.
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
