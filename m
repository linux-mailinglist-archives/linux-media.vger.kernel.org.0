Return-Path: <linux-media+bounces-10421-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1405A8B6F63
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 12:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 93F781F24468
	for <lists+linux-media@lfdr.de>; Tue, 30 Apr 2024 10:16:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E83129E88;
	Tue, 30 Apr 2024 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ta/lCLDZ"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD43128385
	for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 10:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714472170; cv=none; b=ImjhYYNF8HxyfNdn6CFaOXmtq+qiCCIFt20g4vZVqzFUadEG7VDXPKEbKYW6h85biEJHYkO8CR6LCPhn6J8BQmpBSMSO4an4fEID3xcasE8MpEHmi9LXAKwC3QE6bPpxWk07OAM1OrzmGpbdP+lb72L/rSjfPYTveAzY19O76Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714472170; c=relaxed/simple;
	bh=3i/mZ1H0MCHiah5K0FmqCuU7zvPu+ffZG9xaTvoixZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F63SCj3OvD+NIbBbE42yG+V1utnyOuuIulAkmwyRA5VkZ88xBpnarHceap4skdGViDBgsHLRJDwQJt9MQWMdiE4cTvuVOtjzQyC3qzzG/W1KOXLKhnrkBy1S0nfhalZqY0MqnO0y3RmuqQP5R7GOXr+rdmAS20pRAb9lECoDm58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ta/lCLDZ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a4702457ccbso726244166b.3
        for <linux-media@vger.kernel.org>; Tue, 30 Apr 2024 03:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714472166; x=1715076966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QS5G9xaEDMP1Wf2wf2lTz5Y1Lqg/xMjisBHDdDnaE70=;
        b=Ta/lCLDZbzsZfwAiTjbBR6e1WWEN1cieYW0K/4cj8w0Eti3e623ekAjZE9FBPNT4se
         XSznzuF7KxUYsyNmLwm5sl5XCqeu+pG2IR7C/jbIqJvNP2eKyHfwJ4zsmcnlLDZ1OdPQ
         EvqCFTjjwv3OEKcIZzb+AVQ5KVB7qGaPxMKnNMJZgdqGXkUh77pyHfytCh666bWKtVoi
         HYdeCxrhSDg9Zl5SwxtsM9ZQGkmHMMTGjXYoy0mBc72+Ognkvv9bNlA+r3qkxdWPq5tQ
         L5xVBctEoLh2n2h/ZFJ4G4zipStm3bZdiFcjNF6+DBp+cT/JY+wvdCfKigltcN3RxFHl
         RZcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714472166; x=1715076966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QS5G9xaEDMP1Wf2wf2lTz5Y1Lqg/xMjisBHDdDnaE70=;
        b=RNhDmPdE1PL1XamT4i9IlfheRID2gYFiiO+w0fvPvfDvlKY5rxnsEByrYqz5SziUrW
         i2w6MSWqa1LX1ir7PWcHnZYgd/AvB1G9KtVzK4no68cEVumzZHgJdkWMvOZw9Mk2TO+8
         fNXrFDlJUXgn3OOyDHeXkbB5ZpBfODMGkoqc3PmGZBhQQ1VRQPrl4S2H4veLH7zS5oC1
         PCQEUtuBSFgk+c4YMOHB16I/tfFY0hvdGgJPEQuGRDj6dUIrppoxudsuaGwl7HqwSwaH
         YinLzAKJxO04XAb/rhc43gnnL70I0TgCtOyqsYcmtDodv/ZtSRBmdfOVZ/U1QrmsqtSi
         RH/w==
X-Forwarded-Encrypted: i=1; AJvYcCXaSJL6A3PA7DuQrC58g40RwLAVmz3c1iscvrvz94a3xwlVz00AcPKRAOKz1qCcmIAr7lY6+V2vDswFGfBZkyjAbw56D1P+ugAScxs=
X-Gm-Message-State: AOJu0Yxl38sXWrxtyNeu8tKx+QErh2/EcZJOVgQARk9MYqq4bu8EwQ+M
	06tbgd7OA4QCw3iDBN//3jHl+kkW5vH28gZ71LuXXCV+Kg9SJdXC/Moalc5ryE8=
X-Google-Smtp-Source: AGHT+IFTQzO4IP7DsoWJGmXYcGmzFlWbU7upz7g/BF+jQcsWEWQO26vjyLvd7/vBO2qWRMKtvEnULQ==
X-Received: by 2002:a17:906:3b0f:b0:a55:b3d8:a0c8 with SMTP id g15-20020a1709063b0f00b00a55b3d8a0c8mr9078587ejf.42.1714472166334;
        Tue, 30 Apr 2024 03:16:06 -0700 (PDT)
Received: from [192.168.114.15] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id bv19-20020a170906b1d300b00a58eabf6082sm3734438ejb.199.2024.04.30.03.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 03:16:06 -0700 (PDT)
Message-ID: <6bf981a3-2613-4b5e-aa5f-3a83f9bfaf47@linaro.org>
Date: Tue, 30 Apr 2024 12:16:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: media: add qcom,msm8998-venus
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marc Gonzalez <mgonzalez@freebox.fr>, Bjorn Andersson
 <andersson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Bryan O Donoghue <bryan.odonoghue@linaro.org>
Cc: MSM <linux-arm-msm@vger.kernel.org>,
 linux-media <linux-media@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <2b21b160-a530-486a-9404-c5bf8863ffed@freebox.fr>
 <4ea494cf-134e-4380-aea1-4c166a626561@freebox.fr>
 <9655f9ca-91e5-42c5-9a08-cb342179dc4c@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <9655f9ca-91e5-42c5-9a08-cb342179dc4c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.04.2024 9:54 AM, Krzysztof Kozlowski wrote:
> On 29/04/2024 18:15, Marc Gonzalez wrote:
>> Add YAML binding for Qualcomm MSM8998 Venus HW video encode and decode.
>> (Based on qcom,msm8996-venus.yaml)
>>
>> Signed-off-by: Marc Gonzalez <mgonzalez@freebox.fr>
>> ---

[...]

>> +
>> +    required:
>> +      - compatible
>> +      - clocks
>> +      - clock-names
>> +      - power-domains
>> +
>> +    additionalProperties: false
> 
> In nested blocks, put it after the type:object, for readability.
> 
>> +
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

https://lore.kernel.org/linux-arm-msm/ba40de82-b308-67b1-5751-bb2d95f2b8a5@linaro.org/

We've since established that the video-encoder/decoder subnodes are bogus

Konrad

