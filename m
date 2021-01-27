Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AF8F3064FC
	for <lists+linux-media@lfdr.de>; Wed, 27 Jan 2021 21:23:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhA0UWJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jan 2021 15:22:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231612AbhA0UWI (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jan 2021 15:22:08 -0500
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 252FDC06174A
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 12:21:28 -0800 (PST)
Received: by mail-ua1-x92d.google.com with SMTP id g13so1202560uaw.5
        for <linux-media@vger.kernel.org>; Wed, 27 Jan 2021 12:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JkWQEhwAUNLuJiPKeTazkmms8jXTo1ixUZEQclL+Lbo=;
        b=r9q6TDXOq/oTKZfsDu88FKmFK1jFkobThy3I5RX5yDOWeZCqbXkAPofOZhwyzoX0S4
         lmw2aOQ11GEmGdt9SOTMz11LnKqrdTCNN4gnubxwe3dHZMhv+VsV8YZVjYxDcM5GYvec
         yEt+m/lAgrwWi3TGc166UztCAqnGYfmm3+WjObS9ymcp0mxV2NdAFelIasNCR9kP04OH
         EwBxAVdECFQaUOAnYMyIv8j85clAcXLfBlFscijmq8Zod7kAQCoW/+/203JvholLWk+4
         l4wJqVoFVxOmT+KnOdgd6PKD/9pTOcZiIb4GqWwjjWcspeNyAIXi9wFcN6CZ161qe0cV
         R4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JkWQEhwAUNLuJiPKeTazkmms8jXTo1ixUZEQclL+Lbo=;
        b=nayoXUYCJDS+lXuum18tDtX1jpnxtbXL6SWVGpwLGv7q7LGMDtz/BYh6xa652WkEm+
         N+522usR7kGXzYj60M2UJpy6R+k3CJkrv8Wr3JLcuX+oez+q2hjbNSNLFqnBLsALkmdh
         L2dM1FmZJNaadqaoOncz/hIkSCua4q9gbf37od89LERsOeV2j0LB35v7rbbPU6V6EHQh
         l8HLWqUK6VczFXvTHr7IdGOn/0f3bEX0ZA3QO574woA98qa395+Uuh8VAut2f92x9RNl
         C9cL/inJoA7PIKKgy5WQs3MixCHXf4HbHENifFgyUBNrp9fwT453JdvcNxqfyHvw3fkV
         dcrA==
X-Gm-Message-State: AOAM531JBZC89ZVaz/InjbWvm3D+7Eydv71jgjWlKpTj+at5yjLnr/YG
        OIP1GoRechxom9uEZlmC/XtraRAsi8uS6WmKB94+Ug==
X-Google-Smtp-Source: ABdhPJwGX8VLBXNChAV3Mpumim5+i60b+XOkzruAqORvpUqhkGg7ml8LK+TG1dC8IipynSj3q3fq1jXMWQAsSKX643o=
X-Received: by 2002:ab0:7584:: with SMTP id q4mr9773201uap.35.1611778886742;
 Wed, 27 Jan 2021 12:21:26 -0800 (PST)
MIME-Version: 1.0
References: <20210123034655.102813-1-john.stultz@linaro.org> <20210123034655.102813-2-john.stultz@linaro.org>
In-Reply-To: <20210123034655.102813-2-john.stultz@linaro.org>
From:   Daniel Mentz <danielmentz@google.com>
Date:   Wed, 27 Jan 2021 12:21:15 -0800
Message-ID: <CAE2F3rA3a-MWBHPZhGP9dMhEUqMkkvm6wXYYh6LDZ1zF9CAyUg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] dma-buf: system_heap: Add pagepool support to
 system heap
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Chris Goldsworthy <cgoldswo@codeaurora.org>,
        Laura Abbott <labbott@kernel.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sandeep Patil <sspatil@google.com>,
        =?UTF-8?Q?=C3=98rjan_Eide?= <orjan.eide@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Simon Ser <contact@emersion.fr>,
        James Jones <jajones@nvidia.com>, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Jan 22, 2021 at 7:47 PM John Stultz <john.stultz@linaro.org> wrote:
> +static int system_heap_clear_pages(struct page **pages, int num, pgprot_t pgprot)
> +{
> +       void *addr = vmap(pages, num, VM_MAP, pgprot);
> +
> +       if (!addr)
> +               return -ENOMEM;
> +       memset(addr, 0, PAGE_SIZE * num);
> +       vunmap(addr);
> +       return 0;
> +}

I thought that vmap/vunmap are expensive, and I am wondering if
there's a faster way that avoids vmap.

How about lifting this code from lib/iov_iter.c
static void memzero_page(struct page *page, size_t offset, size_t len)
{
        char *addr = kmap_atomic(page);
        memset(addr + offset, 0, len);
        kunmap_atomic(addr);
}

Or what about lifting that code from the old ion_cma_heap.c

if (PageHighMem(pages)) {
        unsigned long nr_clear_pages = nr_pages;
        struct page *page = pages;

        while (nr_clear_pages > 0) {
                void *vaddr = kmap_atomic(page);

                memset(vaddr, 0, PAGE_SIZE);
                kunmap_atomic(vaddr);
                page++;
                nr_clear_pages--;
        }
} else {
        memset(page_address(pages), 0, size);
}
