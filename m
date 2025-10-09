Return-Path: <linux-media+bounces-44068-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0DC8BC8930
	for <lists+linux-media@lfdr.de>; Thu, 09 Oct 2025 12:47:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 90A434E2E34
	for <lists+linux-media@lfdr.de>; Thu,  9 Oct 2025 10:47:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 534032DEA74;
	Thu,  9 Oct 2025 10:47:13 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B177E2DCC05;
	Thu,  9 Oct 2025 10:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760006832; cv=none; b=Jhk+0ArHKg69GKBDtLzHFiCjgd+IUr3Xs8sWJukcyrsxhzhTQBW0KQm6YbERxow/qknsr3X8l8mz5m0oObVmMd8ZllSLYwil3LsSGSlBJDtTo4kW0mqp5vMKJ11P4P0bxpOwB7EZ/b9kFIPBbtMqS1Lb0xk5ZN37ekUH6sWkZ+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760006832; c=relaxed/simple;
	bh=iEZ+B3onCtj/VfCF7aWHQI0bxA5gbvq8yOkNPU3tWL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PfTXHGCnHWZgTPkyopWRUaoSLZ7Jt5NYoQmSrLAV17eZ1XAUKXrP6Fr1GHbSob/0CMgsQQgRycmP8hcDmjAxn/rGne071Z2dcT5MxIWm+vPE/3iJmSdggmK1Y0Jg1aDLTVpj7HjbEhl9GAuN0huVDJoAP6w/v/hJhNwQvbrmypk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EA830176A;
	Thu,  9 Oct 2025 03:47:01 -0700 (PDT)
Received: from [10.57.3.102] (unknown [10.57.3.102])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8A5E03F738;
	Thu,  9 Oct 2025 03:47:06 -0700 (PDT)
Message-ID: <ead7cf8b-fbc4-4242-a9da-b313dded1abc@arm.com>
Date: Thu, 9 Oct 2025 11:46:55 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>, joro@8bytes.org,
 will@kernel.org, saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
 mchehab@kernel.org, bod@kernel.org, krzk+dt@kernel.org,
 abhinav.kumar@linux.dev, vikash.garodia@oss.qualcomm.com,
 dikshita.agarwal@oss.qualcomm.com,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 bjorn.andersson@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
References: <20250928171718.436440-1-charan.kalla@oss.qualcomm.com>
 <aec0f40a-8346-4194-8b18-1022fe3366bb@arm.com>
 <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <0d0560cc-9757-4c7b-8de4-170148d99481@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-10-08 8:10 pm, Charan Teja Kalla wrote:
> 
> On 9/29/2025 3:50 PM, Robin Murphy wrote:
>>> USECASE [1]:
>>> -----------
>>> Video IP, 32bit, have 2 hardware sub blocks(or can be called as
>>> functions) called as pixel and nonpixel blocks, that does decode and
>>> encode of the video stream. These sub blocks are __configured__ to
>>> generate different stream IDs.
>>
>> So please clarify why you can't:
>>
>> a) Describe the sub-blocks as individual child nodes each with their own
>> distinct "iommus" property
>>
> 
> Thanks Robin for your time. Sorry for late reply as I really didn't have
> concrete answer for this question.
> 
> First let me clarify the word "sub blocks" -- This is just the logical
> separation with no separate address space to really able to define them
> as sub devices. Think of it like a single video IP with 2 dma
> engines(used for pixel and non-pixel purpose).
> 
> I should agree that the child-nodes in the device tree is the easy one
> and infact, it is how being used in downstream.
> 
> For upstream -- Since there is no real address space to interact with
> these sub-blocks(or logical blocks), does it really qualify to define as
> child nodes in the device tree? I see there is some push back[1].

Who says you need an address space? Child nodes without "reg" 
properties, referenced by name, compatible or phandle, exist all over 
the place for all manner of reasons. If there are distinct logical 
functions with their own distinct hardware properties, then I would say 
having child nodes to describe and associate those properties with their 
respective functions is entirely natural and appropriate. The first 
example that comes to mind of where this is a well-established practice 
is PMICs - to pick one at random: 
Documentation/devicetree/bindings/regulator/qcom,rpmh-regulator.yaml

For bonus irony, you can't take the other approaches without inherently 
*introducing* a notional address space in the form of your logical 
function IDs anyway.

>    > or:
>>
>> b) Use standard "iommu-map" which already supports mapping a masked
>> input ID to an arbitrary IOMMU specifier
>>
> 
> I think clients is also required to program non-zero smr mask, where as
> iommu-map just maps the id to an IOMMU specifier(sid). Please LMK if I
> am unable to catch your thought here.
An IOMMU specifier is whatever the target IOMMU node's #iommu-cells says 
it is. The fact that Linux's parsing code only works properly for 
#iommu-cells = 1 is not really a DT binding problem (other than it 
stemming from a loose assumption stated in the PCI binding's use of the 
property).

However, I still lean toward the first approach, as this definitely 
seems like it wants to be one overall device with a level of internal 
hierarchy, rather than a full-blown bus abstraction.

Thanks,
Robin.

> 
> Do you suggest to extend the iommu-map to give the non-zero SMR mask
> value[2]?
> 
> 
> [1]
> https://lore.kernel.org/all/ogslvjglnz56lz6nria7py6i4ccp6zvcd4ujpiusrq6xutydsm@xb72os5wk67r/#t
> 
> [2]
> https://lore.kernel.org/all/bffc8478-4de9-4a9b-9248-96a936f20096@oss.qualcomm.com/>
> Thanks,
>> Robin.
>>
>>> With the classical approach of representing all sids with iommus= end up
>>> in using a single translation context limited to the 4GB. There are
>>> video usecases which needs larger IOVA space, like higher concurrent
>>> video sessions(eg: 32 session and 192MB per session) where 4GB of IOVA
>>> is not sufficient.

