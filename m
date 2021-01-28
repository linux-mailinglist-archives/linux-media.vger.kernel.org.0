Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 364ED307DD3
	for <lists+linux-media@lfdr.de>; Thu, 28 Jan 2021 19:24:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231874AbhA1SWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 28 Jan 2021 13:22:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbhA1SU3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 28 Jan 2021 13:20:29 -0500
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8828C061356;
        Thu, 28 Jan 2021 10:19:09 -0800 (PST)
Received: by mail-pf1-x433.google.com with SMTP id m6so4543647pfk.1;
        Thu, 28 Jan 2021 10:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=96bIRJoBt4Fg0MIsvCdpoDvBroS32Sj8ac+QlGQ3Ctc=;
        b=Xs33QAZ7yeDzXY54gYREqH/U4kWK0hgFahIzJU0C02kXIagMykfVHzaRGrYwq5789A
         OVQGttd5yB3nP9PHTL2ZrN+UN/wL7eSWSxMUQtqTG+0aG7865tQb/XpGIs6IiKuqcwZS
         JuPR/KDOvWGZnOAka10ajRo6kPIE7CPi0A8DMY/uByb0B6ZA80ie65apEDZTeeHIlLV7
         s4WzDnd7FuQ7NYSHt0cCM6yUAwQoM3augEg/LwYqWYUAw+KahiL8KmO5Trkct/oFCQMr
         Lo8oU/a0XU+S9ItlsPgXuGzxIyjaOFaJuGMlhdjEsWF9PE6UJ5tx0Q+pczT48guFgsob
         Cuww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=96bIRJoBt4Fg0MIsvCdpoDvBroS32Sj8ac+QlGQ3Ctc=;
        b=oordSK/t2cx0t/pxHSV5Mxhl4RkPA75WJ4DmY5HKevUupUu7/SGCe8w17bU0ep15hY
         ZIB9Lij6KIGWxvWQZ4S8U2kI1U6jPpFazzJ391dWdnhsolTXZNiQO6p1OxKsFPoTUaRI
         3d3G8FJ7XV+L2INjs0z+fzcxJmAgiDhjfcMJgcYa4h9J2svvx9HjxGu8ChmzqOlOXFtF
         PnqYwAbGRcKlH+eNR/ITFoUPm3yTtanU/KYm3kMJEv/a+eRmPPcDc8P5rDh8/19YX4zG
         0S1oIqOOJ7pLjY9/EMbAlsZcQbYMk03IuW4K7qWBA3R7f2XO8EMtY496n3ozxnYlkdS8
         Kszw==
X-Gm-Message-State: AOAM533YJbL95mAVTkdI6FINuLmoXd2uBljHpqaqmwMwWlVulvRPeN08
        8dOOTZWKc1Fro0vpXnjBcgY=
X-Google-Smtp-Source: ABdhPJykKM4AHlWVLXCO9yclwmwZpMr1Tz8dxr0rJ04tpfl04eKInSCoyO0EXkxZnN2DfKwy0fi37w==
X-Received: by 2002:a63:fc48:: with SMTP id r8mr701708pgk.300.1611857949397;
        Thu, 28 Jan 2021 10:19:09 -0800 (PST)
Received: from google.com ([2620:15c:211:201:885b:c20e:b832:f82])
        by smtp.gmail.com with ESMTPSA id w11sm6436748pge.28.2021.01.28.10.19.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 10:19:08 -0800 (PST)
Sender: Minchan Kim <minchan.kim@gmail.com>
Date:   Thu, 28 Jan 2021 10:19:05 -0800
From:   Minchan Kim <minchan@kernel.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        benjamin.gaignard@linaro.org, Liam Mark <lmark@codeaurora.org>,
        labbott@redhat.com, Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>, christian.koenig@amd.com,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        =?iso-8859-1?Q?=D8rjan?= Eide <orjan.eide@arm.com>,
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
Subject: Re: [PATCH 1/1] dma-buf: heaps: Map system heap pages as managed by
 linux vm
Message-ID: <YBMAGRIwcbPF17cU@google.com>
References: <20210128083817.314315-1-surenb@google.com>
 <20210128091348.GA1962975@infradead.org>
 <CAJuCfpFUhJozS98WJpH0KQKBzyGXvqS1fitu-mgSyhaJ1xL8SQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpFUhJozS98WJpH0KQKBzyGXvqS1fitu-mgSyhaJ1xL8SQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jan 28, 2021 at 09:52:59AM -0800, Suren Baghdasaryan wrote:
> On Thu, Jan 28, 2021 at 1:13 AM Christoph Hellwig <hch@infradead.org> wrote:
> >
> > On Thu, Jan 28, 2021 at 12:38:17AM -0800, Suren Baghdasaryan wrote:
> > > Currently system heap maps its buffers with VM_PFNMAP flag using
> > > remap_pfn_range. This results in such buffers not being accounted
> > > for in PSS calculations because vm treats this memory as having no
> > > page structs. Without page structs there are no counters representing
> > > how many processes are mapping a page and therefore PSS calculation
> > > is impossible.
> > > Historically, ION driver used to map its buffers as VM_PFNMAP areas
> > > due to memory carveouts that did not have page structs [1]. That
> > > is not the case anymore and it seems there was desire to move away
> > > from remap_pfn_range [2].
> > > Dmabuf system heap design inherits this ION behavior and maps its
> > > pages using remap_pfn_range even though allocated pages are backed
> > > by page structs.
> > > Clear VM_IO and VM_PFNMAP flags when mapping memory allocated by the
> > > system heap and replace remap_pfn_range with vm_insert_page, following
> > > Laura's suggestion in [1]. This would allow correct PSS calculation
> > > for dmabufs.
> > >
> > > [1] https://driverdev-devel.linuxdriverproject.narkive.com/v0fJGpaD/using-ion-memory-for-direct-io
> > > [2] http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/2018-October/127519.html
> > > (sorry, could not find lore links for these discussions)
> > >
> > > Suggested-by: Laura Abbott <labbott@kernel.org>
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> > > ---
> > >  drivers/dma-buf/heaps/system_heap.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/dma-buf/heaps/system_heap.c b/drivers/dma-buf/heaps/system_heap.c
> > > index 17e0e9a68baf..0e92e42b2251 100644
> > > --- a/drivers/dma-buf/heaps/system_heap.c
> > > +++ b/drivers/dma-buf/heaps/system_heap.c
> > > @@ -200,11 +200,13 @@ static int system_heap_mmap(struct dma_buf *dmabuf, struct vm_area_struct *vma)
> > >       struct sg_page_iter piter;
> > >       int ret;
> > >
> > > +     /* All pages are backed by a "struct page" */
> > > +     vma->vm_flags &= ~VM_PFNMAP;
> >
> > Why do we clear this flag?  It shouldn't even be set here as far as I
> > can tell.
> 
> Thanks for the question, Christoph.
> I tracked down that flag being set by drm_gem_mmap_obj() which DRM
> drivers use to "Set up the VMA to prepare mapping of the GEM object"
> (according to drm_gem_mmap_obj comments). I also see a pattern in
> several DMR drivers to call drm_gem_mmap_obj()/drm_gem_mmap(), then
> clear VM_PFNMAP and then map the VMA (for example here:
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/rockchip/rockchip_drm_gem.c#L246).
> I thought that dmabuf allocator (in this case the system heap) would
> be the right place to set these flags because it controls how memory
> is allocated before mapping. However it's quite possible that I'm

However, you're not setting but removing a flag under the caller.
It's different with appending more flags(e.g., removing condition
vs adding more conditions). If we should remove the flag, caller
didn't need to set it from the beginning. Hiding it under this API
continue to make wrong usecase in future.

> missing the real reason for VM_PFNMAP being set in drm_gem_mmap_obj()
> before dma_buf_mmap() is called. I could not find the answer to that,
> so I hope someone here can clarify that.

Guess DRM had used carved out pure PFN memory long time ago and
changed to use dmabuf since somepoint.
Whatever there is a history, rather than removing the flag
under them, let's add WARN_ON(vma->vm_flags & VM_PFNMAP) so
we could clean up catching them and start discussion.
