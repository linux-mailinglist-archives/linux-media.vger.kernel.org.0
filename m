Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1FB63448C
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 20:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234769AbiKVT3W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 14:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234492AbiKVT3T (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 14:29:19 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F898FFAC
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 11:29:17 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id b8so11231720edf.11
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 11:29:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NVDnmC2dKJqAUSDipNMGo0RTknLwbcl5eyAafViq/zw=;
        b=F6JQcHUsspYdGaSt4ieZNwOMZpEsONnlt9o3YWjXlEPIa0eIcgJ24H9S942F8Q4aMc
         g+39K4DM+a7d2RygbPWquSET+BAUOl/CuMuwn+gW+NMmdBYH2TajHT6E0wgDLsvyRn8Q
         Oyjdw7OWDhgLbC7P9JZW0uMGCjhOePfyWsSdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVDnmC2dKJqAUSDipNMGo0RTknLwbcl5eyAafViq/zw=;
        b=rW196cuVfjFTJFLgJdarUAQYqdad5rLAbQ0VJuqvI1bI/y6UG9pEF0di1aqX46KNku
         fX6EEI/itPgQtduIJB8+Avyl0Lm7aM5Pxb50VeDWXCP4ElKQ+cKPL4Iez9ghiRv9X7fT
         yOiONZTtWvgXl2esn4+PNQZq7oqRmEvX8Y1qQMvLLMAYTcVTx8FzbhjRCUjgn+pSF+/R
         cI/jEb1YFCHzPndHFmvNpqzWUVxhcyUtYaCCdTwiL8J0EMuu1WZEQ8jFEnqlNtLuuj5/
         UxaaxrmYr7ApoXfeSXgfcdnjJIOxW7NdCyAXLYqcpuWyZMtqSgVDvDicKXbAm94+K97r
         9/yw==
X-Gm-Message-State: ANoB5pmIpPwUPYoYUVAcUYmuXJzqCpf+uVr8h8eLTz6LJrNgpTX9xmTI
        foKs9PzVgHZZjtxaFcu/eRBeWAzb3EWJLQpJlBV8WA==
X-Google-Smtp-Source: AA0mqf7IcusChboGRGGt1s/cB7q39wPkujHV5XTXD9uN+GJhpblKvI9MCtZZtq2mwcwYehW0Unnkdw9V4tf6ONn4w74=
X-Received: by 2002:a05:6402:c0b:b0:463:a83c:e0af with SMTP id
 co11-20020a0564020c0b00b00463a83ce0afmr21647244edb.158.1669145356462; Tue, 22
 Nov 2022 11:29:16 -0800 (PST)
MIME-Version: 1.0
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch>
 <Y30PDdsvHIJo5YHR@ziepe.ca> <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
 <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
In-Reply-To: <Y30Z4VxT7Wdoc1Lc@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 22 Nov 2022 20:29:05 +0100
Message-ID: <CAKMK7uE=8eqyh9BKg_+7B1jjMi6K4wrmPyi9xeLVvVYFxBgF9g@mail.gmail.com>
Subject: Re: [PATCH] dma-buf: Require VM_PFNMAP vma for mmap
To:     Jason Gunthorpe <jgg@ziepe.ca>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Suren Baghdasaryan <surenb@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, 22 Nov 2022 at 19:50, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Nov 22, 2022 at 07:08:25PM +0100, Daniel Vetter wrote:
> > On Tue, 22 Nov 2022 at 19:04, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >
> > > On Tue, Nov 22, 2022 at 06:08:00PM +0100, Daniel Vetter wrote:
> > > > tldr; DMA buffers aren't normal memory, expecting that you can use
> > > > them like that (like calling get_user_pages works, or that they're
> > > > accounting like any other normal memory) cannot be guaranteed.
> > > >
> > > > Since some userspace only runs on integrated devices, where all
> > > > buffers are actually all resident system memory, there's a huge
> > > > temptation to assume that a struct page is always present and useable
> > > > like for any more pagecache backed mmap. This has the potential to
> > > > result in a uapi nightmare.
> > > >
> > > > To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> > > > blocks get_user_pages and all the other struct page based
> > > > infrastructure for everyone. In spirit this is the uapi counterpart to
> > > > the kernel-internal CONFIG_DMABUF_DEBUG.
> > > >
> > > > Motivated by a recent patch which wanted to swich the system dma-buf
> > > > heap to vm_insert_page instead of vm_insert_pfn.
> > > >
> > > > v2:
> > > >
> > > > Jason brought up that we also want to guarantee that all ptes have the
> > > > pte_special flag set, to catch fast get_user_pages (on architectures
> > > > that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> > > > still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
> > > >
> > > > From auditing the various functions to insert pfn pte entires
> > > > (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> > > > dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> > > > this should be the correct flag to check for.
> > >
> > > I didn't look at how this actually gets used, but it is a bit of a
> > > pain to insert a lifetime controlled object like a struct page as a
> > > special PTE/VM_PFNMAP
> > >
> > > How is the lifetime model implemented here? How do you know when
> > > userspace has finally unmapped the page?
> >
> > The vma has a filp which is the refcounted dma_buf. With dma_buf you
> > never get an individual page it's always the entire object. And it's
> > up to the allocator how exactly it wants to use or not use the page's
> > refcount. So if gup goes in and elevates the refcount, you can break
> > stuff, which is why I'm doing this.
>
> But how does move work?

You nuke all the ptes. Drivers that move have slightly more than a
bare struct file, they also have a struct address_space so that
invalidate_mapping_range() works. Refaulting and any coherency issues
when a refault races against a dma-buf migration is up to the
driver/exporter to handle correctly. None rely on struct page like mm/
moving stuff around for compaction/ksm/numa-balancing/whateverr.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
