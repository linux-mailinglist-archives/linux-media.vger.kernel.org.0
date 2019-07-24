Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64398730D4
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 16:03:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727266AbfGXODt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 10:03:49 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:50252 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726622AbfGXODs (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 10:03:48 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 2CBBFA9AC7F18D8330B1;
        Wed, 24 Jul 2019 22:03:32 +0800 (CST)
Received: from [127.0.0.1] (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Wed, 24 Jul 2019
 22:03:27 +0800
Subject: Re: [PATCH] media: staging: ipu3: Enable IOVA API only when IOMMU
 support is enabled
To:     Robin Murphy <robin.murphy@arm.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
References: <20190722134749.21580-1-yuehaibing@huawei.com>
 <20190724103027.GD21370@paasikivi.fi.intel.com>
 <e48fc180-06cc-eac7-d8ca-9be1699c8677@arm.com>
CC:     <devel@driverdev.osuosl.org>, <linux-media@vger.kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>, <hverkuil-cisco@xs4all.nl>,
        <digetx@gmail.com>, <mchehab@kernel.org>, <yong.zhi@intel.com>
From:   Yuehaibing <yuehaibing@huawei.com>
Message-ID: <0c08bdae-facc-0f28-0e58-17a65172587a@huawei.com>
Date:   Wed, 24 Jul 2019 22:03:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <e48fc180-06cc-eac7-d8ca-9be1699c8677@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2019/7/24 21:49, Robin Murphy wrote:
> On 24/07/2019 11:30, Sakari Ailus wrote:
>> Hi Yue,
>>
>> On Mon, Jul 22, 2019 at 09:47:49PM +0800, YueHaibing wrote:
>>> If IOMMU_SUPPORT is not set, ipu3 driver may select IOMMU_IOVA to m.
>>> But for many drivers, they use "select IOMMU_IOVA if IOMMU_SUPPORT"
>>> in the Kconfig, for example, CONFIG_TEGRA_VDE is set to y but IOMMU_IOVA
>>> is m, then the building fails like this:
>>>
>>> drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
>>> iommu.c:(.text+0x41): undefined reference to `alloc_iova'
>>> iommu.c:(.text+0x56): undefined reference to `__free_iova'
>>>
>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>> Fixes: 7fc7af649ca7 ("media: staging/intel-ipu3: Add imgu top level pci device driver")
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>>   drivers/staging/media/ipu3/Kconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
>>> index 4b51c67..b7df18f 100644
>>> --- a/drivers/staging/media/ipu3/Kconfig
>>> +++ b/drivers/staging/media/ipu3/Kconfig
>>> @@ -4,7 +4,7 @@ config VIDEO_IPU3_IMGU
>>>       depends on PCI && VIDEO_V4L2
>>>       depends on MEDIA_CONTROLLER && VIDEO_V4L2_SUBDEV_API
>>>       depends on X86
>>> -    select IOMMU_IOVA
>>> +    select IOMMU_IOVA if IOMMU_SUPPORT
>>
>> This doesn't seem right: the ipu3-cio2 driver needs IOMMU_IOVA
>> independently of IOMMU_SUPPORT.
>>
>> Looking at tegra-vde, it seems to depend on IOMMU_SUPPORT but that's not
>> declared in its Kconfig entry. I wonder if adding that would be the right
>> way to fix this.
>>
>> Cc'ing the IOMMU list.
> 
> Right, I also had the impression that we'd made the IOVA library completely standalone. And what does the IPU3 driver's Kconfig have to do with some *other* driver failing to link anyway?

Oh, I misunderstand that IOMMU_IOVA is depend on IOMMU_SUPPORT, thank you for clarification.

I will try to fix this in tegra-vde.

> 
> Robin.
> 
>>
>>>       select VIDEOBUF2_DMA_SG
>>>       help
>>>         This is the Video4Linux2 driver for Intel IPU3 image processing unit,
>>
> 
> .
> 

