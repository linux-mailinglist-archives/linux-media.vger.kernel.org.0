Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2CE025171E
	for <lists+linux-media@lfdr.de>; Tue, 25 Aug 2020 13:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729957AbgHYLJU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 25 Aug 2020 07:09:20 -0400
Received: from mx.socionext.com ([202.248.49.38]:29926 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729458AbgHYLJT (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 25 Aug 2020 07:09:19 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 25 Aug 2020 20:09:16 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 13BB01800AA;
        Tue, 25 Aug 2020 20:09:17 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Tue, 25 Aug 2020 20:09:17 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by iyokan.css.socionext.com (Postfix) with ESMTP id ECCDF403AD;
        Tue, 25 Aug 2020 20:09:16 +0900 (JST)
Received: from [10.212.5.217] (unknown [10.212.5.217])
        by yuzu.css.socionext.com (Postfix) with ESMTP id 683C5120131;
        Tue, 25 Aug 2020 20:09:16 +0900 (JST)
Subject: Re: [PATCH] dma-buf: heaps: Introduce dma_heap_add_cma() for
 non-default CMA heap
To:     John Stultz <john.stultz@linaro.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>, Liam Mark <lmark@codeaurora.org>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-media <linux-media@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Laura Abbott <labbott@kernel.org>
References: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
 <CALAqxLXuJQOCXcpyWwyBFZGFK_dEgG0edEEf2=vOpAw6Ng8mBQ@mail.gmail.com>
 <eacfc713-e98a-78fa-b316-3943600813d0@socionext.com>
 <CALAqxLVzUnc5CH_pA7h3ygXFPRz05KtNZx+_M3eAXXrm7hhGBQ@mail.gmail.com>
 <377e6e65-0b44-ecd0-cfc5-6fbc82be35d5@socionext.com>
 <CALAqxLXbKZ=y4BTG7Kx9E46Uysx=eV=GitEDQKwp-Obg5aHUrw@mail.gmail.com>
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <67acbdf4-f0f0-836d-d5c9-68d40348e1b5@socionext.com>
Date:   Tue, 25 Aug 2020 20:09:16 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLXbKZ=y4BTG7Kx9E46Uysx=eV=GitEDQKwp-Obg5aHUrw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,

On 2020/08/22 3:32, John Stultz wrote:
> On Fri, Aug 21, 2020 at 2:14 AM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
>>
>> On 2020/08/01 4:38, John Stultz wrote:
>>> On Fri, Jul 31, 2020 at 2:32 AM Kunihiko Hayashi
>>> <hayashi.kunihiko@socionext.com> wrote:
>>>> On 2020/07/29 4:17, John Stultz wrote:
>>>>> Do you have a upstream driver that you plan to make use this new call?
>>>>
>>>> Unfortunately I don't have an upstream driver using this call.
>>>>
>>>> This call is called from dma-buf heaps "importer" or "customer",
>>>> and I only made an example (do nothing) importer driver
>>>> to test the call.
>>>>
>>>>> We want to have in-tree users of code added.
>>>>
>>>> I think this is a generic way to use non-default CMA heaps, however,
>>>> we need in-tree "importer" drivers to want to use non-default CMA heaps.
>>>> I don't find it from now.
>>>>
>>>
>>> Yea, I and again, I do agree this is functionality that will be
>>> needed. But we'll need to wait for a user (camera driver, etc which
>>> would utilize the reserved cma region) before we can merge it
>>> upstream. :(  Do let me know if you have an out of tree driver that
>>> would make use of it, and we can see what can be done to help upstream
>>> things.
>>
>> Sorry for late.
>> Before I prepare or find a user driver as "importer",
>> I think something is different in this patch.
>>
>> This patch makes it possible to treat non-default CMA connected to
>> "importer" device with memory-region as dma-buf heaps.
>>
>> However, the allocated memory from this dma-buf heaps can be used
>> for "any" devices, and the "importer" can treat memories from other
>> dma-buf heaps.
>>
>> So, the "importer" and the non-default CMA aren't directly related,
>> and I think an "exporter" for the non-default CMA should be enabled.
>>
>> In paticular, the kernel initializer (as an "exporter") calls
>> dma_heap_add_cma() for all CMAs defined in Devicetree, and
>> the device files associated with each CMA appear under "/dev/dma_heap/".
>> For example:
>>
>>      /dev/dma_heap/linux,cma@10000000
>>      /dev/dma_heap/linux,cma@11000000
>>      /dev/dma_heap/linux,cma@12000000
>>      ...
>>
>> All of these device files can be fairly allocated to any "importer" device.
>>
>> Actually I think that the kernel should executes dma_heap_add_cma()
>> for ALL defined reserved-memory nodes.
>>
>> If this idea hasn't been discussed yet and this is reasonable,
>> I'll prepare RFC patches.
> 
> So yes! An earlier version of the CMA heap I submitted did add all CMA
> regions as accessible heaps as you propose here.

Sorry I've missed your submitted patch and previous discussions.

> However, the concern was that in some cases, those regions are device
> specific reserved memory that the driver is probably expecting to have
> exclusive access. To allow (sufficiently privileged, or misconfigured)
> userland to be able to allocate out of that seemed like it might cause
> trouble, and instead we should have CMA regions explicitly exported.

Ah, I see.
Surely if "device-specific" memory is specified as CMA in the devicetree,
it's difficult to avoid any trouble to access it.

> There was some proposal to add a dt property to the reserved memory
> section (similar to linux,cma-default) and use that to do the
> exporting, but other discussions seemed to prefer having drivers
> export it explicitly in a fashion very similar to what your earlier
> patch does. The only trouble is we just need an upstream driver to add
> such a call in the series before we can merge it.

Okay, I understand.
I agree that it seems safe for upstream driver to handle memory that is
only used explicitly.

However, I've not found any drivers to use heaps.
I'll hold this patch until such a driver or other ideas are upstreamed.

Thank you,

---
Best Regards
Kunihiko Hayashi
