Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57BD230B473
	for <lists+linux-media@lfdr.de>; Tue,  2 Feb 2021 02:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbhBBBI4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Feb 2021 20:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229537AbhBBBIz (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Feb 2021 20:08:55 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FF55C06174A
        for <linux-media@vger.kernel.org>; Mon,  1 Feb 2021 17:08:15 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id c127so850074wmf.5
        for <linux-media@vger.kernel.org>; Mon, 01 Feb 2021 17:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RndNhAUPEtKb/UpdxEGQ4FR5gEglHekd7o0mVZRrBqQ=;
        b=otCvhmypBIsU0J/onWHBK+g2qEX0OxWIhiVfNvjAUaHwhT+ibJG+RaYiLpZ4TJyqmi
         DdZq19Q3SPbdn5aBZf8+AsCdYBGuPkn8epCg2pdmaNFOqakpsJSEbCIbdtZXqIIWkJvw
         bR7L4z770xZfS8N4HIPZJ7gQaQJfolmpybmdiMYDyEBe8U61fIp0/5Rr3ZFZob9kEXuq
         X37WyIlu6xyWlRb0+xpJHTgVA9sgfB646kpTpUK6Ty0tMmS+D8JxtjcuGYCc1s5TtpEg
         8BtJaDPbNBf1QOhhhalJ/yreI5AaQDA5s9vwf+9M5EcazIKaLfT9apknEvGrShR5jCQW
         hd+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RndNhAUPEtKb/UpdxEGQ4FR5gEglHekd7o0mVZRrBqQ=;
        b=Mu0rcEt6rdaFlLJgDM6eWbeqvpEANZDCPvScUeqbd2XGa8VHsh9Qm9gCAUFlvFionA
         +ufOeZ0PnNaLMLkHPS3y9UrlRE4ohJGyu35pSFbyjDNjVoYdizDJ/LlNAohaAeEYOtGA
         A8le2zdB8+juQklfkeme3HsqfHSP64spvsUCBuuQ7dge9p5kw+6D84GZ6V9THtxXXWE/
         VwQFRtIAqPcF7zEipdWA0q+CC27RW0SstXiVSITDfgqx25+uxe+Vd0AHQBIdoHux8rmU
         P3DGXjj2j08XpeKsdlSjEHwZSQ9wS/Z1GgCzYrplBaUExyhBjMqriTzU81WuI/gCU9wo
         a2Sg==
X-Gm-Message-State: AOAM533O0wZ+GHpaTdG7BrSDNhnfUngE3tQ71T81VIsBZFJrflhK7nQm
        6wwkzf+bdtvmaA4S6GsWU6DUcBIkVYqSlUOmdZvU4g==
X-Google-Smtp-Source: ABdhPJxyhZPweyEZdtVS8pbzENesvAgQg7GA6UjMKqYygX8k02wcRUHVoGOMkAll0W7ToHbbz9juQ18x6KIdTBOcux8=
X-Received: by 2002:a05:600c:4fcb:: with SMTP id o11mr1232051wmq.88.1612228093600;
 Mon, 01 Feb 2021 17:08:13 -0800 (PST)
MIME-Version: 1.0
References: <20210128083817.314315-1-surenb@google.com> <20210128091348.GA1962975@infradead.org>
 <CAJuCfpFUhJozS98WJpH0KQKBzyGXvqS1fitu-mgSyhaJ1xL8SQ@mail.gmail.com>
 <YBMAGRIwcbPF17cU@google.com> <CAJuCfpF78RYedBoAgkDdgMdfSmNwC2AQk-zZxAqkhCdtBB9gtQ@mail.gmail.com>
In-Reply-To: <CAJuCfpF78RYedBoAgkDdgMdfSmNwC2AQk-zZxAqkhCdtBB9gtQ@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Mon, 1 Feb 2021 17:08:02 -0800
Message-ID: <CAJuCfpH5nwvtMR+32G0-xa_hY-b_Hnw=Figqq9xcsTGgJhOiww@mail.gmail.com>
Subject: Re: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by
 linux vm
To:     Minchan Kim <minchan@kernel.org>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "(Exiting) Benjamin Gaignard" <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>, labbott@redhat.com,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        James Jones <jajones@nvidia.com>,
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

On Thu, Jan 28, 2021 at 11:00 AM Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Thu, Jan 28, 2021 at 10:19 AM Minchan Kim <minchan@kernel.org> wrote:
> >
> > On Thu, Jan 28, 2021 at 09:52:59AM -0800, Suren Baghdasaryan wrote:
> > > On Thu, Jan 28, 2021 at 1:13 AM Christoph Hellwig <hch@infradead.org> wrote:
> > > >
> > > > On Thu, Jan 28, 2021 at 12:38:17AM -0800, Suren Baghdasaryan wrote:
> > > > > Currently system heap maps its buffers with VM_PFNMAP flag using
> > > > > remap_pfn_range. This results in such buffers not being accounted
> > > > > for in PSS calculations because vm treats this memory as having no
> > > > > page structs. Without page structs there are no counters representing
> > > > > how many processes are mapping a page and therefore PSS calculation
> > > > > is impossible.
> > > > > Historically, ION driver used to map its buffers as VM_PFNMAP areas
> > > > > due to memory carveouts that did not have page structs [1]. That
> > > > > is not the case anymore and it seems there was desire to move away
> > > > > from remap_pfn_range [2].
> > > > > Dmabuf system heap design inherits this ION behavior and maps its
> > > > > pages using remap_pfn_range even though allocated pages are backed
> > > > > by page structs.
> > > > > Clear VM_IO and VM_PFNMAP flags when mapping memory allocated by the
> > > > > system heap and replace remap_pfn_range with vm_insert_page, following
> > > > > Laura's suggestion in [1]. This would allow correct PSS calculation
> > > > > for dmabufs.
> > > > >
> > > > > [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> > > > > [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> > > > > (sorry, could not find lore links for these discussions)
> > > > >
> > > > > Suggested-by: Laura Abbott <labbott@kernel.org>
> > > > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > > > ---
> > > > >  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
> > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > > > > index 17e0e9a68baf..0e92e42b2251 100644
> > > > > --- a/drivers/dma-buf/heaps/system_heap.c
> > > > > +++ b/drivers/dma-buf/heaps/system_heap.c
> > > > > @@ -200,11 +200,13 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> > > > >       struct sg_page_iter piter;
> > > > >       int ret;
> > > > >
> > > > > +     /* All pages are backed by a "struct page" */
> > > > > +     vma->vm_flags &= ~VM_PFNMAP;
> > > >
> > > > Why do we clear this flag?  It shouldn't even be set here as far as I
> > > > can tell.
> > >
> > > Thanks for the question, Christoph.
> > > I tracked down that flag being set by drm_gem_mmap_obj() which DRM
> > > drivers use to "Set up the VMA to prepare mapping of the GEM object"
> > > (according to drm_gem_mmap_obj comments). I also see a pattern in
> > > several DMR drivers to call drm_gem_mmap_obj()/drm_gem_mmap(), then
> > > clear VM_PFNMAP and then map the VMA (for example here:
> > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/rockchip/rockchip_drm_gem.c#L246).
> > > I thought that dmabuf allocator (in this case the system heap) would
> > > be the right place to set these flags because it controls how memory
> > > is allocated before mapping. However it's quite possible that I'm
> >
> > However, you're not setting but removing a flag under the caller.
> > It's different with appending more flags(e.g., removing condition
> > vs adding more conditions). If we should remove the flag, caller
> > didn't need to set it from the beginning. Hiding it under this API
> > continue to make wrong usecase in future.
>
> Which takes us back to the question of why VM_PFNMAP is being set by
> the caller in the first place.
>
> >
> > > missing the real reason for VM_PFNMAP being set in drm_gem_mmap_obj()
> > > before dma_buf_mmap() is called. I could not find the answer to that,
> > > so I hope someone here can clarify that.
> >
> > Guess DRM had used carved out pure PFN memory long time ago and
> > changed to use dmabuf since somepoint.
>
> It would be really good to know the reason for sure to address the
> issue properly.
>
> > Whatever there is a history, rather than removing the flag
> > under them, let's add WARN_ON(vma->vm_flags & VM_PFNMAP) so
> > we could clean up catching them and start discussion.
>
> The issue with not clearing the flag here is that vm_insert_page() has
> a BUG_ON(vma->vm_flags & VM_PFNMAP). If we do not clear this flag I
> suspect we will get many angry developers :)
> If your above guess is correct and we can mandate dmabuf heap users
> not to use VM_PFNMAP then I think the following code might be the best
> way forward:
>
> +       bool pfn_requested = !!(vma->vm_flags & VM_PFNMAP);
> +.      WARN_ON_ONCE(pfn_requested);
>
>         for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
>                 struct page *page = sg_page_iter_page(&piter);
>
> -               ret = remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
> -                                     vma->vm_page_prot);
> +               ret = pfn_requested ?
> +.                      remap_pfn_range(vma, addr, page_to_pfn(page), PAGE_SIZE,
> +                                     vma->vm_page_prot) :
> +                       vm_insert_page(vma, addr, page);

Folks, any objections to the approach above?
