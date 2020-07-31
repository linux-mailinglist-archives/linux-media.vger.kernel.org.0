Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0705234352
	for <lists+linux-media@lfdr.de>; Fri, 31 Jul 2020 11:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732176AbgGaJco (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Jul 2020 05:32:44 -0400
Received: from mx.socionext.com ([202.248.49.38]:6163 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731922AbgGaJco (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Jul 2020 05:32:44 -0400
Received: from unknown (HELO iyokan-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 31 Jul 2020 18:32:42 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
        by iyokan-ex.css.socionext.com (Postfix) with ESMTP id 4118360060;
        Fri, 31 Jul 2020 18:32:42 +0900 (JST)
Received: from 172.31.9.53 (172.31.9.53) by m-FILTER with ESMTP; Fri, 31 Jul 2020 18:32:42 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by iyokan.css.socionext.com (Postfix) with ESMTP id 1A69A40327;
        Fri, 31 Jul 2020 18:32:42 +0900 (JST)
Received: from [10.212.6.48] (unknown [10.212.6.48])
        by yuzu.css.socionext.com (Postfix) with ESMTP id 79B53120498;
        Fri, 31 Jul 2020 18:32:41 +0900 (JST)
Subject: Re: [PATCH] dma-buf: heaps: Introduce dma_heap_add_cma() for
 non-default CMA heap
To:     John Stultz <john.stultz@linaro.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        Christian Koenig <christian.koenig@amd.com>,
        linux-media@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "moderated list:DMA BUFFER SHARING FRAMEWORK" 
        <linaro-mm-sig@lists.linaro.org>,
        lkml <linux-kernel@vger.kernel.org>
References: <1594948208-4739-1-git-send-email-hayashi.kunihiko@socionext.com>
 <CALAqxLXuJQOCXcpyWwyBFZGFK_dEgG0edEEf2=vOpAw6Ng8mBQ@mail.gmail.com>
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <eacfc713-e98a-78fa-b316-3943600813d0@socionext.com>
Date:   Fri, 31 Jul 2020 18:32:41 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALAqxLXuJQOCXcpyWwyBFZGFK_dEgG0edEEf2=vOpAw6Ng8mBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi John,
Thank you for your comment.

On 2020/07/29 4:17, John Stultz wrote:
> On Thu, Jul 16, 2020 at 6:10 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
>>
>> Current dma-buf heaps can handle only default CMA. This introduces
>> dma_heap_add_cma() function to attach CMA heaps that belongs to a device.
>>
>> At first, the driver calls of_reserved_mem_device_init() to set
>> memory-region property associated with reserved-memory defined as CMA
>> to the device. And when the driver calls this dma_heap_add_cma(),
>> the CMA will be added to dma-buf heaps.
>>
>> For example, prepare CMA node named "linux,cma@10000000" and
>> specify the node for memory-region property. After the above calls
>> in the driver, a device file "/dev/dma_heap/linux,cma@10000000"
>> associated with the CMA become available as dma-buf heaps.
>>
>> Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
>> ---
>>   drivers/dma-buf/heaps/cma_heap.c | 12 ++++++++++++
>>   include/linux/dma-heap.h         |  9 +++++++++
>>   2 files changed, 21 insertions(+)
> 
> Hey! Sorry for the slow response on this! I just realized I never replied!

I waited but no problem.

> 
>> diff --git a/drivers/dma-buf/heaps/cma_heap.c b/drivers/dma-buf/heaps/cma_heap.c
>> index 626cf7f..5d2442e 100644
>> --- a/drivers/dma-buf/heaps/cma_heap.c
>> +++ b/drivers/dma-buf/heaps/cma_heap.c

[snip]

>> --
>> 2.7.4
> 
> Looks sane to me.  Being able to expose different multiple CMA heaps
> is needed, and I agree this way (as opposed to my earlier dts
> appraoch) is probably the best approach. The only bit I'm so-so on is
> adding the CMA heap specific call in the dma-heap.h, but at the same
> time I can't justify adding a whole new header for a single function.

I'm also a little worried about whether "CMA specific" call is in
the dma-heap.h, however I can't find another solution.

> Do you have a upstream driver that you plan to make use this new call?

Unfortunately I don't have an upstream driver using this call.

This call is called from dma-buf heaps "importer" or "customer",
and I only made an example (do nothing) importer driver
to test the call.

> We want to have in-tree users of code added.

I think this is a generic way to use non-default CMA heaps, however,
we need in-tree "importer" drivers to want to use non-default CMA heaps.
I don't find it from now.

> But if so, feel free to add my:
>    Acked-by: John Stultz <john.stultz@linaro.org>
> To this patch when you submit the driver changes.

Thank you,

---
Best Regards
Kunihiko Hayashi

