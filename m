Return-Path: <linux-media+bounces-43420-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D213BAC799
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 12:28:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 587003AC226
	for <lists+linux-media@lfdr.de>; Tue, 30 Sep 2025 10:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7882F99AE;
	Tue, 30 Sep 2025 10:28:36 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 413CB4A01;
	Tue, 30 Sep 2025 10:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759228116; cv=none; b=qJGkwK65/baxso1eK40lKqbhubQI8PF7of/AVDecukkaTZA+5D6zztmQNzXSUXV8q5uNW3Bg3SWtvdVwfwVVpURM7jVKYCX4L8bXKOCXXrx4s7mMq1wG+VRWT3J7XTBh1GRFVNtKeHHO56fG/Cv1e52XtGcOqpKMiHKi4MQUKFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759228116; c=relaxed/simple;
	bh=s59PFNCPHyLtwtDwN9N0jTPkPhMXktvA5tBn6/gryFs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TlukBe/t/PEOZXB035gmJl81MZwtMX5Ftg3RUHpLi26nuUFV5cDNtDCtzBNMLe7K8uZEnMM8yqfWoHzd10FOg8+Nzdd27jBhIBOzc5yrqnyvhGzSAqHVsjHlVZDeqEFDyDb/2+6mdXCQFxvHDNDI/JCb+nayztS6lS2p0uchUo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A07C1424;
	Tue, 30 Sep 2025 03:28:25 -0700 (PDT)
Received: from [10.57.1.211] (unknown [10.57.1.211])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37B293F66E;
	Tue, 30 Sep 2025 03:28:21 -0700 (PDT)
Message-ID: <c5fe662c-8726-43f9-8c68-f3e45208fc56@arm.com>
Date: Tue, 30 Sep 2025 11:28:09 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: __iommu_attach_group: check for non-NULL
 blocking_domain
To: Hans Verkuil <hverkuil+cisco@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
References: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
 <20250929120734.GG2617119@nvidia.com>
 <58aabb55-0030-49df-81ed-d4a68174b57e@kernel.org>
 <20250929130214.GK2617119@nvidia.com>
 <4037d353-0ec4-4f68-a09c-564b93ba313b@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <4037d353-0ec4-4f68-a09c-564b93ba313b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-09-29 2:30 pm, Hans Verkuil wrote:
> On 29/09/2025 15:02, Jason Gunthorpe wrote:
>> On Mon, Sep 29, 2025 at 02:18:50PM +0200, Hans Verkuil wrote:
>>> On 29/09/2025 14:07, Jason Gunthorpe wrote:
>>>> On Mon, Sep 29, 2025 at 10:23:47AM +0200, Hans Verkuil wrote:
>>>>
>>>>> Since I am unfamiliar with the iommu core code, I am uncertain whether I am
>>>>> just papering over a bug elsewhere, or whether this is really the correct solution.
>>>>
>>>> It is papering over something, group->domain is not supposed to be
>>>> NULL at this point.. That probably means the iommu driver has not been
>>>
>>> It's group->blocking_domain that's NULL, not group->domain.
>>
>> Er, I thought you were hitting a false positive on this:
>>
>>    group->domain != group->blocking_domain
>>
>> ie NULL != NULL
>>
>> But I suppose the whole expression is checking for group->domain
>> already.
>>
>> All your patch does is entirely disable the safetly logic :\

Yeah, the real question is if group->domain is set to something non-NULL 
that isn't the default identity domain or the blocking domain, and 
shouldn't be the automatic ARM DMA domain because we've detached and got 
rid of that, then what the heck is it?

My best guess is that something went wrong with the prior detach back to 
(what should be) the identity domain, so the previous ARM domain is 
still in place and the failure to attach to a different user domain is 
technically legitimate - i.e. something's broken the intended logic of 
6bc076eec6f8 (which was apparently working at the time).

Thanks,
Robin.

>>
>> What is isp_attach_iommu() trying to accomplish? It does
>> arm_iommu_detach_device() and then arm_iommu_attach_device() ?
>>
>> Why?
>>
>> Is this trying to force a non-identity translation for ISP?
> 
> I have absolutely no idea. The commit where this was added is this:
> 
> ---------------------------------------------------------
> commit 2a0a5472af5caa0d0df334abb9975dc496f045da
> Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Date:   Thu Jan 2 20:06:08 2014 -0300
> 
> [media] omap3isp: Use the ARM DMA IOMMU-aware operations
> 
> Attach an ARM DMA I/O virtual address space to the ISP device. This
> switches to the IOMMU-aware ARM DMA backend, we can thus remove the
> explicit calls to the OMAP IOMMU map and unmap functions.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Acked-by: Sakari Ailus <sakari.ailus@iki.fi>
> Signed-off-by: Mauro Carvalho Chehab <m.chehab@samsung.com>
> ---------------------------------------------------------
> 
> 
> That's over 11 years ago. I've CC-ed Sakari in case he remembers something about
> this.
> 
> Later this was simplified a bit:
> 
> ---------------------------------------------------------
> commit fd8e2d4b393252505783656471465c7f85f3c0a9
> Author: Suman Anna <s-anna@ti.com>
> Date:   Wed Apr 12 00:21:32 2017 -0500
> 
> omap3isp: Remove iommu_group related code
> 
> The OMAP IOMMU driver has added the support for IOMMU groups internally,
> and the ISP device is automatically linked to the appropriate IOMMU group.
> So, remove the explicit function calls that creates/deletes an iommu_group
> and adds the ISP device to this group.
> ---------------------------------------------------------
> 
> 
> And finally the code detaching the device (which you referred to in your
> reply) was added here (much more recently):
> 
> ---------------------------------------------------------
> commit 6bc076eec6f85f778f33a8242b438e1bd9fcdd59
> Author: Robin Murphy <robin.murphy@arm.com>
> Date:   Mon Oct 28 17:58:36 2024 +0000
> 
> media: omap3isp: Handle ARM dma_iommu_mapping
> 
> It's no longer practical for the OMAP IOMMU driver to trick
> arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
> same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
> the arch code's dma_iommu_mapping out of the way to avoid problems.
> ---------------------------------------------------------
> 
> 
> All I know is that something is wrong after blocking_domain was added, which
> now causes the "failed to create ARM IOMMU mapping" error from isp.c when the
> omap3isp driver is probed.
> 
> My (very likely flawed) reasoning for this patch was that if there is no
> blocking_domain (i.e. it's a NULL pointer), then the group->domain should
> just be accepted. But that reasoning was just based on the field names, and with
> no actual understanding of what is going on here :-)
> 
> Regards,
> 
> 	Hans

