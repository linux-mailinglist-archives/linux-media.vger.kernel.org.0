Return-Path: <linux-media+bounces-44269-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C300BD2C2B
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 13:21:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 554393B1163
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 11:21:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643402566E2;
	Mon, 13 Oct 2025 11:21:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C850222587;
	Mon, 13 Oct 2025 11:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760354466; cv=none; b=liC2R/ERi4PdyCxgC2yKnei1f2idFVhgNZGLlTn/L15qVmHrSAVbzRNXoJJda6f9t20bvC2rGSR5Mnk7JlhQdzLp42w9HLGM23CpHEfZGbIgMovpniLKsxmpsjfm7b9Hiz+bD7gqWf5aQYJAjh5426EfPsQLMA7929vKcoPKwZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760354466; c=relaxed/simple;
	bh=tQje5bDbSj9y1kcqNgldXUREwqU4Y0MJp/r7D9wd3RA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I4Dzs4yoMXmYYiRMnypCyEs634TgJj242LWsJzU7lHKz0Yp+t70SmX3henegqm3lqonukkefj4uQbRC4/wIEUshdDAMTXzSyPNum8BORaAAV5hbrQZ/BOYfZeM5ISWGdpE/wJpTp4EWoAPSALwyI92xmiJLLKX7OiGFEwbaXVTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 531BF113E;
	Mon, 13 Oct 2025 04:20:55 -0700 (PDT)
Received: from [10.57.5.235] (unknown [10.57.5.235])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 90BB03F6A8;
	Mon, 13 Oct 2025 04:20:57 -0700 (PDT)
Message-ID: <8d88cd9d-16e8-43f9-8eb3-89862da1d0c1@arm.com>
Date: Mon, 13 Oct 2025 12:20:54 +0100
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
 <9d3eeb9f-b8ea-48e5-a1d9-0865f63ef991@arm.com>
 <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <fhb4woejzh3r6v5dxvdiopnsbuwstucfuuzbiymxg4wrxrjc7t@dt3z3utq6lwd>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-10-09 7:25 pm, Dmitry Baryshkov wrote:
> On Thu, Oct 09, 2025 at 06:03:29PM +0100, Robin Murphy wrote:
>> On 2025-10-09 2:19 pm, Dmitry Baryshkov wrote:
>>> On Thu, Oct 09, 2025 at 11:46:55AM +0100, Robin Murphy wrote:
>>>> On 2025-10-08 8:10 pm, Charan Teja Kalla wrote:
>>>>>
>>>>> On 9/29/2025 3:50 PM, Robin Murphy wrote:
>>>>>>> USECASE [1]:
>>>>>>> -----------
>>>>>>> Video IP, 32bit, have 2 hardware sub blocks(or can be called as
>>>>>>> functions) called as pixel and nonpixel blocks, that does decode and
>>>>>>> encode of the video stream. These sub blocks are __configured__ to
>>>>>>> generate different stream IDs.
>>>>>>
>>>>>> So please clarify why you can't:
>>>>>>
>>>>>> a) Describe the sub-blocks as individual child nodes each with their own
>>>>>> distinct "iommus" property
>>>>>>
>>>>>
>>>>> Thanks Robin for your time. Sorry for late reply as I really didn't have
>>>>> concrete answer for this question.
>>>>>
>>>>> First let me clarify the word "sub blocks" -- This is just the logical
>>>>> separation with no separate address space to really able to define them
>>>>> as sub devices. Think of it like a single video IP with 2 dma
>>>>> engines(used for pixel and non-pixel purpose).
>>>>>
>>>>> I should agree that the child-nodes in the device tree is the easy one
>>>>> and infact, it is how being used in downstream.
>>>>>
>>>>> For upstream -- Since there is no real address space to interact with
>>>>> these sub-blocks(or logical blocks), does it really qualify to define as
>>>>> child nodes in the device tree? I see there is some push back[1].
>>>>
>>>> Who says you need an address space? Child nodes without "reg" properties,
>>>> referenced by name, compatible or phandle, exist all over the place for all
>>>> manner of reasons. If there are distinct logical functions with their own
>>>> distinct hardware properties, then I would say having child nodes to
>>>> describe and associate those properties with their respective functions is
>>>> entirely natural and appropriate. The first example that comes to mind of
>>>> where this is a well-established practice is PMICs - to pick one at random:
>>>> Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml
>>>
>>> Logical function, that's correct. And also note, for PMICs that practice
>>> has bitten us back. For PM8008 we switched back to a non-subdevice
>>> representation.
>>>
>>>> For bonus irony, you can't take the other approaches without inherently
>>>> *introducing* a notional address space in the form of your logical function
>>>> IDs anyway.
>>>>
>>>>>      > or:
>>>>>>
>>>>>> b) Use standard "iommu-map" which already supports mapping a masked
>>>>>> input ID to an arbitrary IOMMU specifier
>>>>>>
>>>>>
>>>>> I think clients is also required to program non-zero smr mask, where as
>>>>> iommu-map just maps the id to an IOMMU specifier(sid). Please LMK if I
>>>>> am unable to catch your thought here.
>>>> An IOMMU specifier is whatever the target IOMMU node's #iommu-cells says it
>>>> is. The fact that Linux's parsing code only works properly for #iommu-cells
>>>> = 1 is not really a DT binding problem (other than it stemming from a loose
>>>> assumption stated in the PCI binding's use of the property).
>>>
>>> I really don't like the idea of extending the #iommu-cells. The ARM SMMU
>>> has only one cell, which is correct even for our platforms. The fact
>>> that we need to identify different IOMMU SIDs (and handle them in a
>>> differnt ways) is internal to the video device (and several other
>>> devices). There is nothing to be handled on the ARM SMMU side.
>>
>> Huh? So if you prefer not to change anything, are you suggesting this series
>> doesn't need to exist at all? Now I'm thoroughly confused...
> 
> Hmm. We need changes, but I don't feel like adding the FUNCTION_ID to
> #iommu-cells is the best idea.

What? No, any function ID would be an *input* to a map, not part of the 
output specifier; indeed it should never go anywhere near the IOMMU, I 
don't think anyone suggested that.

>> If you want to use SMR masks, then you absolutely need #iommu-cells = 2,
>> because that is the SMMU binding for using SMR masks. It would definitely
> 
> I'm sorry. Yes, we have #iommu-cells = <2>.
> 
>> not be OK to have some magic property trying to smuggle
>> IOMMU-driver-specific data contrary to what the IOMMU node itself says. As
>> for iommu-map, I don't see what would be objectionable about improving the
>> parsing to respect a real #iommu-cells value rather than hard-coding an
>> assumption. Yes, we'd probably need to forbid entries with length > 1
>> targeting IOMMUs with #iommu-cells > 1, since the notion of a linear
> 
> This will break e.g. PCIe on Qualcomm platforms:
> 
>                          iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
>                                      <0x100 &apps_smmu 0x1401 0x1>;
> 
> 
> But this seems unlogical anyway wrt. apps_smmu having #iommu-cells =
> <2>. It depends on ARM SMMU ignoring the second cell when it's not
> present.

Urgh, yes, that's just broken already :(

At least they all seem to be a sufficiently consistent pattern that a 
targeted workaround to detect old DTBs looks feasible (I'm thinking, if 
iommu-map size % 4 == 0 and cells n*4 + 3 are all 1 and cells n*4 + 1 
are all the same phandle to an IOMMU with #iommu-cells == 2, then parse 
as if #iommu-cells == 1)

>> relationship between the input ID and the output specifier falls apart when
>> the specifier is complex, but that seems simple enough to implement and
>> document (even if it's too fiddly to describe in the schema itself), and
>> still certainly no worse than having another property that *is* just
>> iommu-map with implicit length = 1.
>>
>> And if you want individual StreamIDs for logical functions to be attachable
>> to distinct contexts then those functions absolutely must be visible to the
>> IOMMU layer and the SMMU driver as independent devices with their own unique
>> properties, which means either they come that way from the DT as of_platform
>> devices in the first place, or you implement a full bus_type abstraction
> 
> Not necessarily. Tegra display driver creates a device for each context
> on its own.
No, the *display* driver does not; the host1x bus driver does, which is 
the point I was making - that has a proper bus abstraction tied into the 
IOMMU layer, such that the devices are correctly configured long before 
the actual DRM driver(s) get anywhere near them.

> In fact, using OF to create context devices is _less_
> robust, because now the driver needs to sync, checking that there is a
> subdevice, that it has probed, etc. Using manually created devices seems
> better from my POV.

Huh? A simple call to of_platform_populate() is somehow less robust than 
open-coding much of the same logic that of_platform_populate() does plus 
a bunch of hackery to try to fake up an of_node to make the new device 
appear to own the appropriate properties?

Having entire sub-*drivers* for child devices or not is an orthogonal 
issue regardless of whichever way they are created.
>> which will have to be hooked up to the IOMMU layer. You cannot make IOMMU
>> configuration "internal" to the actual client driver which is only allowed
>> to bind *after* said IOMMU configuration has already been made.
> 
> I'm not sure I follow this, I'm sorry.
I mean IOMMU configuration is designed to happen at device_add() time, 
and client drivers must not assume otherwise (the mechanisms for 
handling IOMMU drivers registering "late" from modules are internal 
details that can and will change). If you're under the impression that a 
straightforward platform driver for the video codec itself would be able 
to invoke IOMMU configuration for the video codec platform device 
(without unacceptable levels of hackery) then you are mistaken, sorry.

Again, to be able to assign StreamIDs to different contexts, those 
StreamIDs must uniquely belong to different struct devices. Thus in 
terms of how you get to those struct devices from a DT representation, 
either they come from distinct DT nodes with standard "iommus" 
properties that the generic of_platform code can create and configure 
accordingly, or you're doing a non-trivial amount of work to implement 
your own bus layer like host1x_context_bus to manage your own type of 
sub-device. There is no valid middle ground of trying to stuff 
driver-specific knowledge of arbitrarily made-up function IDs into the 
generic platform bus code.

Thanks,
Robin.

