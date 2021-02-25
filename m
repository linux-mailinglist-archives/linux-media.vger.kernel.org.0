Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A340E324E85
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 11:50:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234435AbhBYKrR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 05:47:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234798AbhBYKpG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 05:45:06 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C2DFC061756
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:44:26 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id g11so499320wmh.1
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=87k498fT7yj3CQjDeoWRIeMkjyDSkuKTTxswZ9ytFzY=;
        b=ApBrQHrAxxsxWhGbKZ+rrZtjxu9ZreYAmL9Lc5QjV5VhKgfsV7FNFSsreTZ6ztyx27
         NxKovY/zYjPI+y8rRC+5UL8r48IbRefjpzbmYUd33d7G+9q6T0kGnqSD8TV6HWnKILE+
         /lZLd4gb9fNXw2jNCytZh2NfMp6d/kIw/KRDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=87k498fT7yj3CQjDeoWRIeMkjyDSkuKTTxswZ9ytFzY=;
        b=DqQtzKFsqJrC1QkHGJCeR6F24o2tDf7id/CyX4xKFh/Dk4UIt5+v6zhQRJW8uvlmnm
         p8RUGARUBGc7W/w+4hAqlsKPrjhxGA0AMepa7hCyNiAd9EGBs/KLcuqQ4koAoOG0xw3W
         DVTpz6gEoCH0QjP4BF6EtqJUgwPt30gCAK9bEK9jZIdsgEJAH+vPflA2jHH3uX+rFz2+
         OsGrlFP0vzxySM+QwvCvgujuronQkV0ZfQb4UsxeWaGTCfcPNbKt9Zyj3KRUG7KwB7JC
         7xkZSs5TeE1wxOam506cD33hwA/OHR5XnLJzWWTeK2wFA4ScCMzes85pduHHX369GqCv
         y5dg==
X-Gm-Message-State: AOAM533cfaCEtaVKpxILAna1LriQCFmlz9rrds9bl/Uw02kPmJ76UBBS
        hjWr3bxdyfJwtmYlbP1L2zfGxQ==
X-Google-Smtp-Source: ABdhPJzgLYMjXf3Q+8pL1lPT61BTvTEIZezq9n1onDMtQZszDluhk4BOoQzncMDg8S/ZqbTeGCh6Tg==
X-Received: by 2002:a1c:4d0d:: with SMTP id o13mr2620109wmh.147.1614249864812;
        Thu, 25 Feb 2021 02:44:24 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id a3sm8009780wrt.68.2021.02.25.02.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Feb 2021 02:44:24 -0800 (PST)
Date:   Thu, 25 Feb 2021 11:44:22 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Christian =?iso-8859-1?Q?K=F6nig?= 
        <ckoenig.leichtzumerken@gmail.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Thomas =?iso-8859-1?Q?Hellstr=F6m_=28Intel=29?= 
        <thomas_os@shipmail.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Stultz <john.stultz@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Feb 25, 2021 at 11:28:31AM +0100, Christian König wrote:
> Am 24.02.21 um 10:31 schrieb Daniel Vetter:
> > On Wed, Feb 24, 2021 at 10:16 AM Thomas Hellström (Intel)
> > <thomas_os@shipmail.org> wrote:
> > > 
> > > On 2/24/21 9:45 AM, Daniel Vetter wrote:
> > > > On Wed, Feb 24, 2021 at 8:46 AM Thomas Hellström (Intel)
> > > > <thomas_os@shipmail.org> wrote:
> > > > > On 2/23/21 11:59 AM, Daniel Vetter wrote:
> > > > > > tldr; DMA buffers aren't normal memory, expecting that you can use
> > > > > > them like that (like calling get_user_pages works, or that they're
> > > > > > accounting like any other normal memory) cannot be guaranteed.
> > > > > > 
> > > > > > Since some userspace only runs on integrated devices, where all
> > > > > > buffers are actually all resident system memory, there's a huge
> > > > > > temptation to assume that a struct page is always present and useable
> > > > > > like for any more pagecache backed mmap. This has the potential to
> > > > > > result in a uapi nightmare.
> > > > > > 
> > > > > > To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> > > > > > blocks get_user_pages and all the other struct page based
> > > > > > infrastructure for everyone. In spirit this is the uapi counterpart to
> > > > > > the kernel-internal CONFIG_DMABUF_DEBUG.
> > > > > > 
> > > > > > Motivated by a recent patch which wanted to swich the system dma-buf
> > > > > > heap to vm_insert_page instead of vm_insert_pfn.
> > > > > > 
> > > > > > v2:
> > > > > > 
> > > > > > Jason brought up that we also want to guarantee that all ptes have the
> > > > > > pte_special flag set, to catch fast get_user_pages (on architectures
> > > > > > that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> > > > > > still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
> > > > > > 
> > > > > >    From auditing the various functions to insert pfn pte entires
> > > > > > (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> > > > > > dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> > > > > > this should be the correct flag to check for.
> > > > > > 
> > > > > If we require VM_PFNMAP, for ordinary page mappings, we also need to
> > > > > disallow COW mappings, since it will not work on architectures that
> > > > > don't have CONFIG_ARCH_HAS_PTE_SPECIAL, (see the docs for vm_normal_page()).
> > > > Hm I figured everyone just uses MAP_SHARED for buffer objects since
> > > > COW really makes absolutely no sense. How would we enforce this?
> > > Perhaps returning -EINVAL on is_cow_mapping() at mmap time. Either that
> > > or allowing MIXEDMAP.
> > > 
> > > > > Also worth noting is the comment in  ttm_bo_mmap_vma_setup() with
> > > > > possible performance implications with x86 + PAT + VM_PFNMAP + normal
> > > > > pages. That's a very old comment, though, and might not be valid anymore.
> > > > I think that's why ttm has a page cache for these, because it indeed
> > > > sucks. The PAT changes on pages are rather expensive.
> > > IIRC the page cache was implemented because of the slowness of the
> > > caching mode transition itself, more specifically the wbinvd() call +
> > > global TLB flush.
> 
> Yes, exactly that. The global TLB flush is what really breaks our neck here
> from a performance perspective.
> 
> > > > There is still an issue for iomem mappings, because the PAT validation
> > > > does a linear walk of the resource tree (lol) for every vm_insert_pfn.
> > > > But for i915 at least this is fixed by using the io_mapping
> > > > infrastructure, which does the PAT reservation only once when you set
> > > > up the mapping area at driver load.
> > > Yes, I guess that was the issue that the comment describes, but the
> > > issue wasn't there with vm_insert_mixed() + VM_MIXEDMAP.
> > > 
> > > > Also TTM uses VM_PFNMAP right now for everything, so it can't be a
> > > > problem that hurts much :-)
> > > Hmm, both 5.11 and drm-tip appears to still use MIXEDMAP?
> > > 
> > > https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/ttm/ttm_bo_vm.c#L554
> > Uh that's bad, because mixed maps pointing at struct page wont stop
> > gup. At least afaik.
> 
> Hui? I'm pretty sure MIXEDMAP stops gup as well. Otherwise we would have
> already seen tons of problems with the page cache.

On any architecture which has CONFIG_ARCH_HAS_PTE_SPECIAL vm_insert_mixed
boils down to vm_insert_pfn wrt gup. And special pte stops gup fast path.

But if you don't have VM_IO or VM_PFNMAP set, then I'm not seeing how
you're stopping gup slow path. See check_vma_flags() in mm/gup.c.

Also if you don't have CONFIG_ARCH_HAS_PTE_SPECIAL then I don't think
vm_insert_mixed even works on iomem pfns. There's the devmap exception,
but we're not devmap. Worse ttm abuses some accidental codepath to smuggle
in hugepte support by intentionally not being devmap.

So I'm really not sure this works as we think it should. Maybe good to do
a quick test program on amdgpu with a buffer in system memory only and try
to do direct io into it. If it works, you have a problem, and a bad one.
-Daniel

> 
> Regards,
> Christian.
> 
> > Christian, do we need to patch this up, and maybe fix up ttm fault
> > handler to use io_mapping so the vm_insert_pfn stuff is fast?
> > -Daniel
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
