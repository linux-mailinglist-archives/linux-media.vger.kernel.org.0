Return-Path: <linux-media+bounces-48950-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 067E2CC5DF8
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 04:11:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 073A8302C8F9
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 03:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E082262FDD;
	Wed, 17 Dec 2025 03:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yuzNjmne"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A4928C035
	for <linux-media@vger.kernel.org>; Wed, 17 Dec 2025 03:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765941079; cv=none; b=BRr5XpJVN3reu2yji+0T7srZShFL7l3ayEB5jdrgX8E80pKJmDOMwvHi76lMZH8ubK1b36uabb03atLRdjB/OgpVHeTBDi67Wu8f8SiwJbMjKkweIeqArF7yKstu7Vb0Xpu9y0kc1ZFzm0BRvm65vvXjYIdsYxc8L7+/rYYQxcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765941079; c=relaxed/simple;
	bh=Hl6krguED83y1Rzjo5mpXyB7F6ueszIp5R4/8h51AEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p24xjeVa/OmgXBzmI6kw76h/x8z1iM47lL8wVuoQU6GVIYKzi/CZfMxeflQE394x/8sxsIuD2VYkmev1EuFl5WfXnjCk5Yb8wRWcmg3EqEkEjXvHWhkhPfA87itvDETTntwSEq3Yj7qCpvfzuCXFtqWTiIM2XQdayRR+aqLgH4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yuzNjmne; arc=none smtp.client-ip=209.85.208.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-37f8cc9a9feso6776181fa.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 19:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765941075; x=1766545875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rGlge4qRBG39j21/zCF0OH7xC0Aiqkcowp9xBGjwFw=;
        b=yuzNjmneSgJdoY7J+8EVF141oMXHQ8yl350S+cT2Mwjo68NOeR8R6jpvo3YK43NZqQ
         LH7PXeUBPk2r5mea8aq8qdr2tda5yc8L5DnwpMdgQwbbvR0gN9GXbht+0uOcg/B/krs2
         AIVzzyAId/QVspOGpIdOMagqbIgSzp0lMNFHgpRadBpAwXJE/ah9LMSVQljB/GHkQGIH
         A0fOfLb3EBJO8SE5B8gIOx/hnXzAcReq601popTn+2gEJWvbmyIipWBiX+10vMjbvjUp
         bBlNdyYpX3z7OLWtrRBHpanGce9fWZ1LF+V6srqaRFAp1+0yp9xT3WIKyyIEqW9gkUQI
         o89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765941075; x=1766545875;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/rGlge4qRBG39j21/zCF0OH7xC0Aiqkcowp9xBGjwFw=;
        b=X2MafXMfzyM5pLLEI4T2crwbsYk0Or7+fG970G0QAyGOItfwFw4N5cVLhobOUT/bdr
         PD4G8EhX7EQ6lMWR3gSap68DoruM8vQK7N/9YbQ6oENaybeJYh04RECMBnRIfjfITUlH
         SaUw7A30vYeNYzfwQLFHI+xZdMUdEIDBZogcsg52Yu1CLWrwv5XD/ENyEATQoBLQHogU
         ZzdAPlUMjIw+Wwb7GcSnRCthu0VL3wiPTv6VHbYqfabVshYbgfkW3yfDHUPI/SQLyiol
         hTLp4kuu6KlPE/oGKfbLyiL8ZuVsI0VipDts+oAT+sE+3PHyxvdwGFhUvm6B7SIHPgPq
         NjxQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpmcwBJkkRydcm2RIF6NVEXlA8sxh9gWYQydrQMjinyCG769fQGdifem8e0PzmF4VoEpG+4NwzLArpGg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZoTKBeLdd71jI1ncQXew9oaZhWv/qXCdzHv7mj3tw/NcJdjcG
	7NwvDZp+pIxPRETuBzW5luxAadhjEowfAuO8c4e7xAIC/+DBh64CVpFlFpm16mTrMNw=
X-Gm-Gg: AY/fxX7g9KAHB1Ew78UQSMB4fhHUn1m0h9RPFq0J2J3qEEUl1p06i0oaSaVqiM+6/n/
	9q4bQ3w9dYDuPbyXPbXaXIj4je9i8EZlwqXeASE8cXnMdrbDXSZWhsXw8qPauZ28SR31e/eR7Ha
	AAwsx7WMpSZv5fgHwojVzEf1REsxSmh4MXCiJj6aRl3yhSG6gXk+VBXg58M1K809kT7i4STLfZy
	XNeDxexcEd9bh1MbTrNZY6cSKLXUxeMDw8uTktixH6pZPPAs/sieoIPXzvNL6QtIv6jvCZ+C0Yg
	zE/aS4pVRiAeZ4WmTk61l7x9+UDaJy94v69vbQJg3nQM24ORGIC4gCaNSIIih0EuVbbw20OtNEm
	Q9TZk25BAZhaOhYNFv7u8FPBIaPVdWSQPZA6vM8P6dW5bUgo2na8tDnoYylxg7+7VnLZNxQw88K
	nh93nzfvRiYaoftnbSRM67HZVmj2nwFOQtA9pypYIpi+IjPTL7PpeNQ9E03W4VImbB6mB/2IOFQ
	k52
X-Google-Smtp-Source: AGHT+IEq9ykL4/kesLxddbJb8vGahgoeh8CxvALeFzg0k3o13w9NE4dCxFyrvHz/HciGQbcTeQgV8A==
X-Received: by 2002:a05:6512:239d:b0:594:5582:f77e with SMTP id 2adb3069b0e04-598faa753e6mr3325686e87.4.1765941074579;
        Tue, 16 Dec 2025 19:11:14 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da789f0sm1642136e87.92.2025.12.16.19.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 19:11:13 -0800 (PST)
Message-ID: <79e2bb5b-9bca-4712-87bb-e0371b36bf50@linaro.org>
Date: Wed, 17 Dec 2025 05:11:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
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
 <fa131841-ae9e-49ee-a7c6-728b4a6a4b60@linaro.org> <aUIKWMQMAIzjybHO@rdacayan>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <aUIKWMQMAIzjybHO@rdacayan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/17/25 03:41, Richard Acayan wrote:
> On Tue, Dec 16, 2025 at 05:23:53PM +0200, Vladimir Zapolskiy wrote:
>> On 12/16/25 16:41, Konrad Dybcio wrote:
>>> On 12/16/25 3:31 PM, Vladimir Zapolskiy wrote:
>>>> On 12/16/25 15:56, Konrad Dybcio wrote:
>>>>> On 12/12/25 8:22 PM, Dmitry Baryshkov wrote:
>>>>>> On Thu, Dec 11, 2025 at 07:41:37PM -0500, Richard Acayan wrote:
>>>>>>> On Thu, Dec 11, 2025 at 07:16:30AM +0200, Dmitry Baryshkov wrote:
>>>>>>>> On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
>>>>>>>>> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
>>>>>>>>> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
>>>>>>>>> support for it.
>>>>>>>>>
>>>>>>>>> Co-developed-by: Robert Mader <robert.mader@collabora.com>
>>>>>>>>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>>>>>>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>>>>>>> ---
>>>>>>>>>     .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
>>>>>>>>>     1 file changed, 107 insertions(+)
>>>>>>>>>
>>>>>>>>> @@ -392,6 +420,64 @@ vreg_bob: bob {
>>>>>>>>>         };
>>>>>>>>>     };
>>>>>>>>>     +&camss {
>>>>>>>>> +    vdda-phy-supply = <&vreg_l1a_1p225>;
>>>>>>>>> +    vdda-pll-supply = <&vreg_s6a_0p87>;
>>>>>>>>> +
>>>>>>>>> +    status = "okay";
>>>>>>>>> +
>>>>>>>>> +    ports {
>>>>>>>>> +        port@1 {
>>>>>>>>> +            camss_endpoint1: endpoint {
>>>>>>>>> +                clock-lanes = <7>;
>>>>>>>>> +                data-lanes = <0 1 2 3>;
>>>>>>>>> +                remote-endpoint = <&cam_front_endpoint>;
>>>>>>>>> +            };
>>>>>>>>> +        };
>>>>>>>>> +    };
>>>>>>>>
>>>>>>>> This would be much better:
>>>>>>>>
>>>>>>>>      &camss_endpoint1: {
>>>>>>>>          clock-lanes, data-lanes, remote-endpoint here
>>>>>>>>      };
>>>>>>>
>>>>>>> I'm not sure what you mean, there might be some typo.
>>>>>>
>>>>>> My point is that you are duplicating `ports { port@1 {.... }; };` from
>>>>>> the base DTSI here.  We usually try to avoid this kind of path
>>>>>> duplication. If you can't have an empty endpoint in the base DTSI, I
>>>>>> suggest adding necessary labels to port@N nodes and then extending those
>>>>>> nodes in the board DTSI.
>>>>>>
>>>>>>> If this is about using the commonly-defined endpoints, Vladimir broke it
>>>>>>> in commit dcf6fb89e6f7 ("media: qcom: camss: remove a check for
>>>>>>> unavailable CAMSS endpoint"). If I do this again and go full circle, I'm
>>>>>>> afraid this could break a second time before even making it to
>>>>>>> linux-next.
>>>>>
>>>>> Quite frankly I don't think that commit was valid, given it's conceivable
>>>>> that an endpoint could be unconnected..
>>>>>
>>>>
>>>> Endpoint is not a device, status property is the property of devices and
>>>> not a property of anything else as the Devicetree Specification v0.4 and
>>>> earlier ones define. Dangling endpoints are fine, there is no need to
>>>> add another property to determine, if an endpoint is connected or not.
>>>>
>>>> There should be no status properties inside endpoint device tree nodes.
>>>
>>> The spec doesn't actually define what a "device" is. Funnily enough, it refers
>>> to "endpoint" as a device:
>>>
>>> 2.2.2 Generic Names Recommendation
>>> The name of a node should be somewhat generic, reflecting the function of the
>>> _device_ and not its precise programming model. If appropriate, the name should
>>> be one of the following choices:
>>>
>>> [...]
>>>
>>> * endpoint
>>>
>>>
>>> Plus an OF node is opaque in its purpose.. The top node, a firmware node, a
>>> node representing a physical IP block and a config.ini-style blurb are all
>>> "device nodes"
>>
>> It sounds like somebody of DT maintainers should clarify the matter and update
>> the spec to be less ambiguous, if it happens that "device" term is undefined.
>>
>>>
>>> But coming back to the real world, the ports/endpoints represent the physical
>>> connections to CAMSS and it makes sense to have them defined in one place,
>>> especially since there's a predictable number of them that should not be left
>>> up to each board to define.. That quite obviously implies that not all boards
>>> are going to utilize all interfaces and the commit of yours that was mentioned
>>> above seems to only be valid on the basis of semantics, which I above mentioned
>>> are not *really* a valid point..
>>
>> For whatever reason CAMSS on SDM670 is very special, because IIRC there is no
>> other platform with preset status poperties of endpoints. This exclusive SDM670
>> specifics shall be analysed and eliminated, since it hasn't been done during
>> patch review time, it's time to do it right now then.
> 
> An SoC-common endpoint node is how panels are hooked up to DSI. This
> seems to be the case for SDM670, SDM845, SM8[123456]50, etc.
> It's not special or unpopular for DSI, but CAMSS seems to be the
> subsystem where an endpoint node pre-defined by the SoC is only in
> SDM670.

Only SDM670 CAMSS endpoints contain 'status' property, not DSI, not
CAMSS on any other platform. This makes SDM670 CAMSS special, and as
I've said above this very odd exclusiveness should be eliminated.

> 
> At least from the context retained in this reply and my memory, the most
> compelling argument I've seen from you so far about removing the
> pre-defined endpoints is (in multiple steps):
> 
> 	1. Suggesting common endpoint nodes instead of common port nodes
> 	https://lore.kernel.org/all/e9dc1a6f-156b-40aa-9209-2010464d54ed@linaro.org/

No-no, I didn't do such a suggestion, please reread the discussion,
I asked to remove labels to ports, and no more, endpoints into that
email thread were introduced by you, Richard.

By the way the follow-up discussion repeats one in one Dmitry's
suggestion right in the current email thread:

https://lore.kernel.org/linux-arm-msm/wwpqaecvz42jopgaboasbh353ieelctpvgo3yj6y5tnxoem5oz@j5sbx3yxntot/

> 	2. Breaking common endpoint nodes in CAMSS
> 	https://lore.kernel.org/all/20250903002255.346026-4-vladimir.zapolskiy@linaro.org/

The change breaks endpoint nodes in assumption that endpoints are
devices, but they are not fortunately.

> This is why I try to remove the common endpoint nodes now.

Please convert SDM670 CAMSS port device tree subnodes to be one-in-one
similar to any other selected CAMSS port device tree subnodes, all
the problems will be gone. It's a pity that the original SDM670 CAMSS
change introduced an invalid and unexptected property of endpoints.

Please take a look at sm8250.dtsi/qrb5165-rb5-vision-mezzanine.dtso,
and repeat this layout for SDM670 CAMSS, the exclusiveness shall
be removed.

-- 
Best wishes,
Vladimir

