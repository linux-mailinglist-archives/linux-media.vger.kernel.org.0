Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3D0325C3D
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 04:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229946AbhBZD6v (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 22:58:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbhBZD6v (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 22:58:51 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92736C06174A
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 19:58:10 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id e2so1901482ljo.7
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 19:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IKcGR9mazlUUFUCJHZLpv+HgMJWAswex7iAdBxFMsas=;
        b=QXGOxOrc30RkjTFMoXYgNZN9aKZah9TJL8+FeIDzUqdOhlFB16EzADtDKwN24Pr6Me
         lVy8jOde4a3EHpWNph3fPIYrxmQGALemW9oLwX7ALKnc7/1R9sx5C3CbjvfKhg5HsGjO
         YR+W53mExuY+D9stcgZWxSVvxj8AVeezKm8eiKoZ0AF/RnoeJdAp/SD2NTlR+gpFy7M7
         9PVmZeYqeZlfLeqzvmGX67mXnbDKEwhFLVcTEIUIJZ7WDlQqM3rWwbwDPJnr/WvEZrQy
         +Ps5SPvaFb14e6C/aqVvY37js4Xu9rzne1UItA0EumXeC0VlTbQhgt4vkiWON27I8K9W
         3EBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IKcGR9mazlUUFUCJHZLpv+HgMJWAswex7iAdBxFMsas=;
        b=hMJKeMRSdtWNZbuuZpUzXewxkFiV8JiK2sKqwCWuUDEkZmn6oqz0KM1Tr8U3iR1Ba5
         /skC4ewQ3MwNCfT3+JIWPp5pOisA37zzIsjzWSlHyTaPZOYOe/BLRu3aE+63ozkr+Epe
         sLtQ4pMIudwUR0mWxdDlhRT9xhBhX93GIR6VHh3weRYKtiPWR2BloZdU/MvQ3XUS/yeA
         iFOJ1rFLugc50hRNff+7O0IiT1GDX/i6pkkuqecZtT8R9CzZlXszCKJpgPY9yHZCfv5l
         EYGvanT2wHUc+X9Q5cYW0Whj8q+OyHhVeCm+a67ie/eElEw1QWLa+ylIzs+ULFBVqXfL
         CrzQ==
X-Gm-Message-State: AOAM531bQwt5boXdmLOAWnV76sDHvd/SnGAGZc0GNZhzOxZaSPKtOBhP
        8BsBlhg2Fx8h5Ei9zzGXvaYzVpvvtG603fMZ9uWzhtFBRw0bzA==
X-Google-Smtp-Source: ABdhPJx/pbxqQ4tVmMGKowXmBZLmvQbMe0LIG0j9zdeku6gTbxeiU4ZEHNZuRd9UmA3p7DxDyFxh2XaIyMxq6HHuOIU=
X-Received: by 2002:a2e:8ec6:: with SMTP id e6mr505307ljl.257.1614311882892;
 Thu, 25 Feb 2021 19:58:02 -0800 (PST)
MIME-Version: 1.0
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
From:   John Stultz <john.stultz@linaro.org>
Date:   Thu, 25 Feb 2021 19:57:48 -0800
Message-ID: <CALAqxLURCOA9vfw3VqhUTtf_n6nsTHaA+F1Gu32U3pW8zW-YTw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for mmap
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        Hridya Valsaraju <hridya@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 23, 2021 at 3:00 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> tldr; DMA buffers aren't normal memory, expecting that you can use
> them like that (like calling get_user_pages works, or that they're
> accounting like any other normal memory) cannot be guaranteed.
>
> Since some userspace only runs on integrated devices, where all
> buffers are actually all resident system memory, there's a huge
> temptation to assume that a struct page is always present and useable
> like for any more pagecache backed mmap. This has the potential to
> result in a uapi nightmare.
>
> To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> blocks get_user_pages and all the other struct page based
> infrastructure for everyone. In spirit this is the uapi counterpart to
> the kernel-internal CONFIG_DMABUF_DEBUG.
>
> Motivated by a recent patch which wanted to swich the system dma-buf
> heap to vm_insert_page instead of vm_insert_pfn.
>
> v2:
>
> Jason brought up that we also want to guarantee that all ptes have the
> pte_special flag set, to catch fast get_user_pages (on architectures
> that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
>
> From auditing the various functions to insert pfn pte entires
> (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> this should be the correct flag to check for.
>
> References: https://lore.kernel.org/lkml/CAKMK7uHi+mG0z0HUmNt13QCCvutuRVj=
pcR0NjRL12k-WbWzkRg@mail.gmail.com/
> Acked-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Jason Gunthorpe <jgg@ziepe.ca>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: John Stultz <john.stultz@linaro.org>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: linux-media@vger.kernel.org
> Cc: linaro-mm-sig@lists.linaro.org
> ---
>  drivers/dma-buf/dma-buf.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)


So I gave this a spin in a few of my environments, and with the
current dmabuf heaps it spews a lot of warnings.

I'm testing some simple fixes to add:
    vma->vm_flags |=3D VM_PFNMAP;

to the dmabuf heap mmap ops, which we might want to queue along side of thi=
s.

So assuming those can land together.
Acked-by: John Stultz <john.stultz@linaro.org>

thanks
-john
