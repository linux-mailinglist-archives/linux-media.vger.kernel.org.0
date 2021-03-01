Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738D2327A9F
	for <lists+linux-media@lfdr.de>; Mon,  1 Mar 2021 10:22:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233850AbhCAJWI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Mar 2021 04:22:08 -0500
Received: from ste-pvt-msa1.bahnhof.se ([213.80.101.70]:27855 "EHLO
        ste-pvt-msa1.bahnhof.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233712AbhCAJWE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Mar 2021 04:22:04 -0500
Received: from localhost (localhost [127.0.0.1])
        by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CDE5D3F3A1;
        Mon,  1 Mar 2021 10:21:19 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se;
        dkim=pass (1024-bit key; unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=pTwKGOoe;
        dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
        tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
        DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
        URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
        by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tcU_ueMgXl_O; Mon,  1 Mar 2021 10:21:19 +0100 (CET)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id AFBB83F393;
        Mon,  1 Mar 2021 10:21:16 +0100 (CET)
Received: from [10.249.254.148] (unknown [192.198.151.43])
        by mail1.shipmail.org (Postfix) with ESMTPSA id E9C783600BA;
        Mon,  1 Mar 2021 10:21:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
        t=1614590476; bh=v/6gYa+I8Tt8B9P3C8K3rFhm+y2ThcWR/NttZk59Mig=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=pTwKGOoeZY6eQEETMEQFzNBP9mngHUBwdZttR6CPWTgPJ2KDTyLMNuMQIRYHqdH3k
         QVkSi3bBIaNdTDnlUwK6I5ZGdqMl3XtNuurr+MqgJmryh5kAKP/lI0iA7Ih0c4cW74
         ECt01QAIkTQUiQU988RWC/zJVXRzMqBUVNpyULPo=
Subject: Re: [Linaro-mm-sig] [PATCH 1/2] dma-buf: Require VM_PFNMAP vma for
 mmap
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
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
References: <f43311c8-a02a-1a29-a53b-88e599c92187@shipmail.org>
 <CAKMK7uE2UrOruQPWG9KPBQ781f9Bq9xpVRNserAC9BZ2VzDutQ@mail.gmail.com>
 <b30dacb0-edea-0a3c-6163-0f329e58ba61@gmail.com>
 <YDd/hlf8uM3+lxhr@phenom.ffwll.local>
 <CAKMK7uFezcV52oTZbHeve2HFFATeCGyK6zTT6nE1KVP69QRr0A@mail.gmail.com>
 <61c5c371-debe-4ca0-a067-ce306e51ef88@shipmail.org>
 <CAKMK7uFUiJyMP0E5JUzMOx=NyMW+ZObGsaFOh409x0LOvGbnzg@mail.gmail.com>
 <0d69bd00-e673-17cf-c9e3-ccbcd52649a6@shipmail.org>
 <CAKMK7uE=8+hj-MUFXHFoG_hAbz_Obi8a99+DE5_d1K+KZaG+tQ@mail.gmail.com>
 <b367b7e8-f202-4d23-d672-a5c9bc7fcec1@shipmail.org>
 <YDyuYk8x5QeX83s6@phenom.ffwll.local>
From:   =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= 
        <thomas_os@shipmail.org>
Message-ID: <be8f2503-ffcb-eb58-83be-26fa0fc1837a@shipmail.org>
Date:   Mon, 1 Mar 2021 10:21:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YDyuYk8x5QeX83s6@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


On 3/1/21 10:05 AM, Daniel Vetter wrote:
> On Mon, Mar 01, 2021 at 09:39:53AM +0100, Thomas Hellström (Intel) wrote:
>> Hi,
>>
>> On 3/1/21 9:28 AM, Daniel Vetter wrote:
>>> On Sat, Feb 27, 2021 at 9:06 AM Thomas Hellström (Intel)
>>> <thomas_os@shipmail.org> wrote:
>>>> On 2/26/21 2:28 PM, Daniel Vetter wrote:
>>>>> So I think it stops gup. But I haven't verified at all. Would be good
>>>>> if Christian can check this with some direct io to a buffer in system
>>>>> memory.
>>>> Hmm,
>>>>
>>>> Docs (again vm_normal_page() say)
>>>>
>>>>     * VM_MIXEDMAP mappings can likewise contain memory with or without "struct
>>>>     * page" backing, however the difference is that _all_ pages with a struct
>>>>     * page (that is, those where pfn_valid is true) are refcounted and
>>>> considered
>>>>     * normal pages by the VM. The disadvantage is that pages are refcounted
>>>>     * (which can be slower and simply not an option for some PFNMAP
>>>> users). The
>>>>     * advantage is that we don't have to follow the strict linearity rule of
>>>>     * PFNMAP mappings in order to support COWable mappings.
>>>>
>>>> but it's true __vm_insert_mixed() ends up in the insert_pfn() path, so
>>>> the above isn't really true, which makes me wonder if and in that case
>>>> why there could any longer ever be a significant performance difference
>>>> between MIXEDMAP and PFNMAP.
>>> Yeah it's definitely confusing. I guess I'll hack up a patch and see
>>> what sticks.
>>>
>>>> BTW regarding the TTM hugeptes, I don't think we ever landed that devmap
>>>> hack, so they are (for the non-gup case) relying on
>>>> vma_is_special_huge(). For the gup case, I think the bug is still there.
>>> Maybe there's another devmap hack, but the ttm_vm_insert functions do
>>> use PFN_DEV and all that. And I think that stops gup_fast from trying
>>> to find the underlying page.
>>> -Daniel
>> Hmm perhaps it might, but I don't think so. The fix I tried out was to set
>>
>> PFN_DEV | PFN_MAP for huge PTEs which causes pfn_devmap() to be true, and
>> then
>>
>> follow_devmap_pmd()->get_dev_pagemap() which returns NULL and gup_fast()
>> backs off,
>>
>> in the end that would mean setting in stone that "if there is a huge devmap
>> page table entry for which we haven't registered any devmap struct pages
>> (get_dev_pagemap returns NULL), we should treat that as a "special" huge
>> page table entry".
>>
>>  From what I can tell, all code calling get_dev_pagemap() already does that,
>> it's just a question of getting it accepted and formalizing it.
> Oh I thought that's already how it works, since I didn't spot anything
> else that would block gup_fast from falling over. I guess really would
> need some testcases to make sure direct i/o (that's the easiest to test)
> fails like we expect.

Yeah, IIRC the "| PFN_MAP" is the missing piece for TTM huge ptes. 
Otherwise pmd_devmap() will not return true and since there is no 
pmd_special() things break.

/Thomas



> -Daniel
