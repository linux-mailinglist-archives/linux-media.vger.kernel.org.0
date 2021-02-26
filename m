Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B25532605B
	for <lists+linux-media@lfdr.de>; Fri, 26 Feb 2021 10:44:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230194AbhBZJnY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Feb 2021 04:43:24 -0500
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:29110 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbhBZJmG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Feb 2021 04:42:06 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 5574A3F71E;
        Fri, 26 Feb 2021 10:41:13 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=LfLxKa00;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.534
X-Spam-Level: 
X-Spam-Status: No, score=-2.534 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.435,
        URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
        dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id pa_KGOuTX1l6; Fri, 26 Feb 2021 10:41:10 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 20FF43F6D3;
        Fri, 26 Feb 2021 10:41:07 +0100 (CET)
Received: from [10.249.254.23] (irdmzpr01-ext.ir.intel.com [192.198.151.36])
        by mail1.shipmail.org (Postfix) with ESMTPSA id 7B5893600D9;
        Fri, 26 Feb 2021 10:41:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1614332467; bh=oFakJDD0y6u0RjK0RB8ojGNfQbbvgx821ZF1dWa6LWk=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=LfLxKa00FtOwjT6ow4NaHyKCnW2bQpNM0ORpnRTLPNQChXF21NtkSfvUML6HhtFj4
         wCIca95gFvLMmlxYNp08LXrO/a3VeuacMM9gPi62fFgXfe7qWtrvULgHKuctPpFhBd
         OuXCdDQawWSGquUsnmkoTuQB3HoIYQEWBiU+8RVs=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
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
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Message-ID: <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
Date:   Fri, 26 Feb 2021 10:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/25/21 4:49 PM, Daniel Vetter wrote:
> On Thu, Feb 25, 2021 at 11:44 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>> On Thu, Feb 25, 2021 at 11:28:31AM +0100, Christian König wrote:
>>> Am 24.02.21 um 10:31 schrieb Daniel Vetter:
>>>> On Wed, Feb 24, 2021 at 10:16 AM Thomas Hellström (Intel)
>>>> <thomas_os@shipmail.org> wrote:
>>>>> On 2/24/21 9:45 AM, Daniel Vetter wrote:
>>>>>> On Wed, Feb 24, 2021 at 8:46 AM Thomas Hellström (Intel)
>>>>>> <thomas_os@shipmail.org> wrote:
>>>>>>> On 2/23/21 11:59 AM, Daniel Vetter wrote:
>>>>>>>> tldr; DMA buffers aren't normal memory, expecting that you can use
>>>>>>>> them like that (like calling get_user_pages works, or that they're
>>>>>>>> accounting like any other normal memory) cannot be guaranteed.
>>>>>>>>
>>>>>>>> Since some userspace only runs on integrated devices, where all
>>>>>>>> buffers are actually all resident system memory, there's a huge
>>>>>>>> temptation to assume that a struct page is always present and useable
>>>>>>>> like for any more pagecache backed mmap. This has the potential to
>>>>>>>> result in a uapi nightmare.
>>>>>>>>
>>>>>>>> To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
>>>>>>>> blocks get_user_pages and all the other struct page based
>>>>>>>> infrastructure for everyone. In spirit this is the uapi counterpart to
>>>>>>>> the kernel-internal CONFIG_DMABUF_DEBUG.
>>>>>>>>
>>>>>>>> Motivated by a recent patch which wanted to swich the system dma-buf
>>>>>>>> heap to vm_insert_page instead of vm_insert_pfn.
>>>>>>>>
>>>>>>>> v2:
>>>>>>>>
>>>>>>>> Jason brought up that we also want to guarantee that all ptes have the
>>>>>>>> pte_special flag set, to catch fast get_user_pages (on architectures
>>>>>>>> that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
>>>>>>>> still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
>>>>>>>>
>>>>>>>>     From auditing the various functions to insert pfn pte entires
>>>>>>>> (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
>>>>>>>> dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
>>>>>>>> this should be the correct flag to check for.
>>>>>>>>
>>>>>>> If we require VM_PFNMAP, for ordinary page mappings, we also need to
>>>>>>> disallow COW mappings, since it will not work on architectures that
>>>>>>> don't have CONFIG_ARCH_HAS_PTE_SPECIAL, (see the docs for vm_normal_page()).
>>>>>> Hm I figured everyone just uses MAP_SHARED for buffer objects since
>>>>>> COW really makes absolutely no sense. How would we enforce this?
>>>>> Perhaps returning -EINVAL on is_cow_mapping() at mmap time. Either that
>>>>> or allowing MIXEDMAP.
>>>>>
>>>>>>> Also worth noting is the comment in  ttm_bo_mmap_vma_setup() with
>>>>>>> possible performance implications with x86 + PAT + VM_PFNMAP + normal
>>>>>>> pages. That's a very old comment, though, and might not be valid anymore.
>>>>>> I think that's why ttm has a page cache for these, because it indeed
>>>>>> sucks. The PAT changes on pages are rather expensive.
>>>>> IIRC the page cache was implemented because of the slowness of the
>>>>> caching mode transition itself, more specifically the wbinvd() call +
>>>>> global TLB flush.
>>> Yes, exactly that. The global TLB flush is what really breaks our neck here
>>> from a performance perspective.
>>>
>>>>>> There is still an issue for iomem mappings, because the PAT validation
>>>>>> does a linear walk of the resource tree (lol) for every vm_insert_pfn.
>>>>>> But for i915 at least this is fixed by using the io_mapping
>>>>>> infrastructure, which does the PAT reservation only once when you set
>>>>>> up the mapping area at driver load.
>>>>> Yes, I guess that was the issue that the comment describes, but the
>>>>> issue wasn't there with vm_insert_mixed() + VM_MIXEDMAP.
>>>>>
>>>>>> Also TTM uses VM_PFNMAP right now for everything, so it can't be a
>>>>>> problem that hurts much :-)
>>>>> Hmm, both 5.11 and drm-tip appears to still use MIXEDMAP?
>>>>>
>>>>> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/ttm/ttm_bo_vm.c#L554
>>>> Uh that's bad, because mixed maps pointing at struct page wont stop
>>>> gup. At least afaik.
>>> Hui? I'm pretty sure MIXEDMAP stops gup as well. Otherwise we would have
>>> already seen tons of problems with the page cache.
>> On any architecture which has CONFIG_ARCH_HAS_PTE_SPECIAL vm_insert_mixed
>> boils down to vm_insert_pfn wrt gup. And special pte stops gup fast path.
>>
>> But if you don't have VM_IO or VM_PFNMAP set, then I'm not seeing how
>> you're stopping gup slow path. See check_vma_flags() in mm/gup.c.
>>
>> Also if you don't have CONFIG_ARCH_HAS_PTE_SPECIAL then I don't think
>> vm_insert_mixed even works on iomem pfns. There's the devmap exception,
>> but we're not devmap. Worse ttm abuses some accidental codepath to smuggle
>> in hugepte support by intentionally not being devmap.
>>
>> So I'm really not sure this works as we think it should. Maybe good to do
>> a quick test program on amdgpu with a buffer in system memory only and try
>> to do direct io into it. If it works, you have a problem, and a bad one.
> That's probably impossible, since a quick git grep shows that pretty
> much anything reasonable has special ptes: arc, arm, arm64, powerpc,
> riscv, s390, sh, sparc, x86. I don't think you'll have a platform
> where you can plug an amdgpu in and actually exercise the bug :-)

Hm. AFAIK _insert_mixed() doesn't set PTE_SPECIAL on system pages, so I 
don't see what should be stopping gup to those?

/Thomas



>
> So maybe we should just switch over to VM_PFNMAP for ttm for more clarity?
> -Daniel
>
>
>>> Regards,
>>> Christian.
>>>
>>>> Christian, do we need to patch this up, and maybe fix up ttm fault
>>>> handler to use io_mapping so the vm_insert_pfn stuff is fast?
>>>> -Daniel
>> --
>> Daniel Vetter
>> Software Engineer, Intel Corporation
>> http://blog.ffwll.ch
>
>
