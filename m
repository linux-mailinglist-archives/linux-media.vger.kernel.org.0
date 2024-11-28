Return-Path: <linux-media+bounces-22207-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 316219DB456
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 09:54:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91D74281BF1
	for <lists+linux-media@lfdr.de>; Thu, 28 Nov 2024 08:54:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00D5414D44D;
	Thu, 28 Nov 2024 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b3+mlO7T"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9059814F9FA
	for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 08:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732784053; cv=none; b=GycnRhZK9FJRkoxkE6F2GXdsMsaF0ppwMMaFQ4cw1vXVbyzfRN8jc4ixRWloxLDIcGTAPFdfZvEkcyPE4dzsNDtq3lKN1PxMxVJ/I2RyI+75yUnxeuxZRwkzKK4XZ2DLjoqxTvYbkKv7UQSJ/ThQB5Fsq88U9CVHHinATGJ3ACY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732784053; c=relaxed/simple;
	bh=hkz5SihmtOfz3xVNnJafozuWVVcp4a3ROsLM9kv99sM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UHbiKiNtqSQ0KRTylZo/a5lEAu5piadtgysGWBZDClcG+Xa7YIeUGyByETNehE0m9wNaFiq0Ez1B5DDcJMvI2eKY5omVQQB7NqjpgRaMcz8DSrk3++bJ0iEtSo91VbeZUlBvkaXG5fOms9NoKyygC23XjJodj7oQuf6Y3bQi5qM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b3+mlO7T; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53dd58a4433so83904e87.2
        for <linux-media@vger.kernel.org>; Thu, 28 Nov 2024 00:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732784050; x=1733388850; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/W+eYtBA0K7MiFNuTWTEaMbtArpeNHfybJbxvLhrBp4=;
        b=b3+mlO7TuPoiTq4oSFa5Uh4HRLdrhy4Ihs0nIofOEDMaQJDqSZyXow6cv34pPsEtSU
         enlPoae8R6WiM8aTxZtpW5mNgVAK7yPwb1Im7qiNUtEotC9KiF+eHJcQlw4rfuqJy9J2
         SVTLMiaaQZoUWucwC0FsiThKxQUnFi1FTyqd96sauc2xbLZto+ai2xTPyUmxtM+3qRF6
         QXTxP5EFPoFmQFt/C1nBo6sHfqMXsMF/3e6iOqEb9dtMZzCwWb4+oIohbwNilbh7tViA
         S9cacc0ThVBiLk1HN/r5tADZhTwhetYvxq4WZRnTPPKroZnwGeBa4KONlD76rgwY4gS7
         SpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732784050; x=1733388850;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/W+eYtBA0K7MiFNuTWTEaMbtArpeNHfybJbxvLhrBp4=;
        b=lxDMptQUs5M+4n8ewLUySUSdKZ8N7slX8KOLvNbxf82bQXGkb3+DldQ0b0T/1Niypy
         N1I9WAOiC4qnI7n9ZcRvtN36h1Gzm5Y6/tkPUo3aypmt7jfbk7q0B/Ol+12nQbwefZ+J
         2+CRd4pGblZ5gtyZzjDwLbwsHAQOtp/rwRmU3M36v1IKUdBJwD63EFbRgtlGU7CVp3aN
         xZu3RICiRvx60jax1BZ6an5RgxKSACSQWj0pAiMYxcoZoFjAw25/A3xHs17zMtqoLVhS
         fG9OomBS+DPSrklRvTkh8NNktuCFiFKFqKp4d4vQoRtL1bdteyISlH0Cl+GYnthrqXf4
         ZLQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyYAabRkjFh0WKrXmn3Lr+wBEKQpe3WR2zguhSbF9NlJgPa+6RzjwmsE5IjPV9rye8BR+9t5IvQ+u8wA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHsft3VJbMaicWdj2Dk73m080sc1VUK1RekR/IXLkibj+IUYyf
	ftIQoxWGNVFWcsFfRkgMv2ms+9W6EbdNUMNdztnYmH7yLxrUx2QYtgb5qGdnHLc=
X-Gm-Gg: ASbGncsEHo50/XF6z5c3/cw5ZrBQTaj3R9lHLLw2xOJXZSShCYmrfVSr3JwsJxFzAjf
	pjMnh5vkZ1CAcupjVbnsRjbKuc3EKGHhmJGV+HwNePnYdzECNk+zn7DuBLRWDg/x0DYdbPHCG8d
	2DOlBTiuTMIkYKlzlxkep4Q1OhmlqRw6b/9VgUl+wDFsLIL9e++xPSk7QrjVFqovRrnT7EflMie
	ApNC3Gtwen0ZxBdrnm1ZdCTwH0SlbNFczuXgLZaDvPftdGscRqDjEO9EJah8VIlHTRRmLFnfapl
	N+rv5GsrkB3JK6aEYOirMiiIFBsJ
X-Google-Smtp-Source: AGHT+IHV3a56IUZQzYTe6GHWJjVxI2dvKif7m/fkToU2b9Jrm3M3uttjabmeH44i0IqdBu6iIkTEIQ==
X-Received: by 2002:a05:6512:ba8:b0:53d:ddcc:5143 with SMTP id 2adb3069b0e04-53df00ffeccmr750775e87.10.1732784049654;
        Thu, 28 Nov 2024 00:54:09 -0800 (PST)
Received: from [192.168.1.4] (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df649671asm113813e87.191.2024.11.28.00.54.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Nov 2024 00:54:08 -0800 (PST)
Message-ID: <e7f5f84d-d7cd-4052-bc8c-1b1e5f2a0073@linaro.org>
Date: Thu, 28 Nov 2024 10:54:06 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add qcom,sc7280-camss
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, akapatra@quicinc.com,
 hariramp@quicinc.com, andersson@kernel.org, konradybcio@kernel.org,
 hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241127100421.3447601-1-quic_vikramsa@quicinc.com>
 <20241127100421.3447601-2-quic_vikramsa@quicinc.com>
 <1a87e9d9-da7e-4b8b-807e-f56aa15acfc2@linaro.org>
 <25f89e78-faec-4eba-887b-019eed752064@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <25f89e78-faec-4eba-887b-019eed752064@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bryan,

On 11/28/24 01:31, Bryan O'Donoghue wrote:
> On 27/11/2024 12:57, Vladimir Zapolskiy wrote:
>>>
>>> +        camss: camss@acaf000 {
>>> +            compatible = "qcom,sc7280-camss";
>>> +
>>> +            reg = <0x0 0x0acb3000 0x0 0x1000>,
>>> +                  <0x0 0x0acc8000 0x0 0x1000>,
>>
>> Unsurprisingly above is the error, which has been already reported for
>> enumerous amount of times, I wish to stop poking it eventually, please
>> reference to the previously given review comments and fix all of them
>> before sending a new version of the changes.
> 
> So just to be clear what is wrong here because it may not be clear.
> 
> 1. Sort by IP name
> 2. The first address @ reg should be equal to the address @ camss
> 
> -> Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml
> 
>       camss: camss@1b00020 {
>           compatible = "qcom,msm8953-camss";
> 
>           reg = <0x1b00020 0x10>,
>                 <0x1b30000 0x100>,
>                 <0x1b30400 0x100>,
>                 <0x1b30800 0x100>,
>                 <0x1b34000 0x1000>,
>                 <0x1b00030 0x4>,
>                 <0x1b35000 0x1000>,
>                 <0x1b00038 0x4>,
>                 <0x1b36000 0x1000>,
>                 <0x1b00040 0x4>,
>                 <0x1b31000 0x500>,
>                 <0x1b10000 0x1000>,
>                 <0x1b14000 0x1000>;
>           reg-names = "csi_clk_mux",
>                       "csid0",
>                       "csid1",
>                       "csid2",
>                       "csiphy0",
>                       "csiphy0_clk_mux",
>                       "csiphy1",
>                       "csiphy1_clk_mux",
>                       "csiphy2",
>                       "csiphy2_clk_mux",
>                       "ispif",
>                       "vfe0",
>                       "vfe1";
> So:
> 
>           camss: camss@acaf000 {
>               compatible = "qcom,sc7280-camss";
> 
>               reg = <0x0 0x0acaf000 0x0 0x4000>,
>                     <0x0 0x0acb3000 0x0 0x1000>,
>                     <0x0 0x0acc8000 0x0 0x1000>,
>                     <0x0 0x0acba000 0x0 0x1000>,
>                     <0x0 0x0accf000 0x0 0x1000>,
>                     <0x0 0x0acc1000 0x0 0x1000>,
>                     <0x0 0x0ace0000 0x0 0x2000>,
>                     <0x0 0x0ace2000 0x0 0x2000>,
>                     <0x0 0x0ace4000 0x0 0x2000>,
>                     <0x0 0x0ace6000 0x0 0x2000>,
>                     <0x0 0x0ace8000 0x0 0x2000>,
>                     <0x0 0x0acc4000 0x0 0x4000>,
>                     <0x0 0x0acb6000 0x0 0x4000>,
>                     <0x0 0x0accb000 0x0 0x4000>,
>                     <0x0 0x0acbd000 0x0 0x4000>;
>               reg-names = "vfe0",
>                           "csid0",
>                           "csid0_lite",
>                           "csid1",
>                           "csid1_lite",
>                           "csid2",
>                           "csiphy0",
>                           "csiphy1",
>                           "csiphy2",
>                           "csiphy3",
>                           "csiphy4",
>                           "vfe0_lite",
>                           "vfe1",
>                           "vfe1_lite",
>                           "vfe2";

So, apparently it is the third and the new proposed order of sorting. Any
following scheme is worse than the previous one in my opinion, but why not.

--
Best wishes,
Vladimir

