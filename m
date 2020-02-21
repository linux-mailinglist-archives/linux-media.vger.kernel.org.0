Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3E56167E16
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2020 14:11:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728474AbgBUNLv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 Feb 2020 08:11:51 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47729 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728186AbgBUNLu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 Feb 2020 08:11:50 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20200221131149euoutp0213ee5999a1eab5b8f3621cf4f955b396~1bQRN61oO2544825448euoutp02v
        for <linux-media@vger.kernel.org>; Fri, 21 Feb 2020 13:11:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20200221131149euoutp0213ee5999a1eab5b8f3621cf4f955b396~1bQRN61oO2544825448euoutp02v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1582290709;
        bh=bSQR0Sl96ylNhB7cys1Drb6rlGrFHTrTpHmdbhqqRDo=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=Mb3Dpm7zc0j0nran4gFq5hicigx+/2ee9OuJ3TVVTZZwEg/RFVw4aQEIn+3YoWp7U
         wp+IUjPOTt/Tu9HgU+cuYP8/Cr7J4Qsw+/RM+zait4OMFHjZtyj9KxsMefRmjDdGAF
         HG6XYoluuQ+y2AknXNuComGxIjX5xrQ9JpbWodQE=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200221131149eucas1p23a1da9ddc51be74582c15ca6517e90bc~1bQRE2L6F3052530525eucas1p2L;
        Fri, 21 Feb 2020 13:11:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 41.20.60698.517DF4E5; Fri, 21
        Feb 2020 13:11:49 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200221131148eucas1p1c46f47f47528f1850d6c8d65032cf5dd~1bQQv8vH_2828128281eucas1p14;
        Fri, 21 Feb 2020 13:11:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20200221131148eusmtrp1c0c726296b9f0510908395ba8da63945~1bQQvacVz2587625876eusmtrp1a;
        Fri, 21 Feb 2020 13:11:48 +0000 (GMT)
X-AuditID: cbfec7f5-a29ff7000001ed1a-39-5e4fd7154df8
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 02.17.08375.417DF4E5; Fri, 21
        Feb 2020 13:11:48 +0000 (GMT)
Received: from [106.120.51.15] (unknown [106.120.51.15]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20200221131148eusmtip1bba30d1ac9e767da9c8c07edf9440e50~1bQQeYrd21109211092eusmtip1g;
        Fri, 21 Feb 2020 13:11:48 +0000 (GMT)
Subject: Re: [RFC PATCH 8/9] exynos/s3c/s5p: drop VB2_USERPTR
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <74772846-f15e-bcdc-d092-346749bca5ba@samsung.com>
Date:   Fri, 21 Feb 2020 14:11:48 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d6dc1de9-0c4c-4fd5-fe10-34fc57d899b4@xs4all.nl>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOKsWRmVeSWpSXmKPExsWy7djPc7qi1/3jDLrPsVpcnHmXxaJnw1ZW
        i/anL5ktPrf+Y3Ng8ZjdcJHFY9OqTjaPz5vkPE59/cwewBLFZZOSmpNZllqkb5fAlbHxdAdT
        wWWhiueXXzI3ML7i62Lk5JAQMJHoWbiVqYuRi0NIYAWjxOKllxkhnC+MEpcm3WeFcD4zSsw+
        doMNpqX7yVEWiMRyRokF33qhqt4ySkz/0swOUiUsYCvRt+0IE4gtIuAvsb93Flg3s0C6xM/W
        y2BxNgFDia63XWBxXgE7ial7ITawCKhKdK+4xQxiiwrESsxeeZgFokZQ4uTMJ2A2J9j8mcwQ
        M+Ultr+dA2WLS9x6Mh/sIQmBdnaJT+8es0Oc7SKxbM0fZghbWOLV8S1QcRmJ05N7WCAamhkl
        Hp5byw7h9DBKXG6awQhRZS1x59wvoPM4gFZoSqzfpQ9iSgg4SnzcUA1h8knceCsIcQOfxKRt
        05khwrwSHW1CEDPUJGYdXwe39eCFS8wTGJVmIflsFpJvZiH5ZhbC2gWMLKsYxVNLi3PTU4uN
        81LL9YoTc4tL89L1kvNzNzECk8vpf8e/7mDc9yfpEKMAB6MSD6/DMf84IdbEsuLK3EOMEhzM
        SiK8ajx+cUK8KYmVValF+fFFpTmpxYcYpTlYlMR5jRe9jBUSSE8sSc1OTS1ILYLJMnFwSjUw
        5rRaMU14atFZt676Xm95yIIHTy/Xf92fkl27Uqcg5cAG2/2thxLy7r4/+an3uvyV6XtcJcoV
        tq3dlfjIrfvWDH418ZyYbbf3Hel6YbmvlaHh4pHK0PMlljI2NZ+nrp7S/myNfsLbq4o8Fikv
        budyzZm6IO5+yh5x3tXvPm41jZi4cCXTO5XzokosxRmJhlrMRcWJACtlknYqAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrFIsWRmVeSWpSXmKPExsVy+t/xu7oi1/3jDO5tNbS4OPMui0XPhq2s
        Fu1PXzJbfG79x+bA4jG74SKLx6ZVnWwenzfJeZz6+pk9gCVKz6Yov7QkVSEjv7jEVina0MJI
        z9DSQs/IxFLP0Ng81srIVEnfziYlNSezLLVI3y5BL2Pj6Q6mgstCFc8vv2RuYHzF18XIySEh
        YCLR/eQoSxcjF4eQwFJGiX0/nrFDJGQkTk5rYIWwhSX+XOtigyh6zSjx4PANNpCEsICtRN+2
        I0wgtoiAr8THZ5fAbGaBdInFM34zQjQcZJJY9GA1C0iCTcBQouttF1gzr4CdxNS9EINYBFQl
        ulfcYgaxRQViJW7M7GCCqBGUODnzCVgvJ9iymcwQC8wk5m1+CGXLS2x/OwfKFpe49WQ+0wRG
        oVlI2mchaZmFpGUWkpYFjCyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAuNp27Gfm3cwXtoY
        fIhRgINRiYfX4Zh/nBBrYllxZe4hRgkOZiURXjUevzgh3pTEyqrUovz4otKc1OJDjKZAz01k
        lhJNzgfGel5JvKGpobmFpaG5sbmxmYWSOG+HwMEYIYH0xJLU7NTUgtQimD4mDk6pBkYFC7Ow
        m9PCCkuFU0sZbyq21liGnWnZqLxS52iqbfyJXc9u7RRf2FRmMTfw8bFZZftZjwd/SXiyr5Al
        +f29+uN2tfPT5aLO+fcVaHv/qVZ98MrCTNtyr9gMzozYlmAz16U3v22rY8lNUlh9JkG7mSct
        rd5/nlbRNd7o8g1FkVaztWVazz/sUGIpzkg01GIuKk4EAFaeN/q9AgAA
X-CMS-MailID: 20200221131148eucas1p1c46f47f47528f1850d6c8d65032cf5dd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200221115434eucas1p19f9fcc967d4a0328d7da69e8bedef536
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200221115434eucas1p19f9fcc967d4a0328d7da69e8bedef536
References: <20200221084531.576156-1-hverkuil-cisco@xs4all.nl>
        <20200221084531.576156-9-hverkuil-cisco@xs4all.nl>
        <CAAFQd5D_=EqagJRx03N-1rGAyLz6AYsScB7bfAWVCSW=mbCRRA@mail.gmail.com>
        <CGME20200221115434eucas1p19f9fcc967d4a0328d7da69e8bedef536@eucas1p1.samsung.com>
        <d6dc1de9-0c4c-4fd5-fe10-34fc57d899b4@xs4all.nl>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 21.02.2020 12:54, Hans Verkuil wrote:
> On 2/21/20 9:53 AM, Tomasz Figa wrote:
>> Hi Hans,
>>
>> On Fri, Feb 21, 2020 at 5:46 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>>> The combination of VB2_USERPTR and dma-contig makes no sense for
>>> these devices, drop it.
>> Even though I personally don't like user pointers, I believe at least
>> some of those devices are fine with USERPTR in case they are behind an
>> IOMMU, like on the newer Exynos SoCs. +Marek Szyprowski too.
> I would like this to be tested. I always wonder if that has actually
> been tested, especially with regards to the partial first and last pages of
> the malloc()ed memory. I.e., worst case only 8 bytes may have to be written
> to a page if malloc() aligned the pointer poorly. Can the DMA handle that,
> even with an IOMMU?

Frankly, we never used USERPTR to access malloc()'ed memory, although it 
was possible with IOMMU and I remember I tested such case. USERPTR mode 
was mainly used to access buffers allocated and mmaped from different 
devices. In such case the alignment was already correct. Yes, this can 
be replaced with DMABUF, but that required a lots of changes in 
userspace libs/apps and using USERPTR was much simpler.

Afair the video devices had very capable DMA and they were able to 
transfer data to 8-byte aligned buffers. There was however a problem 
with CPU cache line size - the cache can be reliably managed only 
down-to cache line-size units, what means that some freshly modified by 
the CPU data before and after the buffer might be trashed if it was not 
aligned to CPU cache line size.

I won't cry much after that hack...

> Note that I have the same concern for VB2_USERPTR with dma-sg.
>
> This was a good opportunity to improve v4l2-compliance: it adds sentinels at
> the start/end of the buffer, and it checks that those sentinels are never
> overwritten. So if this test passes for a driver, then VB2_USERPTR can stay
> in, but it should probably have a comment that it has been tested with
> v4l2-compliance.
>
>> What makes you believe it makes no sense for them?
> Serious doubts that this has been properly tested :-)
> You really need a test like I wrote today for v4l2-compliance
> in order to be certain that it works.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

