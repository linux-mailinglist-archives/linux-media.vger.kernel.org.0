Return-Path: <linux-media+bounces-48599-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 982C0CB4153
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 22:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5AC363014DEC
	for <lists+linux-media@lfdr.de>; Wed, 10 Dec 2025 21:46:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26986235C01;
	Wed, 10 Dec 2025 21:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mroN9O/G"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3FD21767D
	for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 21:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765403170; cv=none; b=B+1Q6zbmHk06OcLPFD384rYGVa4+fcF82IgPTy6nVyMHqVyV0Rfis/gXezH6ABWaM1xE3lKfcHdprzZMg24t+Jd7e8xi3gYcqxRGwwqnAwunkofzvG5h2802ykTnDS2ngYN53s50Cq56hOL14Vuf1RngRRH+Nl69YcsiyQ7bRG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765403170; c=relaxed/simple;
	bh=QrsoN2azNxIpAh5CaG0o7xMKjiSA2W1NIXcLmJY6M5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8kK0WZXniuTkgk1Y3Qw8VAUkFpl4IaVVzBp+PFadpZ+GsF1YvppsIC30GCtaYCx4Q7V1Eds5qWsfkyku109yPRVCEUtxbVjB09xwYSNFB3JnI3mI/CelwkMj+On30OT7Io43QowIs6fb7IrHSSIL8+L8hWWDZE/uDWUKhIPBfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mroN9O/G; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-297dd95ffe4so3424005ad.3
        for <linux-media@vger.kernel.org>; Wed, 10 Dec 2025 13:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765403168; x=1766007968; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XvjbXstxZws0JCVxSCuOJ6i73/Kz7IsJRWNMQucF0cQ=;
        b=mroN9O/G+RcHOtq0+V1rYowM28vsLJdF+PReuq4D4hoX4WzUak4w8o9GVuaa4KLZWf
         GPJyQtWFJpWm32/AwZrW1G9chQZ9ucBvueO5gGEYbAgdU18Rx9ldNzxYg2B/QIZ7AcAM
         yEvBQDBM+qHwkGD5qRw7kbh+sKDqtmKV9LuVhddq8/Ygd8pvL5UngLFQnE7orrxcWzvY
         tw9HuUWlMDwHkGyCGnBNoELMy5muImjrv+OiBy8bBqatn61xOfHAGRZC6xeUW4ZGsxGN
         /y/1Ph/r+CLrEpH27aY6PMSrK/OxJyKkthjV2Tk37LIJc6aSrp5lBtdQk7ry//DDh7p2
         4HGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765403168; x=1766007968;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XvjbXstxZws0JCVxSCuOJ6i73/Kz7IsJRWNMQucF0cQ=;
        b=WrY+V8635h/ZEY2LSq34n64ir83fV2P4hA8syTpEzxgv3YfGSbdM4qSDHdCOTEFoyD
         348pmO+2dseXUQRQGKyzwe0D0DRR8GqMfct1opEVuYvn6E1twfMzwNSX9Ly33ewlxKXm
         cYmcdENBHySU95aPGlLbcebboHv+Umckr0rGtMCnADKgTDaipNXUKtghSTqXHlqFZmj7
         nl7ZZtmaL0sVt11NAywBWbnu9x982EFPNLmBxMW9eX3e1vOY8dUiAPoRfQKH1ve98h6k
         BX3esVmZLMPeSlZIrpbU2QLcHZrAjOPHDhxBsduoZS26MhykrNW45MkkVzy8fYLmUjuN
         SqFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM2JX9CSqjLFQ3IARcsIPl8FjVfVwyrH56SVGqrfz2e1Qfozp3aektqsg029oI0qqXwNqa+yS/HIQkJA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNptY/EiF7T8pqanM2mgInr0lU6QvfEq51i91kHWRlbKukbYMY
	tofwhlhs+ivTSTffDa4NYqADfETggdxSNHDX8vy9vUvDblhx1IsLovomg7Z0EJCfdSU=
X-Gm-Gg: AY/fxX7U22KFqyFxPccX+kk8avtois5i/7Q2zndnaDXomehMCs469PEZx5eqM9vCC5c
	ftnLZsQpbbFiTi2dZ6YdqRg3hgLkPllZ1n0yKHZgIVze76bssJFN05+thK0tt/SZCt/2VccN3R7
	d6rcw2F8O6VgmsDZsFXW5GupuY2loElkwcYJ8PXRVorG0H/JiqgfN5lM+5vZ3Q/mjuunPTz1sBh
	QtwbUxGzlUBPxMc1oXfokHne24WItUQsdLjkJxUQp4eg0OgJk29wEVJxoH0cnilqcXHbmI7Uyek
	R/NGj0C7BznRyKCRJyDIyXaa1Sg3aShUzNoaLJil1sF2i6U4jvR9Wplovod2R0J/8PZ0BZ7xTo5
	QVch1SVc5RQ7iIBIVt9l96FCVwfoegCXZMrqGd017uZlrVWZLeXhiyAK1veBVLUQ9A6OZ+rV1zW
	0rTeX+TS8PJDpmRJLMYipWt7Q6QxWuCRYSSu+hJX6J6rvq6b9JGesQxKEXW3w=
X-Google-Smtp-Source: AGHT+IGexHXYQjFit2gnkEqUInFK9e7lZ5vay6JMROzUucD6dZ/qQ1CLM5Fdd3WZfFFSf98HL7pgCw==
X-Received: by 2002:a17:902:ce09:b0:29e:38de:6140 with SMTP id d9443c01a7336-29ec22fadffmr36116815ad.13.1765403168033;
        Wed, 10 Dec 2025 13:46:08 -0800 (PST)
Received: from [10.237.118.45] (M106185144161.v4.enabler.ne.jp. [106.185.144.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34a8f6e5af0sm267766a91.9.2025.12.10.13.45.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Dec 2025 13:46:07 -0800 (PST)
Message-ID: <1c9db550-677e-4fdc-8929-89c21deecf17@linaro.org>
Date: Wed, 10 Dec 2025 21:45:56 +0000
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20251208-add-support-for-camss-on-kaanapali-v9-0-3fcd31258415@oss.qualcomm.com>
 <20251208-add-support-for-camss-on-kaanapali-v9-1-3fcd31258415@oss.qualcomm.com>
 <scnexmcrpemu6vcms3dmq7qjvx54h5pyumjvgqduospao4x2kt@hoi7zfygjq4f>
 <458a7841-e422-4cad-83de-f5b5c1b683a6@oss.qualcomm.com>
 <puv24qramoiq4qq3i4bibatg5ihnrv6hdloul5ajbblvasvwk3@nbse2m6aftkh>
 <2e38b9f3-8a35-4a27-82d3-c1d4996a1684@oss.qualcomm.com>
 <9ecf4783-e1a2-430b-a889-997689bafe45@oss.qualcomm.com>
 <qfhlyl46i7az56t5ceyo42mw55udzwhxgpygw3jnpw3onr6qc2@5r3i6tb6ac3v>
 <bf54a030-ee01-4b66-97d4-37f50a75d93c@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <bf54a030-ee01-4b66-97d4-37f50a75d93c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/12/2025 19:36, Vijay Kumar Tumati wrote:
> 
> On 12/10/2025 11:25 AM, Dmitry Baryshkov wrote:
>> On Wed, Dec 10, 2025 at 09:50:51AM -0800, Vijay Kumar Tumati wrote:
>>> On 12/8/2025 3:21 PM, Vijay Kumar Tumati wrote:
>>>> On 12/8/2025 2:48 PM, Dmitry Baryshkov wrote:
>>>>> On Mon, Dec 08, 2025 at 01:03:06PM -0800, Vijay Kumar Tumati wrote:
>>>>>> On 12/8/2025 11:53 AM, Dmitry Baryshkov wrote:
>>>>>>>> +  interconnects:
>>>>>>>> +    maxItems: 4
>>>>>>>> +
>>>>>>>> +  interconnect-names:
>>>>>>>> +    items:
>>>>>>>> +      - const: ahb
>>>>>>>> +      - const: hf_mnoc
>>>>>>>> +      - const: sf_icp_mnoc
>>>>>>>> +      - const: sf_mnoc
>>>>>>> You know... Failure to look around is a sin. What are the names of
>>>>>>> interconnects used by other devices? What do they actually describe?
>>>>>>>
>>>>>>> This is an absolute NAK.
>>>>>> Please feel free to correct me here but, a couple things.
>>>>>>
>>>>>> 1. This is consistent with
>>>>>> Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml. no?
>>>>> I see that nobody noticed an issue with Agatti, Lemans and Monaco
>>>>> bindings (Krzysztof?)
>>>>>
>>>>> Usually interconnect names describe the blocks that are connected. 
>>>>> Here
>>>>> are the top results of a quick git grep of interconnect names through
>>>>> arch/arm64/dts/qcom:
>>>>>
>>>>>       729 "qup-core",
>>>>>       717 "qup-config",
>>>>>       457 "qup-memory",
>>>>>        41 "usb-ddr",
>>>>>        41 "apps-usb",
>>>>>        39 "pcie-mem",
>>>>>        39 "cpu-pcie",
>>>>>        28 "sdhc-ddr",
>>>>>        28 "cpu-sdhc",
>>>>>        28 "cpu-cfg",
>>>>>        24 "mdp0-mem",
>>>>>        17 "memory",
>>>>>        14 "ufs-ddr",
>>>>>        14 "mdp1-mem",
>>>>>        14 "cpu-ufs",
>>>>>        13 "video-mem",
>>>>>        13 "gfx-mem",
>>>>>
>>>>> I hope this gives you a pointer on how to name the interconnects.
>>>>>
>>>>>> 2. If you are referring to some other targets that use, "cam_"
>>>>>> prefix, we
>>>>>> may not need that , isn't it? If we look at these interconnects
>>>>>> from camera
>>>>>> side, as you advised for other things like this?
>>>>> See above.
>>>> I see, so the names cam-cfg, cam-hf-mem, cam-sf-mem, cam-sf-icp-mem
>>>> should be ok?
>>>>
>>>> Or the other option, go exactly like
>>>> Documentation/devicetree/bindings/media/qcom,sc8280xp-camss.yaml.
>>>>
>>>> What would you advise?
>>>>
>>> To keep it consistent with the previous generations and still 
>>> represent the
>>> block name, we will go ahead with the style in qcom,sc8280xp- 
>>> camss.yaml. If
>>> anyone has any concerns, please do let us know.
>> Krzysztof, Bryan, your opinion? My preference would be to start using
>> sensible names, but I wouldn't enforce that.
>>
>>>>>>>> +
>>>>>>>> +  iommus:
>>>>>>>> +    items:
>>>>>>>> +      - description: VFE non-protected stream
>>>>>>>> +      - description: ICP0 shared stream
>>>>>>>> +      - description: ICP1 shared stream
>>>>>>>> +      - description: IPE CDM non-protected stream
>>>>>>>> +      - description: IPE non-protected stream
>>>>>>>> +      - description: JPEG non-protected stream
>>>>>>>> +      - description: OFE CDM non-protected stream
>>>>>>>> +      - description: OFE non-protected stream
>>>>>>>> +      - description: VFE / VFE Lite CDM non-protected stream
>>>>>>> This will map all IOMMUs to the same domain. Are you sure that 
>>>>>>> this is
>>>>>>> what we want? Or do we wait for iommu-maps to be fixed?
>>> Yes, when it is available, we can start using iommu-maps to create 
>>> separate
>>> context banks.
>> It would be necessary to justify removing items from the list. Wouldn't
>> it be better to map only necessary SIDs now and add other later once we
>> have iommu-maps?
> I will let Bryan take the call on this. He was the one who wanted all 
> the SIDs in the bindings. Hi @Bryan, if you can kindly share your 
> thoughts on this and the interconnect naming, we will go ahead and push 
> rev 10 for this. I believe we have taken care of other things. Thank you.
>>

Since when are we delaying patches for future patches that may land never ?

I'm fine with whatever clock name changes you can agree with Krzysztof 
but it seems a bit ironic to me to be given feedback to "align with 
previous dts" to then have the result be further change.

I'd like a bit of stability and consistency TBH.

---
bod

