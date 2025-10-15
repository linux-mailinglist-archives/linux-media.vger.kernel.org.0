Return-Path: <linux-media+bounces-44625-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E2819BE058A
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 21:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C4FB63BEA11
	for <lists+linux-media@lfdr.de>; Wed, 15 Oct 2025 19:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5122304BCD;
	Wed, 15 Oct 2025 19:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E3PiPsOa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A6BA288522
	for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 19:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760556021; cv=none; b=Cq0UwFpF+OXEzvOQ10ci549Wkq6xnMHF7Ms1Q88VJEuvf9YO5thAIjIlhGW6AYjSYs/IPfj4rWdUHIZZlYjPYn98upSscJVgKI282vQmC6EE7D8kwOUg8dcM1CrP+WbFDTm6mjZ7naJPnyRkwQ/mqrQq1f2vaXqXBq1yVqcRa8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760556021; c=relaxed/simple;
	bh=ep33UcssLfRjc51oBeoQ2Wt7olaU3sFvDFA0ufe3ojQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lzs08AZPvQ1iM+TTOWuUnCVgGMoreCBHyTc6yoEfwI4tOUwRWEhx2OSllzp28bpOCzNmb/GNCqjaWGfYThHy81OxLcMnjWsTAmF/IfiGGtxD78G2euMSAjkxSvST+gxSZyByjteDf7WuZQzPdfBMRowRiP3A5G9bfuAzUCqnePQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E3PiPsOa; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37645b8c09bso4728461fa.2
        for <linux-media@vger.kernel.org>; Wed, 15 Oct 2025 12:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760556017; x=1761160817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8mjpeIrj5Li1/mScwEA3BsQSOlfS1kTZ1a40z447tpk=;
        b=E3PiPsOaV9wRYQPcEuSfhVaFQJpjVUCf+1DcvZMDPzyaYo7JA5KkQhN8Qbx+fBQied
         9sjZmNJqfr+YDKCzcpyc34lJkXV2lRTwjYEYvceEGUX7t0y1SrHCCKf4yFr8HY/qeZmK
         FbziR1SIKyrxyD3R2MPOYU6J2dXjF5uSZtTOQh8OwuwScwHLTW1udbazj0r0B5eodUjq
         2HxJScN1pdHiPfQLuBJC8F+QJgr3mKV+MNZgzGTW1pLSurAApQkupHRaRvnbJ4mJO2UX
         NFwf1YRdwdBhhwitug8w/kAQPuC5E3WdyMrjId4r5cAzdPMpSz2+RA8hC9WjpsCnrhmz
         y0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760556017; x=1761160817;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mjpeIrj5Li1/mScwEA3BsQSOlfS1kTZ1a40z447tpk=;
        b=X090SohJMQ1jFH9BCHLQa/n+hJOs2R8e0l6OOFmsCAQ2rDLxDhzHXjjFAAVWQ7wD0g
         //AEw9PfPONYgGCXFxg8rs7wFNK8VkusDatd1aMGZWJrYMO4Ldhlm/ykmIR4UfCefWhY
         zcOwHEL69AcYEcJtL+ZhwYDFp9pTCW1fhOpfWjbBuk67lTCLzMpvUrdTxDdM8PJjIUsn
         ZfFhj/fItWp5o7w3o8xoIW4XjX1IKASHewnSZI/1mHVNJ94HDjT4Ig4Vw6s+ddigjrH8
         dcFaliQxn6KhQrfy4qIlafI4RjkNlrb0EWsoDmEBZpFN5OoDQen6owgMTsd3V3NiBTop
         Rdkw==
X-Forwarded-Encrypted: i=1; AJvYcCU3YhKZSO7RKmt2xxtYcesysoq5ffnw5bxQ894Cpjh6OWOUoqLh76TGXHzvzabqLkXk2w7uWnfNCTcVdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEy96f4opi9Fp0ocLRWM6ilOQTXPLJe4qMM8xwl1ewVj7nQoR4
	7eozYYOHJfvD5SMK+f+9gixWZhW4/stloXEIzuul6lGwho0AilVg12I0/ht3js4XBy8=
X-Gm-Gg: ASbGncszNZkNziMYz6ETS2cryhPlqMXVg56q3ycJ1LeX3DgdGq5aVAqAwn2br3pG0DB
	rcK+2VvW4lVpuFlZe3/wy0TqRYscpNvRRDCwrAK4+ibKTSNS3OCzbklR4DRXlfOBc0URDF9KXiX
	Qci8A5yur+7iYyXf/poOD1H2PQgKM009btE6HYwV+AkOcXfePWGMwux5bfF2hTFQsHB7FNJM86V
	qorkqCLoJg0rJ6TKOT0AWeFd6omOutomyBqnpaoQew4lHqRd9fsVUQBITVUyoIoZOt9swtmvJbx
	pjqeLMGBK15iF5VQk3uLYdoS7g4m5oS9226CymdCcYNzt0p1eUo5JWJKKnKxQVqfEGG7gjHLF93
	4rhs9temgfTSrDBQjUASaEeakOXAPi11PY8wFsvhnhKRPYoRxu5zFyRIa1HiMu+G+sLfRoBkM1I
	GCLTp3LmtvyyycxZnbx3yH0+I4VThj/R6NHcxDd/RYK6PoqkZOLNqTx2lb5hQ=
X-Google-Smtp-Source: AGHT+IGIsRWmI5ge5lUIdUu2k73q0laJqSFh/LT9P2c/QCskl/jxZ4XreU8Hx9BrNbAPGj0+NboZdw==
X-Received: by 2002:a05:651c:41d6:b0:377:78cd:e917 with SMTP id 38308e7fff4ca-37778cdeb32mr7411751fa.0.1760556017299;
        Wed, 15 Oct 2025 12:20:17 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3762eb6a963sm49042991fa.57.2025.10.15.12.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 12:20:16 -0700 (PDT)
Message-ID: <4eb4bb48-a8b1-4e58-a41b-b9277fbff6e9@linaro.org>
Date: Wed, 15 Oct 2025 22:20:15 +0300
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add
 missing power supplies
Content-Language: ru-RU
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Vikram Sharma <quic_vikramsa@quicinc.com>, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
 linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
 <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
 <bfa0d4f2-45c6-463e-8afc-d90edcf8cf2f@linaro.org>
 <15b35191-eaff-4971-bae5-2d5a8cb9f864@linaro.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <15b35191-eaff-4971-bae5-2d5a8cb9f864@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/15/25 22:12, Bryan O'Donoghue wrote:
> On 15/10/2025 19:41, Vladimir Zapolskiy wrote:
>> On 10/15/25 16:01, Vikram Sharma wrote:
>>> Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
>>> CAMSS binding to reflect camera sensor hardware requirements.
>>
>> What are "camera sensor hardware requirements"? You do add properties
>> to the ISP.
>>
>>>
>>> Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
>>> ---
>>>    .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
>>>    1 file changed, 13 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-
>>> camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-
>>> camss.yaml
>>> index 80a4540a22dc..dce0a1fcb10c 100644
>>> --- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>>> +++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
>>> @@ -120,6 +120,14 @@ properties:
>>>        items:
>>>          - const: top
>>> +  vdda-phy-supply:
>>> +    description:
>>> +      Phandle to a regulator supply to PHY core block.
>>
>> What is "PHY core block" here?
> 
> I mean come on, I think the meaning is clear.
> 

The meaning is clear, the expressed concern that the given description
of the property is very unlikely match the meaning, as well as the
description of "PHY refclk pll block" below is the mismatch to the
meaning.

The misleading information shall be removed.

>>> +
>>> +  vdda-pll-supply:
>>> +    description:
>>> +      Phandle to 1.8V regulator supply to PHY refclk pll block.
>>
>> This is a copy-paste example of a known to be wrong pattern.
> 
> You're right about the name, please align with this commit
> 
> git show cba308979b012664c7fe7c5baa818fcb68e86363
> 
> Thanks for spotting.
> 

-- 
Best wishes,
Vladimir

