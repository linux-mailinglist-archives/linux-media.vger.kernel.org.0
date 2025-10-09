Return-Path: <linux-media+bounces-44133-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E8DBCA506
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 19:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5AD861A61CB7
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 17:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 042FE23B615;
	Thu,  9 Oct 2025 17:03:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E34C621C9E5;
	Thu,  9 Oct 2025 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760029422; cv=none; b=GZxIb6f5wiI+5mGgpEYqQZ6hHYJ1du+SVTHS4CzH7ZWE0uo5F0c4PVzc2Wv2p9et75kNuoiiT5/ib/6pFLhbptTr7f2F/0o/t93raf+D4cxOmesPOr2QlRciJOEGw0BLXK8cRm+s8DuefptTF791YYMKiCRlVo7Tqz7Gh7u87BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760029422; c=relaxed/simple;
	bh=dvZuHKC+jRuZ29hsRElrVWZQ0CVV3aVULPajs+QQGIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UUaGiPPX3EQViPKPb78k5LBRz5yAAmtpHIZgizYC1pmgxWDtX46x8HwxpaOqL2uo2Pr4h4nPfZiOBzTj6Tf7fOVKPoAhkIj18E2TUf7jda09fo6Ae59ga7FV3Nr+x2Lciq3MWNKV4kbyGnP2jg2Q1wSyyOx9tCHCWXAY4N/aTjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42A761762;
	Thu,  9 Oct 2025 10:03:32 -0700 (PDT)
Received: from [10.57.3.102] (unknown [10.57.3.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75D333F66E;
	Thu,  9 Oct 2025 10:03:35 -0700 (PDT)
Message-ID: <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
Date: Thu, 9 Oct 2025 18:03:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
 will@kernel.org, saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
 mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org,
 abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 bjorn.andersson@oss.qualcomm.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
 <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
 <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <nzqte4glwtpjs5bhkxz43yhdufelxvqvzmg5tepudxwetimir3@bvlw5csjizsh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-10-09 2:19 pm, Dmitry Baryshkov wrote:
> On Thu, Oct 09, 2025 at 11:46:55AM +0100, Robin Murphy wrote:
>> On 2025-10-08 8:10 pm, Charan Teja Kalla wrote:
>>>
>>> On 9/29/2025 3:50 PM, Robin Murphy wrote:
>>>>> USECASE [1]:
>>>>> -----------
>>>>> Video IP, 32bit, have 2 hardware sub blocks(or can be called as
>>>>> functions) called as pixel and nonpixel blocks, that does decode and
>>>>> encode of the video stream. These sub blocks are __configured__ to
>>>>> generate different stream IDs.
>>>>
>>>> So please clarify why you can't:
>>>>
>>>> a) Describe the sub-blocks as individual child nodes each with their own
>>>> distinct "iommus" property
>>>>
>>>
>>> Thanks Robin for your time. Sorry for late reply as I really didn't have
>>> concrete answer for this question.
>>>
>>> First let me clarify the word "sub blocks" -- This is just the logical
>>> separation with no separate address space to really able to define them
>>> as sub devices. Think of it like a single video IP with 2 dma
>>> engines(used for pixel and non-pixel purpose).
>>>
>>> I should agree that the child-nodes in the device tree is the easy one
>>> and infact, it is how being used in downstream.
>>>
>>> For upstream -- Since there is no real address space to interact with
>>> these sub-blocks(or logical blocks), does it really qualify to define as
>>> child nodes in the device tree? I see there is some push back[1].
>>
>> Who says you need an address space? Child nodes without "reg" properties,
>> referenced by name, compatible or phandle, exist all over the place for all
>> manner of reasons. If there are distinct logical functions with their own
>> distinct hardware properties, then I would say having child nodes to
>> describe and associate those properties with their respective functions is
>> entirely natural and appropriate. The first example that comes to mind of
>> where this is a well-established practice is PMICs - to pick one at random:
>> Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
> 
> Logical function, that's correct. And also note, for PMICs that practice
> has bitten us back. For PM8008 we switched back to a non-subdevice
> representation.
> 
>> For bonus irony, you can't take the other approaches without inherently
>> *introducing* a notional address space in the form of your logical function
>> IDs anyway.
>>
>>>     > or:
>>>>
>>>> b) Use standard "iommu-map" which already supports mapping a masked
>>>> input ID to an arbitrary IOMMU specifier
>>>>
>>>
>>> I think clients is also required to program non-zero smr mask, where as
>>> iommu-map just maps the id to an IOMMU specifier(sid). Please LMK if I
>>> am unable to catch your thought here.
>> An IOMMU specifier is whatever the target IOMMU node's #iommu-cells says it
>> is. The fact that Linux's parsing code only works properly for #iommu-cells
>> = 1 is not really a DT binding problem (other than it stemming from a loose
>> assumption stated in the PCI binding's use of the property).
> 
> I really don't like the idea of extending the #iommu-cells. The ARM SMMU
> has only one cell, which is correct even for our platforms. The fact
> that we need to identify different IOMMU SIDs (and handle them in a
> differnt ways) is internal to the video device (and several other
> devices). There is nothing to be handled on the ARM SMMU side.

Huh? So if you prefer not to change anything, are you suggesting this 
series doesn't need to exist at all? Now I'm thoroughly confused...

If you want to use SMR masks, then you absolutely need #iommu-cells = 2, 
because that is the SMMU binding for using SMR masks. It would 
definitely not be OK to have some magic property trying to smuggle 
IOMMU-driver-specific data contrary to what the IOMMU node itself says. 
As for iommu-map, I don't see what would be objectionable about 
improving the parsing to respect a real #iommu-cells value rather than 
hard-coding an assumption. Yes, we'd probably need to forbid entries 
with length > 1 targeting IOMMUs with #iommu-cells > 1, since the notion 
of a linear relationship between the input ID and the output specifier 
falls apart when the specifier is complex, but that seems simple enough 
to implement and document (even if it's too fiddly to describe in the 
schema itself), and still certainly no worse than having another 
property that *is* just iommu-map with implicit length = 1.

And if you want individual StreamIDs for logical functions to be 
attachable to distinct contexts then those functions absolutely must be 
visible to the IOMMU layer and the SMMU driver as independent devices 
with their own unique properties, which means either they come that way 
from the DT as of_platform devices in the first place, or you implement 
a full bus_type abstraction which will have to be hooked up to the IOMMU 
layer. You cannot make IOMMU configuration "internal" to the actual 
client driver which is only allowed to bind *after* said IOMMU 
configuration has already been made.

Thanks,
Robin.

