Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 02F012D6AD3
	for <lists+linux-media@lfdr.de>; Thu, 10 Dec 2020 23:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405169AbgLJWz0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Dec 2020 17:55:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393689AbgLJWzF (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Dec 2020 17:55:05 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267E3C0611E4
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 14:40:52 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id s11so8611726ljp.4
        for <linux-media@vger.kernel.org>; Thu, 10 Dec 2020 14:40:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tQWc8Ya/SQ8yu30f2oZK/6gpauwPuWfx0xpCfyzU+rc=;
        b=x0OoNs2LTcACOemmbvVWROexONVqsHi3sxvsxjEkiZzo8yXWD3n2DmqzuWPVW+Lr4b
         ZJhgIZibF4dI8oEPYTgpj3vnCqYB525AAWOvKChixhX1HbwGJ8vSAaE0408WP1YA75TG
         S1Nhwojylv6YfsOD+wxBGPQMRLauPSsMloHkNDFklJ1y2vMtdHU/V7YoC69m6DevORi4
         kF+vdp2hTOIddsuNkaW670CKMwdt6o8sgaDP56d/wvUEluoyEdEpeOxAOCz6ZjYRN2lS
         7NBmhYBNu2YeZZpzS7fwTANlplEp0hZ2PXtBjnNT5YVv1HOonto2C0QmjPttLym4AgAA
         KM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tQWc8Ya/SQ8yu30f2oZK/6gpauwPuWfx0xpCfyzU+rc=;
        b=J87aoH4naOWEvpNDGVLUZX6Z+yXrWBWOTRiAg8TunhEV8tJRFDhXmEYIx5c7H1Wb1Z
         iOoYKFy/z6FKkuFPRXXLGKzpAqqPjVFo6QNKDtPey3y3A1Sf6o5Nlnk/0w1Ae8dLPjo5
         XNPzxfECrMeHYDxjK/fwjf0kiY17Lseqq+/hN8YBu97vu/w/iCr9OV4S09VKWW5xXYsA
         fX589NOVmvn3raQYqm3rRslpJu907iKgNP59hVkwu/vk0OeFO9/6hivXZZRVf4WwYIpi
         R8kqcp4wIJB1AtOSIGYg4rxFche16myj7jtdBYsF/XOxC41z6m626S0F48jdRKqkHCRI
         ehKA==
X-Gm-Message-State: AOAM531UwCfIBbkoUEusXqf3ly401Mi3CLlWkL2lSf03yCxwr7+VZ0VA
        AvySJ1D2gU4QdxgL4OXL0ioH0ygCB1jzVKmziq1bUw==
X-Google-Smtp-Source: ABdhPJzyv+/ixUU7Z4gURlK7gfSgTumIWFyuUn9BMQjVKhZOvuG2b6lPyD6nHt8L6UK49w2MpVe7eroKVnmkRciqHvk=
X-Received: by 2002:a05:651c:10e:: with SMTP id a14mr3979348ljb.128.1607640050539;
 Thu, 10 Dec 2020 14:40:50 -0800 (PST)
MIME-Version: 1.0
References: <20201117181935.3613581-1-minchan@kernel.org> <20201117181935.3613581-5-minchan@kernel.org>
 <CGME20201118030110epcas2p1105a09711ea2c123f19f413b32372764@epcas2p1.samsung.com>
 <CALAqxLWqDLHpOHNEayvhDjJeXjEk_uneH2=d9fy8M87EjKfReA@mail.gmail.com>
 <20201119011431.GA136599@KEI> <CALAqxLV=r-V6u8hq2fTmxq855nT7QPkkjyAYdPeZRkYPBi_CKg@mail.gmail.com>
 <X9Fjd+eSStUJskOV@google.com> <CALAqxLWthd8bEDRMWmuOf8dOCW8=cFao9HBawKGuRhQZkdgXXw@mail.gmail.com>
 <X9JHjPTdxv6Z7lCW@google.com>
In-Reply-To: <X9JHjPTdxv6Z7lCW@google.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 10 Dec 2020 14:40:38 -0800
Message-ID: <CALAqxLVz5bCYxehjVtCJ5eEJ-Wz81=fe30sqRtYtZpXWMkXZiw@mail.gmail.com>
Subject: Re: [PATCH 4/4] dma-heap: Devicetree binding for chunk heap
To:     Minchan Kim <minchan@kernel.org>
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Dec 10, 2020 at 8:06 AM Minchan Kim <minchan@kernel.org> wrote:
> On Thu, Dec 10, 2020 at 12:15:15AM -0800, John Stultz wrote:
> > Well, while I agree that conceptually the dmabuf heaps allow for
> > allocations for multi-device pipelines, and thus are not tied to
> > specific devices. I do think that the memory types exposed are likely
> > to have specific devices/drivers in the pipeline that it matters most
> > to. So I don't see a big issue with the in-kernel driver registering a
> > specific CMA region as a dmabuf heap.
>
> Then, I am worry about that we spread out dma_heap_add_cma to too many
> drivers since kernel doesn't how userspace will use it.
> For example, system 1 could have device A-B-C pipeline so they added
> it A driver. After that, system 2 could have device B-C-D pipeline
> so they add dma_heap_add_cma into B device.

I'm not sure I see this as a major issue? If the drivers add it based
on the dt memory reference, those will be configured to not add
duplicate heaps (and even so the heap driver can also ensure we don't
try to add a heap twice).

> > Yea, an un-upstreamable dummy driver is maybe what it devolves to in
> > the worst case. But I suspect it would be cleaner for a display or ISP
> > driver that benefits most from the heap type to add the reserved
> > memory reference to their DT node, and on init for them to register
> > the region with the dmabuf heap code.
>
> As I mentioned above, it could be a display at this moment but it could
> be different driver next time. If I miss your point, let me know.
>

I guess I just don't see potentially having the registration calls
added to multiple drivers as a big problem.

Ideally, yes, I'd probably rather see a DT node that would allow the
heap driver to register specified regions, but that's been NACKed
multiple times. Given that, having hooks in device drivers to export
the region seems to me like the next best approach, as it avoids DT
ABI ( if ends up its a bad approach, its not something we have to
keep).

The bigger problem right now is not that there are too many places the
registration call would be made from, but that there aren't upstream
drivers which I'm aware of where it would currently make sense to add
specific dma_heap_add_cma() registration hooks to.  We need an
upstream user of Kunihiko Hayashi's patch.

thanks
-john
