Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50E55337383
	for <lists+linux-media@lfdr.de>; Thu, 11 Mar 2021 14:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233354AbhCKNMo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Mar 2021 08:12:44 -0500
Received: from ste-pvt-msa2.bahnhof.se ([213.80.101.71]:37615 "EHLO
        ste-pvt-msa2.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233192AbhCKNMh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Mar 2021 08:12:37 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 9AA743F7AA;
        Thu, 11 Mar 2021 14:12:35 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=Mjr7q+K/;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
        URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
        dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
        by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id jt75w819o8DR; Thu, 11 Mar 2021 14:12:34 +0100 (CET)
Received: by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id E6D453F4B5;
        Thu, 11 Mar 2021 14:12:31 +0100 (CET)
Received: from [192.168.0.209] (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
        by mail1.shipmail.org (Postfix) with ESMTPSA id 7F3EB360133;
        Thu, 11 Mar 2021 14:12:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1615468351; bh=YBkdKA9c8Xfco/ZakLkKtG1rIiSy52T2Ub7JaudfbB0=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Mjr7q+K/wuhHNs/9xBrH39funrcR0iYzwN414cz/xgFXqeEXqaw1OG8P3AXTr7yLx
         ObsbyFYyNPm6JBl9georhfYejKx/U9+HegjuSAubuvEO4/GwjkhVHKV7v7o7TbIDtX
         bYDJ/iv40g0pL4++ZDSlJGTz9IcADyTKZ3LXIWes=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Matthew Wilcox <willy@infradead.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>, Jason Gunthorpe <jgg@ziepe.ca>,
        John Stultz <john.stultz@linaro.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Suren Baghdasaryan <surenb@google.com>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>
References: <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
 <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
 <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org>
 <YDyuYk8x5QeX83s6@phenom.ffwll.local>
 <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org>
 <648556e6-2d99-950d-c940-706eb5a8f6cc@amd.com>
 <CAKMK7uHOe=LacUkvGC75dyWAt9TRm7ce8vgxasXOXn-6wJTVnA@mail.gmail.com>
 <9d608c61-c64c-dcde-c719-59a970144404@shipmail.org>
 <YEoUZe8BtvQdv3TG@phenom.ffwll.local>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Message-ID: <0e15ae7a-58d3-c75e-9a6c-e397e11750a7@shipmail.org>
Date:   Thu, 11 Mar 2021 14:12:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YEoUZe8BtvQdv3TG@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi!

On 3/11/21 2:00 PM, Daniel Vetter wrote:
> On Thu, Mar 11, 2021 at 11:22:06AM +0100, Thomas Hellström (Intel) wrote:
>> On 3/1/21 3:09 PM, Daniel Vetter wrote:
>>> On Mon, Mar 1, 2021 at 11:17 AM Christian König
>>> <christian.koenig@amd.com> wrote:
>>>>
>>>> Am 01.03.21 um 10:21 schrieb Thomas Hellström (Intel):
>>>>> On 3/1/21 10:05 AM, Daniel Vetter wrote:
>>>>>> On Mon, Mar 01, 2021 at 09:39:53AM +0100, Thomas Hellström (Intel)
>>>>>> wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On 3/1/21 9:28 AM, Daniel Vetter wrote:
>>>>>>>> On Sat, Feb 27, 2021 at 9:06 AM Thomas Hellström (Intel)
>>>>>>>> <thomas_os@shipmail.org> wrote:
>>>>>>>>> On 2/26/21 2:28 PM, Daniel Vetter wrote:
>>>>>>>>>> So I think it stops gup. But I haven't verified at all. Would be
>>>>>>>>>> good
>>>>>>>>>> if Christian can check this with some direct io to a buffer in
>>>>>>>>>> system
>>>>>>>>>> memory.
>>>>>>>>> Hmm,
>>>>>>>>>
>>>>>>>>> Docs (again vm_normal_page() say)
>>>>>>>>>
>>>>>>>>>       * VM_MIXEDMAP mappings can likewise contain memory with or
>>>>>>>>> without "struct
>>>>>>>>>       * page" backing, however the difference is that _all_ pages
>>>>>>>>> with a struct
>>>>>>>>>       * page (that is, those where pfn_valid is true) are refcounted
>>>>>>>>> and
>>>>>>>>> considered
>>>>>>>>>       * normal pages by the VM. The disadvantage is that pages are
>>>>>>>>> refcounted
>>>>>>>>>       * (which can be slower and simply not an option for some PFNMAP
>>>>>>>>> users). The
>>>>>>>>>       * advantage is that we don't have to follow the strict
>>>>>>>>> linearity rule of
>>>>>>>>>       * PFNMAP mappings in order to support COWable mappings.
>>>>>>>>>
>>>>>>>>> but it's true __vm_insert_mixed() ends up in the insert_pfn()
>>>>>>>>> path, so
>>>>>>>>> the above isn't really true, which makes me wonder if and in that
>>>>>>>>> case
>>>>>>>>> why there could any longer ever be a significant performance
>>>>>>>>> difference
>>>>>>>>> between MIXEDMAP and PFNMAP.
>>>>>>>> Yeah it's definitely confusing. I guess I'll hack up a patch and see
>>>>>>>> what sticks.
>>>>>>>>
>>>>>>>>> BTW regarding the TTM hugeptes, I don't think we ever landed that
>>>>>>>>> devmap
>>>>>>>>> hack, so they are (for the non-gup case) relying on
>>>>>>>>> vma_is_special_huge(). For the gup case, I think the bug is still
>>>>>>>>> there.
>>>>>>>> Maybe there's another devmap hack, but the ttm_vm_insert functions do
>>>>>>>> use PFN_DEV and all that. And I think that stops gup_fast from trying
>>>>>>>> to find the underlying page.
>>>>>>>> -Daniel
>>>>>>> Hmm perhaps it might, but I don't think so. The fix I tried out was
>>>>>>> to set
>>>>>>>
>>>>>>> PFN_DEV | PFN_MAP for huge PTEs which causes pfn_devmap() to be
>>>>>>> true, and
>>>>>>> then
>>>>>>>
>>>>>>> follow_devmap_pmd()->get_dev_pagemap() which returns NULL and
>>>>>>> gup_fast()
>>>>>>> backs off,
>>>>>>>
>>>>>>> in the end that would mean setting in stone that "if there is a huge
>>>>>>> devmap
>>>>>>> page table entry for which we haven't registered any devmap struct
>>>>>>> pages
>>>>>>> (get_dev_pagemap returns NULL), we should treat that as a "special"
>>>>>>> huge
>>>>>>> page table entry".
>>>>>>>
>>>>>>>    From what I can tell, all code calling get_dev_pagemap() already
>>>>>>> does that,
>>>>>>> it's just a question of getting it accepted and formalizing it.
>>>>>> Oh I thought that's already how it works, since I didn't spot anything
>>>>>> else that would block gup_fast from falling over. I guess really would
>>>>>> need some testcases to make sure direct i/o (that's the easiest to test)
>>>>>> fails like we expect.
>>>>> Yeah, IIRC the "| PFN_MAP" is the missing piece for TTM huge ptes.
>>>>> Otherwise pmd_devmap() will not return true and since there is no
>>>>> pmd_special() things break.
>>>> Is that maybe the issue we have seen with amdgpu and huge pages?
>>> Yeah, essentially when you have a hugepte inserted by ttm, and it
>>> happens to point at system memory, then gup will work on that. And
>>> create all kinds of havoc.
>>>
>>>> Apart from that I'm lost guys, that devmap and gup stuff is not
>>>> something I have a good knowledge of apart from a one mile high view.
>>> I'm not really better, hence would be good to do a testcase and see.
>>> This should provoke it:
>>> - allocate nicely aligned bo in system memory
>>> - mmap, again nicely aligned to 2M
>>> - do some direct io from a filesystem into that mmap, that should trigger gup
>>> - before the gup completes free the mmap and bo so that ttm recycles
>>> the pages, which should trip up on the elevated refcount. If you wait
>>> until the direct io is completely, then I think nothing bad can be
>>> observed.
>>>
>>> Ofc if your amdgpu+hugepte issue is something else, then maybe we have
>>> another issue.
>>>
>>> Also usual caveat: I'm not an mm hacker either, so might be completely wrong.
>>> -Daniel
>> So I did the following quick experiment on vmwgfx, and it turns out that
>> with it,
>> fast gup never succeeds. Without the "| PFN_MAP", it typically succeeds
>>
>> I should probably craft an RFC formalizing this.
> Yeah I think that would be good. Maybe even more formalized if we also
> switch over to VM_PFNMAP, since afaiui these pte flags here only stop the
> fast gup path. And slow gup can still peak through VM_MIXEDMAP. Or
> something like that.
>
> Otoh your description of when it only sometimes succeeds would indicate my
> understanding of VM_PFNMAP vs VM_MIXEDMAP is wrong here.

My understanding from reading the vmf_insert_mixed() code is that iff 
the arch has pte_special(), VM_MIXEDMAP should be harmless. But that's 
not consistent with the vm_normal_page() doc. For architectures without 
pte_special, VM_PFNMAP must be used, and then we must also block COW 
mappings.

If we can get someone can commit to verify that the potential PAT WC 
performance issue is gone with PFNMAP, I can put together a series with 
that included.

As for existing userspace using COW TTM mappings, I once had a couple of 
test cases to verify that it actually worked, in particular together 
with huge PMDs and PUDs where breaking COW would imply splitting those, 
but I can't think of anything else actually wanting to do that other 
than by mistake.

/Thomas


>
> Christian, what's your take?
> -Daniel
>
>> /Thomas
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> index 6dc96cf66744..72b6fb17c984 100644
>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>> @@ -195,6 +195,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault
>> *vmf,
>>          pfn_t pfnt;
>>          struct ttm_tt *ttm = bo->ttm;
>>          bool write = vmf->flags & FAULT_FLAG_WRITE;
>> +       struct dev_pagemap *pagemap;
>>
>>          /* Fault should not cross bo boundary. */
>>          page_offset &= ~(fault_page_size - 1);
>> @@ -210,6 +211,17 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault
>> *vmf,
>>          if ((pfn & (fault_page_size - 1)) != 0)
>>                  goto out_fallback;
>>
>> +       /*
>> +        * Huge entries must be special, that is marking them as devmap
>> +        * with no backing device map range. If there is a backing
>> +        * range, Don't insert a huge entry.
>> +        */
>> +       pagemap = get_dev_pagemap(pfn, NULL);
>> +       if (pagemap) {
>> +               put_dev_pagemap(pagemap);
>> +               goto out_fallback;
>> +       }
>> +
>>          /* Check that memory is contiguous. */
>>          if (!bo->mem.bus.is_iomem) {
>>                  for (i = 1; i < fault_page_size; ++i) {
>> @@ -223,7 +235,7 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault
>> *vmf,
>>                  }
>>          }
>>
>> -       pfnt = __pfn_to_pfn_t(pfn, PFN_DEV);
>> +       pfnt = __pfn_to_pfn_t(pfn, PFN_DEV | PFN_MAP);
>>          if (fault_page_size == (HPAGE_PMD_SIZE >> PAGE_SHIFT))
>>                  ret = vmf_insert_pfn_pmd_prot(vmf, pfnt, pgprot, write);
>>   #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>> @@ -236,6 +248,21 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault
>> *vmf,
>>          if (ret != VM_FAULT_NOPAGE)
>>                  goto out_fallback;
>>
>> +#if 1
>> +       {
>> +               int npages;
>> +               struct page *page;
>> +
>> +               npages = get_user_pages_fast_only(vmf->address, 1, 0,
>> &page);
>> +               if (npages == 1) {
>> +                       DRM_WARN("Fast gup succeeded. Bad.\n");
>> +                       put_page(page);
>> +               } else {
>> +                       DRM_INFO("Fast gup failed. Good.\n");
>> +               }
>> +       }
>> +#endif
>> +
>>          return VM_FAULT_NOPAGE;
>>   out_fallback:
>>          count_vm_event(THP_FAULT_FALLBACK);
>>
>>
>>
>>
>>
