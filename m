Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D71CE24C902
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 02:12:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726840AbgHUAMI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 20:12:08 -0400
Received: from foss.arm.com ([217.140.110.172]:48692 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725859AbgHUAMF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 20:12:05 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF7E230E;
        Thu, 20 Aug 2020 17:12:04 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 346943F71F;
        Thu, 20 Aug 2020 17:11:59 -0700 (PDT)
Subject: Re: [PATCH 16/18] staging/media/tegra-vde: Clean up IOMMU workaround
To:     Dmitry Osipenko <digetx@gmail.com>, hch@lst.de, joro@8bytes.org,
        linux@armlinux.org.uk
Cc:     will@kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, m.szyprowski@samsung.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        thierry.reding@gmail.com, jonathanh@nvidia.com, vdumpa@nvidia.com,
        matthias.bgg@gmail.com, yong.wu@mediatek.com,
        geert+renesas@glider.be, magnus.damm@gmail.com, t-kristo@ti.com,
        s-anna@ti.com, laurent.pinchart@ideasonboard.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
        dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <cover.1597931875.git.robin.murphy@arm.com>
 <3535c205b9bce52556abbf2f63384fb38e009df9.1597931876.git.robin.murphy@arm.com>
 <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com>
Date:   Fri, 21 Aug 2020 01:11:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <07135a55-cbc9-83e5-60dc-731282192554@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-08-20 20:51, Dmitry Osipenko wrote:
> 20.08.2020 18:08, Robin Murphy пишет:
>> Now that arch/arm is wired up for default domains and iommu-dma, we no
>> longer need to work around the arch-private mapping.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/staging/media/tegra-vde/iommu.c | 12 ------------
>>   1 file changed, 12 deletions(-)
>>
>> diff --git a/drivers/staging/media/tegra-vde/iommu.c b/drivers/staging/media/tegra-vde/iommu.c
>> index 6af863d92123..4f770189ed34 100644
>> --- a/drivers/staging/media/tegra-vde/iommu.c
>> +++ b/drivers/staging/media/tegra-vde/iommu.c
>> @@ -10,10 +10,6 @@
>>   #include <linux/kernel.h>
>>   #include <linux/platform_device.h>
>>   
>> -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
>> -#include <asm/dma-iommu.h>
>> -#endif
>> -
>>   #include "vde.h"
>>   
>>   int tegra_vde_iommu_map(struct tegra_vde *vde,
>> @@ -70,14 +66,6 @@ int tegra_vde_iommu_init(struct tegra_vde *vde)
>>   	if (!vde->group)
>>   		return 0;
>>   
>> -#if IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU)
>> -	if (dev->archdata.mapping) {
>> -		struct dma_iommu_mapping *mapping = to_dma_iommu_mapping(dev);
>> -
>> -		arm_iommu_detach_device(dev);
>> -		arm_iommu_release_mapping(mapping);
>> -	}
>> -#endif
>>   	vde->domain = iommu_domain_alloc(&platform_bus_type);
>>   	if (!vde->domain) {
>>   		err = -ENOMEM;
>>
> 
> Hello, Robin! Thank you for yours work!
> 
> Some drivers, like this Tegra VDE (Video Decoder Engine) driver for
> example, do not want to use implicit IOMMU domain.

That isn't (intentionally) changing here - the only difference should be 
that instead of having the ARM-special implicit domain, which you have 
to kick out of the way with the ARM-specific API before you're able to 
attach your own domain, the implicit domain is now a proper IOMMU API 
default domain, which automatically gets bumped by your attach. The 
default domains should still only be created in the same cases that the 
ARM dma_iommu_mappings were.

> Tegra VDE driver
> relies on explicit IOMMU domain in a case of Tegra SMMU because VDE
> hardware can't access last page of the AS and because driver wants to
> reserve some fixed addresses [1].
> 
> [1]
> https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/staging/media/tegra-vde/iommu.c#L100
> 
> Tegra30 SoC supports up to 4 domains, hence it's not possible to afford
> wasting unused implicit domains. I think this needs to be addressed
> before this patch could be applied.

Yeah, there is one subtle change in behaviour from removing the ARM 
layer on top of the core API, in that the IOMMU driver will no longer 
see an explicit detach call. Thus it does stand to benefit from being a 
bit cleverer about noticing devices being moved from one domain to 
another by an attach call, either by releasing the hardware context for 
the inactive domain once the device(s) are moved across to the new one, 
or by simply reprogramming the hardware context in-place for the new 
domain's address space without allocating a new one at all (most of the 
drivers that don't have multiple contexts already handle the latter 
approach quite well).

> Would it be possible for IOMMU drivers to gain support for filtering out
> devices in iommu_domain_alloc(dev, type)? Then perhaps Tegra SMMU driver
> could simply return NULL in a case of type=IOMMU_DOMAIN_DMA and
> dev=tegra-vde.

If you can implement IOMMU_DOMAIN_IDENTITY by allowing the relevant 
devices to bypass translation entirely without needing a hardware 
context (or at worst, can spare one context which all identity-mapped 
logical domains can share), then you could certainly do that kind of 
filtering with the .def_domain_type callback if you really wanted to. As 
above, the intent is that that shouldn't be necessary for this 
particular case, since only one of a group's default domain and 
explicitly attached domain can be live at any given time, so the driver 
should be able to take advantage of that.

If you simply have more active devices (groups) than available contexts 
then yes, you probably would want to do some filtering to decide who 
deserves a translation domain and who doesn't, but in that case you 
should already have had a long-standing problem with the ARM implicit 
domains.

> Alternatively, the Tegra SMMU could be changed such that the devices
> will be attached to a domain at the time of a first IOMMU mapping
> invocation instead of attaching at the time of attach_dev() callback
> invocation.
> 
> Or maybe even IOMMU core could be changed to attach devices at the time
> of the first IOMMU mapping invocation? This could be a universal
> solution for all drivers.

I suppose technically you could do that within an IOMMU driver already 
(similar to how some defer most of setup that logically belongs to 
->domain_alloc until the first ->attach_dev). It's a bit grim from the 
caller's PoV though, in terms of the failure mode being non-obvious and 
having no real way to recover. Again, you'd be better off simply making 
decisions up-front at domain_alloc or attach time based on the domain type.

Robin.
