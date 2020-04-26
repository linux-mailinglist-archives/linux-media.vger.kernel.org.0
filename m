Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F20A1B8B51
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 04:35:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgDZCfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 22:35:07 -0400
Received: from mga14.intel.com ([192.55.52.115]:11693 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgDZCfH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 22:35:07 -0400
IronPort-SDR: sqcmGKBuvoEHGYah3w5l0D6rvgkOIH7WcO+/glbdp/A54KPpyRNZoduce+0JK2+yWSScUZ58df
 nYuWQyba/1NQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2020 19:35:07 -0700
IronPort-SDR: F/9uRcHmSretx3z5K8KxmqxeP9yx30wN9zSURPsGzr0Hauqv4IseqfeywNx6hEFZSEJj/Iz8Hs
 PivsB62rLt6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,318,1583222400"; 
   d="scan'208";a="260285095"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by orsmga006.jf.intel.com with ESMTP; 25 Apr 2020 19:35:05 -0700
Subject: Re: [PATCH 1/1] staging: imgu: Use vmap() instead of __get_vm_area()
 and map_vm_area()
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
        bingbu.cao@intel.com, tfiga@chromium.org, rajmohan.mani@intel.com
References: <20200417125431.25105-1-sakari.ailus@linux.intel.com>
 <d598d565-f956-ffb1-db6a-c633caf52606@linux.intel.com>
 <20200424095641.GT5381@paasikivi.fi.intel.com>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <e11d0223-b2c6-305f-fcc2-a738bffa11fe@linux.intel.com>
Date:   Sun, 26 Apr 2020 10:39:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200424095641.GT5381@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 4/24/20 5:56 PM, Sakari Ailus wrote:
> Hi Bingbu,
> 
> On Fri, Apr 24, 2020 at 03:52:22PM +0800, Bingbu Cao wrote:
>> Hi, Sakari
>>
>> On 4/17/20 8:54 PM, Sakari Ailus wrote:
>>> Switch to vmap() instead of using both __get_vm_area() and map_vm_area().
>>>
>>> While at it, also assign vm_struct.nr_pages field.
>>>
>>> Reported-by: Christoph Hellwig <hch@infradead.org>
>>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>>> ---
>>> This is just compile tested but reasonably trivial.
>>>
>>>  drivers/staging/media/ipu3/ipu3-dmamap.c | 11 ++---------
>>>  1 file changed, 2 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/staging/media/ipu3/ipu3-dmamap.c b/drivers/staging/media/ipu3/ipu3-dmamap.c
>>> index 7431322379f6..58e6683e5770 100644
>>> --- a/drivers/staging/media/ipu3/ipu3-dmamap.c
>>> +++ b/drivers/staging/media/ipu3/ipu3-dmamap.c
>>> @@ -123,16 +123,12 @@ void *imgu_dmamap_alloc(struct imgu_device *imgu, struct imgu_css_map *map,
>>>  		iovaddr += PAGE_SIZE;
>>>  	}
>>>  
>>> -	/* Now grab a virtual region */
>>> -	map->vma = __get_vm_area(size, VM_USERMAP, VMALLOC_START, VMALLOC_END);
>>> +	map->vma = vmap(pages, size / PAGE_SIZE, VM_USERMAP, PAGE_KERNEL);
>>
>> vmap() returns the address of virtual area not the area itself, right?
> 
> Yes. But there's a cleaner patches from Christoph here:
> 
> <URL:https://lore.kernel.org/lkml/20200414131348.444715-5-hch@lst.de/>

Thanks, I just did a simple test with Christoph's patch, the basic camera
functions are OK.

> 
> So I've dropped mine.
> 
>>
>>>  	if (!map->vma)
>>>  		goto out_unmap;
>>>  
>>>  	map->vma->pages = pages;
>>> -	/* And map it in KVA */
>>> -	if (map_vm_area(map->vma, PAGE_KERNEL, pages))
>>> -		goto out_vunmap;
>>> -
>>> +	map->vma->nr_pages = size / PAGE_SIZE;
>>>  	map->size = size;
>>>  	map->daddr = iova_dma_addr(&imgu->iova_domain, iova);
>>>  	map->vaddr = map->vma->addr;
>>> @@ -142,9 +138,6 @@ void *imgu_dmamap_alloc(struct imgu_device *imgu, struct imgu_css_map *map,
>>>  
>>>  	return map->vma->addr;
>>>  
>>> -out_vunmap:
>>> -	vunmap(map->vma->addr);
>>> -
>>>  out_unmap:
>>>  	imgu_dmamap_free_buffer(pages, size);
>>>  	imgu_mmu_unmap(imgu->mmu, iova_dma_addr(&imgu->iova_domain, iova),
>>>
>>
> 

-- 
Best regards,
Bingbu Cao
