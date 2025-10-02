Return-Path: <linux-media+bounces-43620-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DACE5BB3A07
	for <lists+linux-media@lfdr.de>; Thu, 02 Oct 2025 12:22:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 957837B1628
	for <lists+linux-media@lfdr.de>; Thu,  2 Oct 2025 10:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE4827146B;
	Thu,  2 Oct 2025 10:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k8ldR8TU"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD26D2EDD76
	for <linux-media@vger.kernel.org>; Thu,  2 Oct 2025 10:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759400529; cv=none; b=uSdqcoASuy6d9hm2/Uq/SXns93KapuNEwPqeV+3EEncwW06J5DjpGQIWxP/sX3+1+9VZQRXMTSOnloUCyezIaaMohBXCy7fmB5Ddhq9F53Fu+jM6neoB06a9JOUQzcdU5FLz6E2QJKClOacu799VklH8c7cs54llww+y+7vCyyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759400529; c=relaxed/simple;
	bh=KFPLhcvce8+mQ4obDysEFr7M9Qqhm83pW1HLWuVCrzA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=H/KysPm8hPwyQnTJLfJqaiVfN6vtWfSRXoTOa5m8Yz9mBDdsLcVYv+uDYw/plr/LUuulyqPFeOy2pdqUl9fS7aGiIX3gpenoZxUbKZwXBVf40ROhEIwqJzgDCJx10332Cs0QlRaFX1t9IgmjFIOrJsaPZg6pyreKZ/XIi8Od8vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k8ldR8TU; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so1743746a12.3
        for <linux-media@vger.kernel.org>; Thu, 02 Oct 2025 03:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759400526; x=1760005326; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oeiyxphdp3FpXWm94GNIfpVrA+00q3hmgfltim/4eOU=;
        b=k8ldR8TUbFvKY3dMRUsPS24Lnck8Na262IB5DDqDcXCNiDJxzCnK6wCd62lyJ1lAn1
         nxQMvpFsRu+GyhZI/ZzyBjMLSIbbhX22ykRklm8VYTOJSl3G5dnqkh8HlYcLSRIBOYU2
         ZUsxdWsDhQLWlBOGHa8uIW/BEUvgd3sVirEjWSbejcB65XEnvxhATcB339y/GDzrsDKa
         wPtSarzNiYTBv1mOfE99Xdpv9HZHD39Jn9sQdCiSR9LnYlMcWI+2dGEDqxwvWkK9vwHp
         vc6QZlUxPV30GR5Wp45uHawfjK5/cki9rG9CVc6mqC5rELQCLoBeUdntwRzTQckSyGjt
         md1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759400526; x=1760005326;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oeiyxphdp3FpXWm94GNIfpVrA+00q3hmgfltim/4eOU=;
        b=nRm01Kz49d3JrvgI5ZQ/BtuchqN8JzafBKMLYHUJ7PcXL2pE8ZfK9zLA75e7szRtTP
         sPCXTurosR8jewIUFf8xb4fSZUVqKQqoYLaw8iDrXETz2TNzlDRab7Mm5CMjCNNiJpb3
         hBIpLDANVx/Vy9jbXuJdZ7nkidg/pXnMishdP/mvFpgVE7up8w0hUwR1KK4vpnyj0xmQ
         j5JKBRt6JSxk0YuyaGstz5S8ty9VUpQMZU/T0iIUhcdkrzYHKZS1IvCpw2LI2RfggU0W
         mvZGbhggNr9Fitur7eQXjYw2BBFCCT24e/Bwocv3YZSN5g+4bmsCSjuje8mQtjJccp6q
         dEqw==
X-Forwarded-Encrypted: i=1; AJvYcCW6vSDWbXwOrAnz24o0pumadF6NkXZF97ZpAZjC98MMWYYijy2NvZ/gpJqpbNkSqBez7bHycJfUSUSxDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNpmIGlqvdeuUB5a9eZtEkZIqnaVWE8xSY3aejgR2Qx76wRcWg
	cBi43rjJEDxoZvGtJyDK9g/Xnt8bG06mdxyWb1SnjZu3yQ1JLH8q35PFXhVKOm4V3Sc=
X-Gm-Gg: ASbGncuI6dG7esNfb1huvX0v3+5Yj4FVO/F+wIXfVf2nJ9eS4qZQeDlkw0zR+l1F5Op
	uwtTzk3S4s1RqmugMiSFWtQRPZynspiqO/FMsd9w5IhoYuxKcotDI3OV1JQxZDkonGOReoKb6G2
	VZYp0f/o20fYDcX1yA1hlclCSOB+X7z0LsqD/Dn/j9T0FnmGirKalYIkBTJfOg6MjasLHfXR9gd
	r18YTYSmdnMhkzrhvErzhoe682cZqjSNEALVWWxTmC38qLThIDzrzXWlFYiiOpYKo8B6ZOZtuCF
	uufcOREO5wouBuFIey+JIlxEw3AqMnlISOL6Vj6qMXWZx3M/kJDWNqE2Iv1qnFFkoPU5pPVrpy2
	S+neK9N62KZAZJtek7kcTfgtnHaAkC+zhuzdmWUD20P4jIDgW9j+4oHbeDaa2IcIZdZPeb2Zrmm
	X9ZIUQFy39jpfVsxXtPvYKZuVb0MM=
X-Google-Smtp-Source: AGHT+IFlPW8rmREopOYD1ffL5rQR075BadaUVl2h1wYxunv5yBlFe80ZtrFLuMWhLlswGcWI/Kz3KQ==
X-Received: by 2002:a17:907:d14:b0:b10:4355:2e63 with SMTP id a640c23a62f3a-b46e516b397mr787392666b.46.1759400526066;
        Thu, 02 Oct 2025 03:22:06 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7e8b7sm172388266b.40.2025.10.02.03.22.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Oct 2025 03:22:05 -0700 (PDT)
Message-ID: <25e6e163-f91f-4fe5-9454-641914d2eb43@linaro.org>
Date: Thu, 2 Oct 2025 11:22:04 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom: vpu: fix the firmware binary name for qcm6490
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-firmware@kernel.org,
 "Vikash Garodia (QUIC)" <quic_vgarodia@quicinc.com>,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <f5965570-9c49-860d-5de6-bc5a3056d9ad@quicinc.com>
 <w2zhq4nedrzjb7znmjqhixbk7ncxqedjsi5mapsfwfe7pqcnrn@36aeageuuhs7>
 <dcd27cce-7558-d055-caf7-3bf56ff31fdc@quicinc.com>
 <iksemnwiytrp5aelmhehyoexwzj6iem5b66qfr65nviad2fl6f@3qkn23jnzl2z>
 <5ea8f6e4-04c7-092c-2acd-24e18c0bf641@quicinc.com>
 <imo4dxtegwq6fiu6k65ztmezuc7mjlnpnpeapfqn5ogmytj6se@6z4akhw4ymp7>
 <5fdb8fff-d07b-c15a-3f40-eb088e3ff94e@quicinc.com>
 <2llwkhpwbkzqyvyoul2nwxf33d6jhuliblqng4u2bjtmsq7hlj@je3qrtntspap>
 <5a03b200-4e1f-082a-c83a-cb46ad4cea09@quicinc.com>
 <zj2dreqyj7fnhiophdtevhuaohlpk3uoccrslkqt5wjt2jhiip@gqnasgvu7ipq>
 <yeJvz1BmQX5QCjBXnjFbGz8gclNViebyCcZC1Rz2tfocg3MxOAncJZruBARGqAzxG_1UJmw35EUBl80KQy5Sqw==@protonmail.internalid>
 <f1e9ddb0-683d-4c91-f39b-6954c23f7f75@quicinc.com>
 <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
Content-Language: en-US
In-Reply-To: <015dc909-ad0b-4367-8dac-bed53c4f7f9b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/09/2025 13:55, Bryan O'Donoghue wrote:
> On 24/09/2025 11:43, Dikshita Agarwal wrote:
>>>> I understand your concern. To clarify, we are not removing support 
>>>> for the
>>>> existing Gen1 firmware, so backward compatibility remains intact.
>>>>
>>>> We are simply adding support for Gen2 firmware for this 
>>>> architecture. As a
>>>> result, QCM6490 will support both Gen1 firmware (with the Venus 
>>>> driver) and
>>>> Gen2 firmware (via Qualcomm's video driver [1]).
> 
> I agree with Dmitry here.
> 
> Its not possible to disjunct upstream HFI6xx @ the firmware level 
> between Venus and Iris because the DTS would have to point to a 
> particular firmware depending on which driver you wanted to run, which 
> would make the DT dependent on the driver, which is not allowed.
> 
>>>> Additionally, as part of our plan to transition all Venus-supported 
>>>> targets
>>>> to the Iris driver, SC7280 will continue to use Gen1 HFI and Gen1 
>>>> firmware
>>>> to maintain backward compatibility.
>>> Dikshita, this is nonsense. Venus and Iris drivers are supposed to be
>>> interchangeable for the hardware they both support, until the venus
>>> driver drops support for V6 hardware. At that point it's expected that
>>> there will be no V6 support in Venus driver.
>>>
>>> You can not simply upgrade to Gen2 firmware as if nothing happened.
>>> Consider a device node on SC7280 / QCS6490 with the firmware-name
>>> pointing to OEM-signed firmware. Both Venus and Iris drivers would
>>> happily consume the device node and try to work with it. One will work,
>>> another one will fail. This is definitely not what we have agreed upon,
>>> when you started adding Iris driver.
>> @Vikash, could you please chime in?
> 
> It would OTOH be possible _only_ release a HFI6xx Gen2 firmware for a 
> new SoC that doesn't appear upstream yet but, that's not the case with 
> 7280/6490.
> 
> ---
> bod

So discussing this with Vikash and some other qcom folks, I realised the 
DT binding at the moment doesn't depend on the firmware name, so my 
concern making the DT depend on the driver is not a real problem.

I think in fact it should be possible to point venus @ the gen1 firmware 
file while pointing iris @ the gen2 file.

Unless there's something here I'm missing, that should work for the 
update and the agreement.

Dmitry ?

---
bod

