Return-Path: <linux-media+bounces-3559-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4DC82AE9E
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 13:21:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18F4E1F294C8
	for <lists+linux-media@lfdr.de>; Thu, 11 Jan 2024 12:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 875E415AE4;
	Thu, 11 Jan 2024 12:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/xsHfmo"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C294156FD
	for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 12:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2cd7e429429so18621441fa.1
        for <linux-media@vger.kernel.org>; Thu, 11 Jan 2024 04:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704975653; x=1705580453; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Tnl4zNdZiX89VhetJJhBcaJss+KohEVglFcJdoQMpU=;
        b=Q/xsHfmoCB2zBr7qYU8DxwBQqFIocWrzRNSIrlLptFPVeqmknkapkkfv8ZpHpYNWD3
         XbogCurc84TDDGez12kt75ZZHV9sngeWDbDHI+X7sbdPy4h/hzksnwEt9gD8zOjYaj5J
         Fqaa5ZAdE8nyp04m3Ozp7T+BwcVLly4oR/qqfUV4/G8h9hIP2y6IU1kjoBT/F4eIqRcZ
         EqNOvDfLciDwzUdZcISmj4ajo/PxrBE7up1Idk8//0Is5qk61eERMgRuqh/tYGwF/NwS
         tgQcokAHsw2DHSzhjWSh4LEplXFXZm9rMFUMBACjMaP8ArZFEfDj0UI/Z8gLGqhaZNRL
         WmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704975653; x=1705580453;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Tnl4zNdZiX89VhetJJhBcaJss+KohEVglFcJdoQMpU=;
        b=aVtTX+UdV/N44uEquPKJh2s3DobkJGWW91eBZUs5G5NF/fqvCmWoppSAgeilw6NGDk
         /OiZkcGwGbkt6pTMRJ1tF5OcdShtDjvBA91LcZQU/HCx4U6FOkqhfcj/DslK1yG6xxAt
         mj7grxtTPEPbp4YlXHsF4WGHUIN/57BOOfA/BLvYPeoU6Bo/5Ox/CMcHqSdn/bz4j4qk
         r7mhGWKT+THIyNBDl38CWyljlIlVlAZn6uofwGEFleq1eFo7OAW1YFTx/tZZiIEIa8Pw
         FHKUn61c54ukWFOWKdWdYAyTOtGtPgoxqbqpRVyuaXoT1YQE3uoubEBjl9cOH+CTB9rQ
         Vs1w==
X-Gm-Message-State: AOJu0Yz01/0GN1PjH2WbbVMQiS7JHVyxIpLyFZDO1IHOFA35Hk9kF4LS
	ixC1aeyou4RYuNdhDMxs5uDwrrPU+DfEHw==
X-Google-Smtp-Source: AGHT+IHV5C2raZyvfcdmFcRVyyB+ARhMB5CZiq8SXi/WyEZTMQ8NF5vO0FDAEPk5fHEaRgpY/ZZJqQ==
X-Received: by 2002:a2e:2c13:0:b0:2cc:f6b9:3bde with SMTP id s19-20020a2e2c13000000b002ccf6b93bdemr349799ljs.74.1704975653141;
        Thu, 11 Jan 2024 04:20:53 -0800 (PST)
Received: from [172.30.205.123] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id n25-20020a2e7219000000b002cc83210f65sm126181ljc.89.2024.01.11.04.20.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 04:20:52 -0800 (PST)
Message-ID: <0a7d3c97-3211-4d5a-983e-3e8cc86f27e3@linaro.org>
Date: Thu, 11 Jan 2024 13:20:50 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: sc8280xp: camss: Add CAMSS block
 definition
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-0-b8e3a74a6e6a@linaro.org>
 <20240109-linux-next-24-01-02-sc8280xp-camss-core-dtsi-v3-4-b8e3a74a6e6a@linaro.org>
 <927d1ca0-3915-4039-b855-b31ff5280cf7@linaro.org>
 <d9d260e4-c395-4ec3-bb41-10d2af6a1d96@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <d9d260e4-c395-4ec3-bb41-10d2af6a1d96@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 1/11/24 12:47, Bryan O'Donoghue wrote:
> On 10/01/2024 11:03, Konrad Dybcio wrote:
>>
>>
>> On 1/9/24 17:06, Bryan O'Donoghue wrote:
>>> Add CAMSS block definition for sc8280xp.
>>>
>>> This drop contains definitions for the following components on sc8280xp:
>>>
>>> VFE * 4
>>> VFE Lite * 4
>>> CSID * 4
>>> CSIPHY * 4
>>>
>>> This dtsi definition has been developed and validated on a Lenovo X13s
>>> laptop.
>>>
>>> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 239 +++++++++++++++++++++++++++++++++
>>>   1 file changed, 239 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> index f48dfa5e5f36..35bc31117b41 100644
>>> --- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
>>> @@ -3614,6 +3614,245 @@ cci3_i2c1: i2c-bus@1 {
>>>               };
>>>           };
>>> +        camss: camss@ac5a000 {
>>> +            compatible = "qcom,sc8280xp-camss";
>>> +
>>> +            reg = <0 0x0ac5a000 0 0x2000>,
>>> +                  <0 0x0ac5c000 0 0x2000>,
>>> +                  <0 0x0ac65000 0 0x2000>,
>>> +                  <0 0x0ac67000 0 0x2000>,
>>> +                  <0 0x0acaf000 0 0x4000>,
>>> +                  <0 0x0acb3000 0 0x1000>,
>>> +                  <0 0x0acb6000 0 0x4000>,
>>> +                  <0 0x0acba000 0 0x1000>,
>>> +                  <0 0x0acbd000 0 0x4000>,
>>> +                  <0 0x0acc1000 0 0x1000>,
>>> +                  <0 0x0acc4000 0 0x4000>,
>>> +                  <0 0x0acc8000 0 0x1000>,
>>> +                  <0 0x0accb000 0 0x4000>,
>>> +                  <0 0x0accf000 0 0x1000>,
>>> +                  <0 0x0acd2000 0 0x4000>,
>>> +                  <0 0x0acd6000 0 0x1000>,
>>> +                  <0 0x0acd9000 0 0x4000>,
>>> +                  <0 0x0acdd000 0 0x1000>,
>>> +                  <0 0x0ace0000 0 0x4000>,
>>> +                  <0 0x0ace4000 0 0x1000>;
>>> +
>>> +            reg-names = "csiphy2",
>> The random newlines kill consistency with everything else
>>
>> Konrad
> 
> Not random.
> 
> What exactly are you asking for ?

You have newlines between e.g. reg and reg-names

This is not the case anywhere else

Konrad

