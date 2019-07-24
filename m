Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 018D173189
	for <lists+linux-media@lfdr.de>; Wed, 24 Jul 2019 16:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727822AbfGXOX7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jul 2019 10:23:59 -0400
Received: from foss.arm.com ([217.140.110.172]:42012 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726166AbfGXOX7 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jul 2019 10:23:59 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 007AC28;
        Wed, 24 Jul 2019 07:23:58 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 911C33F71A;
        Wed, 24 Jul 2019 07:23:56 -0700 (PDT)
Subject: Re: [PATCH] media: staging: ipu3: Enable IOVA API only when IOMMU
 support is enabled
To:     Dmitry Osipenko <digetx@gmail.com>,
        Yuehaibing <yuehaibing@huawei.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     devel@driverdev.osuosl.org, linux-media@vger.kernel.org,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux-foundation.org, hverkuil-cisco@xs4all.nl,
        mchehab@kernel.org, yong.zhi@intel.com
References: <20190722134749.21580-1-yuehaibing@huawei.com>
 <20190724103027.GD21370@paasikivi.fi.intel.com>
 <e48fc180-06cc-eac7-d8ca-9be1699c8677@arm.com>
 <0c08bdae-facc-0f28-0e58-17a65172587a@huawei.com>
 <491dbca1-8a58-b26e-cf56-a1a419da288f@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <eaf521ff-7dc6-70ae-0473-9c994def602b@arm.com>
Date:   Wed, 24 Jul 2019 15:23:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <491dbca1-8a58-b26e-cf56-a1a419da288f@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/07/2019 15:09, Dmitry Osipenko wrote:
> 24.07.2019 17:03, Yuehaibing пишет:
>> On 2019/7/24 21:49, Robin Murphy wrote:
>>> On 24/07/2019 11:30, Sakari Ailus wrote:
>>>> Hi Yue,
>>>>
>>>> On Mon, Jul 22, 2019 at 09:47:49PM +0800, YueHaibing wrote:
>>>>> If IOMMU_SUPPORT is not set, ipu3 driver may select IOMMU_IOVA to m.
>>>>> But for many drivers, they use "select IOMMU_IOVA if IOMMU_SUPPORT"
>>>>> in the Kconfig, for example, CONFIG_TEGRA_VDE is set to y but IOMMU_IOVA
>>>>> is m, then the building fails like this:
>>>>>
>>>>> drivers/staging/media/tegra-vde/iommu.o: In function `tegra_vde_iommu_map':
>>>>> iommu.c:(.text+0x41): undefined reference to `alloc_iova'
>>>>> iommu.c:(.text+0x56): undefined reference to `__free_iova'
>>>>>
>>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>>> Fixes: 7fc7af649ca7 ("media: staging/intel-ipu3: Add imgu top level pci device driver")
>>>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>>>> ---
>>>>>    drivers/staging/media/ipu3/Kconfig | 2 +-
>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/staging/media/ipu3/Kconfig b/drivers/staging/media/ipu3/Kconfig
>>>>> index 4b51c67..b7df18f 100644
>>>>> --- a/drivers/staging/media/ipu3/Kconfig
>>>>> +++ b/drivers/staging/media/ipu3/Kconfig
>>>>> @@ -4,7 +4,7 @@ config VIDEO_IPU3_IMGU
>>>>>        depends on PCI && VIDEO_V4L2
>>>>>        depends on MEDIA_CONTROLLER && VIDEO_V4L2_SUBDEV_API
>>>>>        depends on X86
>>>>> -    select IOMMU_IOVA
>>>>> +    select IOMMU_IOVA if IOMMU_SUPPORT
>>>>
>>>> This doesn't seem right: the ipu3-cio2 driver needs IOMMU_IOVA
>>>> independently of IOMMU_SUPPORT.
>>>>
>>>> Looking at tegra-vde, it seems to depend on IOMMU_SUPPORT but that's not
>>>> declared in its Kconfig entry. I wonder if adding that would be the right
>>>> way to fix this.
>>>>
>>>> Cc'ing the IOMMU list.
> IOMMU_SUPPORT is optional for the Tegra-VDE driver.
> 
>>> Right, I also had the impression that we'd made the IOVA library completely standalone. And what does the IPU3 driver's Kconfig have to do with some *other* driver failing to link anyway?
> 
> I can see it failing if IPU3 is compiled as a loadable module, while
> Tegra-VDE is a built-in driver. Hence IOVA lib should be also a kernel
> module and thus the IOVA symbols will be missing during of linkage of
> the VDE driver.
> 
>> Oh, I misunderstand that IOMMU_IOVA is depend on IOMMU_SUPPORT, thank you for clarification.
>>
>> I will try to fix this in tegra-vde.
> 
> Probably IOVA could be selected independently of IOMMU_SUPPORT, but IOVA
> library isn't needed for the VDE driver if IOMMU_SUPPORT is disabled.

Oh, I think I get the problem now - tegra-vde/iommu.c is built 
unconditionally and relies on the static inline stubs for IOMMU and IOVA 
calls if !IOMMU_SUPPORT, but in a compile-test config where IOVA=m for 
other reasons, it then picks up the real declarations from linux/iova.h 
instead of the stubs, and things go downhill from there. So there is a 
real issue, but indeed it's Tegra-VDE which needs to be restructured to 
cope with such configurations, and not IPU3's (or anyone else who may 
select IOVA=m in future) job to work around it.

Robin.
