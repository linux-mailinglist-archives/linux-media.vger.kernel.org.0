Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00672254CCB
	for <lists+linux-media@lfdr.de>; Thu, 27 Aug 2020 20:18:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726953AbgH0SST (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Aug 2020 14:18:19 -0400
Received: from foss.arm.com ([217.140.110.172]:32922 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726243AbgH0SSS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Aug 2020 14:18:18 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35068101E;
        Thu, 27 Aug 2020 11:18:17 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C62533F68F;
        Thu, 27 Aug 2020 11:18:13 -0700 (PDT)
Subject: Re: [PATCH 13/18] iommu/tegra: Add IOMMU_DOMAIN_DMA support
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
        linux-tegra@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        digetx@gmail.com, will@kernel.org, hch@lst.de,
        linux-samsung-soc@vger.kernel.org, magnus.damm@gmail.com,
        linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
        kyungmin.park@samsung.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, inki.dae@samsung.com,
        linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
        linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
        linux-kernel@vger.kernel.org, t-kristo@ti.com,
        iommu@lists.linux-foundation.org
References: <cover.1597931875.git.robin.murphy@arm.com>
 <cd11bc7851dbe46db6d14821a942678047331913.1597931876.git.robin.murphy@arm.com>
 <20200827154502.GA1660457@ulmo>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <f6697e60-286c-f7c7-39d1-fe0784cc3e6d@arm.com>
Date:   Thu, 27 Aug 2020 19:18:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200827154502.GA1660457@ulmo>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-08-27 16:45, Thierry Reding wrote:
> On Thu, Aug 20, 2020 at 04:08:32PM +0100, Robin Murphy wrote:
>> Now that arch/arm is wired up for default domains and iommu-dma,
>> implement the corresponding driver-side support for DMA domains.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>> ---
>>   drivers/iommu/tegra-smmu.c | 37 +++++++++++++++++++++----------------
>>   1 file changed, 21 insertions(+), 16 deletions(-)
> 
> We can't do that yet because it will currently still break for use-cases
> such as display where we don't properly set up identity mappings during
> boot. The result is that the dma-iommu code will enable translations
> before the driver gets a chance to set up any mappings and if the
> display controller was left on by the bootloader, scanning out a splash
> screen, this causes faults between the point where dma-iommu is being
> set up for the display controller and where the display controller
> starts mapping its own buffers (rather than the ones mapped by the
> bootloader).

Rest assured that I understand the situation all too well ;) As with 
tegra-gart, the unspoken point here is that since tegra-smmu implements 
of_xlate(), then arm_setup_iommu_dma_ops() must already be causing the 
exact same problem, no? This patch only seeks to move any existing 
behaviour over to the common backend, regardless of whether it was ever 
really appropriate in the first place.

> That said, I do have a series that I've been carrying around for longer
> than I've wanted that does exactly this for Tegra SMMU and I'd prefer if
> you could drop this particular change from your series so that I can
> keep working on resolving the identity mapping issues first.

That would mean you'd see a functional change from the final patch, 
wherein nothing would ever be able to get translation unless drivers do 
their own explicit IOMMU API management. If you definitely want that 
change then OK, but it would still be nice to do it "properly" with 
IOMMU_DOMAIN_IDENTITY support, rather than just forcibly failing default 
domain allocation. I'm having a go at reworking the tegra-gart patch in 
that direction, so I can certainly try it for tegra-smmu as well.

Robin.
