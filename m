Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81A0720F22B
	for <lists+linux-media@lfdr.de>; Tue, 30 Jun 2020 12:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732224AbgF3KHc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Jun 2020 06:07:32 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52825 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732219AbgF3KHa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Jun 2020 06:07:30 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200630100728euoutp01266596500f3f299203bc41ce9d0cc557~dSmbWWQE50576305763euoutp01E
        for <linux-media@vger.kernel.org>; Tue, 30 Jun 2020 10:07:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200630100728euoutp01266596500f3f299203bc41ce9d0cc557~dSmbWWQE50576305763euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1593511648;
        bh=O/UBH/mKXDUvagNJHSuUhhTnnDt9JbXJsJdK+XPv5UI=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=j8Q/Z4e35QiEfKTKTCJwBL5aA7IF+lresLLZlOmyDg53EkTKpqLRcsa27diO0wyP6
         MCm1VO4ZWj8obBulZs/aCd6Rh37uhHpHRZ1cXs72rlrfPyi/qorGLNuiRFSxEI7m01
         /mnJTOahNA5rCJLLRVmOyoPHQMec176t7wRbIGUQ=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20200630100728eucas1p2058324a11592705d20c19eb2d4431545~dSma8s2PL2152321523eucas1p2k;
        Tue, 30 Jun 2020 10:07:28 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 16.AF.05997.0EE0BFE5; Tue, 30
        Jun 2020 11:07:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20200630100727eucas1p2c13e286da77ef5278226b3610faf0498~dSmakSGW83241632416eucas1p2M;
        Tue, 30 Jun 2020 10:07:27 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200630100727eusmtrp22b04e33a7a6e2b7d13c0605b6cc61d2e~dSmajTg-F0851908519eusmtrp2k;
        Tue, 30 Jun 2020 10:07:27 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-e6-5efb0ee08c13
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 5F.F1.06314.FDE0BFE5; Tue, 30
        Jun 2020 11:07:27 +0100 (BST)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200630100726eusmtip2e8258a38457a6d6c86f351b866a6b807~dSmZiHLma0424204242eusmtip2D;
        Tue, 30 Jun 2020 10:07:26 +0000 (GMT)
Subject: Re: [PATCH v7 31/36] staging: tegra-vde: fix common struct sg_table
 related issues
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <559970b6-e80f-90ec-7fb0-1fab742d99de@samsung.com>
Date:   Tue, 30 Jun 2020 12:07:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
        Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200621070015.0cf833ab@dimatab>
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SZ0xTURjNfauPhuKzoHzBQdIoRhNxEm6icRASn+GPfzSOgFR5AcJMy3QS
        ioMiCk6sWhBlyBApUAXFgcEWwUIEF+JAIIoJIrEiKyDtA+XfOec73/3OSS5Lys8xbmxoZIyg
        ilSGKxgpZXw23Lz8s9NowMru54443dJA4PKsMhpPGDNJ/KBpRIKLB7oQbvvdz2DNjTIG3yqu
        J3DOo3U4RZdLYWtbJ4ENXa9p3FpzlcGn7lTRONWqY3C+YYzAT35203i4Rk9tkvMl+hLEf3z4
        lOJrB3Movlr3QcIbilIZ/u7gZ5p/dK1Ewn9KMxF8xc2j/PvxLpI/97YA8fffJTF8uuYHw5+u
        LEL8L8PCbbN2S9cHCeGhcYJqxYZAaUh5s1YSfcY1of3jbyoJpThrkQML3FoofTVIapGUlXOF
        CIw/DIxIrAie3k2dIr8QFKfXoumVXrNmalCAwPzeQoikH8HllmHC5nLm/OHrsQHGhl04Dyio
        H6NtJpIbp6DwcQFlGzDcKtD2aSdNLCvjNsAVk5dNprjF8Ljztd0yZ/Kd03k59ndk3GxouNxt
        1x04T7A2dNhvkZw7aKqukCJ2hfbubHsg4MwsNH/JpcXYvjDUZCZE7AzfTZUSEc+HierpBQ2C
        TkupRCSnELQmZ02VXgcdlhF7UpJbCmU1K0R5M/T0Xkc2GTgneNs3WwzhBGeNl0hRlsHJ43LR
        7QE60+1/Z5+0vCQzkEI3o5puRh3djDq6/3dzEFWEXIVYdUSwoF4dKcR7qpUR6tjIYM/9UREG
        NPlVG8dN1nuoZmxfHeJYpHCUBVqGA+S0Mk6dGFGHgCUVLjKfF40BclmQMvGAoIraq4oNF9R1
        aB5LKVxla3J7/eVcsDJGCBOEaEE1PSVYB7ck5J5dccQnnj3gYKg8aPG9lR+VtqNK6renfXvs
        0KKMoIuVb0r6+hft4ne16realXqv0sDRT36HV/+JPhRWFhJjqp2LJGFe+i/UgsGmFDJzyc6B
        8/IdFwIUvm1bRk7sTj5jHFue8vzd0qyEet/6Hu+N3nuu5n9LOxvqlkgLfaXxLXkJHQpKHaJc
        tYxUqZV/AZvSq5+mAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCKsWRmVeSWpSXmKPExsVy+t/xe7r3+X7HGTxdomvRe+4kk8XGGetZ
        Lf5vm8hssefML3aL1R8fM1pc+fqezaJ58Xo2i5WrjzJZLNhvbdEyaxGLxZcrD5ksNj2+xmpx
        edccNoueDVtZLTq/zGKzWLbpD5PFwQ9PWC1+7prH4iDksWbeGkaPe/sOs3js/baAxWPnrLvs
        HptWdbJ5bP/2gNVj/9w17B73u48zeWxeUu9x+99jZo/JN5Yzeuy+2cDm0dv8js2jb8sqRo/P
        m+QC+KP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLLUov07RL0
        Mjae72Iv6BevuHXvK0sDY4twFyMnh4SAicTLE81sXYxcHEICSxkl7p7sZIVIyEicnNYAZQtL
        /LnWBVX0llHiyffDYAlhgViJ560f2UBsEQE1ieVH/4DFmQX+sUh0HrGFaHjFKDGr+TU7SIJN
        wFCi6y3IJA4OXgE7idnHTUHCLAKqEgceXmMBsUWBZn67twVsJq+AoMTJmU/A4pwCehJfTt5h
        gphvJjFv80NmCFteonnrbChbXOLWk/lMExiFZiFpn4WkZRaSlllIWhYwsqxiFEktLc5Nzy02
        1CtOzC0uzUvXS87P3cQITCHbjv3cvIPx0sbgQ4wCHIxKPLwJ537GCbEmlhVX5h5ilOBgVhLh
        dTp7Ok6INyWxsiq1KD++qDQntfgQoynQcxOZpUST84HpLa8k3tDU0NzC0tDc2NzYzEJJnLdD
        4GCMkEB6YklqdmpqQWoRTB8TB6dUA2NJy7UwZ+GelgfhQS9qFp7cc/PyR9PP2jZNy5lE52xX
        PbHuaGe0l/ujQoUu8f/npweke3zhmHNS6HqD4eOwC1du3TD9s2hm5BWGyYt2JK0rOv34ybSf
        3687uudvXjI/NOXwrroj911PvjkVOVdGY6t9T3tJxt7jzStj/kkw16ocWfU5ZVWVVWSXEktx
        RqKhFnNRcSIA0AcX0DcDAAA=
X-CMS-MailID: 20200630100727eucas1p2c13e286da77ef5278226b3610faf0498
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa
References: <20200619103636.11974-1-m.szyprowski@samsung.com>
        <CGME20200619103714eucas1p18db6efd1a380fc0bdb16174ee85036fa@eucas1p1.samsung.com>
        <20200619103636.11974-32-m.szyprowski@samsung.com>
        <20200621070015.0cf833ab@dimatab>
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21.06.2020 06:00, Dmitry Osipenko wrote:
> В Fri, 19 Jun 2020 12:36:31 +0200
> Marek Szyprowski <m.szyprowski@samsung.com> пишет:
>
>> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg()
>> function returns the number of the created entries in the DMA address
>> space. However the subsequent calls to the
>> dma_sync_sg_for_{device,cpu}() and dma_unmap_sg must be called with
>> the original number of the entries passed to the dma_map_sg().
>>
>> struct sg_table is a common structure used for describing a
>> non-contiguous memory buffer, used commonly in the DRM and graphics
>> subsystems. It consists of a scatterlist with memory pages and DMA
>> addresses (sgl entry), as well as the number of scatterlist entries:
>> CPU pages (orig_nents entry) and DMA mapped pages (nents entry).
>>
>> It turned out that it was a common mistake to misuse nents and
>> orig_nents entries, calling DMA-mapping functions with a wrong number
>> of entries or ignoring the number of mapped entries returned by the
>> dma_map_sg() function.
>>
>> To avoid such issues, lets use a common dma-mapping wrappers operating
>> directly on the struct sg_table objects and use scatterlist page
>> iterators where possible. This, almost always, hides references to the
>> nents and orig_nents entries, making the code robust, easier to follow
>> and copy/paste safe.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>   drivers/staging/media/tegra-vde/iommu.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/staging/media/tegra-vde/iommu.c
>> b/drivers/staging/media/tegra-vde/iommu.c index
>> 6af863d92123..adf8dc7ee25c 100644 ---
>> a/drivers/staging/media/tegra-vde/iommu.c +++
>> b/drivers/staging/media/tegra-vde/iommu.c @@ -36,8 +36,8 @@ int
>> tegra_vde_iommu_map(struct tegra_vde *vde,
>>   	addr = iova_dma_addr(&vde->iova, iova);
>>   
>> -	size = iommu_map_sg(vde->domain, addr, sgt->sgl, sgt->nents,
>> -			    IOMMU_READ | IOMMU_WRITE);
>> +	size = iommu_map_sgtable(vde->domain, addr, sgt,
>> +				 IOMMU_READ | IOMMU_WRITE);
>>   	if (!size) {
>>   		__free_iova(&vde->iova, iova);
>>   		return -ENXIO;
> Ahh, I saw the build failure report. You're changing the DMA API in
> this series, while DMA API isn't used by this driver, it uses IOMMU
> API. Hence there is no need to touch this code. Similar problem in the
> host1x driver patch.

The issue is caused by the lack of iommu_map_sgtable() stub when no 
IOMMU support is configured. I've posted a patch for this:

https://lore.kernel.org/lkml/20200630081756.18526-1-m.szyprowski@samsung.com/

The patch for this driver is fine, we have to wait until the above fix 
gets merged and then it can be applied during the next release cycle.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

