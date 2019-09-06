Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 565B4ABAD9
	for <lists+linux-media@lfdr.de>; Fri,  6 Sep 2019 16:29:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394451AbfIFO3F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Sep 2019 10:29:05 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:36696 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388545AbfIFO3F (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 6 Sep 2019 10:29:05 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 69C8BE935B408234D2E0;
        Fri,  6 Sep 2019 22:29:01 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Fri, 6 Sep 2019
 22:28:59 +0800
Subject: Re: [PATCH] media: staging: tegra-vde: Disable building with
 COMPILE_TEST
To:     Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
References: <20190826133140.13456-1-yuehaibing@huawei.com>
 <7f73bcac-f52d-f1b3-324c-e9b551c5378b@xs4all.nl>
 <20190829124034.GA19842@ulmo>
 <b048b460-9d58-8e38-e335-f9a3fface559@gmail.com>
 <20190829154902.GC19842@ulmo>
 <c4014675-8fc6-e947-7ac5-68795fd80bc0@gmail.com>
CC:     <mchehab@kernel.org>, <gregkh@linuxfoundation.org>,
        <jonathanh@nvidia.com>, <robin.murphy@arm.com>,
        <linux-media@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devel@driverdev.osuosl.org>, <linux-kernel@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <3ce3b6ed-86d3-55ac-462d-4bc91b7d04ed@huawei.com>
Date:   Fri, 6 Sep 2019 22:28:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <c4014675-8fc6-e947-7ac5-68795fd80bc0@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 2019/9/6 21:38, Dmitry Osipenko wrote:
> 29.08.2019 18:49, Thierry Reding пишет:
>> On Thu, Aug 29, 2019 at 04:58:22PM +0300, Dmitry Osipenko wrote:
>>> 29.08.2019 15:40, Thierry Reding пишет:
>>>> On Thu, Aug 29, 2019 at 01:39:32PM +0200, Hans Verkuil wrote:
>>>>> On 8/26/19 3:31 PM, YueHaibing wrote:
>>>>>> If COMPILE_TEST is y and IOMMU_SUPPORT is n, selecting TEGRA_VDE
>>>>>> to m will set IOMMU_IOVA to m, this fails the building of
>>>>>> TEGRA_HOST1X and DRM_TEGRA which is y like this:
>>>>>>
>>>>>> drivers/gpu/host1x/cdma.o: In function `host1x_cdma_init':
>>>>>> cdma.c:(.text+0x66c): undefined reference to `alloc_iova'
>>>>>> cdma.c:(.text+0x698): undefined reference to `__free_iova'
>>>>>>
>>>>>> drivers/gpu/drm/tegra/drm.o: In function `tegra_drm_unload':
>>>>>> drm.c:(.text+0xeb0): undefined reference to `put_iova_domain'
>>>>>> drm.c:(.text+0xeb4): undefined reference to `iova_cache_put'
>>>>>>
>>>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>>>> Fixes: 6b2265975239 ("media: staging: tegra-vde: Fix build error")
>>>>>> Fixes: b301f8de1925 ("media: staging: media: tegra-vde: Add IOMMU support")
>>>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>>>> ---
>>>>>>  drivers/staging/media/tegra-vde/Kconfig | 4 ++--
>>>>>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/staging/media/tegra-vde/Kconfig b/drivers/staging/media/tegra-vde/Kconfig
>>>>>> index ba49ea5..a41d30c 100644
>>>>>> --- a/drivers/staging/media/tegra-vde/Kconfig
>>>>>> +++ b/drivers/staging/media/tegra-vde/Kconfig
>>>>>> @@ -1,9 +1,9 @@
>>>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>>>  config TEGRA_VDE
>>>>>>  	tristate "NVIDIA Tegra Video Decoder Engine driver"
>>>>>> -	depends on ARCH_TEGRA || COMPILE_TEST
>>>>>> +	depends on ARCH_TEGRA
>>>>>
>>>>> What happens if you drop this change,
>>>>>
>>>>>>  	select DMA_SHARED_BUFFER
>>>>>> -	select IOMMU_IOVA if (IOMMU_SUPPORT || COMPILE_TEST)
>>>>>> +	select IOMMU_IOVA if IOMMU_SUPPORT
>>>>>
>>>>> but keep this change?
>>>>>
>>>>> iova.h has stubs that are used if IOMMU_IOVA is not set, so it should
>>>>> work when compile testing this tegra-vde driver.
>>>>>
>>>>> Haven't tried it, but making sure that compile testing keep working is
>>>>> really important.
>>>
>>> The driver's code compilation works okay, it's the linkage stage which
>>> fails during compile-testing.
>>>
>>>> Yeah, that variant seems to work for me. I think it's also more correct
>>>> because the IOMMU_IOVA if IOMMU_SUPPORT dependency really says that the
>>>> IOVA usage is bound to IOMMU support. If IOMMU support is not enabled,
>>>> then IOVA is not needed either, so the dummies will do just fine.
>>>
>>> Am I understanding correctly that you're suggesting to revert [1][2] and
>>> get back to the other problem?
>>>
>>> [1]
>>> https://lore.kernel.org/linux-media/dd547b44-7abb-371f-aeee-a82b96f824e2@gmail.com/T/
>>> [2] https://patchwork.ozlabs.org/patch/1136619/
>>>
>>> If we want to keep compile testing, I guess the only reasonable variant
>>> right now is to select IOMMU_IOVA unconditionally in all of the drivers
>>> (vde, host1x, drm and etc) and then just ignore that IOVA will be
>>> compiled-and-unused if IOMMU_SUPPORT=n (note that IOMMU_SUPPORT=y in all
>>> of default kernel configurations).
>>
>> Agreed. I think we should just select IOMMU_IOVA unconditionally. We
>> really do want IOMMU_SUPPORT always as well, but it might be nice to be
>> able to switch it off for testing or so. In the cases that really matter
>> we will be enabling both IOMMU_SUPPORT and IOMMU_IOVA anyway, so might
>> as well select IOMMU_IOVA always. It's not terribly big and I can't
>> imagine anyone wanting to run a kernel without IOMMU_SUPPORT for
>> anything other than testing.
> 
> Hello Yue,
> 
> Could you please make an updated version of the fix in accordance to the above comments?
> 
> Alternatively, we can go with the current patch and temporarily remove the compile-testing. I'll make
> patches to properly re-add compile-testing sometime later then.

I prefer to do this choice, thanks.

> 
> .
> 

