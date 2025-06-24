Return-Path: <linux-media+bounces-35727-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C312DAE5F74
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 10:35:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66B3E16C1CA
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 08:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A4C25BEEF;
	Tue, 24 Jun 2025 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dzj9ABnR"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAB125C82C;
	Tue, 24 Jun 2025 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750753986; cv=none; b=j8siAq/ixnRmEt81XYO7I/xwm7Q5/oxhDFlJdxgHuMi8UZK4CkkQPbOASXQ+v3uSS66YyHeQEFhz+/3zqfEi19lYGpKZo9ztaf8OubCz6KKwULaPgyTsataP/3cA43ZJhm13j8b6vgfO7+66Ng3HiBIGmSl6Jd6aqL+tSF1Z+7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750753986; c=relaxed/simple;
	bh=6d9ilZKlt54Cy4GygVeA1BUh6llNTH6aW8oKt2FPRxk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WlCoE+qL61Rz3mMqeSnn7z7x5dJnMczyy09QRo2z84iZYHDtxr6/lMnrDCS5RMkFU3aa+z8mEDJX01pMnqA4DMIMSIkyhD8ebj2TOgZabgkxBV1vi9JFDWhz/Tx5d9AnKrNVPFCocLgSaoL1wg9MJCu/xhrR10Ih6EtKRz8SA9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dzj9ABnR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C469CC4CEEF;
	Tue, 24 Jun 2025 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750753985;
	bh=6d9ilZKlt54Cy4GygVeA1BUh6llNTH6aW8oKt2FPRxk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dzj9ABnRS80dywSl2xcQvuz60BjS/EzVRE/7sQoofkNYQ7RofCuvsObKAXpaQaHhY
	 zXC0Z9eZQx9FnJKQkn5I3NuTOAOoCzPH53F+3rfQps4BK8S9K3JinrQOaMWzdUPfEX
	 k5fJq+MzTJDDQZEzILWEIpIPCwhhSXqC1RWwgpyeQoBLjzzKySewQVrL5o6fKCS7DZ
	 M5XqquZLWD0jRbVTRuQhkN6xqIGL8HazkCLVHd0jg0WbeGDbdDRajTMzQktlQ5yuwM
	 RbpXXibS/6NldZc7u1AAeN0S3EseToLZxoWwhYt22I98mvRMDa3ZbOp/W7O3DVuTQ3
	 jT0iISOUpT7eA==
Message-ID: <ea0d8afb-4d64-4fc5-996b-452420e750da@kernel.org>
Date: Tue, 24 Jun 2025 10:33:00 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: media: qcom,sm8550-iris: add non_pixel
 and resv_region properties
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
 <20250620-video_cb-v1-1-9bcac1c8800c@quicinc.com>
 <a35d3928-8ac6-49ab-8689-16ba69afe197@kernel.org>
 <2bd17ab5-950c-4260-ae7c-9ba9a6441496@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <2bd17ab5-950c-4260-ae7c-9ba9a6441496@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20/06/2025 19:27, Konrad Dybcio wrote:
> On 6/20/25 8:39 AM, Krzysztof Kozlowski wrote:
>> On 20/06/2025 08:20, Vikash Garodia wrote:
>>> Existing definition limits the IOVA to an addressable range of 4GiB, and
>>> even within that range, some of the space is used by IO registers,
>>> thereby limiting the available IOVA to even lesser. Video hardware is
>>> designed to emit different stream-ID for pixel and non_pixel buffers,
>>> thereby introduce a non_pixel sub node to handle non_pixel stream-ID.
>>>
>>> With this, both iris and non_pixel device can have IOVA range of 0-4GiB
>>> individually. Certain video usecases like higher video concurrency needs
>>> IOVA higher than 4GiB.
>>>
>>> Add the "resv_region" property, which defines reserved IOVA regions that
>>> are *excluded* from addressable range. Video hardware generates
>>> different stream IDs based on the range of IOVA addresses. Thereby IOVA
>>> addresses for firmware and data buffers need to be non overlapping. For
>>> ex. 0x0-0x25800000 address range is reserved for firmware stream-ID,
>>> while non_pixel (bitstream ) stream-ID can be generated by hardware only
>>> when bitstream buffers IOVA address is from 0x25800000-0xe0000000.
>>>
>>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>>> ---
>>>  .../bindings/media/qcom,sm8550-iris.yaml           | 35 ++++++++++++++++++++++
>>>  1 file changed, 35 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>> index c79bf2101812d83b99704f38b7348a9f728dff44..a1e83bae3c36f3a4c58b212ef457905e38091b97 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>>> @@ -65,10 +65,45 @@ properties:
>>>        - const: core
>>>  
>>>    iommus:
>>> +    minItems: 1
>>
>> As discussed in other patchset, this needs clear explanation, so
>> imperfect patch won't be used in future discussions as argument to take
>> more of such things.
>>
>>>      maxItems: 2
>>>  
>>>    dma-coherent: true
>>>  
>>> +  resv_region:
>>
>> DTS coding style. Anyway, regions go with memory-region bindings. Use that.
> 
> On a tangent, FWIW this is a discussion related to this patchset that
> never got much attention:
> 
> https://lore.kernel.org/linux-devicetree/9439182e-3338-4d57-aa02-b621bc9498a3@oss.qualcomm.com/


There is no patchset above, just email describing a problem. It did not
get attention maybe because of usual kernel process: show the code, we
do not have time to comment on every problem or idea.

Best regards,
Krzysztof

