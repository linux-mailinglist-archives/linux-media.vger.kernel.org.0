Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43E17324E4E
	for <lists+linux-media@lfdr.de>; Thu, 25 Feb 2021 11:43:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbhBYKcW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Feb 2021 05:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235199AbhBYK3W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Feb 2021 05:29:22 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D89C061786
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:28:34 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id v22so6110649edx.13
        for <linux-media@vger.kernel.org>; Thu, 25 Feb 2021 02:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=TVKAjWBFusaHyTtxALPIeACysl8qlhJqMmxF1Z/3BQc=;
        b=KvT6uHV3ltQQhKNAxhivu1WaoQNP6hJd5KdyNGhOZzV3MFX5tYjNtdWuTP9AjxAm9u
         t/N1MkyWh8kg69o8urHsk7zDck/zOgNio6qdWVGet3ki3S9ysgXQblGyreIP5Ph77p6y
         EwPT8y17+qmJx8LH1tG6oiIcwq9Fj8SGseVhOB8JKtsFaRnNkB7NJBmnWgRjKcT2iIOk
         S6xvGKbX/th/EYMn2UPD+kklrD1e3BQ7mEFUCSEdzwlviaulkxoq1JjKeX/we/Lid9ve
         thgLqK+DQ3yQv6sdq63aRRPiPRh+ux2fQvmPwRS+Faz0MZaG7bKGu328voC0IKZamAvr
         ujuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=TVKAjWBFusaHyTtxALPIeACysl8qlhJqMmxF1Z/3BQc=;
        b=Kq1MaboEcQGHzAxqQTt/EM/C45vCh0xf5+HKUrAcoC5idiIoFLkrvi+S0XdvtMAiXJ
         OMdcQ8TDvre/1Cupwbx6AoR/k0f5nCoMVzL/X5zprnRLPJaPkRTTnnfGwFeIKhN940pU
         drPewrga4iOAXd4FajSFPyjnUiaad8t1u2V7x0bEoaKzHgTs1uOk54strlHnaw0IBg+B
         C4PEo0bka2KdrFVol43dFrdiXJjlbTV35k1m4KXLQThgjLB2q2htTeX0nkE+D/ZqZMSv
         UNGNXWy0u/A8O9lqI/YBXufrz/2zPbxoWBE/ZzUyeeIYSDt9Vz91nwrQae2CrrwgBwQ8
         +qTQ==
X-Gm-Message-State: AOAM533pyhOLOhmxw86M9gfFWC7PNty9N9Fp+UdjqegrLekTQhzuGMBe
        qMcKY4DyCPb5UeJLS3kgwKoiPc6reCrHvw==
X-Google-Smtp-Source: ABdhPJxQxWpA8AILfgr1cKP4yfsCw8NTRfhgVfgrxKucOL6WpWcAlGS0EyTXuI5Jrm/OQ3hF+5Bjbw==
X-Received: by 2002:a05:6402:c15:: with SMTP id co21mr2140459edb.115.1614248913374;
        Thu, 25 Feb 2021 02:28:33 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:fc8:43:f4c0:95af? ([2a02:908:1252:fb60:fc8:43:f4c0:95af])
        by smtp.gmail.com with ESMTPSA id v11sm2635553eds.14.2021.02.25.02.28.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Feb 2021 02:28:32 -0800 (PST)
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Cc:     Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Stultz <john.stultz@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
 <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
Date:   Thu, 25 Feb 2021 11:28:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Am 24.02.21 um 10:31 schrieb Daniel Vetter:
> On Wed, Feb 24, 2021 at 10:16 AM Thomas Hellström (Intel)
> <thomas_os@shipmail.org> wrote:
>>
>> On 2/24/21 9:45 AM, Daniel Vetter wrote:
>>> On Wed, Feb 24, 2021 at 8:46 AM Thomas Hellström (Intel)
>>> <thomas_os@shipmail.org> wrote:
>>>> On 2/23/21 11:59 AM, Daniel Vetter wrote:
>>>>> tldr; DMA buffers aren't normal memory, expecting that you can use
>>>>> them like that (like calling get_user_pages works, or that they're
>>>>> accounting like any other normal memory) cannot be guaranteed.
>>>>>
>>>>> Since some userspace only runs on integrated devices, where all
>>>>> buffers are actually all resident system memory, there's a huge
>>>>> temptation to assume that a struct page is always present and useable
>>>>> like for any more pagecache backed mmap. This has the potential to
>>>>> result in a uapi nightmare.
>>>>>
>>>>> To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
>>>>> blocks get_user_pages and all the other struct page based
>>>>> infrastructure for everyone. In spirit this is the uapi counterpart to
>>>>> the kernel-internal CONFIG_DMABUF_DEBUG.
>>>>>
>>>>> Motivated by a recent patch which wanted to swich the system dma-buf
>>>>> heap to vm_insert_page instead of vm_insert_pfn.
>>>>>
>>>>> v2:
>>>>>
>>>>> Jason brought up that we also want to guarantee that all ptes have the
>>>>> pte_special flag set, to catch fast get_user_pages (on architectures
>>>>> that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
>>>>> still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
>>>>>
>>>>>    From auditing the various functions to insert pfn pte entires
>>>>> (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
>>>>> dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
>>>>> this should be the correct flag to check for.
>>>>>
>>>> If we require VM_PFNMAP, for ordinary page mappings, we also need to
>>>> disallow COW mappings, since it will not work on architectures that
>>>> don't have CONFIG_ARCH_HAS_PTE_SPECIAL, (see the docs for vm_normal_page()).
>>> Hm I figured everyone just uses MAP_SHARED for buffer objects since
>>> COW really makes absolutely no sense. How would we enforce this?
>> Perhaps returning -EINVAL on is_cow_mapping() at mmap time. Either that
>> or allowing MIXEDMAP.
>>
>>>> Also worth noting is the comment in  ttm_bo_mmap_vma_setup() with
>>>> possible performance implications with x86 + PAT + VM_PFNMAP + normal
>>>> pages. That's a very old comment, though, and might not be valid anymore.
>>> I think that's why ttm has a page cache for these, because it indeed
>>> sucks. The PAT changes on pages are rather expensive.
>> IIRC the page cache was implemented because of the slowness of the
>> caching mode transition itself, more specifically the wbinvd() call +
>> global TLB flush.

Yes, exactly that. The global TLB flush is what really breaks our neck 
here from a performance perspective.

>>> There is still an issue for iomem mappings, because the PAT validation
>>> does a linear walk of the resource tree (lol) for every vm_insert_pfn.
>>> But for i915 at least this is fixed by using the io_mapping
>>> infrastructure, which does the PAT reservation only once when you set
>>> up the mapping area at driver load.
>> Yes, I guess that was the issue that the comment describes, but the
>> issue wasn't there with vm_insert_mixed() + VM_MIXEDMAP.
>>
>>> Also TTM uses VM_PFNMAP right now for everything, so it can't be a
>>> problem that hurts much :-)
>> Hmm, both 5.11 and drm-tip appears to still use MIXEDMAP?
>>
>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/ttm/ttm_bo_vm.c#L554
> Uh that's bad, because mixed maps pointing at struct page wont stop
> gup. At least afaik.

Hui? I'm pretty sure MIXEDMAP stops gup as well. Otherwise we would have 
already seen tons of problems with the page cache.

Regards,
Christian.

> Christian, do we need to patch this up, and maybe fix up ttm fault
> handler to use io_mapping so the vm_insert_pfn stuff is fast?
> -Daniel

