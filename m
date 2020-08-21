Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB25824C92D
	for <lists+linux-media@lfdr.de>; Fri, 21 Aug 2020 02:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbgHUA3C (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Aug 2020 20:29:02 -0400
Received: from foss.arm.com ([217.140.110.172]:49090 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726735AbgHUA3C (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Aug 2020 20:29:02 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E07930E;
        Thu, 20 Aug 2020 17:29:01 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 09B773F71F;
        Thu, 20 Aug 2020 17:28:52 -0700 (PDT)
Subject: Re: [PATCH 12/18] iommu/tegra-gart: Add IOMMU_DOMAIN_DMA support
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
 <516b33118d489e56499ff8c64c019709b744110c.1597931876.git.robin.murphy@arm.com>
 <081f7532-9ca0-0af3-35a1-cbaba0782237@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <3a132bb0-f2e6-6f8d-6d0c-bc925dd23f06@arm.com>
Date:   Fri, 21 Aug 2020 01:28:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <081f7532-9ca0-0af3-35a1-cbaba0782237@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-08-20 21:16, Dmitry Osipenko wrote:
> 20.08.2020 18:08, Robin Murphy пишет:
>> Now that arch/arm is wired up for default domains and iommu-dma,
>> implement the corresponding driver-side support for DMA domains.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/tegra-gart.c | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/iommu/tegra-gart.c b/drivers/iommu/tegra-gart.c
>> index fac720273889..e081387080f6 100644
>> --- a/drivers/iommu/tegra-gart.c
>> +++ b/drivers/iommu/tegra-gart.c
>> @@ -9,6 +9,7 @@
>>   
>>   #define dev_fmt(fmt)	"gart: " fmt
>>   
>> +#include <linux/dma-iommu.h>
>>   #include <linux/io.h>
>>   #include <linux/iommu.h>
>>   #include <linux/moduleparam.h>
>> @@ -145,16 +146,22 @@ static struct iommu_domain *gart_iommu_domain_alloc(unsigned type)
>>   {
>>   	struct iommu_domain *domain;
> 
> Hello, Robin!
> 
> Tegra20 GART isn't a real IOMMU, but a small relocation aperture. We
> would only want to use it for a temporal mappings (managed by GPU
> driver) for the time while GPU hardware is busy and working with a
> sparse DMA buffers, the driver will take care of unmapping the sparse
> buffers once GPU work is finished [1]. In a case of contiguous DMA
> buffers, we want to bypass the IOMMU and use buffer's phys address
> because GART aperture is small and all buffers simply can't fit into
> GART for a complex GPU operations that involve multiple buffers [2][3].
> The upstream GPU driver still doesn't support GART, but eventually it
> needs to be changed.
> 
> [1]
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/gart.c#L489
> 
> [2]
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/gart.c#L542
> 
> [3]
> https://github.com/grate-driver/linux/blob/master/drivers/gpu/drm/tegra/uapi/patching.c#L90
> 
>> -	if (type != IOMMU_DOMAIN_UNMANAGED)
>> +	if (type != IOMMU_DOMAIN_UNMANAGED && type != IOMMU_DOMAIN_DMA)
>>   		return NULL;
> 
> Will a returned NULL tell to IOMMU core that implicit domain shouldn't
> be used? Is it possible to leave this driver as-is?

The aim of this patch was just to make the conversion without functional 
changes wherever possible, i.e. maintain an equivalent to the existing 
ARM behaviour of allocating its own implicit domains for everything. It 
doesn't represent any judgement of whether that was ever appropriate for 
this driver in the first place ;)

Hopefully my other reply already covered the degree of control drivers 
can have with proper default domains, but do shout if anything wasn't clear.

Cheers,
Robin.
