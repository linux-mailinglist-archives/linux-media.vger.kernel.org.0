Return-Path: <linux-media+bounces-39830-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 501A5B25506
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 23:15:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06B965A6488
	for <lists+linux-media@lfdr.de>; Wed, 13 Aug 2025 21:15:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EE7D2ED16F;
	Wed, 13 Aug 2025 21:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEBG+XJo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C238829B22F
	for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 21:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755119716; cv=none; b=pHI4EgDvVmnOzJW+R9uODpGr8SAmj7jsVjJOMveQpEcdmKAdpUdClt0bF3IabEh0GHt/0u/MscUDzJ6G2LjDtfPUVRZiUpYl7SI57Reu5rcKUN6s5Y6KWtc7nMKz5fXYZwPdUM4LxNwkdEDEDHfKNE6u/bIlGugb1UEgrYStwQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755119716; c=relaxed/simple;
	bh=f0mOh5zW36wEzOojcDIcMa7UEWLFOqZuK/fsupPNmY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GujtN56ZzygtxCrprYE/3g5OkasE2/3uyi4ChE1m2BQeNlJ1ucLpJMGvVK8S10efQKDp6bvqL2f4Wofm10MMRBJPO8arPPmFSl9nSnGr2lVNAeRCWTE0vFk8EGsl7KV0kx27XhWbaQNoc9R24I0foEbfgssUSutHPufa/RGn5rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEBG+XJo; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e41669d6so181451f8f.2
        for <linux-media@vger.kernel.org>; Wed, 13 Aug 2025 14:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755119713; x=1755724513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ewofpmx2u2AWLuh72EpS+Kxy8uzpjMF+7SbnHvsYlc4=;
        b=iEBG+XJoLFsnrn6dm5Fsa2J/ukEKZdfxok99/Qz+ZSBT/ocPZbg0cyOtkO8wFB1KxC
         V3oC2YQBwEQUo2hGLlfssLsSgzJJV2AI0N1RT/sXR4WfEFRmX/hA8VvttnVRe032Y+N2
         zzgGyQ5h0GwZWuNI70flYcztveCpUA8hhA9ql+CCz5tFCVMfipttR+S+z7bfKHcpQguk
         D9rK2uXZtl461kj3WFMQ7hKMksw5q8UJ7Ya9vVG3BquGU1Cx5mYhGhJ9Iyc7ZV0Zjj21
         UpUlgmAxmXwh1WFYYQlopN+fXiKFIkHwVvdOP0ahGMk6YPSfSG3bxu66eiNgMC4EiTHo
         G53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755119713; x=1755724513;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ewofpmx2u2AWLuh72EpS+Kxy8uzpjMF+7SbnHvsYlc4=;
        b=nRPQ06JHq+GyullFoinKOQvFnlQSN5yvj7KjKBlR+t6CLp2lixt7XPWccfLV1WkjpK
         DmGfFT94mgPiu4w75guGgbBADRqle12wFHsttQxGXGYyinkMIdWbGogNKuSpUsnmml2W
         HLN4WbhLQh+hQIRM6WelLhsoh5aQqzeU8nfXd3hfqyoARqkf5ZV+SfVs82qmmhxIBLQU
         l20HkUaNzRSCLWO4Kx9srC+rCiev7XRIF/UXD3vCBhsL8yeTqj29OQSzf9O16eWGT+DH
         Y+8xIVmruOJdXDq67ivF8ZThe5+D2ENIyjbcnL1h3ElI5ahNkV6+bTqAUC3eR9+ZD50Y
         F80A==
X-Gm-Message-State: AOJu0YzT6bQaktnoxlmvrsj32MTpyNYYsebTlxHax1zM2lTfLvGPfF6x
	R9rJ/3dmsLlAXDwDY4Jlp7HpGqenWdd2N5nls7gX2WEHQSj2yd3yZ1wCI29CJ4rWZL8=
X-Gm-Gg: ASbGncvLpQv8x6BC8WzzuzCW/3lhwxaCZ0wn65OuqBbMmMODkt+RxE22/4S3aPcUipI
	SWfL7gJz+XsJODJl847i/yvOIKFzw0onI3cLt5iNKiPDpvCYLKfzhAJEjtkpfroG3IHIENsAkeE
	Id5Bw+Ip55sbrXFdMJGJaZtXGmSd6XKErDa5HpIJtyGEGFHCAoGHtBuYlm976tS5BfI7dtJzBQA
	w0ATbk7FlySamYUj6szaAYcKQXsaAtc64jhJU4mcqNn+k09HFAPzQjOrhXtwq9cwzKHx8bGC4DO
	rvHZoy3QnWCVINA5iRl/yZx0qFFFW8MAgpHrRwa9pO5yFtKbGoxOoJS42c8n20l/Sn8jPK5H7X5
	S3q18PkfGjwEYfT+Yd+s7g/Vu13sHLHfLGdRsTH3LuwVkwJ8eYDWJt01gCchuXM5+
X-Google-Smtp-Source: AGHT+IESt7Dqns9DwMc5t6p93qJ/wntgnWbJwzl+NSSOoNpJ0QKJzEMjsB+Jf37ThCfpJRFyEsk/pw==
X-Received: by 2002:a05:6000:4283:b0:3b9:8224:d3cf with SMTP id ffacd0b85a97d-3b9fc2f813bmr578094f8f.54.1755119712975;
        Wed, 13 Aug 2025 14:15:12 -0700 (PDT)
Received: from [192.168.0.13] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b91b05b28fsm2527911f8f.21.2025.08.13.14.15.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Aug 2025 14:15:12 -0700 (PDT)
Message-ID: <93e35282-52a3-4c3e-8065-b2a6c363c974@linaro.org>
Date: Wed, 13 Aug 2025 22:15:10 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] media: dt-bindings: qcom,sm8550-iris: Add SM8750
 video codec
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250804-sm8750-iris-v2-0-6d78407f8078@linaro.org>
 <20250804-sm8750-iris-v2-1-6d78407f8078@linaro.org>
 <683024c7-3740-cb9a-6924-33816edd63f3@quicinc.com>
 <8d8dcaef-eb96-4e7b-9a0a-8b3836cb284c@kernel.org>
 <e33a22ba-f82a-412a-b1fd-d1cd50f6b21d@kernel.org>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <e33a22ba-f82a-412a-b1fd-d1cd50f6b21d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/08/2025 09:04, Krzysztof Kozlowski wrote:
> On 12/08/2025 10:00, Krzysztof Kozlowski wrote:
>> On 12/08/2025 09:54, Dikshita Agarwal wrote:
>>>
>>>
>>> On 8/4/2025 7:07 PM, Krzysztof Kozlowski wrote:
>>>> Add binding for Qualcom SM8750 Iris video codec, which comes with
>>>> significantly different powering up sequence than previous SM8650, thus
>>>> different clocks and resets.  For consistency keep existing clock and
>>>> clock-names naming, so the list shares common part.
>>>>
>>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>> ---
>>>>   .../bindings/media/qcom,sm8750-iris.yaml           | 186 +++++++++++++++++++++
>>>>   1 file changed, 186 insertions(+)
>>>>
>>>
>>> Query:
>>> Can the additional reset and clocks be accommodated in existing 8550-iris
>>
>> No, different hardware. Although it is hardware from your domain and
>> your company, so I would assume you know the answer.
> I guess I misread - I thought you want to re-use existing properties or
> something like that, but you just want to create one huge binding?
> 
> No. Don't grow these unmaintainable patterns. We have been changing this
> for some time already :/
> 
> Best regards,
> Krzysztof

@Dikshita can you revert here are you happy with a new binding or 
requesting in-line changes in Iris - my reading here is a binding is 
justified.

@Krzysztof 
https://lore.kernel.org/linux-arm-msm/fb8f154b-3da4-4bee-82e1-3a1597a35c46@kernel.org/

Are you sending a v3 here ?

I can also just add the OPP when applying this patch.

---
bod


