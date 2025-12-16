Return-Path: <linux-media+bounces-48890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CC0CC3B06
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 15:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 97512308459E
	for <lists+linux-media@lfdr.de>; Tue, 16 Dec 2025 14:39:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F3C62D662F;
	Tue, 16 Dec 2025 14:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c11OV9h2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE370330640
	for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 14:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765895478; cv=none; b=IaWjnTHEvVofD0n5Rz3/YhuEkn8ob11NPQvyVSiBefHw6vWnxtI8rwsyY+4r4MI7BEAPZfFva9WAH0PT21+ISXDI1oQ4Vtu1NUkchuLRHN4N1WdhovrhNBNEih//5DSoAWcbHmID3ZCRMKy5LaxmMJDkte9X+PM8Zpm64rGUAYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765895478; c=relaxed/simple;
	bh=HWKUUOhgC7Bbh6Fj/qDMxMGEKNyJPCIoLjenHExxT30=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qiK6mQTgYoKSxBKWVhu98950LQcmEvfC7xu6tT4n/SLxnWe8MKkkGDwXK7dfkJrE2CP21WG0EPx5x3vAA6quBtDXxL8+zZz5SaY8pyCBSiWkPbMIRMrg8ZZzFeSZj5/keUQ6ILi/JU1k1EyLwNfvaTkr4RWK70sDyiEwbQlBXoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c11OV9h2; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-59425b1f713so392035e87.0
        for <linux-media@vger.kernel.org>; Tue, 16 Dec 2025 06:31:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765895473; x=1766500273; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xfu9/x0xNMrvhAjr2jkgM7SbE8EB5nDelVyqL0dhsjs=;
        b=c11OV9h2ItPtdqs3r6wUfjQplDm+W+3YiqpFeIpDXRw3N71fxfS8bpOAsV78eKsSmM
         wDVL7tW7AQ/JKpB7SFKHY2Of8i8yp5+mrAa33Rqi7DV7o/4Zy71SWlFQxSghY/IiAvk5
         edWy//z0rJKy5aE3HHUcK4Nn39if5jxfj1qaZ2Tf7rreen9t3doD1VPNRUgUb61F1LnS
         KjkQx0lFxtT+ewo/29ZmHIWpslF93e4ToncoyDHgmHptgWCmLroB1p/1gYKvu635roeX
         upnE5CsuO5yiY0PAEeE2RuWGoc/HXrl4tcMjttVQfT3VAuo4ZZ24S9oBjSWbgdyamSGi
         8Wmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765895473; x=1766500273;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xfu9/x0xNMrvhAjr2jkgM7SbE8EB5nDelVyqL0dhsjs=;
        b=PIaRXs30Zb8DKDxRobEw0aDARPPWOL3e8HaT+8X+4XSBv1gyBKsHATQzkZ94T8Ir7v
         raeEs4azSVPvOZ19FGua1s9OXuvXOm1SPI+N+6hARXbFDbEM5QYztHWGn39Z1aQ3Cus7
         U2aOr/QuapZEAdJ5zEGCU71Izyx28cY5g8zAj9lu4xBkGyzx9IvqUxefPGR+yEVXDQDz
         dtRCHyXS8FW1WGnucPbEq+Ev2JpSSRrvkBc3hHZGTZTJCUuwjqk86KWg29WWyqQInMxI
         pU09iotwAFfBQoimdgJlHvmqDnADSosKwglybiSIyxqn497I2b9bWD31O608OdlnVsxS
         XIvw==
X-Forwarded-Encrypted: i=1; AJvYcCVw8DQYvx7K2m8XTf5SrLHU6t0OXqHCgDJ72RoYDGtD6LCpyoutaQK6Z/VsRAsvj/kXCnqir1I8eZ7DdA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb0S7OVNwa1QzEn6D5PdBTUZgu6Uq6yyRzu0GaowTvDTzACbuE
	mn23f6CdLTKOd0C+mFdLaKgXKccekrIlbXG0tLCvLBznBeTCdNYGOVChBaj7U8+3h5w=
X-Gm-Gg: AY/fxX4IQvRIXPBr4eV9+6lhvJtsx17pHfGMScZJk9RP0vyuqurJYnYia3BWFJgIlSA
	IlzJ0vhz25lX0JxuCbyJPxWOznErADLKbFNL7OEq4MLB4FvAmyj3d/8bqGmrL1JBn+Otr3/k8hZ
	T3A5yP1QjSp1GQuXFAMf3R5KBgg4mhMLRGIPPordcRc+S8jJ4IYDse5OlkZlavaNhWn05yPytvw
	hUkMqDbbXw39cmyxWPnavqYfz4wi8l0HlNPE9PEtjjaXp5mkvAsHNTjNg6pAOW8e41SsbWIQzde
	AGmcUbt/wxOXnaDH/LbapCwJ6fTF8v84ar191lOYRGGhGwlg3Dq/1qQ9DAQmLmEV6ZBBOg45pvq
	R/w7tQgMbohGiY07kA5WukM/0ibYmnwP6Kw5XP7drrnNZBZEECHmUDn/xNXOpWioasNnXtQLCkV
	5vbGPPN7pDIB0NGpIVRdHedW8ONmkGj447T+08HPI2PRCe3aDkTHQy7oQARfVgHYrcSg==
X-Google-Smtp-Source: AGHT+IFGeqCptPuKL6XF9dvAV0U4Lgatiw+PP6jAvRdbytsuhBhazQFTOzDmEKQMDq7MS+TNzZOffw==
X-Received: by 2002:a05:6512:3f26:b0:592:f7b4:e5fb with SMTP id 2adb3069b0e04-598faa84ccemr2519008e87.3.1765895472964;
        Tue, 16 Dec 2025 06:31:12 -0800 (PST)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5990da789f0sm940458e87.92.2025.12.16.06.31.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Dec 2025 06:31:12 -0800 (PST)
Message-ID: <1d830282-a778-44aa-918b-5ab3e1516c0d@linaro.org>
Date: Tue, 16 Dec 2025 16:31:11 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
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
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <341012f3-18bd-4f96-98c1-f964d1fedb8f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/25 15:56, Konrad Dybcio wrote:
> On 12/12/25 8:22 PM, Dmitry Baryshkov wrote:
>> On Thu, Dec 11, 2025 at 07:41:37PM -0500, Richard Acayan wrote:
>>> On Thu, Dec 11, 2025 at 07:16:30AM +0200, Dmitry Baryshkov wrote:
>>>> On Wed, Dec 10, 2025 at 08:48:46PM -0500, Richard Acayan wrote:
>>>>> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
>>>>> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
>>>>> support for it.
>>>>>
>>>>> Co-developed-by: Robert Mader <robert.mader@collabora.com>
>>>>> Signed-off-by: Robert Mader <robert.mader@collabora.com>
>>>>> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
>>>>> ---
>>>>>   .../boot/dts/qcom/sdm670-google-sargo.dts     | 107 ++++++++++++++++++
>>>>>   1 file changed, 107 insertions(+)
>>>>>
>>>>> @@ -392,6 +420,64 @@ vreg_bob: bob {
>>>>>   	};
>>>>>   };
>>>>>   
>>>>> +&camss {
>>>>> +	vdda-phy-supply = <&vreg_l1a_1p225>;
>>>>> +	vdda-pll-supply = <&vreg_s6a_0p87>;
>>>>> +
>>>>> +	status = "okay";
>>>>> +
>>>>> +	ports {
>>>>> +		port@1 {
>>>>> +			camss_endpoint1: endpoint {
>>>>> +				clock-lanes = <7>;
>>>>> +				data-lanes = <0 1 2 3>;
>>>>> +				remote-endpoint = <&cam_front_endpoint>;
>>>>> +			};
>>>>> +		};
>>>>> +	};
>>>>
>>>> This would be much better:
>>>>
>>>>    &camss_endpoint1: {
>>>>        clock-lanes, data-lanes, remote-endpoint here
>>>>    };
>>>
>>> I'm not sure what you mean, there might be some typo.
>>
>> My point is that you are duplicating `ports { port@1 {.... }; };` from
>> the base DTSI here.  We usually try to avoid this kind of path
>> duplication. If you can't have an empty endpoint in the base DTSI, I
>> suggest adding necessary labels to port@N nodes and then extending those
>> nodes in the board DTSI.
>>
>>> If this is about using the commonly-defined endpoints, Vladimir broke it
>>> in commit dcf6fb89e6f7 ("media: qcom: camss: remove a check for
>>> unavailable CAMSS endpoint"). If I do this again and go full circle, I'm
>>> afraid this could break a second time before even making it to
>>> linux-next.
> 
> Quite frankly I don't think that commit was valid, given it's conceivable
> that an endpoint could be unconnected..
> 

Endpoint is not a device, status property is the property of devices and
not a property of anything else as the Devicetree Specification v0.4 and
earlier ones define. Dangling endpoints are fine, there is no need to
add another property to determine, if an endpoint is connected or not.

There should be no status properties inside endpoint device tree nodes.

One day I've reviewed v8 of "arm64: dts: qcom: sdm670: add camss and cci",
which didn't contain these properties, and asked to remove the labels, but
v9-v10 appeared with these properties introduced and with my RB, I didn't
notice in time that my RB should be revoked in v9.

-- 
Best wishes,
Vladimir

