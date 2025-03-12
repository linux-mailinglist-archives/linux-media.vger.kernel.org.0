Return-Path: <linux-media+bounces-28094-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A958CA5E36E
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 19:05:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79B1A1897881
	for <lists+linux-media@lfdr.de>; Wed, 12 Mar 2025 18:05:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E813B256C6D;
	Wed, 12 Mar 2025 18:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P+Z5JO/t"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFF27083C
	for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 18:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741802740; cv=none; b=BdJ7M3CweaNvuK8byZG1VMRqfnmxxA8W7by34kz06ECgR4athlcGvc3cviJ4EscXL78TJdUNlf1GEDCyZ3IY1InLhXjnOuTazlBVkSAmZLmJ/v+wvQmEoy0m2hoVXcNpcRlazw1zkUlkRDkBSAIZ+1hLwJ8emincIfULvNWr6Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741802740; c=relaxed/simple;
	bh=ZnvtSvXYaZKgXRPi9veH142SzPQiahF6nTX9p/M+dJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tUbXdI9XX97LDMpeBg1WA/dvVjkZZ8LsW5esdyQEH0THZ4d3Hj7tAjY8lsmju1aJWoEe7xxqsGg6bmqV18hy4Tc6G4US5ckio/fZQ+UleNY5P6rfDOlN2hpfQLYiQdlHIar6amgBM0gW3/D96xccK37Fq/QPTn9GOfYDBgSqGZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P+Z5JO/t; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5499af0cecdso11098e87.2
        for <linux-media@vger.kernel.org>; Wed, 12 Mar 2025 11:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741802737; x=1742407537; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4JP/zrVSexM0psJNK4a87mL+zi9yaJ2cIxPsPxHNny4=;
        b=P+Z5JO/tsgDgec+EVmgvNitfMfdnsvXASdqP5fIMs9lnDK7SrONlGShwoZdmv4HdbU
         riZq1xoZ7SC0r+qr2LHPJr/2oGC2dLPGC+5iBDUDlK3x14EGEqqE71PSlZA4BbCotYxV
         kMQWY8AvCfDbkaIdbs+di1yVpSasdnUsJMfz8y3U6PBSEWPjQ0NKMpFxiFBtFpJdMhLX
         XW/H5vjJzxf3xjl17HWtIQWvOLbSn33YD0Qa4ff+gHqRHmDi1fHDIPCtwHpdk4lkoQIw
         /a2V0P4XsdBx+bRfFhAcTmsuwlpSfco+YqxzSNVDup57egQtVqfUllKm7uDfPcMHKgfg
         jTvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741802737; x=1742407537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4JP/zrVSexM0psJNK4a87mL+zi9yaJ2cIxPsPxHNny4=;
        b=RzgIIsgW21japcWVtkkI8WAwRuoDEsgpqs2j0JoETdiAdv0zqWvY1Ltv3BFKa/ATLJ
         HqYXwcoMWdrnknHzqbboT+rH4GeLuuJXUzMJzMsudNwAaqZJ0w0ZQ5MhYqpZZ0JF6OAF
         rtw2OYZBc35zA7xi1QRY3QIf0c6i3pyj4tuIHBcbqrzJSllQ6fsMn85plgEoAN0iID0P
         e32IkKaKI5rmKc8ppoinYl0u8EpaKnCkVY6OMky6PsZlCFZOvEDrtNQ2sMyRUtqwilOK
         TSAsWB5jN2FNkdi02jYd8RUthSArMAgIUNepLtihYmINuQ70Y75Dp182ySeCmsUUtD94
         c16w==
X-Gm-Message-State: AOJu0YwNFeAKKWdIK7hM3FR5AMAGkxKheUatO38dGfOwF7tuCPJZ0Led
	A1x5X3TkiLmNIwVAKLnYDyI1EmcG4MNX+pbcyuF92q1r4istrn9p8R0nPU/Cph4=
X-Gm-Gg: ASbGncsczeDJDMbiJ8qqOtMQ5Ch28vWNCLcB0avfHqi9WL2e09xltIgogy0AEy6pccZ
	JVA+ml+6LrDaz0mf+Q0ln2DBkZxg1Uxr4AtjDTcX2mR0vq2+7na1QF/IksNGspZqYHbY98HDDi1
	li9UUhpi11RnsC/4hW/7DapWikwzZx/Mf1tIgZ2dc2tUbkDB3ZB6bvvn2UvsgY9FNttunDlsEx7
	jatn6s2IhZELyAx3jAN/gKgBhGM1HPq4yKbcRpFHnjloXvxP3ubggzETiZKTSzcLQOFOTVzCso3
	fTsBY9qJ6EB9rhlxii+VbZkzwNrNL4Y8WK5IDnKuKhJy28kgM6x0guxHdl0xpJROSHlf+kUvacw
	F35ohxpe37peguozc
X-Google-Smtp-Source: AGHT+IF9q4rX/bNC2ZItHt0EL8U3J8nNwY8dNosMDubIuSu9sUrRcC/KaIRJyrmIsSDmKBjdsU5nBQ==
X-Received: by 2002:a05:6512:ba7:b0:549:8f26:ba08 with SMTP id 2adb3069b0e04-549ababf748mr1150913e87.5.1741802736571;
        Wed, 12 Mar 2025 11:05:36 -0700 (PDT)
Received: from [192.168.1.228] (74-111-126-194.sta.estpak.ee. [194.126.111.74])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5498ae4b6f9sm2177533e87.50.2025.03.12.11.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 11:05:35 -0700 (PDT)
Message-ID: <ebe9d832-e414-4b67-b78e-f30a7c43a466@linaro.org>
Date: Wed, 12 Mar 2025 20:05:31 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: media: Describe Qualcomm SM8650 CAMSS IP
Content-Language: ru-RU
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-media@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 devicetree@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>
References: <20250312001132.1832655-1-vladimir.zapolskiy@linaro.org>
 <20250312001132.1832655-2-vladimir.zapolskiy@linaro.org>
 <174177914766.189343.17822607487336311201.robh@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <174177914766.189343.17822607487336311201.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/12/25 13:33, Rob Herring (Arm) wrote:
> 
> On Wed, 12 Mar 2025 02:11:30 +0200, Vladimir Zapolskiy wrote:
>> Add device tree bindings for Qualcomm SM8650 camera subsystem.
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
>> ---
>>   .../bindings/media/qcom,sm8650-camss.yaml     | 389 ++++++++++++++++++
>>   1 file changed, 389 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml: properties:ports:properties: '^port@[0-5]$' does not match '^[#$a-zA-Z][a-zA-Z0-9#,+\\-._@]{0,63}$'
> 	hint: Expected a valid DT property name
> 	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
> 

I believe it's a false positive of a regexp unparsed by a regexp, and the warning can be ignored.

--
Best wishes,
Vladimir

