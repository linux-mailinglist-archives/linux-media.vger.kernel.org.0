Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DD31307D28
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 18:56:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231158AbhA1Rzy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 12:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231317AbhA1Rye (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 12:54:34 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7B2CC061574
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 09:53:11 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id a1so6329385wrq.6
        for <linux-media@vger.kernel.org>; Thu, 28 Jan 2021 09:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1yrHTpCxJbPqJxPosBUCqHjQNeMsmt6Vm7ugtgzEReE=;
        b=ez3mBXPhoqFz1D3IFmXN3JtwjoO2rNSDfgvnHC2YcXG14lhpNPd5zYmbbD8+pcGVq6
         AI2c8Urh2Bb+okX+xWbE5YxfBXEvjwaAH4ag9VriOmGaE8MLOma8D2W56hCwqfIun6A9
         P133f7nV5kCBXDTJ0v3Fh7ufr+igEpbVcs2OxxVnfhcFOTm2VQ+2KOvcJxxtpe0eXIjO
         oNI6bg5v2vfU/OymKzVBb8jV6UyEZSlca/u9CCqCQh5CUMP8ej4gYQUhqkCY50a3Y75G
         aQyhYowhGe/6O6ZDgEv+PVFoYmQIdibb8orbwSm6/XmEH2wzsaKDo6c0p/HNCBl2BWKL
         eMig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1yrHTpCxJbPqJxPosBUCqHjQNeMsmt6Vm7ugtgzEReE=;
        b=Lt2l0wIV2ibY9EmJQ3AnXQ4dpppZfCUkGlTGNA9QHq/TyS4h0IECGA+RpkMbgnuiWp
         pKl9sQcPU+4bneOi/A0yQRvWBjydhvi6Q5SSjYCQ0pfwo8eSP684CMFy/7/jv8ag8K8o
         jE7v5qVWlh/GhRcFp/Y/O0lwGux1SX6a5XKXNy5LAhCkIE3HkZL/3ND05yBsdMM8wUXX
         at1h43isEkeU/EV/uWRpRBfVcHeVLOWuJI2vGw74FOsBTqJ5ypUhFp9HRDQ6wDFMyXXt
         8F4ygH1oanQXJofFXipPuwQpu7sYKiQ4v92sJWLZtvdzhZfVPegX/KL1NZVUOQmwJj2h
         YDtQ==
X-Gm-Message-State: AOAM530DPnZ1wjvE7C0Vi/zZROx/196UgWk3v4yLsEmmVjjcySwpgSxI
        Tku80GcVmqlp4XAv/ytY7HrXG7+fGeOVRaOzsjm2oA==
X-Google-Smtp-Source: ABdhPJxwJqmSpiOHWxbkktFlqp4IMoBe4w7eVr8q1PfPy4kMSqkddDUEO7do+MQxEcJmtNOrfxqEeXfGoH86SezSyCg=
X-Received: by 2002:adf:ed45:: with SMTP id u5mr267262wro.358.1611856390338;
 Thu, 28 Jan 2021 09:53:10 -0800 (PST)
MIME-Version: 1.0
References: <20210128083817.314315-1-surenb@google.com> <20210128091348.GA1962975@infradead.org>
In-Reply-To: <20210128091348.GA1962975@infradead.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Thu, 28 Jan 2021 09:52:59 -0800
Message-ID: <CAJuCfpFUhJozS98WJpH0KQKBzyGXvqS1fitu-mgSyhaJ1xL8SQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by
 linux vm
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        benjamin.gaignard@linaro.org, Liam Mark <lmark@codeaurora.org>,
        labbott@redhat.com, Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>, christian.koenig@amd.com,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
        Minchan Kim <minchan@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Sandeep Patil <sspatil@google.com>,
        linux-media <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 28, 2021 at 1:13 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Jan 28, 2021 at 12:38:17AM -0800, Suren Baghdasaryan wrote:
> > Currently system heap maps its buffers with VM_PFNMAP flag using
> > remap_pfn_range. This results in such buffers not being accounted
> > for in PSS calculations because vm treats this memory as having no
> > page structs. Without page structs there are no counters representing
> > how many processes are mapping a page and therefore PSS calculation
> > is impossible.
> > Historically, ION driver used to map its buffers as VM_PFNMAP areas
> > due to memory carveouts that did not have page structs [1]. That
> > is not the case anymore and it seems there was desire to move away
> > from remap_pfn_range [2].
> > Dmabuf system heap design inherits this ION behavior and maps its
> > pages using remap_pfn_range even though allocated pages are backed
> > by page structs.
> > Clear VM_IO and VM_PFNMAP flags when mapping memory allocated by the
> > system heap and replace remap_pfn_range with vm_insert_page, following
> > Laura's suggestion in [1]. This would allow correct PSS calculation
> > for dmabufs.
> >
> > [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> > [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> > (sorry, could not find lore links for these discussions)
> >
> > Suggested-by: Laura Abbott <labbott@kernel.org>
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > ---
> >  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > index 17e0e9a68baf..0e92e42b2251 100644
> > --- a/drivers/dma-buf/heaps/system_heap.c
> > +++ b/drivers/dma-buf/heaps/system_heap.c
> > @@ -200,11 +200,13 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> >       struct sg_page_iter piter;
> >       int ret;
> >
> > +     /* All pages are backed by a "struct page" */
> > +     vma->vm_flags &= ~VM_PFNMAP;
>
> Why do we clear this flag?  It shouldn't even be set here as far as I
> can tell.

Thanks for the question, Christoph.
I tracked down that flag being set by drm_gem_mmap_obj() which DRM
drivers use to "Set up the VMA to prepare mapping of the GEM object"
(according to drm_gem_mmap_obj comments). I also see a pattern in
several DMR drivers to call drm_gem_mmap_obj()/drm_gem_mmap(), then
clear VM_PFNMAP and then map the VMA (for example here:
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/rockchip/rockchip_drm_gem.c#L246).
I thought that dmabuf allocator (in this case the system heap) would
be the right place to set these flags because it controls how memory
is allocated before mapping. However it's quite possible that I'm
missing the real reason for VM_PFNMAP being set in drm_gem_mmap_obj()
before dma_buf_mmap() is called. I could not find the answer to that,
so I hope someone here can clarify that.
