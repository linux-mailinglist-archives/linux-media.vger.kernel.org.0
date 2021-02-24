Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3922B323960
	for <lists+linux-media@lfdr.de>; Wed, 24 Feb 2021 10:23:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234591AbhBXJXL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Feb 2021 04:23:11 -0500
Received: from pio-pvt-msa1.bahnhof.se ([79.136.2.40]:35732 "EHLO
        pio-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234635AbhBXJWr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Feb 2021 04:22:47 -0500
X-Greylist: delayed 362 seconds by postgrey-1.27 at vger.kernel.org; Wed, 24 Feb 2021 04:22:46 EST
Received: from localhost (localhost [127.0.0.1])
        by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 698E93FB8E;
        Wed, 24 Feb 2021 10:16:01 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="MhA+2q2N";
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
        URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id ysZtkX8b-I9f; Wed, 24 Feb 2021 10:15:59 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id BB3A33FB77;
        Wed, 24 Feb 2021 10:15:56 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        by mail1.shipmail.org (Postfix) with ESMTPSA id 2F140360057;
        Wed, 24 Feb 2021 10:15:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1614158156; bh=ix+su6huoHUWLoam5bGdxjErhPEi4qIOKLMdA1dPgHU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=MhA+2q2NGiHMfMcJDMTa7neNduFcPwmpSmsTPFQG0lbRffsO/vhzORz07U1rvua4A
         8ha06+kF4kkAAYtf6NGt1wC2+iu8HzUXwqeK1TKRr94eT8Jz6ne45QO9HM7vr3LTDd
         vNINgDMca1lMbaQ/SVtY1PkxJM2aSkX7JsaLBiUs=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Stultz <john.stultz@linaro.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <20210223105951.912577-1-daniel.vetter@ffwll.ch>
 <1a7c2295-6241-f2bf-4a78-6cadd43bc248@shipmail.org>
 <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Message-ID: <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
Date:   Wed, 24 Feb 2021 10:15:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHzRb6Q_LgPUrrHn18sorYo7ysTgB+PNE36LDUUsJpHDg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 2/24/21 9:45 AM, Daniel Vetter wrote:
> On Wed, Feb 24, 2021 at 8:46 AM Thomas Hellström (Intel)
> <thomas_os@shipmail.org> wrote:
>>
>> On 2/23/21 11:59 AM, Daniel Vetter wrote:
>>> tldr; DMA buffers aren't normal memory, expecting that you can use
>>> them like that (like calling get_user_pages works, or that they're
>>> accounting like any other normal memory) cannot be guaranteed.
>>>
>>> Since some userspace only runs on integrated devices, where all
>>> buffers are actually all resident system memory, there's a huge
>>> temptation to assume that a struct page is always present and useable
>>> like for any more pagecache backed mmap. This has the potential to
>>> result in a uapi nightmare.
>>>
>>> To stop this gap require that DMA buffer mmaps are VM_PFNMAP, which
>>> blocks get_user_pages and all the other struct page based
>>> infrastructure for everyone. In spirit this is the uapi counterpart to
>>> the kernel-internal CONFIG_DMABUF_DEBUG.
>>>
>>> Motivated by a recent patch which wanted to swich the system dma-buf
>>> heap to vm_insert_page instead of vm_insert_pfn.
>>>
>>> v2:
>>>
>>> Jason brought up that we also want to guarantee that all ptes have the
>>> pte_special flag set, to catch fast get_user_pages (on architectures
>>> that support this). Allowing VM_MIXEDMAP (like VM_SPECIAL does) would
>>> still allow vm_insert_page, but limiting to VM_PFNMAP will catch that.
>>>
>>>   From auditing the various functions to insert pfn pte entires
>>> (vm_insert_pfn_prot, remap_pfn_range and all it's callers like
>>> dma_mmap_wc) it looks like VM_PFNMAP is already required anyway, so
>>> this should be the correct flag to check for.
>>>
>> If we require VM_PFNMAP, for ordinary page mappings, we also need to
>> disallow COW mappings, since it will not work on architectures that
>> don't have CONFIG_ARCH_HAS_PTE_SPECIAL, (see the docs for vm_normal_page()).
> Hm I figured everyone just uses MAP_SHARED for buffer objects since
> COW really makes absolutely no sense. How would we enforce this?

Perhaps returning -EINVAL on is_cow_mapping() at mmap time. Either that 
or allowing MIXEDMAP.

>> Also worth noting is the comment in  ttm_bo_mmap_vma_setup() with
>> possible performance implications with x86 + PAT + VM_PFNMAP + normal
>> pages. That's a very old comment, though, and might not be valid anymore.
> I think that's why ttm has a page cache for these, because it indeed
> sucks. The PAT changes on pages are rather expensive.

IIRC the page cache was implemented because of the slowness of the 
caching mode transition itself, more specifically the wbinvd() call + 
global TLB flush.

>
> There is still an issue for iomem mappings, because the PAT validation
> does a linear walk of the resource tree (lol) for every vm_insert_pfn.
> But for i915 at least this is fixed by using the io_mapping
> infrastructure, which does the PAT reservation only once when you set
> up the mapping area at driver load.

Yes, I guess that was the issue that the comment describes, but the 
issue wasn't there with vm_insert_mixed() + VM_MIXEDMAP.

>
> Also TTM uses VM_PFNMAP right now for everything, so it can't be a
> problem that hurts much :-)

Hmm, both 5.11 and drm-tip appears to still use MIXEDMAP?

https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/ttm/ttm_bo_vm.c#L554

> -Daniel

/Thomas


