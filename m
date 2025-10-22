Return-Path: <linux-media+bounces-45183-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54CC0BFA27B
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 08:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA7021889242
	for <lists+linux-media@lfdr.de>; Wed, 22 Oct 2025 06:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D592EC0BF;
	Wed, 22 Oct 2025 06:04:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enQ4ENOz"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DCB15A86D;
	Wed, 22 Oct 2025 06:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761113095; cv=none; b=cHS1hnqcJj4/L+5B5aQxTKlL7yVH5glnYBISSiXR0rCD+6PuU3KWcIG9u86CeArn5bQrC+TOa7RmHSYFVkquxkw2XchwWomk1R7UnoHTOh4MM0WlNWNOrqNDnHG7/JVCUNeK4Ez0Zdh7A0ZlVkzjerWP9mkRvmkspQEP5jlKTKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761113095; c=relaxed/simple;
	bh=HL2GeUTTydpIWwe8FUj/+YBiyzEduRP7Fz8McSf997M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gTZOp4tyVOou5p+c5x6UqRhIBgdEkso9RXPfYKJDxNgtuXy4irZ14GSxhiddgDagbDd197+Wxc7YFcBLrQTeuxe/MopwH8Pfm+qz0Rqr2bSRmFK1Xz1Nt7j1v1YmGG0kDhfANgCZ7Y/fIvnbt6q5kR40drK6IqoxGjZ+KqA3MiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enQ4ENOz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2F67C4CEE7;
	Wed, 22 Oct 2025 06:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761113094;
	bh=HL2GeUTTydpIWwe8FUj/+YBiyzEduRP7Fz8McSf997M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=enQ4ENOztE9ee8u006wz3GWIcSrCLKpFOFXbUM58SZL3VMaQDH86nNGOz3tZ2n4iN
	 7hsUxeezW3eNTSXwZ+sd1++KkqofD02NqIu1yUr9aFVjRpKtdyHOeYP0UrwxCRr3mK
	 jnvWCV41ZdOMLBgytGobrvY+dLtzJMk7slNf3aIIpxOFRcdDqigg9EvFu6FSsw0NtN
	 gHOVhIi2Ur6GzY1BYBarIzZ91z8v9EGMQIgWzVP682fDfk+SIoLY4eUl9Swn8laCpo
	 z98CKfHhK5s7A+9ZW91CJpyQEo5r24GLtxfQ5/92KCLGcDAZ/75xECWg63rNcqoHup
	 MI98gY/FYZCsg==
Message-ID: <6bcb2cad-91c6-46a7-9b67-82bd1755467a@kernel.org>
Date: Wed, 22 Oct 2025 08:04:48 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Vishnu Reddy <quic_bvisredd@quicinc.com>
References: <20251017-knp_video-v2-0-f568ce1a4be3@oss.qualcomm.com>
 <20251017-knp_video-v2-1-f568ce1a4be3@oss.qualcomm.com>
 <c9d8f76a-513f-4a09-bba4-cb8f0df1d2fe@kernel.org>
 <034bf6f4-0a49-4973-8536-28526b3409d1@oss.qualcomm.com>
 <d19b1279-3031-43b9-ac73-7e5f990802ed@kernel.org>
 <e1bfadd4-2d53-1953-beef-1350594c5010@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <e1bfadd4-2d53-1953-beef-1350594c5010@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21/10/2025 23:07, Vikash Garodia wrote:
> 
> On 10/22/2025 12:45 AM, Krzysztof Kozlowski wrote:
>> On 21/10/2025 20:55, Vikash Garodia wrote:
>>>
>>> On 10/18/2025 9:28 PM, Krzysztof Kozlowski wrote:
>>>> On 17/10/2025 16:16, Vikash Garodia wrote:
>>>>> +  clock-names:
>>>>> +    items:
>>>>> +      - const: iface
>>>>> +      - const: core
>>>>> +      - const: vcodec0_core
>>>>> +      - const: iface1
>>>>> +      - const: core_freerun
>>>>> +      - const: vcodec0_core_freerun
>>>>> +      - const: vcodec_bse
>>>>> +      - const: vcodec_vpp0
>>>>> +      - const: vcodec_vpp1
>>>>> +      - const: vcodec_apv
>>>>> +
>>>>> +  dma-coherent: true
>>>>> +
>>>>> +  firmware-name:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  interconnects:
>>>>> +    maxItems: 2
>>>>> +
>>>>> +  interconnect-names:
>>>>> +    items:
>>>>> +      - const: cpu-cfg
>>>>> +      - const: video-mem
>>>>> +
>>>>> +  interrupts:
>>>>> +    maxItems: 1
>>>>> +
>>>>> +  iommus:
>>>>> +    minItems: 3
>>>>> +    maxItems: 8
>>>>
>>>> I don't understand why this is flexible. Make it fixed size and anyway -
>>>> list the items.
>>>
>>> kaanapali vpu generates 8 different stream-ids. Now, boards running kernel in
>>> EL2 mode can list all of them, while boards running in EL1 can have only non
>>> secure stream IDs. Min have the list of stream ids which can be enabled for all
>>> type of boards, while max is for boards which can list all in HLOS given kernel
>>> is in EL2 mode.
>>>
>>> Below crash would be seen if boards running kernel in EL1 mode lists the secure
>>> ones.
>>
>>
>> That has to be explained somewhere, e.g. comment, 
> 
> Sure, will add a description for iommus property explaining the same.
> 
> and still we need then
>> EL2 DTS in the kernel. I did not see such so far, but maybe I missed it
>> - can you link it?
>>
> 
> EL2 DTS for kaanapali is not yet posted to handle secure SIDs. While it is in
> development, describing the secure stream-ids would ensure to cover all the
> hardware generated IDs.


Then maybe this binding should wait till we see entire picture of hardware.

> 
>>>
>>> [    1.361157] pc : qcom_smmu_write_s2cr+0x64/0xa4
>>> [    1.361165] lr : arm_smmu_write_s2cr+0x2c/0xbc
>>> [    1.361168] sp : ffff80008005b8f0
>>> [    1.361169] x29: ffff80008005b8f0 x28: 0000000000000000 x27: ffffc7f252f45320
>>> ....
>>> [    1.361195] x2 : ffff800081200c48 x1 : 0000000000000048 x0 : ffff800081200000
>>> [    1.361198] Call trace:
>>> [    1.361199]  qcom_smmu_write_s2cr+0x64/0xa4 (P)
>>> [    1.361203]  arm_smmu_master_install_s2crs+0x7c/0xac
>>> [    1.361207]  arm_smmu_attach_dev+0xb0/0x1d4
>>>
>>> Could you please suggest on listing the iommu items ? I did not find the
>>> relevant references in other bindings where flexible iommus is being listed.
>>
>>
>> Just like every other list property - clocks, resets, power-domains.
>>
> something like
> 
> iommu-names:
>   items:
>     - const: 0x1943
>     - const: 0x1940
> ...
> 
> given that one of vpu sub hardware generates multiple SIDs, if we go with sub
> hardware name in the list, the names would be repeated.

No, we describe items, what are their meaning and purpose. In case of
clock you say what sort of clock input is that. In case of here, you
have IOMMUs for different purpose, you say which purpose is that.


Best regards,
Krzysztof

