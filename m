Return-Path: <linux-media+bounces-44083-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66390BC8F8A
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 14:16:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22C3B3B2718
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 12:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F93F2DF152;
	Thu,  9 Oct 2025 12:16:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBB9CBA3F;
	Thu,  9 Oct 2025 12:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760012182; cv=none; b=JWWRBROHwkFiJekZawb+v5LyR+GfZXFCqLjrXszlISo+rDAko7Zq4ijH518Y6BcuYM+wvGW4TAOb9b/5LB6Jfo7bHVI4M2YoQ7uZqthVae3/DhLjOohqT8zkzs4G2Hl5hT8OdUSVbIzxZIoQwj64PrT6iEJRnqtmN6Z1L8rqa70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760012182; c=relaxed/simple;
	bh=mCKEyRUdNIwoQi693Be3g9WMtS9hamqKlb0qQo8BiVE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOFJ4/zk/fWkKdYnyYDgE43d8xtNDhjfUj/U+pIeBg1jfYa9/DTiNHLjTavYuQ/sOhhkitiABmkYXVTPX146+rFdfrQBzbALSF4MviBeLU1VaNsPmM6iAUZ7fwkHiwynuOUVkiZq3Ny/llCekvJhajGi+YT9E1d8S3fVBojSj/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CB2D176A;
	Thu,  9 Oct 2025 05:16:12 -0700 (PDT)
Received: from [10.57.3.102] (unknown [10.57.3.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A78E3F66E;
	Thu,  9 Oct 2025 05:16:13 -0700 (PDT)
Message-ID: <496c2d88-2558-42fe-8434-81c000955a84@arm.com>
Date: Thu, 9 Oct 2025 13:16:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Cc: joro@8bytes.org, will@kernel.org, saravanak@google.com,
 conor+dt@kernel.org, mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org,
 abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <CAL_JsqK9waZK=i+ov0jV-PonWSfddwHvE94Q+pks4zAEtKc+yg@mail.gmail.com>
 <1d36569c-55b9-4390-87d1-fd0c2f837014@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <1d36569c-55b9-4390-87d1-fd0c2f837014@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2025-10-09 1:26 am, Krzysztof Kozlowski wrote:
> On 29/09/2025 05:23, Rob Herring wrote:
>> On Sun, Sep 28, 2025 at 12:17 PM Charan Teja Kalla
>> <charan.kalla@oss.qualcomm.com> wrote:
>>>
>>> This series introduces a new iommu property called iommu-map-masked(may
>>> be there is a better name), which is used to represent the IOMMU
>>> specifier pairs for each function of a __multi-functional platform
>>> device__, where each function can emit unique master id(s) that can be
>>> associated with individual translation context.
>>>
>>> Currently, the iommu configuration - at least for arm architecture-
>>> requires all the functions of a platform device will be represented
>>> under single dt node thus endup in using only a single translation
>>> context.
>>>
>>> A simple solution to associate individual translation context for each
>>> function of a device can be through creating per function child nodes in
>>> the device tree, but dt is only to just represent the soc layout to
>>> linux kernel.
>>>
>>> Supporting such cases requires a new iommu property called,
>>> iommu-map-masked(taking cue from iommu-map for pci devices) and syntax
>>> is:
>>>     iommu-map-masked = <FUNCTION_ID1 &iommu ID1 MASK1>,
>>>                        <FUNCTION_ID2 &iommu ID2 MASK2>;
>>> NOTE: As an RFC, it is considered that this property always expects 4
>>> cells.
>>>
>>> During the probe phase of the driver for a multi-functional device
>>> behind an IOMMU, a child device is instantiated for each FUNCTION_ID.
>>> The call to of_dma_configure_id() on each child sets up the IOMMU
>>> configuration, ensuring that each function of the device is associated
>>> with a distinct translation context.
>>>
>>> This property can also be used in association with 'iommus=' when dt
>>> bindings requires the presence of 'iommus=', example[2]. For these
>>> cases, representation will be(on arm64):
>>>     iommus = <&iommu sid mask>; //for default function.
>>>     iommu-map-masked = <FUNCTION_ID &iommu sid mask>;//additional
>>> function.
>>
>> Where does the FUNCTION_ID value come from?
>>
>> Why can't you just have multiple "iommus" entries where the index
>> defines the default and any FUNCTION_ID entries? What's in each index
>> is specific to the device.
> 
> 
> We discussed the problem earlier and that is what I asked them to do.
> Apparently I was just ignored so now two maintainers say the same. We
> can get ignored still and the third maintainer will have to tell this.

The reason why that isn't really viable is that the "iommus" property 
needs to be consumed directly by the relevant IOMMU driver(s) without a 
dependency on any driver for the client device represented by the node 
itself. For security/isolation purposes the IOMMU has to know about all 
potential DMA sources and be able to be configured for them *before* 
anyone else gets a chance to start initiating DMA from them. If the DT 
consumer is, say, a bare-metal hypervisor, it may have no understanding 
whatsoever of what most of the client devices are nor how they work.

This is part of the reason why we went for a separate "iommu-map" 
property for buses, so that an IOMMU consumer *can* easily tell when 
multiple specifiers do not represent an indivisible set tied to the 
given device, and thus it can expect help from a bus driver to subdivide 
them later (but in the meantime can still safely isolate the entire bus 
based on the output of the map without having to understand the inputs.)

Now, I suppose in some cases it might be technically possible for a 
client device driver to collude with an IOMMU driver to divide a 
monolithic DT device into logical functions after the fact, but for 
Linux I don't see an acceptable way of doing that without some major 
changes to the driver model abstraction and IOMMU API...

Thanks,
Robin.

