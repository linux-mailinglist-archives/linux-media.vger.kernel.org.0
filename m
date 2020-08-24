Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FCFE24FF74
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 16:02:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726886AbgHXOCB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 10:02:01 -0400
Received: from foss.arm.com ([217.140.110.172]:34574 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725780AbgHXOCA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 10:02:00 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C6AE61FB;
        Mon, 24 Aug 2020 07:01:58 -0700 (PDT)
Received: from [10.57.40.122] (unknown [10.57.40.122])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A711F3F71F;
        Mon, 24 Aug 2020 07:01:52 -0700 (PDT)
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
 <cb12808b-7316-19db-7413-b7f852a6f8ae@arm.com>
 <62a72187-442b-2103-46c3-39d3cd999f54@gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <affe2cfb-19e8-8e55-acd0-7170e274ab34@arm.com>
Date:   Mon, 24 Aug 2020 15:01:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <62a72187-442b-2103-46c3-39d3cd999f54@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-08-23 22:34, Dmitry Osipenko wrote:
> 21.08.2020 03:11, Robin Murphy пишет:
> ...
>>> Hello, Robin! Thank you for yours work!
>>>
>>> Some drivers, like this Tegra VDE (Video Decoder Engine) driver for
>>> example, do not want to use implicit IOMMU domain.
>>
>> That isn't (intentionally) changing here - the only difference should be
>> that instead of having the ARM-special implicit domain, which you have
>> to kick out of the way with the ARM-specific API before you're able to
>> attach your own domain, the implicit domain is now a proper IOMMU API
>> default domain, which automatically gets bumped by your attach. The
>> default domains should still only be created in the same cases that the
>> ARM dma_iommu_mappings were.
>>
>>> Tegra VDE driver
>>> relies on explicit IOMMU domain in a case of Tegra SMMU because VDE
>>> hardware can't access last page of the AS and because driver wants to
>>> reserve some fixed addresses [1].
>>>
>>> [1]
>>> https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/staging/media/tegra-vde/iommu.c#L100
>>>
>>>
>>> Tegra30 SoC supports up to 4 domains, hence it's not possible to afford
>>> wasting unused implicit domains. I think this needs to be addressed
>>> before this patch could be applied.
>>
>> Yeah, there is one subtle change in behaviour from removing the ARM
>> layer on top of the core API, in that the IOMMU driver will no longer
>> see an explicit detach call. Thus it does stand to benefit from being a
>> bit cleverer about noticing devices being moved from one domain to
>> another by an attach call, either by releasing the hardware context for
>> the inactive domain once the device(s) are moved across to the new one,
>> or by simply reprogramming the hardware context in-place for the new
>> domain's address space without allocating a new one at all (most of the
>> drivers that don't have multiple contexts already handle the latter
>> approach quite well).
>>
>>> Would it be possible for IOMMU drivers to gain support for filtering out
>>> devices in iommu_domain_alloc(dev, type)? Then perhaps Tegra SMMU driver
>>> could simply return NULL in a case of type=IOMMU_DOMAIN_DMA and
>>> dev=tegra-vde.
>>
>> If you can implement IOMMU_DOMAIN_IDENTITY by allowing the relevant
>> devices to bypass translation entirely without needing a hardware
>> context (or at worst, can spare one context which all identity-mapped
>> logical domains can share), then you could certainly do that kind of
>> filtering with the .def_domain_type callback if you really wanted to. As
>> above, the intent is that that shouldn't be necessary for this
>> particular case, since only one of a group's default domain and
>> explicitly attached domain can be live at any given time, so the driver
>> should be able to take advantage of that.
>>
>> If you simply have more active devices (groups) than available contexts
>> then yes, you probably would want to do some filtering to decide who
>> deserves a translation domain and who doesn't, but in that case you
>> should already have had a long-standing problem with the ARM implicit
>> domains.
>>
>>> Alternatively, the Tegra SMMU could be changed such that the devices
>>> will be attached to a domain at the time of a first IOMMU mapping
>>> invocation instead of attaching at the time of attach_dev() callback
>>> invocation.
>>>
>>> Or maybe even IOMMU core could be changed to attach devices at the time
>>> of the first IOMMU mapping invocation? This could be a universal
>>> solution for all drivers.
>>
>> I suppose technically you could do that within an IOMMU driver already
>> (similar to how some defer most of setup that logically belongs to
>> ->domain_alloc until the first ->attach_dev). It's a bit grim from the
>> caller's PoV though, in terms of the failure mode being non-obvious and
>> having no real way to recover. Again, you'd be better off simply making
>> decisions up-front at domain_alloc or attach time based on the domain type.
> 
> Robin, thank you very much for the clarifications!
> 
> In accordance to yours comments, this patch can't be applied until Tegra
> SMMU will support IOMMU_DOMAIN_IDENTITY and implement def_domain_type()
> callback that returns IOMMU_DOMAIN_IDENTITY for the VDE device.
> 
> Otherwise you're breaking the VDE driver because
> dma_buf_map_attachment() [1] returns the IOMMU SGT of the implicit
> domain which is then mapped into the VDE's explicit domain [2], and this
> is a nonsense.

It's true that iommu_dma_ops will do some work in the unattached default 
domain, but non-coherent cache maintenance will still be performed 
correctly on the underlying memory, which is really all that you care 
about for this case. As for tegra_vde_iommu_map(), that seems to do the 
right thing in only referencing the physical side of the scatterlist 
(via iommu_map_sg()) and ignoring the DMA side, so things ought to work 
out OK even if it is a little non-obvious.

> [1]
> https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/staging/media/tegra-vde/dmabuf-cache.c#L102
> 
> [2]
> https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/staging/media/tegra-vde/dmabuf-cache.c#L122
> 
> Hence, either VDE driver should bypass iommu_dma_ops from the start or
> it needs a way to kick out the ops, like it does this using ARM's
> arm_iommu_detach_device().
> 
> 
> The same applies to the Tegra GPU devices, otherwise you're breaking
> them as well because Tegra DRM is sensible to implicit vs explicit domain.

Note that Tegra DRM will only be as broken as its current state on 
arm64, and I was under the impression that that was OK now - at least I 
don't recall seeing any complaints since 43c5bf11a610. Although that 
commit and the one before it are resolving the scalability issue that 
they describe, it was very much in my mind at the time that they also 
have the happy side-effect described above - the default domain isn't 
*completely* out of the way, but it's far enough that sensible cases 
should be able to work as expected.

> BTW, I tried to apply this series and T30 doesn't boot anymore. I don't
> have more info for now.

Yeah, I'm still trying to get to the bottom of whether it's actually 
working as intended at all, even on my RK3288. So far my debugging 
instrumentation has been confusingly inconclusive :/

Robin.
