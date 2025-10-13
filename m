Return-Path: <linux-media+bounces-44262-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 39354BD284C
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 12:18:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1A2BA4EFD23
	for <lists+linux-media@lfdr.de>; Mon, 13 Oct 2025 10:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1B12FE589;
	Mon, 13 Oct 2025 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnXlRhX8"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5C628000A;
	Mon, 13 Oct 2025 10:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350691; cv=none; b=nvHI3g8DMafaDzp/uThoI34cQ9VMqJbQgcsMHPNoN4XjGO6f5ZNMzXShL/TCGFje1kUyzkkPsG3/lqfPRDeUfqnTjDXv11q+pmIx+0Lodt0yb+A448hZnf16AY4rYKXF3cpItOGUJCETGbKCTLsQajB+wubYykjmOLFTIplRpAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350691; c=relaxed/simple;
	bh=YthDpkR+oLWgZls0ALfZLAM7hGcGSvH5hlnAbWxBnjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rW5B63EpuQCKOW+McpXgzGTrsYbxs/iVC/bfispVqeQ7m2adPyg89ZZBf04pQSNn2qbcA83Wq38HNvc3ECNcCMttR3lZrCSipNrCzX9Ks/fZLNasx1ESQV7uTkvHwaxVcpi/1zWkZ+TuIe8azvKoY+lDd9JliYip1TEizLCynUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnXlRhX8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29D9C4CEF8;
	Mon, 13 Oct 2025 10:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760350688;
	bh=YthDpkR+oLWgZls0ALfZLAM7hGcGSvH5hlnAbWxBnjw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EnXlRhX8sw9r8Eas+JakkwrvLXvw39f8en3ub8q2m/JAsTD6u8qkc9L8qTFAbhwDY
	 w9/3zDRUC4kpkJfNVNtFmLRMwjk+zYzJyBtr3vzu1CnYD1pJudxQ2VlLmqF2bfiyB8
	 DiaGPKgL0dqatbCMpmbx0c9jLLF+jAqMcQ+Bu5oF5Dddm2ZoLfmIfFGmmu4tUQ5r5h
	 zy0nZA1jO0ob7DjsM1LrSvCx66YzghMtXXfmLlFiD1kfAyAhGFupC1QlAM0bmP7nIs
	 s/kjrpVuz2VVLNlBM+3yckQeilU1KDVWtHso3PNbppyuBkHY/gi8WWa5dAyLUj8qJ4
	 ZZhLWpCM64WpQ==
Message-ID: <452c8af1-7ec0-4bc3-9d85-8993c0773c86@kernel.org>
Date: Mon, 13 Oct 2025 11:18:01 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] Introduce iommu-map-masked for platform devices
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>,
 Robin Murphy <robin.murphy@arm.com>, joro@8bytes.org, will@kernel.org,
 saravanak@google.com, conor+dt@kernel.org, robh@kernel.org,
 mchehab@kernel.org, krzk+dt@kernel.org, abhinav.kumar@linux.dev,
 vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
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
 <0zcQcB2YYWH_ufElq3ptqtLsGDsxvMEAkHCt_jYaSpwV597VFc22pFWzyMz0rSY-DKqWCQgOCiKpsIRNA0Fisw==@protonmail.internalid>
 <c863f6a7-b117-4444-ae6d-1d525b572be2@oss.qualcomm.com>
 <3c1eb276-abde-4af4-ab39-c934c30aa447@kernel.org>
 <4yMPpVuyUWPNYEAfCpYtZnf3fgFlbDavEA9cqVIJTTOufoxdbJmQ8sWMiK5afpKXUwLZMQGhm1UbHtBaAnV5Iw==@protonmail.internalid>
 <mtt7x2fqvuotwko6ztczosiep5ofyaupayumyggch6e2piqxmr@4v5tb5u2a5u3>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-US
In-Reply-To: <mtt7x2fqvuotwko6ztczosiep5ofyaupayumyggch6e2piqxmr@4v5tb5u2a5u3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/2025 23:47, Dmitry Baryshkov wrote:
> On Sun, Oct 12, 2025 at 09:44:43PM +0100, Bryan O'Donoghue wrote:
>> On 10/10/2025 20:53, Charan Teja Kalla wrote:
>>> I don't want to dilute what Dmitry is saying here, but the below is what
>>> i can make out of Robin comments, please CMIW:
>>>
>>> iommu {
>>> 	#iommu-cells = <2>;
>>> }
>>>
>>> video {
>>>      iommu = <iommu sid1 mask1>, <iommu sid2 mask2>;
>>>      #iommu-map-cells = 2; /* does it look weird to define here, even if
>>> it is SMMU property? */
>>>      iommu-map = <0 smmu sid3 mask3>,
>>> 	       <0 smmu sid4 mask4>;
>>> };
>>
>>
>> This whole iommu-map thing is a wrong direction, its a workaround.
>>
>> It stems from here:
>>
>> 1. Vikash posted a series adding a platform device
>> https://lore.kernel.org/linux-media/20250627-video_cb-v3-0-51e18c0ffbce@quicinc.com/
>>
>>     The two objectives of this are
>>
>>     a. Allow Linux, the APPS as qcom calls it,@ EL1 or EL2
>>        to setup iommu entries for function_ids that are
>>        not the APPS @ EL1/EL2.
> 
> No.
> 
> Up to now we were talking only about the non-pixel bitstreams and secure
> en-/decoding data.  None of that is related to anything except Linux
> running in EL1/EL2. Only Linux consumes / provides normal non-pixel
> data. Only Linux handles decoded secure buffers. Only Linux sets up the
> video decoding of secure data and then blending of that data inside DPU.

As I understand some of these >>        For example the APPS running in 
TEE or one of the
>>        various co-processors - like say the Compute DSP cDSP.
> 
> How did CDSP or TEE get into the picture?

Hypothetical examples of the non-HLOS VMID. Call these AC_VM_CP_BITSREAM 
or AC_VM_CP_NON_PIXEL to use values from the documentation.

>>
>>     b. Allowing for each device to have a full IOVA range.
>>
>> 2. Krzysztof queried about changing _existing_ entries e.g.
>> https://lore.kernel.org/linux-media/6fd3fa34-69e1-484f-ad6f-8caa852f1a6c@kernel.org/
>>
>>     The point about ABI breakage.
>>
>> 3. This proposal to introduce iommu-map as a workaround
>>     Gets the FUNCTION_ID APPS v cDSP v TZ into the DT
> 
> It's neither CDSP nor TZ. The source or the consumer of the data might
> be crypto core or just Linux process. For non-secured non-pixel data it
> _is_ Linux process.
> 
>>
>>     So it solves 1/a I'm not sure it solves 1/b
>>
>>     However if you were designing from scratch you wouldn't
>>     have a motivation to assign this additional property.
>>
>>     The motivation is to not break the ABI I think.
>>
>> 4. Robin said
>>
>>     "And if you want individual StreamIDs for logical functions to be
>>      attachable to distinct contexts then those functions absolutely
>>      must be visible to the IOMMU layer and the SMMU driver as
>>      independent devices"
> 
> Correct. But it doesn't require separate OF device nodes. See
> host1x_memory_context_list_init().

Fine could be platform code too.


>>
>> 5. If you think about this, its actually the right long term solution
>>
>>     - Individual devices means something like:
>>
>>       video-codec@aa00000 {
>>           /* Any SID mapping to S1_VIDEO_HLOS belongs here */
>>           compatible = "qcom,sm8550-iris";
>>           iommus = <&apps_smmu 0x1947 0x0000>;
>>       };
>>
>>       video-codec-non-pixel {
>>           /* Any SID mapping to S1_VIDEO_HLOS_P belongs here */
>>           compatible = "qcom,sm8550-iris-non-pixel";
>>           iommus = <&apps_smmu 0x1940 0x0000>;
>>       };
> 
> Which piece of hardware is described by this node? Why is it separate
> from the main video-codec? The IOMMU stream doesn't have any specifics,
> it's just a part of the video codec core.

You could conceivably start associating /dev/video entries with a device 
that maps to AC_VM_CP_PIXEL - the protected video stream.

There may be data other than SID/FUNCTION_ID that we would want to 
associate with those devices, I'll stipulate to further discussion there.
>>
>>     - Or do something like that above again in platform code.
>>
>> 6. We should on introduction of a new SoC
>>
>>     - Fix the iommus = <> for "qcom,newsoc-iris" to contain
>>       only what is pertinent to S1_VIDEO_HLOS
>>
>>     - Make new devices in the DT for each FUNCTION_ID
>>
>>     - Then look at how - if - that fix can be brought back to Lemans
>>
>> My problem with introducing the iommu-map is that it bakes into the video
>> codec definitions a fixup which then gets carried forward.
>>
>> But the right thing to do is individual devices so, let's do that and worry
>> about how to back-port that fix to older SoCs once done.

So really whether we end up representing these devices in DT or platform 
code, separate devices are the answer - both for the FUNCTION_ID mapping 
and the IOVA range.

You just need to carefully think about what ends up being a device if 
the IOVA range is a concern.

Its unfortunate that sm8550 has an addtional iommu entry that wants to 
live in a different device - but, that's a problem for sm8550.

Perhaps something we can backport to Lanai, Lemans and friends once we 
get the new submissions right..

---
bod

