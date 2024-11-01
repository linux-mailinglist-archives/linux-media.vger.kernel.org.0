Return-Path: <linux-media+bounces-20682-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B749B8E1F
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 10:47:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 36139281910
	for <lists+linux-media@lfdr.de>; Fri,  1 Nov 2024 09:47:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A2415A86A;
	Fri,  1 Nov 2024 09:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFu7XpOg"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD7442C0B;
	Fri,  1 Nov 2024 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730454467; cv=none; b=PWAkbv1u4P155GGKIohx72BfqoNeaGAcRJM8EBMueTRN/sn30PjVfJADdTTATNXkk3+O0t6RZRNdbpJib9cGxbeq80dD6wIMtSNDj5vsyvGeEZhIrIfptwcepARP9ora4yNqe3p7jV1pvhBKhSIGjnC69+ch0sHmNK9qWZEq7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730454467; c=relaxed/simple;
	bh=upm8WGdKhPggtEfpo7lQDsOK8xctqolSF2bsVJdhbhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fXG5ZCPmlNm2uJYVObd9zg4NqVWh+ADbCtqrKp+vY0wJb13qcUu4ITppHE/oOffSXwHSpDcVyxFGh7bUIVbkuvYa8weMtyhq2c1QDoESPNB/XocYCKk2QkYRlmqnGnxlUwE3QAlCG7O+3UESGLN6qAFHw4pW8APWQKNlhOw4cJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFu7XpOg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1A1C4CECD;
	Fri,  1 Nov 2024 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730454466;
	bh=upm8WGdKhPggtEfpo7lQDsOK8xctqolSF2bsVJdhbhA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KFu7XpOgTT+UYr/2hNWNxM8dEMGLVvXekSBH0vKDsa004yigZZJTzlKW5HhyFsVhK
	 d8Xz5B5nYH4OtLTRsR3aDiCafo7kfvR2O1S6X9CxUMZrrNyIfxaUbVWmLSGAuJ36kt
	 tW+gfIgT+FSkNJpIb9QaEiREYM2uIC6b9kUDUDm14nHOoDXOvfm2o7hcmR8Ms9PBeJ
	 m9PFIHfVxLRWlCOCc/gfaDqH9wl8rE+Li/kL1HXR6VU47fxIeE7HeaxNGPNKMfpEpc
	 cxddrE5s1HZfCBitcMoo0Mt3aF/0HQpMgrn50z4qR8kdFolT3SmM9cpSOZpRCygZkQ
	 3JMVNOzwi+USg==
Message-ID: <364f2afb-fdaa-42b9-8921-70dbdc3f7085@kernel.org>
Date: Fri, 1 Nov 2024 10:47:38 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/5] dt-bindings: media: camss: Add qcom,sdm670-camss
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Rob Herring <robh@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Richard Acayan <mailingradian@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org
References: <20241011023724.614584-7-mailingradian@gmail.com>
 <20241011023724.614584-9-mailingradian@gmail.com>
 <785c82d5-549d-454b-86bf-a00a39e6f521@linaro.org>
 <a230de8f-a11d-41c1-9bc6-7e06e850b51d@linaro.org>
 <20241011144129.GA2295617-robh@kernel.org>
 <ca89bbae-193b-4636-b1a6-ff0c9cecae58@linaro.org>
 <CAL_JsqKwaT4q-VHqfLXAabdGtKvRtnh7SFiELpyXDGVRRpOoYQ@mail.gmail.com>
 <b9a467bd-ad2f-4b6b-a0c3-0d60960023c6@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <b9a467bd-ad2f-4b6b-a0c3-0d60960023c6@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/10/2024 23:13, Vladimir Zapolskiy wrote:
> On 10/30/24 23:06, Rob Herring wrote:
>> On Wed, Oct 30, 2024 at 9:20 AM Vladimir Zapolskiy
>> <vladimir.zapolskiy@linaro.org> wrote:
>>>
>>> Hi Rob.
>>>
>>> On 10/11/24 17:41, Rob Herring wrote:
>>>> On Fri, Oct 11, 2024 at 09:31:06AM +0100, Bryan O'Donoghue wrote:
>>>>> On 11/10/2024 08:14, Vladimir Zapolskiy wrote:
>>>>>>
>>>>>> Two most recently added CAMSS IP descriptions (qcom,sm8250-camss.yaml and
>>>>>> qcom,sc8280xp-camss.yaml) do implement sorting by reg values, I believe
>>>>>> from now on
>>>>>> it should be assumed that all subsequently added CAMSS IP descriptions
>>>>>> to follow
>>>>>> the same established policy.
>>>>>
>>>>> My preference is sort by address not sort by name => we sort the device
>>>>> nodes themselves by address so it seems more consistent to sort by address
>>>>> inside of the devices too.
>>>>
>>>> Strictly speaking, the values of addresses are unknown to the binding,
>>>> so you can't sort by address. However, if something is truly a single
>>>> block, then the offsets are probably fixed in order by offset makes
>>>> sense. But when a block is changed, any rule on sorting may go out
>>>> the window since we add new regions on the end.
>>>
>>> Exactly, and this is an argument why the sorting is a subject to a device
>>> driver policy, kind of any sorting order is equally bad. Sorting 'reg'
>>> values by addresses helps to avoid a notorious problem with unit addresses.
>>
>> What notorious problem?
>>
> 
> Here the problem I reference to is the problem of an incorrespondence between
> device tree node unit address and the address of the first value of 'reg'
> values.

Sorting by unit address does not solve it. Sorting by anything else does
not cause it. You repeat this statement multiple times already. Sorry,
it's not true. You can sort by address and still put wrong unit address.

Tools address it already, not sorting.

> 
> Having a sorting by addresses allows to grasp IO ranges easily, and setting
> device tree node unit addresses to some almost arbitrary chosen value from
> the middle of IP's IO range is suspicious and confusing in my opinion.

It's not arbitrary. It's the main, control address space often. At least
it should be. Your sorting rule enforces putting irrelevant address as
unit address, imagine:

isp@1000 {
reg = <0x1000 0x4>, <0x2000, 0x1000>;
reg-names = "reset-control-block-one-unimportant-register",
            "main-control-block-with-99%-of-registers";

Sorry, this is just wrong coding style.

Best regards,
Krzysztof


