Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 224C263434A
	for <lists+linux-media@lfdr.de>; Tue, 22 Nov 2022 19:08:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232565AbiKVSIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Nov 2022 13:08:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234420AbiKVSIj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Nov 2022 13:08:39 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74144697E8
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 10:08:38 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id bj12so37540324ejb.13
        for <linux-media@vger.kernel.org>; Tue, 22 Nov 2022 10:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yeE/fvHo7zplB3H0njfvx+KBD+UsXtgVtTcTsJSQKTs=;
        b=HJQzg3HAQLfej9Lynj1eAMPPLxHBUWytNt/6mGkTn4aeoz+YFCARsIB3utatEXxeDD
         OyHr1lPIXUf7zx9qQWafuBhFg7CdNJSUeoRB61i9yhQ22q5typ8pT/pxa5z5QY5lUTEh
         gk+HrYz68CeLLiJM2B8IZENBotgdF7bB+GjpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yeE/fvHo7zplB3H0njfvx+KBD+UsXtgVtTcTsJSQKTs=;
        b=RH/6F2lIA1tZc7OU81IfIDeD7ZFmktLQM47NjenpZhJzCIidig+MwEpJf2Rr89ZUue
         lofe1jPZyNTWmzSPqSprYVoxvhGgkdkSi8rkqzhrLcVM28ocL5HL9xEQ9UQhoxhg54IM
         LCoRaEbo24iYkXtHi0f/ZsusglTtJn8RBDw/QXB7QUkgsZZZnQltcAFjiCiAhj6yla2V
         stZwW4BLui5sUQoyPjfvjjx00/dACFKPLVb07U+GZihQmLQ+1VhvrBCkchbLBpXY1lKV
         V7I1jHPKvT0fxETBO1Kime+4tT3NCsSADv90OW04rYTSxfoKV9R/oQk92ztefd3X8s4Y
         0Riw==
X-Gm-Message-State: ANoB5pltUX9u08aX055IX2pLwbYGsLatKNJctOTl6vNtaL6fFsF8LYs8
        Cc8z90EED3Az2ruU9wU+dDNUgq9iO8PiKu2S7p6MzQ==
X-Google-Smtp-Source: AA0mqf5YaIer5B7BWrJ7ocvdT+1R5W8bGrPu5RkAiIG9/MkRdfGUud/7t1Fi3LwOKtyXP+dS2/LSLhbZV2Y6VlJIN58=
X-Received: by 2002:a17:906:414c:b0:7a9:ecc1:2bd2 with SMTP id
 l12-20020a170906414c00b007a9ecc12bd2mr8382937ejk.545.1669140516986; Tue, 22
 Nov 2022 10:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20221122170801.842766-1-daniel.vetter@ffwll.ch> <Y30PDdsvHIJo5YHR@ziepe.ca>
In-Reply-To: <Y30PDdsvHIJo5YHR@ziepe.ca>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue, 22 Nov 2022 19:08:25 +0100
Message-ID: <CAKMK7uEccwYTNwDYQazmZvTfBFQOikZt5A6BmegweyO-inKYbQ@mail.gmail.com>
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

On Tue, 22 Nov 2022 at 19:04, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Tue, Nov 22, 2022 at 06:08:00PM +0100, Daniel Vetter wrote:
> > tldr; DMA buffers aren't normal memory, expecting that you can use
> > them like that (like calling get_user_pages works, or that they're
> > accounting like any other normal memory) cannot be guaranteed.
> >
> > Since some userspace only runs on integrated devices, where all
> > buffers are actually all resident system memory, there's a huge
> > temptation to assume that a struct page is always present and useable
> > like for any more pagecache backed mmap. This has the potential to
> > result in a uapi nightmare.
> >
> > To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
> > blocks get_user_pages and all the other struct page based
> > infrastructure for everyone. In spirit this is the uapi counterpart to
> > the kernel-internal CONFIG_DMABUF_DEBUG.
> >
> > Motivated by a recent patch which wanted to swich the system dma-buf
> > heap to vm_insert_page instead of vm_insert_pfn.
> >
> > v2:
> >
> > Jason brought up that we also want to guarantee that all ptes have the
> > pte_special flag set, to catch fast get_user_pages (on architectures
> > that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
> > still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
> >
> > From auditing the various functions to insert pfn pte entires
> > (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
> > dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
> > this should be the correct flag to check for.
>
> I didn't look at how this actually gets used, but it is a bit of a
> pain to insert a lifetime controlled object like a struct page as a
> special PTE/VM_PFNMAP
>
> How is the lifetime model implemented here? How do you know when
> userspace has finally unmapped the page?

The vma has a filp which is the refcounted dma_buf. With dma_buf you
never get an individual page it's always the entire object. And it's
up to the allocator how exactly it wants to use or not use the page's
refcount. So if gup goes in and elevates the refcount, you can break
stuff, which is why I'm doing this.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
