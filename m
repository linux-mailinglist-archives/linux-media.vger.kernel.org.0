Return-Path: <linux-media+bounces-48912-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B073CC3FBB
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 16:37:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 72120305FB62
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:33:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2DEA364038;
	Tue, 16 Dec 2025 15:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JtM7/pmv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608D136402C
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 15:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765898639; cv=none; b=T86jpcGDPp4FsHsGsz2NBmw7x/paJbNbkXI7LbRoDJI7t6aPIWBQNtkdFKVywa0Y3sGIvIp1DG+kMi7jOs1N5bvGx7glygj4LVeofXeqlFmMCX2WjcnEjIcIpSalN6b10H+PMNcHuAgLlKfVroN2NayMZyJa+ZeN+zN3cX0Jx0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765898639; c=relaxed/simple;
	bh=vAIUzpoHMjytN7Rz/48aH/uHNy/JzgqzYyhfXala8SY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=opafyIqfZu8jXpveY4RYfPyfE5TkHBItR7R09vNWyZFbg97iF12Se6NnGZRMH9OgCXK4S7k4/2ZPQLQEc3kxN3xP6PnBmY8CMIOYuu5eQUg0Ip72mFhWLRHpqzV837eUmPUtLFQiiiXQQWzxfbTAEavZvmEylDVuVDFZuaZTyy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JtM7/pmv; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-597c366f2feso510066e87.3
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 07:23:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765898635; x=1766503435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2J5a4QLlp1gIHPWSsgnLzMZagpwihm0V+U4IQ8hkHA=;
        b=JtM7/pmv4UcY9jganGs9Y13EyL7i08fV8rQzKsmUPCfnQdDOkQyDZl05qpkzCv77TN
         eCtH2/hrSqMiiYf/UBtJScf3Ey0DhUP+8rO4/ScQOF+R0xzLi8OD0J7ijWbk4aKwFt7n
         WipjFgBy+I/DCdTrnA6qRlgx2sK2YmcfLpiMrmvlNEko4tIvH132pcZ+6I31EDWWcehv
         s2YWAnG9EXEAoUtnciSontVikcqUJJYdMi18nrZiIO0bENoW6t+sIJw8inbN+kULFw6B
         Vz2e5tLkl8raiid9BW8HnaqL0iMGUTUWvr+uvBchI1EWdYAFCoVU0TKe0e662QhGYRt0
         rEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765898635; x=1766503435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i2J5a4QLlp1gIHPWSsgnLzMZagpwihm0V+U4IQ8hkHA=;
        b=XnYpCwwvO4tPJjpuPUeTjEFgiQ7XjHJtWEwvkL8lOX6SwCLIr0dOFhlsSlzd8a0FWm
         S5jvX+g6QF1HDr7qqZzLMZ3jcUqjOjw+e5lvhRM2H50R4wtroI8y8olVl7A6t26LO+wJ
         Q+h3F14TUhH07/qbz4reZNLMfSe/Q5xnCDmuzhK44EfpwyWuznMGebLu1vE1CmXoHFZG
         j4/h74TMuZPKolc4rXWC86vbFaZCB7BjQdkZJECyb1ZaTraPSnETVcEgh7rWi8t1ECEA
         5nMXgaT5cfcSMWkLF4cCV8PN/31UrsBbPGIIXIMS7efRDIPPHnrknFfKZVawCNmktKMx
         7c/w==
X-Forwarded-Encrypted: i=1; AJvYcCUjMBalnbvvB7C7FFTtXV1grL4lSXdn9GV6tNA+m7J/+xU3h2DjGRfL0ulsb3cUL3SHYq1Lxo7FFKtqgA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nrLzcWz4922StgdeoNr2HWF6pKiA9kOe13bGh37sgNF1zuun
	oO6QhI5Bk60q/Zakp0qELG239xJwlU+Pza/QsTRigso2TRHWse84BU6hT7oMht7Hs7g=
X-Gm-Gg: AY/fxX7Hn5keIYYH8hYDI7ePgDQvXund5Y1LmqnapPHKhb9IUQlwHNaQDfWTThyWPRl
	t4ovVQ0y2+EjZIvHbuOEK+8E3nubd5RDv6lmlijB2X7ohNsZVDr+OirthqX8FlQLfrjL7HJ6q7W
	oAtMd2hIB+VYsOK/AWyhPIR6k3G8IsI4OKoMHlH/4EHcsTRVHFmCCzJdcDj4SSyxq29bnaknUgd
	gQOzDCZR/jWstvXws+vx61/yRDCPMCzfepdTxdVJ1OfM1Zh9VNaKbz5YRCyym10AzbWx7pXmrg1
	h4C4KX4SwHnUFcdyDTocBvKjaXmrjAptgGkdt4/Xj5Jy0ZSAYtz9gr5i3xdKeKGzAIpYm53NIIE
	hnKSR28o3OubnVD/HnppQwtzrPPXgrg4Jag4/8IDEdn8iEP/5h98W9co66B+f6o2XDvpYEmZ//R
	rcZzHld61bx2u+nTbOfmDpSz6EvkPfjHp7N+NV+EgTc+KFQQEkw/77/6TCBch2z57gYS8p2c7cU
	0JR
X-Google-Smtp-Source: AGHT+IHUqZ8MlsWcdLXjMndrMOISBhO6vzgQ33SdrvAjwJowVkeUJIKabKJZh0y+vSHN1OThLLU0NQ==
X-Received: by 2002:a05:6512:e86:b0:595:834a:b1ed with SMTP id 2adb3069b0e04-598faaa6ddfmr3212199e87.7.1765898635326;
        Tue, 16 Dec 2025 07:23:55 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da1a743sm964416e87.41.2025.12.16.07.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 07:23:54 -0800 (PST)
Message-ID: <fa131841-ae9e-49ee-a7c6-728b4a6a4b60@linaro.org>
Date: Tue, 16 Dec 2025 17:23:53 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
Content-Language: ru-RU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Richard Acayan <mailingradian@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Tianshu Qiu <tian.shu.qiu@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-media@vger.kernel.org,
 Robert Mader <robert.mader@collabora.com>
References: <20251211014846.16602-1-mailingradian@gmail.com>
 <20251211014846.16602-6-mailingradian@gmail.com>
 <wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot>
 <aTtkwQb2gOeWAFuv@rdacayan>
 <d7jcawzugobqern6zlo5jwcnximtsroxywix53v2yp2isvzo5r@ymxicmgfjmzq>
 <341012f3-18bd-4f96-98c1-f964d1fedb8f@oss.qualcomm.com>
 <1d830282-a778-44aa-918b-5ab3e1516c0d@linaro.org>
 <4c4e8e5b-66b1-4227-86ee-756eca945972@oss.qualcomm.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <4c4e8e5b-66b1-4227-86ee-756eca945972@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/16/25 16:41, Konrad Dybcio wrote:
> On 12/16/25 3:31 PM, Vladimir Zapolskiy wrote:
>> On 12/16/25 15:56, Konrad Dybcio wrote:
>>> On 12/12/25 8:22 PM, Dmitry Baryshkov wrote:
>>>> On Thu, Dec 11, 2025 at 07:41:37PM -0500, Richard Acayan wrote:
>>>>> On Thu, Dec 11, 2025 at 07:16:30AM +0200, Dmitry Baryshkov wrote:
>>>>>> On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
>>>>>>> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
>>>>>>> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
>>>>>>> support for it.
>>>>>>>
>>>>>>> Co-developed-by: Robert Mader <robert.mader@collabora.com>
>>>>>>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>>>>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>>>>> ---
>>>>>>>    .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
>>>>>>>    1 file changed, 107 insertions(+)
>>>>>>>
>>>>>>> @@ -392,6 +420,64 @@ vreg_bob: bob {
>>>>>>>        };
>>>>>>>    };
>>>>>>>    +&camss {
>>>>>>> +    vdda-phy-supply = <&vreg_l1a_1p225>;
>>>>>>> +    vdda-pll-supply = <&vreg_s6a_0p87>;
>>>>>>> +
>>>>>>> +    status = "okay";
>>>>>>> +
>>>>>>> +    ports {
>>>>>>> +        port@1 {
>>>>>>> +            camss_endpoint1: endpoint {
>>>>>>> +                clock-lanes = <7>;
>>>>>>> +                data-lanes = <0 1 2 3>;
>>>>>>> +                remote-endpoint = <&cam_front_endpoint>;
>>>>>>> +            };
>>>>>>> +        };
>>>>>>> +    };
>>>>>>
>>>>>> This would be much better:
>>>>>>
>>>>>>     &camss_endpoint1: {
>>>>>>         clock-lanes, data-lanes, remote-endpoint here
>>>>>>     };
>>>>>
>>>>> I'm not sure what you mean, there might be some typo.
>>>>
>>>> My point is that you are duplicating `ports { port@1 {.... }; };` from
>>>> the base DTSI here.  We usually try to avoid this kind of path
>>>> duplication. If you can't have an empty endpoint in the base DTSI, I
>>>> suggest adding necessary labels to port@N nodes and then extending those
>>>> nodes in the board DTSI.
>>>>
>>>>> If this is about using the commonly-defined endpoints, Vladimir broke it
>>>>> in commit dcf6fb89e6f7 ("media: qcom: camss: remove a check for
>>>>> unavailable CAMSS endpoint"). If I do this again and go full circle, I'm
>>>>> afraid this could break a second time before even making it to
>>>>> linux-next.
>>>
>>> Quite frankly I don't think that commit was valid, given it's conceivable
>>> that an endpoint could be unconnected..
>>>
>>
>> Endpoint is not a device, status property is the property of devices and
>> not a property of anything else as the Devicetree Specification v0.4 and
>> earlier ones define. Dangling endpoints are fine, there is no need to
>> add another property to determine, if an endpoint is connected or not.
>>
>> There should be no status properties inside endpoint device tree nodes.
> 
> The spec doesn't actually define what a "device" is. Funnily enough, it refers
> to "endpoint" as a device:
> 
> 2.2.2 Generic Names Recommendation
> The name of a node should be somewhat generic, reflecting the function of the
> _device_ and not its precise programming model. If appropriate, the name should
> be one of the following choices:
> 
> [...]
> 
> * endpoint
> 
> 
> Plus an OF node is opaque in its purpose.. The top node, a firmware node, a
> node representing a physical IP block and a config.ini-style blurb are all
> "device nodes"

It sounds like somebody of DT maintainers should clarify the matter and update
the spec to be less ambiguous, if it happens that "device" term is undefined.

> 
> But coming back to the real world, the ports/endpoints represent the physical
> connections to CAMSS and it makes sense to have them defined in one place,
> especially since there's a predictable number of them that should not be left
> up to each board to define.. That quite obviously implies that not all boards
> are going to utilize all interfaces and the commit of yours that was mentioned
> above seems to only be valid on the basis of semantics, which I above mentioned
> are not *really* a valid point..

For whatever reason CAMSS on SDM670 is very special, because IIRC there is no
other platform with preset status poperties of endpoints. This exclusive SDM670
specifics shall be analysed and eliminated, since it hasn't been done during
patch review time, it's time to do it right now then.

-- 
Best wishes,
Vladimir

