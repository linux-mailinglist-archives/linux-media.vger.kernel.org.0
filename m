Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B936C338F70
	for <lists+linux-media@lfdr.de>; Fri, 12 Mar 2021 15:08:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230491AbhCLOIJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Mar 2021 09:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231701AbhCLOHq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Mar 2021 09:07:46 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF19EC061574
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 06:07:45 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id o16so1846982wrn.0
        for <linux-media@vger.kernel.org>; Fri, 12 Mar 2021 06:07:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=0b94v7S34F+yLOJy1ewvn7dt40NwWiU/Q8n4vHSPEiA=;
        b=XFWc9HL48dKo2J8ISHJxsSvF7n/teqj0UITJY0vXYJ/lbUYwued6kXgJqZQZLkyGql
         4+0yeQDRwXOJ6smUNxSDubBFHU9KdD8fIzIrlcxkSzqBDtwaKQCIEt+2b1+iCyD6tj0b
         8SvnkSoKRO24Trx/AL/rHGcFguDp7SviwUzQE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=0b94v7S34F+yLOJy1ewvn7dt40NwWiU/Q8n4vHSPEiA=;
        b=cIcpuhOwnwl87SX8RMLbDLa1qZihxL/2goapFNXGEj46riFZrpW3vKqUjNszVa3pHj
         LEHH0KJjjLYtqa7QwKcloQide18QM9kOMa2mlNainw00g08MavhBJhSKercOn5K5gQTQ
         jNHVFvkrhLSsOTK+MVrW5GJjZZiLW9FR55LPMz4YZz6WOfIOPgeyeuz7uIhVR75o7icQ
         2Jp7jfAyVyV27wjdE58ZggosfmGWpki/D5oqhwAxdkbnMbb8fgD9Wzv8p+cIZym3193o
         wjtsGXSxppe6XS5zPN8h7TTF6CIk6F9SySAnJt5YJmtmyyI3qwYtTd0ZN9ztg3B7OWfV
         15vw==
X-Gm-Message-State: AOAM531nguu9O/S4kz7DAoPNS1ogk5jDS7UpSLRO01wf6zP+OUGbqhWA
        jhFdWNpGj3/HWjU7ZO2GocKYmQ==
X-Google-Smtp-Source: ABdhPJxse6kS7PMvxKaC+u15I2lZJQSm6UO7GbTrgtUDupCCuocqmsqXDUqNwE+1aiA0VjVsMdPYeA==
X-Received: by 2002:a5d:5047:: with SMTP id h7mr14781415wrt.111.1615558064393;
        Fri, 12 Mar 2021 06:07:44 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v13sm8959320wrt.45.2021.03.12.06.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Mar 2021 06:07:43 -0800 (PST)
Date:   Fri, 12 Mar 2021 15:07:41 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Dave Airlie <airlied@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>,
        Jerome Glisse <jglisse@redhat.com>,
        Felix Kuehling <felix.kuehling@amd.com>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH] dma-fence: Document recoverable page fault implications
Message-ID: <YEt1rVg/flnZHsgG@phenom.ffwll.local>
References: <20210203152921.2429937-1-daniel.vetter@ffwll.ch>
 <8e28d123-e7ea-aade-dd7f-af0eb2999ce6@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e28d123-e7ea-aade-dd7f-af0eb2999ce6@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Feb 03, 2021 at 04:40:38PM +0100, Christian König wrote:
> Am 03.02.21 um 16:29 schrieb Daniel Vetter:
> > Recently there was a fairly long thread about recoreable hardware page
> > faults, how they can deadlock, and what to do about that.
> > 
> > While the discussion is still fresh I figured good time to try and
> > document the conclusions a bit. This documentation section explains
> > what's the potential problem, and the remedies we've discussed,
> > roughly ordered from best to worst.
> > 
> > v2: Linus -> Linux typoe (Dave)
> > 
> > v3:
> > - Make it clear drivers only need to implement one option (Christian)
> > - Make it clearer that implicit sync is out the window with exclusive
> >    fences (Christian)
> > - Add the fairly theoretical option of segementing the memory (either
> >    statically or through dynamic checks at runtime for which piece of
> >    memory is managed how) and explain why it's not a great idea (Felix)
> > 
> > References: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fdri-devel%2F20210107030127.20393-1-Felix.Kuehling%40amd.com%2F&amp;data=04%7C01%7Cchristian.koenig%40amd.com%7C767e1096b9554ab5b6dd08d8c8587f0f%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637479629728871138%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Fth2y8c3LuNbweQGrsS7VjYESGlshu6DfQyikiWBwyQ%3D&amp;reserved=0
> > Cc: Dave Airlie <airlied@gmail.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > Cc: "Christian König" <christian.koenig@amd.com>
> > Cc: Jerome Glisse <jglisse@redhat.com>
> > Cc: Felix Kuehling <felix.kuehling@amd.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Sumit Semwal <sumit.semwal@linaro.org>
> > Cc: linux-media@vger.kernel.org
> > Cc: linaro-mm-sig@lists.linaro.org
> 
> Reviewed-by: Christian König <christian.koenig@amd.com>

Pulled this in, thanks everyone who helped clarify the situation here.

Cheers, Daniel

> I still haven't fully given up on supporting implicit sync with user fences,
> but it is really an eeek, let's try very hard to avoid that, problem.
> 
> Christian
> 
> > ---
> >   Documentation/driver-api/dma-buf.rst | 76 ++++++++++++++++++++++++++++
> >   1 file changed, 76 insertions(+)
> > 
> > diff --git a/Documentation/driver-api/dma-buf.rst b/Documentation/driver-api/dma-buf.rst
> > index a2133d69872c..7f37ec30d9fd 100644
> > --- a/Documentation/driver-api/dma-buf.rst
> > +++ b/Documentation/driver-api/dma-buf.rst
> > @@ -257,3 +257,79 @@ fences in the kernel. This means:
> >     userspace is allowed to use userspace fencing or long running compute
> >     workloads. This also means no implicit fencing for shared buffers in these
> >     cases.
> > +
> > +Recoverable Hardware Page Faults Implications
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Modern hardware supports recoverable page faults, which has a lot of
> > +implications for DMA fences.
> > +
> > +First, a pending page fault obviously holds up the work that's running on the
> > +accelerator and a memory allocation is usually required to resolve the fault.
> > +But memory allocations are not allowed to gate completion of DMA fences, which
> > +means any workload using recoverable page faults cannot use DMA fences for
> > +synchronization. Synchronization fences controlled by userspace must be used
> > +instead.
> > +
> > +On GPUs this poses a problem, because current desktop compositor protocols on
> > +Linux rely on DMA fences, which means without an entirely new userspace stack
> > +built on top of userspace fences, they cannot benefit from recoverable page
> > +faults. Specifically this means implicit synchronization will not be possible.
> > +The exception is when page faults are only used as migration hints and never to
> > +on-demand fill a memory request. For now this means recoverable page
> > +faults on GPUs are limited to pure compute workloads.
> > +
> > +Furthermore GPUs usually have shared resources between the 3D rendering and
> > +compute side, like compute units or command submission engines. If both a 3D
> > +job with a DMA fence and a compute workload using recoverable page faults are
> > +pending they could deadlock:
> > +
> > +- The 3D workload might need to wait for the compute job to finish and release
> > +  hardware resources first.
> > +
> > +- The compute workload might be stuck in a page fault, because the memory
> > +  allocation is waiting for the DMA fence of the 3D workload to complete.
> > +
> > +There are a few options to prevent this problem, one of which drivers need to
> > +ensure:
> > +
> > +- Compute workloads can always be preempted, even when a page fault is pending
> > +  and not yet repaired. Not all hardware supports this.
> > +
> > +- DMA fence workloads and workloads which need page fault handling have
> > +  independent hardware resources to guarantee forward progress. This could be
> > +  achieved through e.g. through dedicated engines and minimal compute unit
> > +  reservations for DMA fence workloads.
> > +
> > +- The reservation approach could be further refined by only reserving the
> > +  hardware resources for DMA fence workloads when they are in-flight. This must
> > +  cover the time from when the DMA fence is visible to other threads up to
> > +  moment when fence is completed through dma_fence_signal().
> > +
> > +- As a last resort, if the hardware provides no useful reservation mechanics,
> > +  all workloads must be flushed from the GPU when switching between jobs
> > +  requiring DMA fences or jobs requiring page fault handling: This means all DMA
> > +  fences must complete before a compute job with page fault handling can be
> > +  inserted into the scheduler queue. And vice versa, before a DMA fence can be
> > +  made visible anywhere in the system, all compute workloads must be preempted
> > +  to guarantee all pending GPU page faults are flushed.
> > +
> > +- Only a fairly theoretical option would be to untangle these dependencies when
> > +  allocating memory to repair hardware page faults, either through separate
> > +  memory blocks or runtime tracking of the full dependency graph of all DMA
> > +  fences. This results very wide impact on the kernel, since resolving the page
> > +  on the CPU side can itself involve a page fault. It is much more feasible and
> > +  robust to limit the impact of handling hardware page faults to the specific
> > +  driver.
> > +
> > +Note that workloads that run on independent hardware like copy engines or other
> > +GPUs do not have any impact. This allows us to keep using DMA fences internally
> > +in the kernel even for resolving hardware page faults, e.g. by using copy
> > +engines to clear or copy memory needed to resolve the page fault.
> > +
> > +In some ways this page fault problem is a special case of the `Infinite DMA
> > +Fences` discussions: Infinite fences from compute workloads are allowed to
> > +depend on DMA fences, but not the other way around. And not even the page fault
> > +problem is new, because some other CPU thread in userspace might
> > +hit a page fault which holds up a userspace fence - supporting page faults on
> > +GPUs doesn't anything fundamentally new.
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
