Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EC543003FE
	for <lists+linux-media@lfdr.de>; Fri, 22 Jan 2021 14:19:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727187AbhAVNTS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 22 Jan 2021 08:19:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727052AbhAVNTL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 22 Jan 2021 08:19:11 -0500
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com [IPv6:2607:f8b0:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37413C06174A
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:18:31 -0800 (PST)
Received: by mail-ot1-x32e.google.com with SMTP id i30so5012965ota.6
        for <linux-media@vger.kernel.org>; Fri, 22 Jan 2021 05:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nGtfuinTF+9Yk1nFreBSi+/4XI3un+o6N5Q+AzlwfGw=;
        b=T0D50G4VoC9GX6gBxC92OEixiUXyLbcRhe/Z8Xyz48rN52neF0OTn2QOpOd+mD6Kic
         ZiKh5E+bbxMYCKeEYH7kuZ8nQV0suw178zwTLJ8ANLZ+i6g1D+z1/FFOp/m3xIon72HQ
         L+U8plQ982rv9yEOukQDr8rgaUceUT/wPmjsA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nGtfuinTF+9Yk1nFreBSi+/4XI3un+o6N5Q+AzlwfGw=;
        b=C/cQJtIaI3IKmMufjP599vSUvACSL8EuFgOv5sIUBgsqsTp8DNGIm9lt3efWPUJVT1
         FP2LJnCoTyifzffJKRLy/PWCS5vidZja2roR4hIfkXKdWozAbUQrRFhfBOwHUgIH7fOR
         2fBucvSkqn+EGDHyaoUWRN7rhO/kR2SNGUnudHZxuuoVCt7bDncHxmuq4umdv0Lv+u7N
         0+8Y/NcOtvt8xT/G5IST+vUVb6T6BXf3LvWNxc9D6f4EmfQ4qQ8M5naMnQ/MbxrLqeVl
         7CfxLKVkiynpTmX5c0Z43PZgD1gbSZW/oOrqQmkGULJbymLfn+bI//CZyyB+wHWtobC1
         oCDw==
X-Gm-Message-State: AOAM532aX16WiLbkPwIICWfFp70DYSs1Rakqk9sGLTKMPyU7FrXTSwZv
        jfKe/45hoL5wyU9Dr0snOr4LaO//cqLElXcrDWE63A==
X-Google-Smtp-Source: ABdhPJyXtD5LXx2cxBgyhFlNSyMWMdvn61xITYufNOY88eNQ6AORFkmV9H8WamIeHymGEhPGDsz+fP4KFZtZuyGE0sM=
X-Received: by 2002:a9d:ea6:: with SMTP id 35mr3221268otj.188.1611321510577;
 Fri, 22 Jan 2021 05:18:30 -0800 (PST)
MIME-Version: 1.0
References: <20210121194056.1734409-1-daniel.vetter@ffwll.ch> <38322325-d6c7-cbf9-9361-e2da2fac0451@amd.com>
In-Reply-To: <38322325-d6c7-cbf9-9361-e2da2fac0451@amd.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 22 Jan 2021 14:18:19 +0100
Message-ID: <CAKMK7uF4w6igeFv9QmZ69u2J0vC0X2-LJQGervA-XpLmAYEDGg@mail.gmail.com>
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

On Fri, Jan 22, 2021 at 2:10 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 21.01.21 um 20:40 schrieb Daniel Vetter:
> > Recently there was a fairly long thread about recoreable hardware page
> > faults, how they can deadlock, and what to do about that.
> >
> > While the discussion is still fresh I figured good time to try and
> > document the conclusions a bit.
> >
> > References: https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehlin=
g%40amd.com%2F&amp;data=3D04%7C01%7Cchristian.koenig%40amd.com%7C94782d99ad=
7d4e1cc57c08d8be447d74%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6374685=
48672516391%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJ=
BTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DAT8QP2r2UczSqCKkPRTJI1cQ0GOG=
yykgLcMfW8NbD8w%3D&amp;reserved=3D0
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Thomas Hellstr=C3=B6m <thomas.hellstrom@intel.com>
> > Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> > Cc: Jerome Glisse <jglisse@redhat.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> > --
> > I'll be away next week, but figured I'll type this up quickly for some
> > comments and to check whether I got this all roughly right.
> >
> > Critique very much wanted on this, so that we can make sure hw which
> > can't preempt (with pagefaults pending) like gfx10 has a clear path to
> > support page faults in upstream. So anything I missed, got wrong or
> > like that would be good.
> > -Daniel
> > ---
> >   Documentation/driver-api/dma-buf.rst | 66 +++++++++++++++++++++++++++=
+
> >   1 file changed, 66 insertions(+)
> >
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/drive=
r-api/dma-buf.rst
> > index a2133d69872c..e924c1e4f7a3 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -257,3 +257,69 @@ fences in the kernel. This means:
> >     userspace is allowed to use userspace fencing or long running compu=
te
> >     workloads. This also means no implicit fencing for shared buffers i=
n these
> >     cases.
> > +
> > +Recoverable Hardware Page Faults Implications
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Modern hardware supports recoverable page faults, which has a lot of
> > +implications for DMA fences.
> > +
> > +First, a pending page fault obviously holds up the work that's running=
 on the
> > +accelerator and a memory allocation is usually required to resolve the=
 fault.
> > +But memory allocations are not allowed to gate completion of DMA fence=
s, which
> > +means any workload using recoverable page faults cannot use DMA fences=
 for
> > +synchronization. Synchronization fences controlled by userspace must b=
e used
> > +instead.
> > +
> > +On GPUs this poses a problem, because current desktop compositor proto=
cols on
> > +Linus rely on DMA fences, which means without an entirely new userspac=
e stack
> > +built on top of userspace fences, they cannot benefit from recoverable=
 page
> > +faults. The exception is when page faults are only used as migration h=
ints and
> > +never to on-demand fill a memory request. For now this means recoverab=
le page
> > +faults on GPUs are limited to pure compute workloads.
> > +
> > +Furthermore GPUs usually have shared resources between the 3D renderin=
g and
> > +compute side, like compute units or command submission engines. If bot=
h a 3D
> > +job with a DMA fence and a compute workload using recoverable page fau=
lts are
> > +pending they could deadlock:
> > +
> > +- The 3D workload might need to wait for the compute job to finish and=
 release
> > +  hardware resources first.
> > +
> > +- The compute workload might be stuck in a page fault, because the mem=
ory
> > +  allocation is waiting for the DMA fence of the 3D workload to comple=
te.
> > +
> > +There are a few ways to prevent this problem:
> > +
> > +- Compute workloads can always be preempted, even when a page fault is=
 pending
> > +  and not yet repaired. Not all hardware supports this.
> > +
> > +- DMA fence workloads and workloads which need page fault handling hav=
e
> > +  independent hardware resources to guarantee forward progress. This c=
ould be
> > +  achieved through e.g. through dedicated engines and minimal compute =
unit
> > +  reservations for DMA fence workloads.
> > +
>
> > +- The reservation approach could be further refined by only reserving =
the
> > +  hardware resources for DMA fence workloads when they are in-flight. =
This must
> > +  cover the time from when the DMA fence is visible to other threads u=
p to
> > +  moment when fence is completed through dma_fence_signal().
>
> Up till here it makes perfect sense, but what should this paragraph mean =
?

Instead of reserving a few CU at driver load, to guarantee that
dma-fence workloads can always complete, we only do the reservatation
while a problematic dma_fence is in the system, and note yet
signalled. Of course that approach needs to be very careful, to really
make sure you can't ever deadlock by accident because the dynamic
reservation at runtime was done a notch too late.

This allows us to use all CUs on pure compute workloads (on servers,
and on desktop as long as nothing gets rendered).

If that clicks, got ideas for how to improve the text?

> > +- As a last resort, if the hardware provides no useful reservation mec=
hanics,
> > +  all workloads must be flushed from the GPU when switching between jo=
bs
> > +  requiring DMA fences or jobs requiring page fault handling: This mea=
ns all DMA
> > +  fences must complete before a compute job with page fault handling c=
an be
> > +  inserted into the scheduler queue. And vice versa, before a DMA fenc=
e can be
> > +  made visible anywhere in the system, all compute workloads must be p=
reempted
> > +  to guarantee all pending GPU page faults are flushed.
> > +
> > +Note that workloads that run on independent hardware like copy engines=
 or other
> > +GPUs do not have any impact. This allows us to keep using DMA fences i=
nternally
> > +in the kernel even for resolving hardware page faults, e.g. by using c=
opy
> > +engines to clear or copy memory needed to resolve the page fault.
> > +
> > +In some ways this page fault problem is a special case of the `Infinit=
e DMA
> > +Fences` discussions: Infinite fences from compute workloads are allowe=
d to
> > +depend on DMA fences, but not the other way around. And not even the p=
age fault
> > +problem is new, because some other CPU thread in userspace might
> > +hit a page fault which holds up a userspace fence - supporting page fa=
ults on
> > +GPUs doesn't anything fundamentally new.
>
> Maybe worth noting that it just doesn't work with the implicit
> synchronization we have for existing userspace.

At the very beginning I covered that already with ".... they cannot
benefit from recoverable page faults." Should I hammer that home more
that with implicit sync, it's really not going to happen? The thing
is, this is just a special case from dma_fence sync, and we also have
some protocols (I think only android) which use sync_file for that,
and that also is not going to work. I guess we could do the same trick
as with timeline fence objects for waiting for the actual dma_fence to
materialize there. But given how much trouble rolling out timeline
syncobj was I don't think that'll happen. So maybe just specifically
include implicitly synced protocols?
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
