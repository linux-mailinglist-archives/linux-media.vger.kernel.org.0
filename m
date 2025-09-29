Return-Path: <linux-media+bounces-43342-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FBDBA95AE
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 15:30:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6AF13A8A41
	for <lists+linux-media@lfdr.de>; Mon, 29 Sep 2025 13:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D69D221FB2;
	Mon, 29 Sep 2025 13:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVIc60Ya"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB96E145B16;
	Mon, 29 Sep 2025 13:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759152625; cv=none; b=pAcAP/tANzrlHzmIP5AIwjkogHcIs8ylvvt2eBSwtRrwpphXYUoqdX85W9aamFu4VFGnm5WQs5BD27Uj6KPlOihAfP03uD3D2T7y1qaH51Xd0I5dyzC9bOwBw8aTU8LvyJCxoOt/N/3GngDz4FfzZxp9OfHA2Gey/CLguMojtGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759152625; c=relaxed/simple;
	bh=uHgIBibYdlDuNfkcTOkEkYN0C68bkD2VvKTcK12DGcw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Tdp9/DD5UyIqS1RlfGGUtqMwOyGJHdlr1N9kG+4xSGaonO4l6WE5vIxeiRoIQN9Q/EwMlE2eWG7yvPlUZ31RiRQzJdrfYpYctJb/3XuZv9HIYcnJPdsaSHAekq6+UDq7UbKWZvtNLEg3lUUgwLS0wBBNDIAlv/1+Gm/lwCjzWiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVIc60Ya; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 137CBC4CEF4;
	Mon, 29 Sep 2025 13:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759152625;
	bh=uHgIBibYdlDuNfkcTOkEkYN0C68bkD2VvKTcK12DGcw=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=oVIc60Yau39MZ5crY2C3OPLwS1iKMficNc3xTJAZnJKumjxSf2zk6rRZVQd6Uizbf
	 Wn5Fm5mV4MfZikLDTjVSE7V84C7SUlpeTHnNZ+NaV1BgiMitNuZdB5HmXKRUWFxuHv
	 er7z2RT864Lnal50po44+o6GwdxK9TOEoxIJjiqPuGHkVycUBdh3Lx9XmtO2dcRMrj
	 eRs8nP3dpiD5Pv4Kt6v2cyyvzuwC2bGm9r3FNLOdZ+sTNFFyjnfosFPSq3CfSxm6I1
	 hj25AryanGK0K1Dx1WWmg3UjRUXEuGmR90SnPhnjE8IGHjOh+P6zZcVygoiGAgYQpB
	 +5xYTdb8cYtHA==
Message-ID: <4037d353-0ec4-4f68-a09c-564b93ba313b@kernel.org>
Date: Mon, 29 Sep 2025 15:30:22 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH] iommu: __iommu_attach_group: check for non-NULL
 blocking_domain
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Linux Kernel <linux-kernel@vger.kernel.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Robin Murphy <robin.murphy@arm.com>
References: <9a3ebe9b-518e-49ef-b87d-925d951a446f@kernel.org>
 <20250929120734.GG2617119@nvidia.com>
 <58aabb55-0030-49df-81ed-d4a68174b57e@kernel.org>
 <20250929130214.GK2617119@nvidia.com>
Content-Language: en-US, nl
In-Reply-To: <20250929130214.GK2617119@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/09/2025 15:02, Jason Gunthorpe wrote:
> On Mon, Sep 29, 2025 at 02:18:50PM +0200, Hans Verkuil wrote:
>> On 29/09/2025 14:07, Jason Gunthorpe wrote:
>>> On Mon, Sep 29, 2025 at 10:23:47AM +0200, Hans Verkuil wrote:
>>>
>>>> Since I am unfamiliar with the iommu core code, I am uncertain whether I am
>>>> just papering over a bug elsewhere, or whether this is really the correct solution.
>>>
>>> It is papering over something, group->domain is not supposed to be
>>> NULL at this point.. That probably means the iommu driver has not been
>>
>> It's group->blocking_domain that's NULL, not group->domain.
> 
> Er, I thought you were hitting a false positive on this:
> 
>   group->domain != group->blocking_domain
> 
> ie NULL != NULL
> 
> But I suppose the whole expression is checking for group->domain
> already.
> 
> All your patch does is entirely disable the safetly logic :\
> 
> What is isp_attach_iommu() trying to accomplish? It does
> arm_iommu_detach_device() and then arm_iommu_attach_device() ?
> 
> Why?
> 
> Is this trying to force a non-identity translation for ISP?

I have absolutely no idea. The commit where this was added is this:

---------------------------------------------------------
commit 2a0a5472af5caa0d0df334abb9975dc496f045da
Author: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date:   Thu Jan 2 20:06:08 2014 -0300

[media] omap3isp: Use the ARM DMA IOMMU-aware operations

Attach an ARM DMA I/O virtual address space to the ISP device. This
switches to the IOMMU-aware ARM DMA backend, we can thus remove the
explicit calls to the OMAP IOMMU map and unmap functions.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Sakari Ailus <sakari.ailus@iki.fi>
Signed-off-by: Mauro Carvalho Chehab <m.chehab@samsung.com>
---------------------------------------------------------


That's over 11 years ago. I've CC-ed Sakari in case he remembers something about
this.

Later this was simplified a bit:

---------------------------------------------------------
commit fd8e2d4b393252505783656471465c7f85f3c0a9
Author: Suman Anna <s-anna@ti.com>
Date:   Wed Apr 12 00:21:32 2017 -0500

omap3isp: Remove iommu_group related code

The OMAP IOMMU driver has added the support for IOMMU groups internally,
and the ISP device is automatically linked to the appropriate IOMMU group.
So, remove the explicit function calls that creates/deletes an iommu_group
and adds the ISP device to this group.
---------------------------------------------------------


And finally the code detaching the device (which you referred to in your
reply) was added here (much more recently):

---------------------------------------------------------
commit 6bc076eec6f85f778f33a8242b438e1bd9fcdd59
Author: Robin Murphy <robin.murphy@arm.com>
Date:   Mon Oct 28 17:58:36 2024 +0000

media: omap3isp: Handle ARM dma_iommu_mapping

It's no longer practical for the OMAP IOMMU driver to trick
arm_setup_iommu_dma_ops() into ignoring its presence, so let's use the
same tactic as other IOMMU API users on 32-bit ARM and explicitly kick
the arch code's dma_iommu_mapping out of the way to avoid problems.
---------------------------------------------------------


All I know is that something is wrong after blocking_domain was added, which
now causes the "failed to create ARM IOMMU mapping" error from isp.c when the
omap3isp driver is probed.

My (very likely flawed) reasoning for this patch was that if there is no
blocking_domain (i.e. it's a NULL pointer), then the group->domain should
just be accepted. But that reasoning was just based on the field names, and with
no actual understanding of what is going on here :-)

Regards,

	Hans

