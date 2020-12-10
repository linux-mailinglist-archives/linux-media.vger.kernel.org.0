Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7E72D618D
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 17:21:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392309AbgLJQHY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 11:07:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392300AbgLJQHV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 11:07:21 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43807C0613CF;
        Thu, 10 Dec 2020 08:06:41 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id t7so4505596pfh.7;
        Thu, 10 Dec 2020 08:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+JSgMk2msbA8mHhf4SGmCfSpNmhQM7k91wlY8aggnvo=;
        b=j6AmNaHh6jI8xHLs6St/LuzF1qubwmIAXp//PcGOpi+4I3NnuTBnRQ8QTmUXKM+Lbt
         aliY45/zIeMV9SfcWL9uIzNvoDhjVZ9VDdH+AfABnE7roj06cshHS6IZdH3Me3Ri71iC
         EccUS9OY+FNNq8d2ooxOz8IZxpWH6vKzKgNOpWhw1bvxlEZnjwCU7SuweO6xxXgeK4tV
         f9kTE2dc+8//bZdrWkU3P/HO0vQC2q9AcPoqCni+Vk4GJM2GUu8tBxY35Oej0xtd65He
         jdKfXaAoHGMEezYcuxlTgwcjdG0E/ZmQrtzD+jPotuxodIDMYp5rlVMjc8LMdbn6Yqp0
         rLEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=+JSgMk2msbA8mHhf4SGmCfSpNmhQM7k91wlY8aggnvo=;
        b=hzXY8JuSMqW18L3YDj8XOyTA/hNR0iroLnV+egqbiGPKMGfRMVKOchyawabZKGEHUj
         iQHunqQ9N69JZJJ0eVHGCn8Pm8L2WgRroOB4uEHY8zBhY0hdcC3Io7iY5f7cvkbR8Z+o
         PUqdfDv4pW5T4T3KQ3x5cD5chtPyiBjOG+oJbxYPXTVMv0Hs1OQoG6VRY4IjGSFKucc7
         s80wuaGeO+zMAZtHPyNZy3nmK8yT11iOGFGckpRER0OTrs3LSALyj4/R0zb10R/UEEJZ
         nMcpnyrtwf502hWUn4/2mKZEDMvJXsFoC4TdJXnUB5pTKzmoCrqT533qlnzscjscdQuB
         Wfpw==
X-Gm-Message-State: AOAM531uH0TrB7qJ1osYFQ70BmRmB1JRvx7TAz6KW2vZkB8s3MHyfXOP
        YMwj8sYmWUeA5u1fa9m5Vws=
X-Google-Smtp-Source: ABdhPJyacNBT7X4OevsSO0bCcLV9+8O4gwMJexjecYnLGPFoA/pI4ihWL3JWMpxMwAHQK6Fyy4lDmA==
X-Received: by 2002:a17:90a:4402:: with SMTP id s2mr8387612pjg.37.1607616400810;
        Thu, 10 Dec 2020 08:06:40 -0800 (PST)
Received: from google.com ([2620:15c:211:201:7220:84ff:fe09:5e58])
        by smtp.gmail.com with ESMTPSA id y2sm6340909pfe.10.2020.12.10.08.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Dec 2020 08:06:39 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Thu, 10 Dec 2020 08:06:36 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     Hyesoo Yu <hyesoo.yu@samsung.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mm <linux-mm@kvack.org>,
        Matthew Wilcox <willy@infradead.org>, david@redhat.com,
        iamjoonsoo.kim@lge.com, vbabka@suse.cz,
        Suren Baghdasaryan <surenb@google.com>,
        KyongHo Cho <pullip.cho@samsung.com>,
        John Dias <joaodias@google.com>,
        Hridya Valsaraju <hridya@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh@kernel.org>,
        Christian Koenig <christian.koenig@amd.com>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: Re: [PATCH 4/4] dma-heap: Devicetree binding for chunk heap
Message-ID: <X9JHjPTdxv6Z7lCW@google.com>
References: <20201117181935.3613581-1-minchan@kernel.org>
 <20201117181935.3613581-5-minchan@kernel.org>
 <CGME20201118030110epcas2p1105a09711ea2c123f19f413b32372764@epcas2p1.samsung.com>
 <CALAqxLWqDLHpOHNEayvhDjJeXjEk_uneH2=d9fy8M87EjKfReA@mail.gmail.com>
 <20201119011431.GA136599@KEI>
 <CALAqxLV=r-V6u8hq2fTmxq855nT7QPkkjyAYdPeZRkYPBi_CKg@mail.gmail.com>
 <X9Fjd+eSStUJskOV@google.com>
 <CALAqxLWthd8bEDRMWmuOf8dOCW8=cFao9HBawKGuRhQZkdgXXw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALAqxLWthd8bEDRMWmuOf8dOCW8=cFao9HBawKGuRhQZkdgXXw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 12:15:15AM -0800, John Stultz wrote:
> On Wed, Dec 9, 2020 at 3:53 PM Minchan Kim <minchan@kernel.org> wrote:
> > On Wed, Nov 18, 2020 at 07:19:07PM -0800, John Stultz wrote:
> > > The CMA heap currently only registers the default CMA heap, as we
> > > didn't want to expose all CMA regions and there's otherwise no way to
> > > pick and choose.
> >
> > Yub.
> >
> > dma-buf really need a way to make exclusive CMA area. Otherwise, default
> > CMA would be shared among drivers and introduce fragmentation easily
> > since we couldn't control other drivers. In such aspect, I don't think
> > current cma-heap works if userspace needs big memory chunk.
> 
> Yes, the default CMA region is not always optimal.
> 
> That's why I was hopeful for Kunihiko Hayashi's patch to allow for
> exposing specific cma regions:
>   https://lore.kernel.org/lkml/1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com/
> 
> I think it would be a good solution, but all we need is *some* driver
> which can be considered the primary user/owner of the cma region which
> would then explicitly export it via the dmabuf heaps.
> 
> > Here, the problem is there is no in-kernel user to bind the specific
> > CMA area because the owner will be random in userspace via dma-buf
> > interface.
> 
> Well, while I agree that conceptually the dmabuf heaps allow for
> allocations for multi-device pipelines, and thus are not tied to
> specific devices. I do think that the memory types exposed are likely
> to have specific devices/drivers in the pipeline that it matters most
> to. So I don't see a big issue with the in-kernel driver registering a
> specific CMA region as a dmabuf heap.

Then, I am worry about that we spread out dma_heap_add_cma to too many
drivers since kernel doesn't how userspace will use it.
For example, system 1 could have device A-B-C pipeline so they added
it A driver. After that, system 2 could have device B-C-D pipeline
so they add dma_heap_add_cma into B device.

> 
> > > > Is there a reason to use dma-heap framework to add cma-area for specific device ?
> > > >
> > > > Even if some in-tree users register dma-heap with cma-area, the buffers could be allocated in user-land and these could be shared among other devices.
> > > > For exclusive access, I guess, the device don't need to register dma-heap for cma area.
> > > >
> > >
> > > It's not really about exclusive access. More just that if you want to
> > > bind a memory reservation/region (cma or otherwise), at least for DTS,
> > > it needs to bind with some device in DT.
> > >
> > > Then the device driver can register that region with a heap driver.
> > > This avoids adding new Linux-specific software bindings to DT. It
> > > becomes a driver implementation detail instead. The primary user of
> > > the heap type would probably be a practical pick (ie the display or
> > > isp driver).
> >
> > If it's the only solution, we could create some dummy driver which has
> > only module_init and bind it from there but I don't think it's a good
> > idea.
> 
> Yea, an un-upstreamable dummy driver is maybe what it devolves to in
> the worst case. But I suspect it would be cleaner for a display or ISP
> driver that benefits most from the heap type to add the reserved
> memory reference to their DT node, and on init for them to register
> the region with the dmabuf heap code.

As I mentioned above, it could be a display at this moment but it could
be different driver next time. If I miss your point, let me know.

Thanks for the review, John.

> 
> 
> > > The other potential solution Rob has suggested is that we create some
> > > tag for the memory reservation (ie: like we do with cma: "reusable"),
> > > which can be used to register the region to a heap. But this has the
> > > problem that each tag has to be well defined and map to a known heap.
> >
> > Do you think that's the only solution to make progress for this feature?
> > Then, could you elaborate it a bit more or any other ideas from dma-buf
> > folks?
> 
> I'm skeptical of that DT tag approach working out, as we'd need a new
> DT binding for the new tag name, and we'd have to do so for each new
> heap type that needs this (so non-default cma, your chunk heap,
> whatever other similar heap types that use reserved regions folks come
> up with).  Having *some* driver take ownership for the reserved region
> and register it with the appropriate heap type seems much
> cleaner/flexible and avoids mucking with the DT ABI.
> 
> thanks
> -john
