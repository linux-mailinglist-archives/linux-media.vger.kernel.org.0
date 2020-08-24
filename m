Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23E07250B33
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 23:56:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbgHXV4h (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 24 Aug 2020 17:56:37 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38154 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726090AbgHXV4g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 24 Aug 2020 17:56:36 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07OLtjYQ054833;
        Mon, 24 Aug 2020 16:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1598306145;
        bh=ToO+3NPhNZ4b2VimF7JI2m/Y+G+uDEUZKNJic2RPL6o=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ejZiB6taEENr+Hn0hc5bAxqg24U0O44RwRV6vWtKHX8yF2fcogQtJomSomBv68bsw
         PLYH2FmE7jGwhcY7LIUnfJ+iODjLSNf3FaJ0nJiaJysxQlv4DWvzMPBjl/LP0PdV54
         oEReJqNmiKlUmO1gpvLUOBekMLgyCfT8DdSLNWaM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07OLtiU8069939
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 24 Aug 2020 16:55:44 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 24
 Aug 2020 16:55:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 24 Aug 2020 16:55:43 -0500
Received: from [10.250.32.171] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07OLtgT3075587;
        Mon, 24 Aug 2020 16:55:43 -0500
Subject: Re: [PATCH 17/18] media/omap3isp: Clean up IOMMU workaround
To:     Robin Murphy <robin.murphy@arm.com>,
        Sakari Ailus <sakari.ailus@iki.fi>
CC:     <hch@lst.de>, <joro@8bytes.org>, <linux@armlinux.org.uk>,
        <will@kernel.org>, <inki.dae@samsung.com>,
        <sw0312.kim@samsung.com>, <kyungmin.park@samsung.com>,
        <m.szyprowski@samsung.com>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <vdumpa@nvidia.com>, <digetx@gmail.com>,
        <matthias.bgg@gmail.com>, <yong.wu@mediatek.com>,
        <geert+renesas@glider.be>, <magnus.damm@gmail.com>,
        <t-kristo@ti.com>, <laurent.pinchart@ideasonboard.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <iommu@lists.linux-foundation.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <dri-devel@lists.freedesktop.org>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <11d8419744e4e744a9448180801b0c4683328afd.1597931876.git.robin.murphy@arm.com>
 <20200820165339.GK7145@valkosipuli.retiisi.org.uk>
 <be010209-4abc-ba48-4e31-185427776a13@arm.com>
 <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
 <5190a40e-ad24-d98e-3588-b95592ea2db3@arm.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <86d2fb37-33b8-68f1-fe0c-dad496869b29@ti.com>
Date:   Mon, 24 Aug 2020 16:55:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5190a40e-ad24-d98e-3588-b95592ea2db3@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 8/20/20 6:01 PM, Robin Murphy wrote:
> On 2020-08-20 20:55, Sakari Ailus wrote:
>> On Thu, Aug 20, 2020 at 06:25:19PM +0100, Robin Murphy wrote:
>>> On 2020-08-20 17:53, Sakari Ailus wrote:
>>>> Hi Robin,
>>>>
>>>> On Thu, Aug 20, 2020 at 04:08:36PM +0100, Robin Murphy wrote:
>>>>> Now that arch/arm is wired up for default domains and iommu-dma, devices
>>>>> behind IOMMUs will get mappings set up automatically as appropriate, so
>>>>> there is no need for drivers to do so manually.
>>>>>
>>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>>
>>>> Thanks for the patch.
>>>
>>> Many thanks for testing so quickly!
>>>
>>>> I haven't looked at the details but it seems that this causes the buffer
>>>> memory allocation to be physically contiguous, which causes a failure to
>>>> allocate video buffers of entirely normal size. I guess that was not
>>>> intentional?
>>>
>>> Hmm, it looks like the device ends up with the wrong DMA ops, which implies
>>> something didn't go as expected with the earlier IOMMU setup and default
>>> domain creation. Chances are that either I missed some subtlety in the
>>> omap_iommu change, or I've fundamentally misjudged how the ISP probing works
>>> and it never actually goes down the of_iommu_configure() path in the first
>>> place. Do you get any messages from the IOMMU layer earlier on during boot?

Yeah, I don't think we go through the of_iommu_configure() path, the setup is
mostly done using .probe_device() and .attach_dev() ops. Since the MMUs are
present directly in the respective sub-systems and relies on the sub-system
clocking and power, the MMU itself is turned ON and enabled during .attach_dev().

regards
Suman

>>
>> I do get these:
>>
>> [    2.934936] iommu: Default domain type: Translated
>> [    2.940917] omap-iommu 480bd400.mmu: 480bd400.mmu registered
>> [    2.946899] platform 480bc000.isp: Adding to iommu group 0
>>
> 
> So that much looks OK, if there are no obvious errors. Unfortunately there's no
> easy way to tell exactly what of_iommu_configure() is doing (beyond enabling a
> couple of vague debug messages). The first thing I'll do tomorrow is
> double-check whether it's really working on my boards here, or whether I was
> just getting lucky with CMA... (I assume you don't have CMA enabled if you're
> ending up in remap_allocator_alloc())
> 
> Robin.

