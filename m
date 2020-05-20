Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 785171DB4F5
	for <lists+linux-media@lfdr.de>; Wed, 20 May 2020 15:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726436AbgETN2T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 May 2020 09:28:19 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:34302 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbgETN2O (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 May 2020 09:28:14 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200520132811euoutp02a307eff42919039c167a3adbbb970b50~Qv4_cwjlI0839908399euoutp02Y
        for <linux-media@vger.kernel.org>; Wed, 20 May 2020 13:28:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200520132811euoutp02a307eff42919039c167a3adbbb970b50~Qv4_cwjlI0839908399euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1589981292;
        bh=wt7ZAzus8jfvwuKXh+8jgmyBochZXbmDRoFuEwJS3xI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Psr+YyLutS8m3QluKb9arhKlsjRQZStBz+TshYDTbAd2sQMGSa+L+c0yW/7P9g0sX
         me+ft6/78l7M1CTLRUk/3dV1X6Yn7vF+Rvm5ljUajxTdU99dBYyym59vuyoUOJinYp
         8Z2wpROZQ9s09H3eNYacVAXgXjSgxuN9CZJ5lmrQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200520132811eucas1p17d3caed7aaf8e435b5ae7b144d6bb35e~Qv4_LSZDa1895018950eucas1p1A;
        Wed, 20 May 2020 13:28:11 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id D3.2E.60679.B6035CE5; Wed, 20
        May 2020 14:28:11 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200520132811eucas1p155ffc4369d7cf1cf7047cca91361cee1~Qv49wwr_O0413504135eucas1p1d;
        Wed, 20 May 2020 13:28:11 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200520132811eusmtrp23a14ae78a3dd1695ec1d268558f9c045~Qv49wIN3U0288702887eusmtrp28;
        Wed, 20 May 2020 13:28:11 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-cd-5ec5306bce29
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id A2.00.07950.B6035CE5; Wed, 20
        May 2020 14:28:11 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200520132810eusmtip1cf37ae1106ea84b84b45fea842669ed2~Qv49XL-8d2058120581eusmtip1P;
        Wed, 20 May 2020 13:28:10 +0000 (GMT)
Subject: Re: Bad kfree of dma_parms in v5.7-rc5
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <9f72aeab-8d63-7fc1-d5ff-7d5c4f11012b@samsung.com>
Date:   Wed, 20 May 2020 15:28:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <CAPDyKFq8-JYA_tKZmUZOY3mT-jeoWMHNpdj8SDGkqYmX7jJHVQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsWy7djP87rZBkfjDNpvqVk0L17PZnF51xw2
        i54NW1ktlm36w2Sxfv4tNovja8Md2Dw2repk87hzbQ+bx/65a9g9jt/YzuTxeZNcAGsUl01K
        ak5mWWqRvl0CV8bNhc1MBefkK37+vs7awDhVqouRk0NCwETi8eUpjF2MXBxCAisYJaa+ecAK
        4XxhlLh2dhkThPOZUWLGs/1sMC1rby4Fs4UEljNKrP/sDFH0nlFi54mFQAkODmEBfYmzM+xB
        akQEgiT+7LgKtoJZ4ACjxIaec4wgCTYBQ4mut11gg3gF7CSebJ/GCmKzCKhKHGxZCxYXFYiV
        OL14MyNEjaDEyZlPWEBsToFAibe3/zOD2MwC8hLb386BssUlbj2ZD3a1hMAqdommX9tYIa52
        kfj05hUThC0s8er4FnYIW0bi/06YhmZGiYfn1rJDOD2MEpebZjBCVFlL3Dn3C+w1ZgFNifW7
        9CHCjhITz85nBwlLCPBJ3HgrCHEEn8SkbdOZIcK8Eh1tQhDVahKzjq+DW3vwwiXmCYxKs5C8
        NgvJO7OQvDMLYe8CRpZVjOKppcW56anFRnmp5XrFibnFpXnpesn5uZsYgYnn9L/jX3Yw7vqT
        dIhRgINRiYeXQ+BonBBrYllxZe4hRgkOZiUR3oX8QCHelMTKqtSi/Pii0pzU4kOM0hwsSuK8
        xotexgoJpCeWpGanphakFsFkmTg4pRoYlyXKTjvL1it+viPd+4JTuPj+xOdnj/7a5/7cYd9X
        sSsKwvzWk09/tmd23pvsWhW5SKJ435Kemcl6m3ZtFmLkvbmpTCDZvE73kHDT+X/NGafZuOfc
        PKx3NM5v1b3plukhMz0qy3q3dhu+mViS9PnvAYvj9oZXfkSzvJ7gqGO7y3QnS/8q7ZYnSizF
        GYmGWsxFxYkAK8hUpDgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGIsWRmVeSWpSXmKPExsVy+t/xu7rZBkfjDH6t57FoXryezeLyrjls
        Fj0btrJaLNv0h8li/fxbbBbH14Y7sHlsWtXJ5nHn2h42j/1z17B7HL+xncnj8ya5ANYoPZui
        /NKSVIWM/OISW6VoQwsjPUNLCz0jE0s9Q2PzWCsjUyV9O5uU1JzMstQifbsEvYybC5uZCs7J
        V/z8fZ21gXGqVBcjJ4eEgInE2ptL2boYuTiEBJYySuzpWs4KkZCRODmtAcoWlvhzrQuq6C2j
        xMWuCcxdjBwcwgL6Emdn2IOYIgJBEqsXSoGUMAscYpR4v+0+I0ivkMBlZoldTZYgNpuAoUTX
        W5A5nBy8AnYST7ZPA5vPIqAqcbBlLVhcVCBWYvW1VkaIGkGJkzOfsIDYnAKBEm9v/2cGsZkF
        zCTmbX4IZctLbH87B8oWl7j1ZD7TBEahWUjaZyFpmYWkZRaSlgWMLKsYRVJLi3PTc4uN9IoT
        c4tL89L1kvNzNzEC42zbsZ9bdjB2vQs+xCjAwajEw8shcDROiDWxrLgyF+hZDmYlEd6F/EAh
        3pTEyqrUovz4otKc1OJDjKZAz01klhJNzgemgLySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLp
        iSWp2ampBalFMH1MHJxSDYwFVoe2ucr6BCd7mHAypR9U/xiRLRWQemjynsncM74+3JQufW7a
        4Y69elMW5hrrTW0M6rIyMvg12/jupJ62t/9bt0fonLbcdfbSkjOld+Kvzf/MrOTxYKpgtOGh
        huZXhx5laYtM2V7x9ifP/dTzNQfu/mhw//cmcWqMwMK6o3ZJvV9nTuJ6GZ2mxFKckWioxVxU
        nAgAVmKblMkCAAA=
X-CMS-MailID: 20200520132811eucas1p155ffc4369d7cf1cf7047cca91361cee1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c
References: <CGME20200520090109eucas1p17270805f81f6958cd5084a7b910efc6c@eucas1p1.samsung.com>
        <a9df7155-dd7a-752b-6d1c-3426837756b1@ti.com>
        <e9674719-0c86-63be-04a3-ee98bd884901@samsung.com>
        <f3c58dcd-b806-95ef-2434-3084e65e1afb@ti.com>
        <e3fa0b35-7cca-1e37-c2fa-63cc07e6bfda@samsung.com>
        <227465a5-c6e6-5b4d-abbd-7789727843a6@ti.com>
        <29a21e64-a63f-6721-c938-d713488767c1@samsung.com>
        <CAPDyKFq8-JYA_tKZmUZOY3mT-jeoWMHNpdj8SDGkqYmX7jJHVQ@mail.gmail.com>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ulf,

On 20.05.2020 15:12, Ulf Hansson wrote:
> + Greg
>
> On Wed, 20 May 2020 at 14:54, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 20.05.2020 14:43, Tomi Valkeinen wrote:
>>> On 20/05/2020 12:22, Marek Szyprowski wrote:
>>>> On 20.05.2020 11:18, Tomi Valkeinen wrote:
>>>>> On 20/05/2020 12:13, Marek Szyprowski wrote:
>>>>>> On 20.05.2020 11:00, Tomi Valkeinen wrote:
>>>>>>> Commit 9495b7e92f716ab2bd6814fab5e97ab4a39adfdd ("driver core:
>>>>>>> platform: Initialize dma_parms for platform devices") v5.7-rc5 causes
>>>>>>> at least some v4l2 platform drivers to break when freeing resources.
>>>>>>>
>>>>>>> E.g. drivers/media/platform/ti-vpe/cal.c uses
>>>>>>> vb2_dma_contig_set_max_seg_size() and
>>>>>>> vb2_dma_contig_clear_max_seg_size() to manage the dma_params, and
>>>>>>> similar pattern is seen in other drivers too.
>>>>>>>
>>>>>>> After 9495b7e92f716ab2, vb2_dma_contig_set_max_seg_size() will not
>>>>>>> allocate anything, but vb2_dma_contig_clear_max_seg_size() will still
>>>>>>> kfree the dma_params.
>>>>>>>
>>>>>>> I'm not sure what's the proper fix here. A flag somewhere to indicate
>>>>>>> that vb2_dma_contig_set_max_seg_size() did allocate, and thus
>>>>>>> vb2_dma_contig_clear_max_seg_size() must free?
>>>>>>>
>>>>>>> Or drop the kzalloc and kfree totally, if dma_params is now supposed
>>>>>>> to always be there?
>>>>>> Thanks for reporting this issue!
>>>>>>
>>>>>> Once the mentioned commit has been merged, the code should assume that
>>>>>> the platform devices does have a struct dma_params allocated, so the
>>>>>> proper fix is to alloc dma_params only if the bus is not a platform
>>>>>> bus:
>>>>>>
>>>>>> if (!dev_is_platform(dev) && !dev->dma_parms) {
>>>>>>         dev->dma_parms = kzalloc(sizeof(*dev->dma_parms), GFP_KERNEL);
>>>>>>
>>>>>> same check for the free path.
>>>>> There is also "amba: Initialize dma_parms for amba devices". And the
>>>>> commit message says PCI devices do this too.
>>>>>
>>>>> Guessing this based on the device type doesn't sound like a good idea
>>>>> to me.
>>>> Indeed. Then replace the allocation with a simple check for NULL
>>>> dma_parms and return an error in such case. This should be enough for
>>>> v5.8. Later we can simply get rid of those helpers and inline setting
>>>> max segment size directly to the drivers.
> That seems like a good idea, in the long run.
>
>>> Is that valid either? Then we assume that dma_parms is always set up
>>> by someone else. That's true for platform devices and apparently some
>>> other devices, but is it true for all devices now?
>> # git grep vb2_dma_contig_set_max_seg_size | wc -l
>>
>> 18
>>
>> I've checked all clients of the vb2_dma_contig_set_max_seg_size
>> function. There are only 9 drivers, all of them are platform device
>> drivers. We don't care about off-tree users, so the proposed approach is
>> imho fine.
> Thanks for reporting and for looking into this. I apologize for the mess!
>
> There is one case, where the above solution could be a problem (unless
> I am wrong). That is, s5p_mfc_configure_2port_memory() that calls
> s5p_mfc_alloc_memdev(), which allocates/initializes an internal struct
> *device. Thus, this doesn't have the dev->dma_parms
> allocated/assigned.
Indeed, this one will fail.
> In other words, we would need to manage alloc/free for the
> dev->dma_parms to have a complete fix. Maybe in
> s5p_mfc_configure|unconfigure_2port_memory()!?
That would be the best place to allocate it.
> Additionally, I think reverting the offending commit, as discussed
> above, could cause even more issues, as it's even included for
> v5.6-stable kernels. I will go through all cases, more carefully this
> time, of how ->dma_parms is managed, to be sure there are no more
> conflicting cases.

I've already posted a fix for ExynosDRM driver, which is also affected: 
https://patchwork.kernel.org/patch/11559965/


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

